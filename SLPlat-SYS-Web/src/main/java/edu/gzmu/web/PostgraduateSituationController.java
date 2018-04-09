package edu.gzmu.web;

import edu.gzmu.model.PostgraduateSituation;
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
 * 考研情况  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/postgraduateSituation")
@Api(value = "考研情况接口", description = "考研情况接口")
public class PostgraduateSituationController extends BaseController<ISysProvider> {
	public String getService() {
		return "postgraduateSituationService";
	}

	@RequiresPermissions("postgraduateSituation.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询考研情况", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("postgraduateSituation.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "考研情况详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		PostgraduateSituation param = WebUtil.getParameter(request, PostgraduateSituation.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("postgraduateSituation.update")
	@ApiOperation(value = "修改考研情况", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		PostgraduateSituation param = WebUtil.getParameter(request, PostgraduateSituation.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("postgraduateSituation.delete")
	@ApiOperation(value = "删除考研情况", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		PostgraduateSituation param = WebUtil.getParameter(request, PostgraduateSituation.class);
		return super.del(param);
	}
}