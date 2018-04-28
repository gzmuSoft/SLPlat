'use strict';
// 

var app = angular.module('app')
	.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider,   $urlRouterProvider) {
            // 默认地址
            $urlRouterProvider.otherwise('/access/login');
            // 状态配置
            $stateProvider
                .state('main', {
                    abstract: true,
                    url: '',
                    templateUrl: 'src/tpl/app.html'
                })
                .state('access', {
                    url: '/access',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('access.login',{
                    url: '/login',
                    templateUrl: 'src/app/sys/login/login.html',
                    controller: 'loginController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/login/loginController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys', {
                    url: '/sys',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message', {
                    url: '/message',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                // 用户
                .state('main.sys.user', {
                    url: '/user',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.sys.user.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/user/user.html',
                    controller: 'userController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/user/userController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.user.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/user/update.html',
                    controller: 'userUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/user/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.user.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/user/update.html',
                    controller: 'userUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/user/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                }) // 部门
                .state('main.sys.dept', {
                    url: '/dept',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.sys.dept.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/dept/dept.html',
                    controller: 'deptController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/dept/deptController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.dept.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/dept/update.html',
                    controller: 'deptUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/dept/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.dept.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/dept/update.html',
                    controller: 'deptUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/dept/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.student', {
                    url: '/student',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                //学校
                .state('main.student.school', {
                    url: '/school',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.student.school.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/school/school.html',
                    controller: 'schoolController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/school/schoolController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.student.school.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/school/update.html',
                    controller: 'schoolUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/school/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.student.school.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/school/update.html',
                    controller: 'schoolUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/school/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //学院
                .state('main.student.college', {
                    url: '/college',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.student.college.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/college/college.html',
                    controller: 'collegeController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/college/collegeController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.student.college.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/college/update.html',
                    controller: 'collegeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/college/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.student.college.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/college/update.html',
                    controller: 'collegeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/college/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //专业
                .state('main.student.specialty', {
                    url: '/specialty',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.student.specialty.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/specialty/specialty.html',
                    controller: 'specialtyController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/specialty/specialtyController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.student.specialty.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/specialty/update.html',
                    controller: 'specialtyUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/specialty/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.student.specialty.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/specialty/update.html',
                    controller: 'specialtyUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/specialty/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //班级
                .state('main.student.class', {
                    url: '/class',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.student.class.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/class/class.html',
                    controller: 'classController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/class/classController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.student.class.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/class/update.html',
                    controller: 'classUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/class/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.student.class.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/class/update.html',
                    controller: 'classUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/class/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site', {
                    url: '/site',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })// 省会
                .state('main.site.province', {
                    url: '/province',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.site.province.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/province/province.html',
                    controller: 'provinceController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/province/provinceController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site.province.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/province/update.html',
                    controller: 'provinceUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/province/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site.province.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/province/update.html',
                    controller: 'provinceUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/province/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })// 城市
                .state('main.site.city', {
                    url: '/city',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.site.city.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/city/city.html',
                    controller: 'cityController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/city/cityController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site.city.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/city/update.html',
                    controller: 'cityUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/city/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site.city.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/city/update.html',
                    controller: 'cityUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/city/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })// 县城
                .state('main.site.county', {
                    url: '/county',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.site.county.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/county/county.html',
                    controller: 'countyController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/county/countyController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site.county.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/county/update.html',
                    controller: 'countyUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/county/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site.county.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/county/update.html',
                    controller: 'countyUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/county/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })// 乡镇
                .state('main.site.town', {
                    url: '/town',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.site.town.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/town/town.html',
                    controller: 'townController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/town/townController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site.town.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/town/update.html',
                    controller: 'townUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/town/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.site.town.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/town/update.html',
                    controller: 'townUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/town/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //民族
                .state('main.message.nation', {
                    url: '/nation',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.nation.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/nation/nation.html',
                    controller: 'nationController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/nation/nationController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.nation.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/nation/update.html',
                    controller: 'nationUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/nation/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.nation.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/nation/update.html',
                    controller: 'nationUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/nation/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //性别
                .state('main.message.gender', {
                    url: '/gender',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.gender.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/gender/gender.html',
                    controller: 'genderController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/gender/genderController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.gender.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/gender/update.html',
                    controller: 'genderUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/gender/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.gender.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/gender/update.html',
                    controller: 'genderUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/gender/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //政治面貌
                .state('main.message.politicalStatus', {
                    url: '/politicalStatus',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.politicalStatus.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/politicalStatus/politicalStatus.html',
                    controller: 'politicalStatusController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/politicalStatus/politicalStatusController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.politicalStatus.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/politicalStatus/update.html',
                    controller: 'politicalStatusUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/politicalStatus/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.politicalStatus.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/politicalStatus/update.html',
                    controller: 'politicalStatusUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/politicalStatus/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //职称
                .state('main.message.professionalTitle', {
                    url: '/professionalTitle',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.professionalTitle.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/professionalTitle/professionalTitle.html',
                    controller: 'professionalTitleController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/professionalTitle/professionalTitleController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.professionalTitle.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/professionalTitle/update.html',
                    controller: 'professionalTitleUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/professionalTitle/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.professionalTitle.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/professionalTitle/update.html',
                    controller: 'professionalTitleUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/professionalTitle/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //行政职务
                .state('main.message.administrativePost', {
                    url: '/administrativePost',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.administrativePost.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/administrativePost/administrativePost.html',
                    controller: 'administrativePostController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/administrativePost/administrativePostController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.administrativePost.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/administrativePost/update.html',
                    controller: 'administrativePostUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/administrativePost/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.administrativePost.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/administrativePost/update.html',
                    controller: 'administrativePostUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/administrativePost/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //高中类别
                .state('main.message.highSchoolCategory', {
                    url: '/highSchoolCategory',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.highSchoolCategory.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/highSchoolCategory/highSchoolCategory.html',
                    controller: 'highSchoolCategoryController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/highSchoolCategory/highSchoolCategoryController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.highSchoolCategory.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/highSchoolCategory/update.html',
                    controller: 'highSchoolCategoryUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/highSchoolCategory/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.highSchoolCategory.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/highSchoolCategory/update.html',
                    controller: 'highSchoolCategoryUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/highSchoolCategory/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //考生类别
                .state('main.message.examineeCategory', {
                    url: '/examineeCategory',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.examineeCategory.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/examineeCategory/examineeCategory.html',
                    controller: 'examineeCategoryController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/examineeCategory/examineeCategoryController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.examineeCategory.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/examineeCategory/update.html',
                    controller: 'examineeCategoryUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/examineeCategory/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.examineeCategory.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/examineeCategory/update.html',
                    controller: 'examineeCategoryUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/examineeCategory/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //出版社
                .state('main.message.publisher', {
                    url: '/publisher',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.publisher.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/publisher/publisher.html',
                    controller: 'publisherController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/publisher/publisherController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.publisher.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/publisher/update.html',
                    controller: 'publisherUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/publisher/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.publisher.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/publisher/update.html',
                    controller: 'publisherUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/publisher/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //批次
                .state('main.message.batch', {
                    url: '/batch',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.batch.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/batch/batch.html',
                    controller: 'batchController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/batch/batchController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.batch.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/batch/update.html',
                    controller: 'batchUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/batch/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.batch.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/batch/update.html',
                    controller: 'batchUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/batch/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //附件类型
                .state('main.message.attachmentType', {
                    url: '/attachmentType',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.attachmentType.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/attachmentType/attachmentType.html',
                    controller: 'attachmentTypeController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/attachmentType/attachmentTypeController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.attachmentType.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/attachmentType/update.html',
                    controller: 'attachmentTypeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/attachmentType/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.attachmentType.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/attachmentType/update.html',
                    controller: 'attachmentTypeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/attachmentType/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //课程类型
                .state('main.message.courseType', {
                    url: '/courseType',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.courseType.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/courseType/courseType.html',
                    controller: 'courseTypeController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/courseType/courseTypeController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.courseType.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/courseType/update.html',
                    controller: 'courseTypeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/courseType/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.courseType.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/courseType/update.html',
                    controller: 'courseTypeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/courseType/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //学期
                .state('main.message.semester', {
                    url: '/semester',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.semester.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/semester/semester.html',
                    controller: 'semesterController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/semester/semesterController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.semester.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/semester/update.html',
                    controller: 'semesterUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/semester/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.semester.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/semester/update.html',
                    controller: 'semesterUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/semester/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //历年分数线
                .state('main.message.ceeAnnualScore', {
                    url: '/ceeAnnualScore',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.ceeAnnualScore.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/ceeAnnualScore/ceeAnnualScore.html',
                    controller: 'ceeAnnualScoreController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/ceeAnnualScore/ceeAnnualScoreController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.ceeAnnualScore.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/ceeAnnualScore/update.html',
                    controller: 'ceeAnnualScoreUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/ceeAnnualScore/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.ceeAnnualScore.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/ceeAnnualScore/update.html',
                    controller: 'ceeAnnualScoreUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/ceeAnnualScore/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //课程
                .state('main.message.course', {
                    url: '/course',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.course.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/course/course.html',
                    controller: 'courseController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/course/courseController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.course.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/course/update.html',
                    controller: 'courseUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/course/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.course.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/course/update.html',
                    controller: 'courseUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/course/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //课程教材
                .state('main.message.courseMaterial', {
                    url: '/courseMaterial',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.message.courseMaterial.list', {
                    url: '/list',
                    templateUrl: 'src/app/message/courseMaterial/courseMaterial.html',
                    controller: 'courseMaterialController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/courseMaterial/courseMaterialController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.courseMaterial.create', {
                    url: '/create',
                    templateUrl: 'src/app/message/courseMaterial/update.html',
                    controller: 'courseMaterialUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/courseMaterial/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.message.courseMaterial.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/message/courseMaterial/update.html',
                    controller: 'courseMaterialUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/message/courseMaterial/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                // 菜单
                .state('main.sys.menu', {
                    url: '/menu',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.sys.menu.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/menu/menu.html',
                    controller: 'menuController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/menu/menuController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.menu.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/menu/update.html',
                    controller: 'menuUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/menu/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.menu.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/menu/update.html',
                    controller: 'menuUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/menu/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                }) // 角色
                .state('main.sys.role', {
                    url: '/role',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.sys.role.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/role/role.html',
                    controller: 'roleController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                    		return uiLoad.load('src/app/sys/role/roleController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.role.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/role/update.html',
                    controller: 'roleUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/role/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.role.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/role/update.html',
                    controller: 'roleUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/role/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                }) // 会话
                .state('main.sys.session', {
                    url: '/session',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.sys.session.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/session/session.html',
                    controller: 'sessionController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/session/sessionController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                }) // 字典
                .state('main.sys.dic', {
                    url: '/dic',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.sys.dic.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/dic/dic.html',
                    controller: 'dicController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/dic/dicController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.dic.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/dic/update.html',
                    controller: 'dicUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/dic/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.dic.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/dic/update.html',
                    controller: 'dicUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/dic/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                }) // 参数
                .state('main.sys.param', {
                    url: '/param',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.sys.param.list', {
                    url: '/list',
                    templateUrl: 'src/app/sys/param/param.html',
                    controller: 'paramController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/param/paramController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.param.create', {
                    url: '/create',
                    templateUrl: 'src/app/sys/param/update.html',
                    controller: 'paramUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/param/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.sys.param.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/sys/param/update.html',
                    controller: 'paramUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/sys/param/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                }) // 调度
                .state('main.task', {
                    url: '/task',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.task.scheduled', {
                    url: '/scheduled',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.task.scheduled.list', {
                    url: '/list',
                    templateUrl: 'src/app/task/scheduled/scheduled.html',
                    controller: 'taskScheduledController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/task/scheduled/scheduledController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.task.scheduled.create', {
                    url: '/update',
                    templateUrl: 'src/app/task/scheduled/update.html',
                    controller: 'scheduledUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/task/scheduled/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.task.scheduled.update', {
                    url: '/update',
                    params: {
                    	'taskGroup': null,'taskName': null,
                    	'taskCron': null,'taskDesc': null,
                    	'taskType': null,'jobType': null,
                    	'targetObject': null,'targetMethod': null
                    },
                    templateUrl: 'src/app/task/scheduled/update.html',
                    controller: 'scheduledUpdateController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/task/scheduled/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                })
                .state('main.task.log', {
                    url: '/log',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.task.log.list', {
                    url: '/list',
                    templateUrl: 'src/app/task/scheduled/log.html',
                    controller: 'scheduledLogController',
                    resolve: {
                    	deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/task/scheduled/logController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                      }
                });
    }])
    .controller("navCtrl",function($rootScope,$state) {
    	$.ajax({
			url : '/user/read/promission',
			success : function(result) {
				if (result.code == 200) {
					$rootScope.userInfo = result.user;
					$rootScope.menuList = result.menus;
					$rootScope.$apply();
				}
			}
		});
  	})
    .run(['$rootScope', '$state', '$stateParams','$timeout', '$templateCache',
          function ($rootScope,$state,$stateParams,$timeout, $templateCache) {
              $rootScope.$state = $state;
              $rootScope.$stateParams = $stateParams;
              $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams) {
                  var from =  fromState.name, to = toState.name;
                  if(from && to){ // 解决 相应模块从列表进入编辑后 状态丢失问题
                      var s1= from.substring(0,from.lastIndexOf(".")),
                          g1 = from.substring(from.lastIndexOf(".")+1),
                          s2 = to.substring(0,to.lastIndexOf(".")),
                          g2 = to.substring(to.lastIndexOf(".")+1);
                      if(s1 == s2){
                          if(g1 =='list' && (g2=='update'||g2=='view')) { //进行编辑
                              toParams['params'] = window.location.hash;
                          }
                          //返回列表
                          if((g1 == "update"||g1 =='view') && g2=='list') {
                              var h = fromParams['params'];
                              if(h){
                                  $timeout(function(){
                                      window.location.hash = h;
                                  });
                              }
                          }
                      }
                  }
              });
          }
      ]);