'use strict';

    angular.module('app')
        .controller('deptUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
                                             function($scope, $rootScope, $state, $timeout, toaster) {
        var title = "";
        $scope.param = {};
        if($state.includes('**.dept.update')){
            title="编辑部门";
            var id = $state.params.id;
            activate(id);
            validate(id);
            loadParent(id);
        }else if($state.includes('**.dept.create')){
            title="添加部门";
            validate(null);
            loadParent(null);
        }
        $scope.title = $rootScope.title = title;
        $scope.loading = true;

        //初始化验证
        //validate($scope);
        $scope.submit= function(){
            var m = $scope.record;
            if(m){
                $scope.isDisabled = true;//提交disabled
                $scope.record.parentId = $scope.recordParentId;
                $.ajax({
                	type: 'POST',
    	            dataType: 'json',
    				contentType:'application/json;charset=UTF-8',
    				url : '/dept',
    				data: angular.toJson($scope.record)
    			}).then(callback);
            }
            function callback(result) {
                if(result.code ==200){//成功
                    toaster.clear('*');
                    toaster.pop('success', '', "保存成功");
                    $timeout(function(){
                        $state.go('main.sys.dept.list');
                    },2000);
                }else{
                    toaster.clear('*');
                    toaster.pop('error', '', result.msg);
                    $scope.isDisabled = false;
                }
            }
        }

        // 初始化页面
        function activate(id) {
	        $scope.loading = true;
        	$.ajax({
        		type: 'PUT',
	            dataType: 'json',
				contentType:'application/json;charset=UTF-8',
				url : '/dept/read/detail',
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

        //加载上级部门信息
        function loadParent(id) {
            $scope.loading = true;
            $.ajax({
                type: 'PUT',
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                url : '/dept/read/list',
                data: angular.toJson($scope.param)
            }).then(function(resultDepInfo) {
                $scope.loading = false;
                if (resultDepInfo.code == 200) {
                    $scope.parentNames = resultDepInfo.rows;
                    var i = 0;
                    if(id != null) {
                        for (var item in $scope.parentNames) {
                            if ($scope.record.parentId != null && item == $scope.record.parentId) {
                            $scope.recordParentId = item;
                            break;
                        }
                        i++;
                    }
                }
                if(i == $scope.parentNames.length || id == null)$scope.recordParentId="0";
                } else {
                    $scope.msg = resultDepInfo.msg;
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
                        required: '请填写部门名称',
                        maxLengthB:"部门名称不得超过{0}个字符"
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