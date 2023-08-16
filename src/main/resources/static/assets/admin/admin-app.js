const app = angular.module("admin-app", ["ngRoute"]);
app.config($routeProvider => {
    $routeProvider
    .when("/product", {
        templateUrl: "/assets/admin/product/index.html?" + Math.random(),
        controller: "product-ctrl"
    })
    .when("/category", {
        templateUrl: "/assets/admin/category/index.html?" + Math.random(),
        controller: "category-ctrl"
    })
    .when("/authorize", {
        templateUrl: "/assets/admin/authority/index.html?" + Math.random(),
        controller: "authority-ctrl"
    }).when("/account", {
        templateUrl: "/assets/admin/account/index.html?" + Math.random(),
        controller: "account-ctrl"
    }).when("/status", {
        templateUrl: "/assets/admin/orderStatus/index.html?" + Math.random(),
        controller: "status-ctrl"
    }).when("/role", {
        templateUrl: "/assets/admin/role/index.html?" + Math.random(),
        controller: "role-ctrl"
    }).when("/order", {
        templateUrl: "/assets/admin/order/index.html?" + Math.random(),
        controller: "order-ctrl"
    })
    .when("/unauthorized", {
        templateUrl: "/assets/admin/authority/unauthorized.html?" + Math.random(),
        controller: "authority-ctrl"
    })
    .otherwise({
        template: "<h1 class='text-center'>Administration</h1>"
    });
});