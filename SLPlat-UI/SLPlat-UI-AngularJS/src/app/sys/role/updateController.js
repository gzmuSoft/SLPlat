'use strict';

    angular.module('app')
        .controller('roleUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
                                             function($scope, $rootScope, $state, $timeout, toaster) {
        var title = "";
        $scope.param = {};
        if($state.includes('**.role.update')){
            title="编辑角色";
            var id = $state.params.id;
            activate(id);
            validate(id);
        }else if($state.includes('**.role.create')){
            title="添加角色";
            validate(null);
            loadDept(null);
        }
        $scope.title = $rootScope.title = title;
        $scope.loading = true;

        //初始化验证
        //validate($scope);
        $scope.submit= function(){
            var m = $scope.record;
            if(m){
                $scope.isDisabled = true;//提交disabled
                $scope.record.roleType = $scope.recordRoleType;
                $scope.record.deptId = $scope.recordDeptId;
                $.ajax({
    				type: 'POST',
    	            dataType: 'json',
    				contentType:'application/json;charset=UTF-8',
    				url : '/role',
    				data: angular.toJson($scope.record)
    			}).then(callback);
            }
            function callback(result) {
                if(result.code ==200){//成功
                    toaster.clear('*');
                    toaster.pop('success', '', "保存成功");
                    $timeout(function(){
                        $state.go('main.sys.role.list');
                    },2000);
                }else{
                    toaster.clear('*');
                    toaster.pop('error', '', result.msg);
                    $scope.isDisabled = false;
                }
            }
        }

        //加载部门信息
        function loadDept(id) {
            $scope.loading = true;
            $.ajax({
                type: 'PUT',
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                url : '/dept/read/list',
                data: angular.toJson($scope.param)
            }).then(function(result) {
                $scope.loading = false;
                if (result.code == 200) {
                    $scope.deptNames = result.rows;
                    var i = 0;
                    if(id != null) {
                        for (var item in $scope.deptNames) {
                            if ($scope.record.deptId != null && item == $scope.record.deptId) {
                            $scope.recordDeptId = item;
                            break;
                        }
                        i++;
                    }
                }
                if(i == $scope.deptNames.length || id == null)$scope.recordDeptId="0";
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
				url : '/role/read/detail',
				data: angular.toJson({'id': id})
			}).then(function(result) {
		        $scope.loading = false;
				if (result.code == 200) {
					$scope.record = result.data;
				} else {
					$scope.msg = result.msg;
				}
				loadDept($scope.record.deptId);
                $scope.recordRoleType = $scope.record.roleType;
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
                    }
                },
                messages: {
                	name: {
                        required: '请填写角色名称',
                        maxLengthB:"部门名称不得超过{0}个字符"
                    },
                },
                submitHandler: function() {
                    $scope.submit();
                }
            });
        }

    }]);