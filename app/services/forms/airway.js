function airwayService(angular, app) {

    app.service('airwayService', airwayService);

    airwayService.$inject = ['$http'];

    function airwayService($http) {

        this.save = function (awb) {
            var formData = new FormData();
            var products = [];
            angular.forEach(awb, function (key, value) {
                if (value !== "products") {
                    formData.append(value, key);
                } else {
                    products = key;
                }
            });

            return $http.post('./hbr-selfie/dist/php/add_guides.php', formData, {
                transformRequest: angular.identity,
                headers: { 'Content-Type': undefined }
            });
        };

        this.addProductToAwb = function (product) {
            var formData = new FormData();
            angular.forEach(product, function (key, value) {
                formData.append(value, key);
            });
            return $http.post('./hbr-selfie/dist/php/add_product_to_guide.php', formData, {
                transformRequest: angular.identity,
                headers: { 'Content-Type': undefined }
            });
        };

        this.updateBill = function (bill) {
            var formData = new FormData();
            angular.forEach(bill, function (key, value) {
                formData.append(value, key);
            });
            return $http.post('./hbr-selfie/dist/php/update_bill.php', formData, {
                transformRequest: angular.identity,
                headers: { 'Content-Type': undefined }
            });
        };

        this.updateProduct = function (product) {
            var formData = new FormData();
            angular.forEach(product, function (key, value) {
                formData.append(value, key);
            });
            return $http.post('./hbr-selfie/dist/php/update_product.php', formData, {
                transformRequest: angular.identity,
                headers: { 'Content-Type': undefined }
            });
        };
    }
}
module.exports = airwayService;