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
        address:"",
        name:"",
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
            if (!$scope.order.name || !$scope.order.address || !$scope.order.phone) {
                alert("Vui lòng điền đầy đủ thông tin đặt hàng.");
                return;
            }

            // Kiểm tra định dạng số điện thoại (sử dụng regex)
            var phoneRegex = /^[0-9]{10,11}$/; // Định dạng: 10 hoặc 11 chữ số
            if (!phoneRegex.test($scope.order.phone)) {
                alert("Số điện thoại không đúng định dạng.");
                return;
            }


            var order= angular.copy(this);
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