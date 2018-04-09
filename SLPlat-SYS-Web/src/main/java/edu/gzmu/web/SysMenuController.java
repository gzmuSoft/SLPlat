package edu.gzmu.web;

import edu.gzmu.model.SysMenu;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.base.provider.Parameter;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单管理    前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "menu")
@Api(value = "菜单管理接口", description = "菜单管理接口")
public class SysMenuController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysMenuService";
	}

	@ApiOperation(value = "查询菜单", produces = MediaType.APPLICATION_JSON_VALUE)
	@PutMapping(value = "/read/page")
	@RequiresPermissions("sys.base.menu.read")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "查询菜单", produces = MediaType.APPLICATION_JSON_VALUE)
	@PutMapping(value = "/read/list")
	@RequiresPermissions("sys.base.menu.read")
	public Object get(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "查询菜单", produces = MediaType.APPLICATION_JSON_VALUE)
	@PutMapping(value = "/read/tree")
	@RequiresPermissions("sys.base.menu.read")
	public Object getTree(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		Parameter parameter = new Parameter(getService(), "queryTreeList", param);
		List<?> list = provider.execute(parameter).getResultList();
		return setSuccessModelMap(modelMap, list);
	}

	@ApiOperation(value = "菜单详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@PutMapping(value = "/read/detail")
	@RequiresPermissions("sys.base.menu.read")
	public Object get(ModelMap modelMap, @RequestBody SysMenu param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改菜单", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.menu.update")
	public Object update(ModelMap modelMap, @RequestBody SysMenu param) {
		if (param.getIsShow() == null) {
			param.setIsShow(false);
		}
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除菜单", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.menu.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysMenu param) {
		return super.delete(modelMap, param);
	}

	@ApiOperation(value = "获取所有权限", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.menu.read")
	@RequestMapping(value = "/read/permission")
	public Object getPermissions(ModelMap modelMap) {
		Parameter parameter = new Parameter(getService(), "getPermissions", new SysMenu());
		List<?> list = provider.execute(parameter).getResultList();
		return setSuccessModelMap(modelMap, list);
	}
}
