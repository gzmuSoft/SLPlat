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
                })
                // 部门
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
                })
                // 角色
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
                })
                // 会话
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
                })
                // 字典
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
                })
                // 参数
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
                })

                .state('main.baseInfo', {
                    url: '/baseInfo',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                //学校
                .state('main.baseInfo.school', {
                    url: '/school',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.school.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/school/school.html',
                    controller: 'schoolController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/school/schoolController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.school.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/school/update.html',
                    controller: 'schoolUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/school/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.school.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/school/update.html',
                    controller: 'schoolUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/school/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //学院
                .state('main.baseInfo.college', {
                    url: '/college',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.college.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/college/college.html',
                    controller: 'collegeController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/college/collegeController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.college.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/college/update.html',
                    controller: 'collegeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/college/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.college.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/college/update.html',
                    controller: 'collegeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/college/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //专业
                .state('main.baseInfo.specialty', {
                    url: '/specialty',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.specialty.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/specialty/specialty.html',
                    controller: 'specialtyController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/specialty/specialtyController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.specialty.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/specialty/update.html',
                    controller: 'specialtyUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/specialty/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.specialty.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/specialty/update.html',
                    controller: 'specialtyUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/specialty/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //班级
                .state('main.baseInfo.class', {
                    url: '/class',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.class.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/class/class.html',
                    controller: 'classController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/class/classController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.class.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/class/update.html',
                    controller: 'classUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/class/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.class.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/class/update.html',
                    controller: 'classUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/class/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //培养方案
                .state('main.baseInfo.educationProgram', {
                    url: '/educationProgram',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.educationProgram.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/educationProgram/educationProgram.html',
                    controller: 'educationProgramController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/educationProgram/educationProgramController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.educationProgram.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/educationProgram/update.html',
                    controller: 'educationProgramUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/educationProgram/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.educationProgram.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/educationProgram/update.html',
                    controller: 'educationProgramUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/educationProgram/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })



                // 省
                .state('main.baseInfo.province', {
                    url: '/province',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.province.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/province/province.html',
                    controller: 'provinceController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/province/provinceController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.province.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/province/update.html',
                    controller: 'provinceUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/province/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.province.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/province/update.html',
                    controller: 'provinceUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/province/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                // 市
                .state('main.baseInfo.city', {
                    url: '/city',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.city.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/city/city.html',
                    controller: 'cityController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/city/cityController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.city.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/city/update.html',
                    controller: 'cityUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/city/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.city.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/city/update.html',
                    controller: 'cityUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/city/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                // 区/县
                .state('main.baseInfo.county', {
                    url: '/county',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.county.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/county/county.html',
                    controller: 'countyController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/county/countyController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.county.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/county/update.html',
                    controller: 'countyUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/county/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.county.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/county/update.html',
                    controller: 'countyUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/county/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                // 乡镇
                .state('main.baseInfo.town', {
                    url: '/town',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.town.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/town/town.html',
                    controller: 'townController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/town/townController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.town.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/town/update.html',
                    controller: 'townUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/town/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.town.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/town/update.html',
                    controller: 'townUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function (uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/town/updateController.js').then(function () {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })

                //民族
                .state('main.baseInfo.nation', {
                    url: '/nation',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.nation.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/nation/nation.html',
                    controller: 'nationController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/nation/nationController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.nation.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/nation/update.html',
                    controller: 'nationUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/nation/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.nation.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/nation/update.html',
                    controller: 'nationUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/nation/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //性别
                .state('main.baseInfo.gender', {
                    url: '/gender',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.gender.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/gender/gender.html',
                    controller: 'genderController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/gender/genderController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.gender.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/gender/update.html',
                    controller: 'genderUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/gender/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.gender.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/gender/update.html',
                    controller: 'genderUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/gender/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //政治面貌
                .state('main.baseInfo.politicalStatus', {
                    url: '/politicalStatus',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.politicalStatus.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/politicalStatus/politicalStatus.html',
                    controller: 'politicalStatusController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/politicalStatus/politicalStatusController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.politicalStatus.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/politicalStatus/update.html',
                    controller: 'politicalStatusUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/politicalStatus/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.politicalStatus.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/politicalStatus/update.html',
                    controller: 'politicalStatusUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/politicalStatus/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //职称
                .state('main.baseInfo.professionalTitle', {
                    url: '/professionalTitle',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.professionalTitle.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/professionalTitle/professionalTitle.html',
                    controller: 'professionalTitleController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/professionalTitle/professionalTitleController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.professionalTitle.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/professionalTitle/update.html',
                    controller: 'professionalTitleUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/professionalTitle/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.professionalTitle.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/professionalTitle/update.html',
                    controller: 'professionalTitleUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/professionalTitle/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //行政职务
                .state('main.baseInfo.administrativePost', {
                    url: '/administrativePost',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.administrativePost.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/administrativePost/administrativePost.html',
                    controller: 'administrativePostController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/administrativePost/administrativePostController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.administrativePost.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/administrativePost/update.html',
                    controller: 'administrativePostUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/administrativePost/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.administrativePost.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/administrativePost/update.html',
                    controller: 'administrativePostUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/administrativePost/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //高中类别
                .state('main.baseInfo.highSchoolCategory', {
                    url: '/highSchoolCategory',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.highSchoolCategory.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/highSchoolCategory/highSchoolCategory.html',
                    controller: 'highSchoolCategoryController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/highSchoolCategory/highSchoolCategoryController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.highSchoolCategory.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/highSchoolCategory/update.html',
                    controller: 'highSchoolCategoryUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/highSchoolCategory/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.highSchoolCategory.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/highSchoolCategory/update.html',
                    controller: 'highSchoolCategoryUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/highSchoolCategory/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //考生类别
                .state('main.baseInfo.examineeCategory', {
                    url: '/examineeCategory',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.examineeCategory.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/examineeCategory/examineeCategory.html',
                    controller: 'examineeCategoryController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/examineeCategory/examineeCategoryController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.examineeCategory.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/examineeCategory/update.html',
                    controller: 'examineeCategoryUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/examineeCategory/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.examineeCategory.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/examineeCategory/update.html',
                    controller: 'examineeCategoryUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/examineeCategory/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //出版社
                .state('main.baseInfo.publisher', {
                    url: '/publisher',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.publisher.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/publisher/publisher.html',
                    controller: 'publisherController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/publisher/publisherController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.publisher.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/publisher/update.html',
                    controller: 'publisherUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/publisher/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.publisher.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/publisher/update.html',
                    controller: 'publisherUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/publisher/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //批次
                .state('main.baseInfo.batch', {
                    url: '/batch',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.batch.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/batch/batch.html',
                    controller: 'batchController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/batch/batchController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.batch.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/batch/update.html',
                    controller: 'batchUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/batch/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.batch.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/batch/update.html',
                    controller: 'batchUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/batch/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //附件类型
                .state('main.baseInfo.attachmentType', {
                    url: '/attachmentType',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.attachmentType.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/attachmentType/attachmentType.html',
                    controller: 'attachmentTypeController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/attachmentType/attachmentTypeController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.attachmentType.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/attachmentType/update.html',
                    controller: 'attachmentTypeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/attachmentType/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.attachmentType.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/attachmentType/update.html',
                    controller: 'attachmentTypeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/attachmentType/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //课程类型
                .state('main.baseInfo.courseType', {
                    url: '/courseType',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.courseType.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/courseType/courseType.html',
                    controller: 'courseTypeController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/courseType/courseTypeController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.courseType.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/courseType/update.html',
                    controller: 'courseTypeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/courseType/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.courseType.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/courseType/update.html',
                    controller: 'courseTypeUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/courseType/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //学期
                .state('main.baseInfo.semester', {
                    url: '/semester',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.semester.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/semester/semester.html',
                    controller: 'semesterController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/semester/semesterController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.semester.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/semester/update.html',
                    controller: 'semesterUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/semester/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.semester.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/semester/update.html',
                    controller: 'semesterUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/semester/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //历年分数线
                .state('main.baseInfo.ceeAnnualScore', {
                    url: '/ceeAnnualScore',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.ceeAnnualScore.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/ceeAnnualScore/ceeAnnualScore.html',
                    controller: 'ceeAnnualScoreController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/ceeAnnualScore/ceeAnnualScoreController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.ceeAnnualScore.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/ceeAnnualScore/update.html',
                    controller: 'ceeAnnualScoreUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/ceeAnnualScore/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.ceeAnnualScore.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/ceeAnnualScore/update.html',
                    controller: 'ceeAnnualScoreUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/ceeAnnualScore/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //课程
                .state('main.baseInfo.course', {
                    url: '/course',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.course.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/course/course.html',
                    controller: 'courseController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/course/courseController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.course.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/course/update.html',
                    controller: 'courseUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/course/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.course.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/course/update.html',
                    controller: 'courseUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/course/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //课程教材
                .state('main.baseInfo.courseMaterial', {
                    url: '/courseMaterial',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.courseMaterial.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/courseMaterial/courseMaterial.html',
                    controller: 'courseMaterialController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/courseMaterial/courseMaterialController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.courseMaterial.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/courseMaterial/update.html',
                    controller: 'courseMaterialUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/courseMaterial/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.courseMaterial.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/courseMaterial/update.html',
                    controller: 'courseMaterialUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/courseMaterial/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                //章节
                .state('main.baseInfo.chapterAndSections', {
                    url: '/chapterAndSections',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>'
                })
                .state('main.baseInfo.chapterAndSections.list', {
                    url: '/list',
                    templateUrl: 'src/app/baseInfo/chapterAndSections/chapterAndSections.html',
                    controller: 'chapterAndSectionsController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/chapterAndSections/chapterAndSectionsController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.chapterAndSections.create', {
                    url: '/create',
                    templateUrl: 'src/app/baseInfo/chapterAndSections/update.html',
                    controller: 'chapterAndSectionsUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/chapterAndSections/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })
                .state('main.baseInfo.chapterAndSections.update', {
                    url: '/update/{id}?params',
                    templateUrl: 'src/app/baseInfo/chapterAndSections/update.html',
                    controller: 'chapterAndSectionsUpdateController',
                    resolve: {
                        deps: ['uiLoad', '$ocLazyLoad', function(uiLoad, $ocLazyLoad) {
                            return uiLoad.load('src/app/baseInfo/chapterAndSections/updateController.js').then(function() {
                                return $ocLazyLoad.load('toaster');
                            });
                        }]
                    }
                })

                // 调度管理（任务）
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
                // 日志
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