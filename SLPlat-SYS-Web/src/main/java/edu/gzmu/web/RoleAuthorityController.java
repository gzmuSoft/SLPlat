package edu.gzmu.web;

import edu.gzmu.model.RoleAuthority;
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
 * 角色权限关联  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/roleAuthority")
@Api(value = "角色权限关联接口", description = "角色权限关联接口")
public class RoleAuthorityController extends BaseController<ISysProvider> {
	public String getService() {
		return "roleAuthorityService";
	}

	@RequiresPermissions("roleAuthority.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询角色权限关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("roleAuthority.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "角色权限关联详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		RoleAuthority param = WebUtil.getParameter(request, RoleAuthority.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("roleAuthority.update")
	@ApiOperation(value = "修改角色权限关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		RoleAuthority param = WebUtil.getParameter(request, RoleAuthority.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("roleAuthority.delete")
	@ApiOperation(value = "删除角色权限关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		RoleAuthority param = WebUtil.getParameter(request, RoleAuthority.class);
		return super.del(param);
	}
}