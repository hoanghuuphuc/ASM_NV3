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
            }
        },
        get count(){
            return this.items
                .map(item => item.qty)
                .reduct((total,qty)=>total+=qty,0)
        },
        get amount(){
            return this.items
            .map(item => item.qty+item.price)
            .reduct((total,qty)=>total+=qty,0)
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
    }
    $scope.cart.loadFromLocalStorage();




});

