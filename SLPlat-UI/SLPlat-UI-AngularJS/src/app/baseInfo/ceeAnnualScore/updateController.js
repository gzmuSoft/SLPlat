'use strict';

    angular.module('app')
        .controller('ceeAnnualScoreUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
                                             function($scope, $rootScope, $state, $timeout, toaster) {
        var title = "";
        $scope.param = {};
        if($state.includes('**.ceeAnnualScore.update')){
            title="编辑历年分数线";
            var id = $state.params.id;
            activate(id);
            validate(id);
            loadProvince(id);
            loadCategory(id);
            loadBatch(id);
        }else if($state.includes('**.ceeAnnualScore.create')){
            title="添加历年分数线";
            validate(null);
            loadProvince(null);
            loadCategory(null);
            loadBatch(null);
        }
        $scope.title = $rootScope.title = title;
        $scope.loading = true;

        //初始化验证
        //validate($scope);
        $scope.submit= function(){
            var m = $scope.record;
            if(m){
                $scope.isDisabled = true;//提交disabled
                $scope.record.provinceId = $scope.recordProvinceId;
                $scope.record.categoryId = $scope.recordCategoryId;
                $scope.record.batchId = $scope.recordBatchId;
                $.ajax({
                	type: 'POST',
    	            dataType: 'json',
    				contentType:'application/json;charset=UTF-8',
    				url : '/ceeAnnualScore',
    				data: angular.toJson($scope.record)
    			}).then(callback);
            }
            function callback(result) {
                if(result.code ==200){//成功
                    toaster.clear('*');
                    toaster.pop('success', '', "保存成功");
                    $timeout(function(){
                        $state.go('main.baseInfo.ceeAnnualScore.list');
                    },2000);
                }else{
                    toaster.clear('*');
                    toaster.pop('error', '', result.msg);
                    $scope.isDisabled = false;
                }
            }
        }

        //加载上级省份信息
        function loadProvince(id) {
            $scope.loading = true;
            $.ajax({
                type: 'PUT',
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                url : '/province/read/page',
                data: angular.toJson($scope.param)
            }).then(function(result) {
                $scope.loading = false;
                if (result.code == 200) {
                    $scope.provinceNames = result.rows;
                    var i = 0;
                    if(id != null) {
                        for (var item in $scope.provinceNames) {
                            if ($scope.record.provinceId != null && item == $scope.record.provinceId) {
                                $scope.recordProvinceId = item;
                                break;
                            }
                            i++;
                        }
                    }
                    if(i == $scope.provinceNames.length || id == null)$scope.recordProvinceId="0";
                } else {
                    $scope.msg = result.msg;
                }
                $scope.$apply();
            });
        }

        //加载上级考生类别信息
        function loadCategory(id) {
            $scope.loading = true;
            $.ajax({
                type: 'PUT',
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                url : '/examineeCategory/read/page',
                data: angular.toJson($scope.param)
            }).then(function(result) {
                $scope.loading = false;
                if (result.code == 200) {
                    $scope.categoryNames = result.rows;
                    var i = 0;
                    if(id != null) {
                        for (var item in $scope.categoryNames) {
                            if ($scope.record.categoryId != null && item == $scope.record.categoryId) {
                                $scope.recordCategoryId = item;
                                break;
                            }
                            i++;
                        }
                    }
                    if(i == $scope.categoryNames.length || id == null)$scope.recordCategoryId="0";
                } else {
                    $scope.msg = result.msg;
                }
                $scope.$apply();
            });
        }

        //加载上级批次信息
        function loadBatch(id) {
            $scope.loading = true;
            $.ajax({
                type: 'PUT',
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                url : '/batch/read/page',
                data: angular.toJson($scope.param)
            }).then(function(result) {
                $scope.loading = false;
                if (result.code == 200) {
                    $scope.batchNames = result.rows;
                    var i = 0;
                    if(id != null) {
                        for (var item in $scope.batchNames) {
                            if ($scope.record.batchId != null && item == $scope.record.batchId) {
                                $scope.recordBatchId = item;
                                break;
                            }
                            i++;
                        }
                    }
                    if(i == $scope.batchNames.length || id == null)$scope.recordBatchId="0";
                } else {
                    $scope.msg = result.msg;
                }
                $scope.$apply();
            });
        }


        // 初始化页面
        function activate(id) {
	        $scope.loading = true;
        	$.ajax({
        		type: 'PUT',
	            dataType: 'json',
				contentType:'application/json;charset=UTF-8',
				url : '/ceeAnnualScore/read/detail',
				data: angular.toJson({'id': id})
			}).then(function(result) {
		        $scope.loading = false;
				if (result.code == 200) {
					$scope.record = result.data;
				} else {
					$scope.msg = result.msg;
				}
				$scope.$apply();
			});
        }

        //表单验证
        function validate(userId){
            jQuery('form').validate({
                rules: {
                    name: {
                        required: true,
                        stringCheck:[],
                        maxLengthB:[20]
                    },
                    sortNo: {
                        required: true
                    }
                },
                messages: {
                    name: {
                        required: '请填写历年分数线名称',
                        maxLengthB:"历年分数线名称不得超过{0}个字符"
                    },
                    sortNo: {
                        required: '请填写排序'
                    }
                },
                submitHandler: function() {
                    $scope.submit();
                }
            });
        }

    }]);