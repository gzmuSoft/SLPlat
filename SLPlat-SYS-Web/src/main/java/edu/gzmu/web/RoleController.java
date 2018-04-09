package edu.gzmu.web;

import edu.gzmu.model.Role;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("/role_New")
@Api(value = "角色接口", description = "角色接口")
public class RoleController extends BaseController<ISysProvider> {
	public String getService() {
		return "roleService";
	}

	@RequiresPermissions("role_New.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询角色", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("role_New.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "角色详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Role param = WebUtil.getParameter(request, Role.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("role_New.update")
	@ApiOperation(value = "修改角色", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Role param = WebUtil.getParameter(request, Role.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("role_New.delete")
	@ApiOperation(value = "删除角色", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Role param = WebUtil.getParameter(request, Role.class);
		return super.del(param);
	}
}