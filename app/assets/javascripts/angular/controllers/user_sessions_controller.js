/**
* Created by Marcelo on 17/09/2014.
*/

//Controller
angular.module('GestaoPatrimonial').controller("UserSessionsController", ['$scope', '$http', '$resource', 'UserSession', '$location', function($scope, $http, $resource, UserSession, $location) {

    //$scope.user_session = UserSession.new();

    $scope.createUserSession = function () {
        if ($scope.userSessionForm.$valid){
            UserSession.create({userSession: $scope.userSession}, function(){
                $location.path('/users');
            }, function(error){
                console.log(error)
            });
        }
    };

    $scope.destroyUserSession = function(userSessionId) {
        UserSession.destroy({ userSessionId: userSessionId }, function(){
            $location.path('/');
        });
    };
}]);