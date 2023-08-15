app.controller("authority-ctrl", function ($rootScope, $scope, $http, $location) {
	$rootScope.currPage = "authorize";
    $scope.roles = [];
    $scope.admins = [];
    $scope.authorities = [];

    $scope.init = () => {
        // load roles
        $http.get("/api/roles").then(resp => {
            $scope.roles = resp.data;
        });
        // load staffs and admins
        $http.get("/api/accounts?admin=true").then(resp => {
            $scope.admins = resp.data;
        });
        // load staffs and admins
        $http.get("/api/authorities?admin=true").then(resp => {
            $scope.authorities = resp.data;
        }, error => {
            $location.path("/unauthorized")
        });
    }

    $scope.authorityOf = (acc, role) => {
        if ($scope.authorities) {
            return $scope.authorities.find(au => au.account.username == acc.username && au.role.id == role.id);
        }
    }

    $scope.authorityChanged = (acc, role) => {
        var authority = $scope.authorityOf(acc, role);
        if (authority) {
            $scope.revokeAuthority(authority);
        } else {
            authority = {
                account: acc,
                role: role
            }
            $scope.grantAuthority(authority);
        }
    }

    $scope.grantAuthority = (authority) => {
        $http.post("/api/authorities", authority).then(resp => {
            $scope.authorities.push(resp.data);
            alert("Cấp quyền thành công");
        }, error => {
            alert("Cấp quyền thất bại");
            console.log("Error", error);
        });
    }

    $scope.revokeAuthority = (authority) => {
        $http.delete("/api/authorities/" + authority.id).then(resp => {
            var index = $scope.authorities.findIndex(au => au.id == authority.id);
            $scope.authorities.splice(index, 1);
            alert("Thu hồi quyền thành công");
        }, error => {
            alert("Thu hồi quyền thất bại");
            console.log("Error", error);
        });
    }

    $scope.init();
});