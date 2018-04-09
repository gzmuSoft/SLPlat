package edu.gzmu.web;

import edu.gzmu.model.UserRole;
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
 * 用户角色关联  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/userRole")
@Api(value = "用户角色关联接口", description = "用户角色关联接口")
public class UserRoleController extends BaseController<ISysProvider> {
	public String getService() {
		return "userRoleService";
	}

	@RequiresPermissions("userRole.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询用户角色关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("userRole.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "用户角色关联详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		UserRole param = WebUtil.getParameter(request, UserRole.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("userRole.update")
	@ApiOperation(value = "修改用户角色关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		UserRole param = WebUtil.getParameter(request, UserRole.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("userRole.delete")
	@ApiOperation(value = "删除用户角色关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		UserRole param = WebUtil.getParameter(request, UserRole.class);
		return super.del(param);
	}
}