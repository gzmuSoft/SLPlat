package edu.gzmu.web;

import edu.gzmu.model.SysParam;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;

import java.util.Map;

/**
 * <p>
 * 参数  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "param")
@Api(value = "系统参数接口", description = "系统参数接口")
public class SysParamController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysParamService";
	}

	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询系统参数", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.param.read")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "系统参数详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.param.read")
	public Object get(ModelMap modelMap, @RequestBody SysParam param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改系统参数", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.param.update")
	public Object update(ModelMap modelMap, @RequestBody SysParam param) {
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除系统参数", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.param.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysParam param) {
		return super.delete(modelMap, param);
	}
}
