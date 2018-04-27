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