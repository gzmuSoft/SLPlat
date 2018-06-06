/**=========================================================
 * Module: form-imgcrop.js
 * Image crop controller
 =========================================================*/
App.controller('ImageCropController', ["$scope", function($scope) {

  $scope.reset = function() {
    $scope.myImage        = '';
    $scope.myCroppedImage = '';
    $scope.imgcropType    = "square";
  };

  $scope.reset();

  var handleFileSelect=function(evt) {
    var file=evt.currentTarget.files[0];
    var reader = new FileReader();
    reader.onload = function (evt) {
      $scope.$apply(function($scope){
        $scope.myImage=evt.target.result;
      });
    };
    if(file)
      reader.readAsDataURL(file);
  };
  
  angular.element(document.querySelector('#fileInput')).on('change',handleFileSelect);

}]);