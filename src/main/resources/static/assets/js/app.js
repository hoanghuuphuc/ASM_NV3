const app = angular.module("myApp", []);
app.controller("myCtrl", ($scope, $http) => {
    $scope.cart = {
        items: [],
        add(id) {
            var item = this.items.find(item => item.id == id);
            if (item) {
                item.quantity++;
                this.saveToLocalStorage();
            } else {
                $http.get("/api/products/" + id)
                    .then(resp => {
                        resp.data.quantity = 1;
                        this.items.push(resp.data);
                        this.saveToLocalStorage();
                    })
            }
        },
        remove(id) {
            var index = this.items.findIndex(item => item.id == id);
            this.items.splice(index, 1);
            this.saveToLocalStorage();
        },
        clear() {
            this.items = [];
            this.saveToLocalStorage();
        },
        amountOf(item) {

        },
        get count() {
            return this.items
                .map(item => item.quantity)
                .reduce((total, quantity) => total += quantity, 0);
        },
        get amount() {
            return this.items
                .map(item => item.quantity * item.price)
                .reduce((total, quantity) => total += quantity, 0);
        },
        saveToLocalStorage() {
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);
        },
        loadFromLocalStorage() {
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) : [];
        }
    }
    $scope.cart.loadFromLocalStorage();
    $scope.order = {
        createDate: new Date(),
        address: "",
        account: {
            username: document.querySelector("#username") ? document.querySelector("#username").value : ''
        },
        get orderDetails() {
            return $scope.cart.items.map(item => {
                return {
                    product: {
                        id: item.id
                    },
                    price: item.price,
                    quantity: item.quantity
                }
            });
        },
        purchase() {
            var order = angular.copy(this);
            $http.post("/api/orders", order).then(resp => {
                alert("Đặt hàng thành công");
                $scope.cart.clear();
                location.href = "/order/detail/" + resp.data.id;
            }, error => {
                alert("Đặt hàng thất bại")
                console.log(error);
            });
        }

    }
});