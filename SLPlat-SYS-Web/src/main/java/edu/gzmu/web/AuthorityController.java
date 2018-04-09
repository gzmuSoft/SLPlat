package edu.gzmu.web;

import edu.gzmu.model.Authority;
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
 * 权限  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/authority")
@Api(value = "权限接口", description = "权限接口")
public class AuthorityController extends BaseController<ISysProvider> {
	public String getService() {
		return "authorityService";
	}

	@RequiresPermissions("authority.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询权限", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("authority.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "权限详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Authority param = WebUtil.getParameter(request, Authority.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("authority.update")
	@ApiOperation(value = "修改权限", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Authority param = WebUtil.getParameter(request, Authority.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("authority.delete")
	@ApiOperation(value = "删除权限", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Authority param = WebUtil.getParameter(request, Authority.class);
		return super.del(param);
	}
}