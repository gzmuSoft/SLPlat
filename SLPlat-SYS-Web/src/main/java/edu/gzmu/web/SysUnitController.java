package edu.gzmu.web;

import edu.gzmu.model.SysUnit;
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
 * 单位管理  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "unit")
@Api(value = "单位管理接口", description = "单位管理接口")
public class SysUnitController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysUnitService";
	}

	@ApiOperation(value = "查询单位", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.unit.read")
	@PutMapping(value = "/read/list")
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "查询单位", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.unit.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "单位详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.unit.read")
	@PutMapping(value = "/read/detail")
	public Object get(ModelMap modelMap, @RequestBody SysUnit param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改单位", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.unit.update")
	public Object update(ModelMap modelMap, @RequestBody SysUnit param) {
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除单位", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.unit.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysUnit param) {
		return super.delete(modelMap, param);
	}
}
