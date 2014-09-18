/**
 * Created by Marcelo on 18/09/2014.
 */

//Routes
angular.module('GestaoPatrimonial').config([
    '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
        $routeProvider.when('/users',{
            templateUrl: '/templates/users/index.html',
            controller: 'UserListCtr'
        });
        $routeProvider.when('/users/new', {
            templateUrl: '/templates/users/new.html',
            controller: 'UserAddCtr'
        });
        $routeProvider.when('/users/:id/edit', {
            templateUrl: '/templates/users/edit.html',
            controller: "UserUpdateCtr"
        });

        $routeProvider.when('/users/:id/edit', {
            templateUrl: '/templates/users/edit.html',
            controller: "UserUpdateCtr"
        });

        $routeProvider.otherwise({
            redirectTo: '/users'
        });

//        $routeProvider.when('/user_sessions/new', {
//            templateUrl: '/templates/user_sessions/login.html',
//            controller: "UserSessionsController"
//        });
//
//        $routeProvider.otherwise({
//            redirectTo: '/user_sessions/new'
//        });
    }
]);