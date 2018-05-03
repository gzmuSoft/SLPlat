package edu.gzmu.web;

import edu.gzmu.model.Class;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.base.provider.Parameter;
import top.ibase4j.core.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * 班级  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/class")
@Api(value = "班级接口", description = "班级接口")
public class ClassController extends BaseController<ISysProvider> {
	@Override
	public String getService() {
		return "classService";
	}

	@RequiresPermissions("sys.baseInfo.class.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询班级", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	/**
	 * 获取当前班级的信息
	 * @param modelMap 消息体
	 * @param param 前台传递过来的json参数自动解析为map结合
	 * @return 成功或失败代码以及数据
	 */
	@RequiresPermissions("sys.baseInfo.class.read")
	@PutMapping(value = "/read/infoOne")
	@ApiOperation(value = "班级信息", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object queryById(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		Parameter parameter = new Parameter(this.getService(),"queryByClassId",param);
		Object result = provider.execute(parameter).getResult();
		return setSuccessModelMap(modelMap, result);
	}

	@Override
	@ApiOperation(value = "查询班级", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.baseInfo.class.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.baseInfo.class.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "班级详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Class param = WebUtil.getParameter(request, Class.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.baseInfo.class.update")
	@ApiOperation(value = "修改班级", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Class param = WebUtil.getParameter(request, Class.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.baseInfo.class.delete")
	@ApiOperation(value = "删除班级", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Class param = WebUtil.getParameter(request, Class.class);
		return super.del(param);
	}


}