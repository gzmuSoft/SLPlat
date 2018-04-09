package edu.gzmu.web;

import edu.gzmu.model.User;
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
 * 用户  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/user_new")
@Api(value = "用户接口", description = "用户接口")
public class UserController extends BaseController<ISysProvider> {
	public String getService() {
		return "userService";
	}

	@RequiresPermissions("user_new.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询用户", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("user_new.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "用户详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		User param = WebUtil.getParameter(request, User.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("user_new.update")
	@ApiOperation(value = "修改用户", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		User param = WebUtil.getParameter(request, User.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("user_new.delete")
	@ApiOperation(value = "删除用户", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		User param = WebUtil.getParameter(request, User.class);
		return super.del(param);
	}
}