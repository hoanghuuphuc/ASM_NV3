app.controller("status-ctrl", function ($rootScope, $scope, $http) {
    $rootScope.title = "OrderStatus";
    $rootScope.currPage = "status";
    $scope.items = [];
    $scope.status = [];
    $scope.form = {};
    $scope.init = () => {
        // load status
        $http.get("/api/status").then(resp => {
            $scope.items = resp.data;

        });
        $scope.reset = () => {
            $scope.form = {};
        }

        $scope.edit = (item) => {
            $scope.form = angular.copy(item);
            window.scrollTo(0, 0);
        }
        $scope.create = () => {
            var item = angular.copy($scope.form);
            $http.post("/api/status", item).then(resp => {
                $scope.items.push(resp.data);
                $scope.reset();
                alert("Thêm Trạng thái Vận Chuyển thành công");
            }, error => {
                alert("Thêm Trạng thái Vận Chuyển thất bại");
                console.log("Error", error);
            });
        }

        $scope.update = () => {
            var item = angular.copy($scope.form);
            $http.put("/api/status/" + item.id, item).then(resp => {
                var index = $scope.items.findIndex(p => p.id = item.id);
                $scope.items[index] = item;
                alert("Cập nhật Trạng thái Vận Chuyển thành công");
            }, error => {
                alert("Cập nhât Trạng thái Vận Chuyển thất bại");
                console.log("Error", error);
            });
        }
        $scope.remove = (item) => {
            var idToDelete;
            if (item.id) {
                idToDelete = item.id;
            } else if ($scope.form.id) {
                idToDelete = $scope.form.id;
            }
            if (idToDelete) {
                $http.delete("/api/status/" + idToDelete).then(resp => {
                    var index = $scope.items.findIndex(p => p.id === idToDelete);
                    if (index !== -1) {
                        $scope.items.splice(index, 1);
                    }
                    $scope.reset(); // Clear the form
                    alert("Xoá trạng thái thành công");
                }, error => {
                    alert("Xoá trạng thái thất bại");
                    console.log("Error", error);
                });
            }
        }


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