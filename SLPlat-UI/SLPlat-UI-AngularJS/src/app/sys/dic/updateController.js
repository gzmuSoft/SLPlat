'use strict';

    angular.module('app')
        .controller('dicUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
                                             function($scope, $rootScope, $state, $timeout, toaster) {
        var title = "";
        if($state.includes('**.dic.update')){
            title="编辑字典";
            var id = $state.params.id;
            activate(id);
            validate(id);
        }else if($state.includes('**.dic.create')){
            title="添加字典";
            validate(null);
        }
        $scope.title = $rootScope.title = title;
        $scope.loading = true;

        //初始化验证
        //validate($scope);
        $scope.submit= function(){
            var m = $scope.record;
            if(m){
                $scope.isDisabled = true;//提交disabled
                $.ajax({
    				type: 'POST',
    	            dataType: 'json',
    				contentType:'application/json;charset=UTF-8',
    				url : '/dic',
    				data: angular.toJson($scope.record)
    			}).then(callback);
            }
            function callback(result) {
                if(result.code ==200){//成功
                    toaster.clear('*');
                    toaster.pop('success', '', "保存成功");
                    $timeout(function(){
                        $state.go('main.sys.dic.list');
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
				url : '/dic/read/detail',
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
                    type: {
                        required: true,
                        stringCheck:[],
                        maxLengthB:[20]
                    },
                    codeText: {
                        required: true,
                        stringCheck:[],
                        maxLengthB:[20]
                    },
                    code: {
                        required: true,
                        stringCheck:[],
                        maxLengthB:[20]
                    }
                },
                messages: {
                    type: {
                        required: '请填写类型',
                        maxLengthB:"类型不得超过{0}个字符"
                    },
                    codeText: {
                        required: '请填写字典名称',
                        maxLengthB:"字典名称不得超过{0}个字符"
                    },
                    code: {
                        required: '请填写关键字',
                        maxLengthB:"关键字不得超过{0}个字符"
                    }
                },
                submitHandler: function() {
                    $scope.submit();
                }
            });
        }

    }]);