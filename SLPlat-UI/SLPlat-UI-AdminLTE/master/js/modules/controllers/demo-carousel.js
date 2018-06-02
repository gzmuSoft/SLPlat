/**=========================================================
 * Module: demo-carousel.js
 * Provides a simple demo for bootstrap ui carousel
 =========================================================*/

App.controller('CarouselDemoCtrl', ['$scope', function ($scope) {
  $scope.myInterval = 5000;
  var slides = $scope.slides = [];
  $scope.addSlide = function() {
    var newWidth = 800 + slides.length;
    slides.push({
      image: '//placekitten.com/' + newWidth + '/300',
      text: ['More','Extra','Lots of','Surplus'][slides.length % 2] + ' ' +
        ['Cats', 'Kittys', 'Felines', 'Cutes'][slides.length % 2]
    });
  };
  for (var i=0; i<2; i++) {
    $scope.addSlide();
  }
}]);