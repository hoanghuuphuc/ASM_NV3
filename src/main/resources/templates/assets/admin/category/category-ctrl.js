app.controller("category-ctrl", function ($rootScope, $scope, $http) {
	$rootScope.title = "Category";
	$rootScope.currPage = "category";
    $scope.items = [];
    $scope.categories = [];
    $scope.form = {};
    $scope.init = () => {
        // load categories
        $http.get("/api/categories").then(resp => {
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
        $http.post("/api/categories", item).then(resp => {
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
        $http.put("/api/categories/" + item.id, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id = item.id);
            $scope.items[index] = item;
            alert("Cập danh mục phẩm thành công");
        }, error => {
            alert("Cập danh mục phẩm thất bại");
            console.log("Error", error);
        });
    }

    $scope.remove = (item) => {
        var item = angular.copy($scope.form);
        $http.delete("/api/categories/" + item.id).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            alert("Xoá danh mục thành công");
        }, error => {
            alert("Xoá danh mục thất bại");
            console.log("Error", error);
        });
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