app.controller("order-ctrl", function ($rootScope, $scope, $http) {
    $rootScope.title = "Order";
    $rootScope.currPage = "order";
    $scope.items = [];
    $scope.status = [];
    $scope.form = {};

    $scope.init = () => {
        // load status
        $http.get("/api/orders").then(resp => {
            $scope.items = resp.data;
            sortOrdersByCreateDateDesc();
        });
        function sortOrdersByCreateDateDesc() {
            $scope.items.sort(function(a, b) {
                return new Date(b.createDate) - new Date(a.createDate);
            });
        }
        //load orders status
        $http.get("/api/status").then(resp => {
            $scope.status = resp.data;

        });
        $scope.reset = () => {
            $scope.form = {};
        }
        $scope.update = function(item) {
            var updatedStatusId = item.orderStatus.id;
            var orderId = item.id;
            var updatedData = {
                orderStatus: { id: updatedStatusId }
            };

            $http.put('/api/orders/' + orderId, updatedData)
                .then(function(resp) {
                   alert("Cập nhật giao hàng thành công");
                })
                .catch(function(error) {
                    alert("Cập nhật giao hàng thất bại")
                });
        };
        $scope.edit = function(item) {
            $scope.selectedOrder = item;

            // Lấy danh sách order details từ máy chủ khi bấm vào nút "Edit"
            $http.get('/api/order-details/' + item.id) // Thay đổi đường dẫn tương ứng với API của bạn
                .then(function(response) {
                    $scope.selectedOrder.orderDetails = response.data;

                    // Hiển thị modal khi đã có dữ liệu order details
                    $('#editModal').modal('show');
                })
                .catch(function(error) {
                    console.error("Error fetching order details:", error);
                });
        };
        $scope.calculateTotal = function(orderDetails) {
            let total = 0;
            for (const orderDetail of orderDetails) {
                total += orderDetail.price * orderDetail.quantity;
            }
            return total;
        };

        $scope.closeOrder = function() {
            // Thực hiện các thao tác cần thiết trước khi đóng đơn hàng
            // Ví dụ: Cập nhật trạng thái đơn hàng, gửi yêu cầu đóng đơn hàng lên máy chủ, ...

            // Đóng modal
            $('#editModal').modal('hide');
        };














    }
    $scope.pager = {
        page: 0,
        size: 10,
        get items() {
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1.0 * $scope.items.length / this.size);
        },
        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }
    $scope.init();
});