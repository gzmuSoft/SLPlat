/**=========================================================
 * Module: locale.js
 * Demo for locale settings
 =========================================================*/

App.controller('LocalizationController', ["$rootScope", "tmhDynamicLocale", "$locale", function($rootScope, tmhDynamicLocale, $locale) {
  
  $rootScope.availableLocales = {
    'en': 'English',
    'es': 'Spanish',
    'de': 'German',
    'fr': 'French',
    'ar': 'Arabic',
    'ja': 'Japanese',
    'ko': 'Korean',
    'zh': 'Chinese'};
  
  $rootScope.model = {selectedLocale: 'en'};
  
  $rootScope.$locale = $locale;
  
  $rootScope.changeLocale = tmhDynamicLocale.set;

}]);
