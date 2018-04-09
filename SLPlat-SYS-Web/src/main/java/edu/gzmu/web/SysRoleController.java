package edu.gzmu.web;

import edu.gzmu.model.SysRole;
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
 * 角色  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "role")
@Api(value = "角色管理", description = "角色管理")
public class SysRoleController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysRoleService";
	}

	@ApiOperation(value = "查询角色", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.role.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "查询角色", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.role.read")
	@PutMapping(value = "/read/list")
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "角色详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.role.read")
	@PutMapping(value = "/read/detail")
	public Object get(ModelMap modelMap, @RequestBody SysRole param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改角色", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.role.update")
	public Object update(ModelMap modelMap, @RequestBody SysRole param) {
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除角色", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.role.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysRole param) {
		return super.delete(modelMap, param);
	}
}
