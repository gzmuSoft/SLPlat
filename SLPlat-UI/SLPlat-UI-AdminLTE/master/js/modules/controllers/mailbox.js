/**=========================================================
 * Module: demo-pagination.js
 * Provides a simple demo for pagination
 =========================================================*/

 App.controller('MailboxController', ["$scope", "colors", function($scope, colors) {


  $scope.folders = [
    {name: 'Inbox',   folder: 'inbox',   alert: 42, icon: "fa-inbox" },
    {name: 'Starred', folder: 'starred', alert: 10, icon: "fa-star" },
    {name: 'Sent',    folder: 'sent',    alert: 0,  icon: "fa-paper-plane-o" },
    {name: 'Draft',   folder: 'draft',   alert: 5,  icon: "fa-edit" },
    {name: 'Trash',   folder: 'trash',   alert: 0,  icon: "fa-trash"}
  ];

  $scope.labels = [
    {name: 'Red',     color: 'danger'},
    {name: 'Pink',    color: 'pink'},
    {name: 'Blue',    color: 'info'},
    {name: 'Yellow',  color: 'warning'}
  ];

  $scope.mail = {
    cc: false,
    bcc: false
  };
  // Mailbox editr initial content
  $scope.content = "<p>Type something..</p>";


}]);

App.controller('MailFolderController', ['$scope', 'mails', '$stateParams', function($scope, mails, $stateParams) {
  // no filter for inbox
  $scope.folder = $stateParams.folder === 'inbox' ? '' : $stateParams.folder;
  mails.all().then(function(mails){
    $scope.mails = mails;
  });
}]);

App.controller('MailViewController', ['$scope', 'mails', '$stateParams', function($scope, mails, $stateParams) {
  mails.get($stateParams.mid).then(function(mail){
    $scope.mail = mail;
  });
}]);

// A RESTful factory for retreiving mails from 'mails.json'
App.factory('mails', ['$http', function ($http) {
  var path = 'server/mails.json';
  var mails = $http.get(path).then(function (resp) {
    return resp.data.mails;
  });

  var factory = {};
  factory.all = function () {
    return mails;
  };
  factory.get = function (id) {
    return mails.then(function(mails){
      for (var i = 0; i < mails.length; i++) {
        if (mails[i].id == id) return mails[i];
      }
      return null;
    });
  };
  return factory;
}]);