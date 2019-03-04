(function (angular) {
    var app = angular.module('Aplikacija');
    app.controller('ProizvodCtrl', ['$http', '$stateParams', 'loginService', '$timeout', function($http, $stateParams, loginService, $timeout) {
        var that = this;
        
        that.logovan = false;
        that.poruka = "";
        that.proizvod = {};
        that.zaKorpu = {
            kolicina : 1,
        };

        that.ulogovan = function () {
            loginService.isLoggedIn(function () {
                loginService.getLoggedIn(function (korisnik) {
                    that.korisnik = korisnik;
                    that.zaKorpu.korpa_id = korisnik.korpa_id;
                },
                function (errorReason) {
                })
            that.logovan = true;
            },function() {});
        }

        that.obavestenje = function(){
            $timeout(function () {
                that.poruka = "";
            }, 1500);
        };
        
        that.dobaviProizvod = function() {
            $http.get('proizvod/'+$stateParams.id).then(function(response){
                that.proizvod = response.data;
            },
            function(reason){
                console.log(reason);
            })
        };

        that.dodajUKorpu = function(id){
            $http.post('/dodajUkorpu/'+id, that.zaKorpu).then(function(response){
                if(response.data["status"] == "done") {
                    that.poruka = "Product is successfully added to the cart!";
                    that.obavestenje();
                }
            },
            function(reason){
                console.log(reason);
            })
        }

        that.dobaviProizvod();
        that.ulogovan();
}]);
})(angular);