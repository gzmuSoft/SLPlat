package edu.gzmu.web;

import edu.gzmu.model.Judgment;
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
 * 判断题  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/judgment")
@Api(value = "判断题接口", description = "判断题接口")
public class JudgmentController extends BaseController<ISysProvider> {
	public String getService() {
		return "judgmentService";
	}

	@RequiresPermissions("judgment.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询判断题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("judgment.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "判断题详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Judgment param = WebUtil.getParameter(request, Judgment.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("judgment.update")
	@ApiOperation(value = "修改判断题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Judgment param = WebUtil.getParameter(request, Judgment.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("judgment.delete")
	@ApiOperation(value = "删除判断题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Judgment param = WebUtil.getParameter(request, Judgment.class);
		return super.del(param);
	}
}