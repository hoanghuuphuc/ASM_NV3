app.controller("account-ctrl", function ($rootScope, $scope, $http) {
    $rootScope.title = "Account";
    $rootScope.currPage = "account";
    $scope.items = [];
    $scope.account = [];
    $scope.form = {};
    $scope.init = () =>{
        $http.get("/api/accounts").then(resp =>{
            $scope.items=resp.data;
            $scope.items.forEach(item => {
                item.createDate = new Date(item.createDate);
            });
        })
    }
    //reset
    $scope.reset=()=>{
        $scope.form={
            username:'',
            password:'',
            fullname:''
        };
    }
    $scope.edit=(item)=>{
        $scope.form=angular.copy(item);
        window.scrollTo(0, 0);
    }
    //them
    $scope.create=() =>{
        var item=angular.copy($scope.form);
        $http.post("/api/accounts",item).then(resp =>{
            $scope.items.push(resp.data);
            $scope.reset();
            alert("Thêm Account thành công")
        }, error => {
            alert("Thêm Account thất bại");
            console.log("Error", error);
        });
    }
    $scope.update = () => {
        var item = angular.copy($scope.form);
        $http.put("/api/accounts/" + item.username, item).then(resp => {
            var index = $scope.items.findIndex(p => p.username = item.username);
            $scope.items[index] = item;
            alert("Cập nhât Account thành công");
        }, error => {
            alert("Cập nhật Account thất bại");
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