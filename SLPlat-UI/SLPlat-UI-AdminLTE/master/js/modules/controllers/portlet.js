/**=========================================================
 * Module: portlet.js
 * Drag and drop any panel to change its position
 * The Selector should could be applied to any object that contains
 * panel, so .col-* element are ideal.
 =========================================================*/
App.controller('portletsController', [ '$scope', '$timeout', '$window', function($scope, $timeout, $window) {
  'use strict';

  // Component is optional
  if(!$.fn.sortable) return;

  var Selector = '[portlet]',
      storageKeyName = 'portletState';

  angular.element(document).ready(function () {

    $timeout(function() {

      $( Selector ).sortable({
        connectWith:          Selector,
        items:                'div.panel',
        handle:               '.portlet-handler',
        opacity:              0.7,
        placeholder:          'portlet box-placeholder',
        cancel:               '.portlet-cancel',
        forcePlaceholderSize: true,
        iframeFix:            false,
        tolerance:            'pointer',
        helper:               'original',
        revert:               200,
        forceHelperSize:      true,
        start:                saveListSize,
        update:               savePortletOrder,
        create:               loadPortletOrder
      })
      // optionally disables mouse selection
      //.disableSelection()
      ;
    }, 0);

  });

  function savePortletOrder(event, ui) {
    var self = event.target;
    var data = angular.fromJson($scope.$storage[storageKeyName]);
    
    if(!data) { data = {}; }

    data[self.id] = $(self).sortable('toArray');

    $scope.$storage[storageKeyName] = angular.toJson(data);
      
    // save portlet size to avoid jumps
    saveListSize.apply(self);
  }

  function loadPortletOrder(event) {
    var self = event.target;
    var data = angular.fromJson($scope.$storage[storageKeyName]);

    if(data) {
      
      var porletId = self.id,
          panels   = data[porletId];

      if(panels) {
        var portlet = $('#'+porletId);
        
        $.each(panels, function(index, value) {
           $('#'+value).appendTo(portlet);
        });
      }

    }

    // save portlet size to avoid jumps
    saveListSize.apply(self);
  }

  // Keeps a consistent size in all portlet lists
  function saveListSize() {
    var $this = $(this);
    $this.css('min-height', $this.height());
  }

  /*function resetListSize() {
    $(this).css('min-height', "");
  }*/

}]);