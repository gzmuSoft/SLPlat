package edu.gzmu.web;

import edu.gzmu.model.ShortAnswerQuestion;
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
 * 简答题  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/shortAnswerQuestion")
@Api(value = "简答题接口", description = "简答题接口")
public class ShortAnswerQuestionController extends BaseController<ISysProvider> {
	public String getService() {
		return "shortAnswerQuestionService";
	}

	@RequiresPermissions("shortAnswerQuestion.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询简答题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("shortAnswerQuestion.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "简答题详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		ShortAnswerQuestion param = WebUtil.getParameter(request, ShortAnswerQuestion.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("shortAnswerQuestion.update")
	@ApiOperation(value = "修改简答题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		ShortAnswerQuestion param = WebUtil.getParameter(request, ShortAnswerQuestion.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("shortAnswerQuestion.delete")
	@ApiOperation(value = "删除简答题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		ShortAnswerQuestion param = WebUtil.getParameter(request, ShortAnswerQuestion.class);
		return super.del(param);
	}
}