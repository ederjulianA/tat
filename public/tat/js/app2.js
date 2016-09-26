
var app = angular.module('todoList',  []);
app.controller('ToDoCtrl', function($scope,$http) {
    $http.get("/api/pagos").success(function(todos) {
        $scope.todos = todos.pagos;
        console.log($scope.todos);
    });

    $scope.remaining = function() {
        var count = 0;

        angular.forEach($scope.todos,function(todo) {
            count += todo.done ? 0 : 1;
        });

        return count;
    }

    $scope.addNew = function() {
        //alert("hola");
        var todo = {
            TipPagNom: $scope.todoText,
            done: false
        }

        var name = $scope.todoText;

        $scope.todos.push(todo);



        $http.post("/api/pago/nuevo", todo).then(function successCallback(response) {
    // this callback will be called asynchronously
    // when the response is available
    console.log(response);
  }, function errorCallback(response) {
    console.log(response);
    // called asynchronously if an error occurs
    // or server returns response with an error status.
  });;
    }
});

app.controller('banCtrl', function($scope,$http){
    $http.get("/api/banners").success(function(bans) {
        $scope.bans = bans.banners;
        console.log($scope.bans);
    });

    $scope.doStuff = function(item){
        var id = angular.element(item).data('data-id');
        console.log(id);
    }

});