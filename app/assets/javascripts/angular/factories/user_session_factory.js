/**
 * Created by Marcelo on 18/09/2014.
 */

angular.module('GestaoPatrimonial').factory('UserSession', ['$resource', function($resource){
    return $resource('/user_sessions/:id.json', {}, {
        new: { method: 'GET' },
        create: { method: 'POST' },
        destroy: { method: 'DELETE', params: {id: '@id'} }
    });
}]);
