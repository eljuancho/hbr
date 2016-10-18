function shoppingController(angular, app) {
  'use strict';

    'use angular template'; //jshint ignore:line

    app.controller('shoppingCtrl', shoppingCtrl);

    shoppingCtrl.$inject = ['$http','$state'];

    function shoppingCtrl($http,$state) {
      'use strict';
        var self = this; //jshint ignore:line
        function get_userdata(){
          $http.get('./dist/php/users.php', { params: { sskey: sessionStorage.getItem('sskey'), action: "getUserBySskey" } })
          .then(function(response){
            self.purchase.user = response.data;
          });
        }
        function finish(){
          console.log(self.purchase);
          $http.post('./dist/php/shopping.php',{ 
            peso_excedente: self.purchase.peso_excedente,
            parcial_price: self.purchase.parcial_price,
            peso_total:  self.purchase.peso_total,
            tasas:  self.purchase.tasas,
            total:  self.purchase.total,
            total_quantity:  self.purchase.total_quantity,
            transporte:  self.purchase.transporte,
            products: self.purchase.products,
            userId: self.purchase.user.id,
            method:"POST" })
          .then(function success(response){
            if(response.data.errors){
              console.log(response.data.errors.error);
            }
            if(response.data.success){
              $state.go('dashboard.shopping_list',{reload: true});
            }
          });
        }
        function add_purchase(){
          self.purchase.data.price = self.purchase.data.quantity * self.purchase.data.price;
          self.purchase.data.weight = self.purchase.data.quantity * self.purchase.data.weight;
          self.purchase.products.push(self.purchase.data);
          self.purchase.parcial_price =  self.purchase.parcial_price + self.purchase.data.price;
          self.purchase.total_quantity =  parseInt(self.purchase.total_quantity) + parseInt(self.purchase.data.quantity);
          self.purchase.peso_total =  self.purchase.peso_total + self.purchase.data.weight;
          self.purchase.total = 0;
          self.purchase.total =  self.purchase.parcial_price;
          self.purchase.data = {};
          self.shoppingForm_purchase.$valid = true;
          self.shoppingForm_purchase.$setPristine();
          self.shoppingForm_purchase.$submitted = false;
          console.log(self.purchase);
        }
        function init() {
          self.purchase = {
            user: {},
            data:{},
            products : [],
            parcial_price: 0.00,
            peso_total:0,
            peso_excedente:0,
            transporte:0,
            excedente_peso:0,
            tasas:0,
            total:0.00,
            total_quantity:0
          };
          self.collapse_personal = true;
          self.collapse_purchase = true;
          self.collapse_list = true;
          self.add_purchase = add_purchase;
          self.finish = finish;
          get_userdata();
        }
        init();
      }
    }
    module.exports = shoppingController;