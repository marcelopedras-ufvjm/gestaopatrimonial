/**
 * Created by Marcelo on 18/09/2014.
 */

angular.module('GestaoPatrimonial').factory('Users', ['$resource',function($resource){
    return $resource('/users.json', {},{
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);

angular.module('GestaoPatrimonial').factory('User', ['$resource', function($resource){
    return $resource('/users/:id.json', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    });
}]);