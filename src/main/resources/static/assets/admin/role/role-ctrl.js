app.controller("role-ctrl", function ($rootScope, $scope, $http) {
    $rootScope.title = "Role";
    $rootScope.currPage = "role";
    $scope.items = [];
    $scope.role = [];
    $scope.form = {};
    $scope.init = () => {

        $http.get("/api/roles").then(resp => {
            $scope.items = resp.data;
        });
    }

    $scope.reset = () => {
        $scope.form = {};
    }

    $scope.edit = (item) => {
        $scope.form = angular.copy(item);
        window.scrollTo(0, 0);
    }

    $scope.create = () => {
        var item = angular.copy($scope.form);
        $http.post("/api/roles", item).then(resp => {
            $scope.items.push(resp.data);
            $scope.reset();
            alert("Thêm danh mục thành công");
        }, error => {
            alert("Thêm danh mục thất bại");
            console.log("Error", error);
        });
    }

    $scope.update = () => {
        var item = angular.copy($scope.form);
        $http.put("/api/roles/" + item.id, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id = item.id);
            $scope.items[index] = item;
            alert("Cập danh mục phẩm thành công");
        }, error => {
            alert("Cập danh mục phẩm thất bại");
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
            $http.delete("/api/roles/" + idToDelete).then(resp => {
                var index = $scope.items.findIndex(p => p.id === idToDelete);
                if (index !== -1) {
                    $scope.items.splice(index, 1);
                }
                $scope.reset(); // Clear the form
                alert("Xoá danh mục thành công");
            }, error => {
                alert("Xoá danh mục thất bại");
                console.log("Error", error);
            });
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