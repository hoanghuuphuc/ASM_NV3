const app=angular.module("shopping-cart-app",[]);

app.controller("shopping-cart-ctrl",function($scope,$http){

    $scope.cart = {
        items: [],
        // Thêm sản phẩm vào giỏ hàng
        add(id) {
            var item = this.items.find(item => item.id == id);
            var quantityInput = document.getElementById("soluong");
            var quantity = parseInt(quantityInput.value);

            if (!isNaN(quantity) && quantity > 0) {
                if (item) {
                    item.qty += quantity; // Cộng dồn số lượng vào sản phẩm đã tồn tại trong giỏ hàng
                    this.saveToLocalStorege();
                } else {
                    $http.get(`/rest/products/${id}`).then(resp => {
                        resp.data.qty = quantity;
                        this.items.push(resp.data);
                        this.saveToLocalStorege();
                    });
                }
                alert("Đã Thêm sản phẩm vào giỏ hàng");
            }
        },
        get count(){
            return this.items
                .map(item => item.qty)
                .reduct((total,qty)=>total+=qty,0)
        },
        get amount(){
            return this.items
                .map(item => item.qty * item.price)
                .reduce((total,qty)=>total+=qty,0)
        },

        saveToLocalStorege(){
            var json=JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart",json);
        },
        loadFromLocalStorage(){
            var json=localStorage.getItem("cart");
            this.items=json ? JSON.parse(json): [];
        },
        removeItem(id) {
            var index = this.items.findIndex(item => item.id === id);
            if (index !== -1) {
                this.items.splice(index, 1); // Xóa sản phẩm khỏi mảng
                this.saveToLocalStorege();
            }
        },
        clearAll(){
            this.items = []; // Xóa tất cả các sản phẩm trong mảng
            this.saveToLocalStorege(); // Lưu thay đổi vào dữ liệu lưu trữ cục bộ
        },
    }

    $scope.cart.loadFromLocalStorage();

    $scope.order={
        createDate:new Date(),
        name:"",
        address:"",
        phone:"",
        account:{username: $("#username").text()},
        get orderDetails(){
            return $scope.cart.items.map(item =>{
                return {
                    product:{id:item.id},
                    price:item.price,
                    quantity:item.qty
                }
            })
        },
        purchase() {
            console.log('hi'+this.name)
            console.log('hi'+this.address)
            console.log('hi'+this.phone)
            // if (!this.order || !this.name || !this.address ||!this.phone) {
            //     alert("Vui lòng điền đầy đủ thông tin khách hàng.");
            //     return;
            // }

            var order= angular.copy(this.order);
            $http.post("/rest/orders", order)
                .then(resp => {
                    alert("Đặt Hàng thành công");
                    $scope.cart.clearAll();
                    location.href = "/order/detail/" + resp.data.id;
                })
                .catch(error => {
                    alert("Đặt Hàng Lỗi");
                    console.log(error);
                });
        }

    }



});