package edu.gzmu.web;

import edu.gzmu.model.AdministrativePost;
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
 * 行政职务  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/administrativePost")
@Api(value = "行政职务接口", description = "行政职务接口")
public class AdministrativePostController extends BaseController<ISysProvider> {
	public String getService() {
		return "administrativePostService";
	}

	@RequiresPermissions("administrativePost.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询行政职务", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("administrativePost.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "行政职务详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		AdministrativePost param = WebUtil.getParameter(request, AdministrativePost.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("administrativePost.update")
	@ApiOperation(value = "修改行政职务", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		AdministrativePost param = WebUtil.getParameter(request, AdministrativePost.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("administrativePost.delete")
	@ApiOperation(value = "删除行政职务", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		AdministrativePost param = WebUtil.getParameter(request, AdministrativePost.class);
		return super.del(param);
	}
}