package edu.gzmu.web;

import edu.gzmu.model.Completion;
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
 * 填空题  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/completion")
@Api(value = "填空题接口", description = "填空题接口")
public class CompletionController extends BaseController<ISysProvider> {
	public String getService() {
		return "completionService";
	}

	@RequiresPermissions("completion.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询填空题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("completion.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "填空题详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Completion param = WebUtil.getParameter(request, Completion.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("completion.update")
	@ApiOperation(value = "修改填空题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Completion param = WebUtil.getParameter(request, Completion.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("completion.delete")
	@ApiOperation(value = "删除填空题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Completion param = WebUtil.getParameter(request, Completion.class);
		return super.del(param);
	}
}