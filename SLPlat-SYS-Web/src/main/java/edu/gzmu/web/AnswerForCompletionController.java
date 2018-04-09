package edu.gzmu.web;

import edu.gzmu.model.AnswerForCompletion;
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
 * 填空题答案  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/answerForCompletion")
@Api(value = "填空题答案接口", description = "填空题答案接口")
public class AnswerForCompletionController extends BaseController<ISysProvider> {
	public String getService() {
		return "answerForCompletionService";
	}

	@RequiresPermissions("answerForCompletion.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询填空题答案", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("answerForCompletion.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "填空题答案详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		AnswerForCompletion param = WebUtil.getParameter(request, AnswerForCompletion.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("answerForCompletion.update")
	@ApiOperation(value = "修改填空题答案", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		AnswerForCompletion param = WebUtil.getParameter(request, AnswerForCompletion.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("answerForCompletion.delete")
	@ApiOperation(value = "删除填空题答案", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		AnswerForCompletion param = WebUtil.getParameter(request, AnswerForCompletion.class);
		return super.del(param);
	}
}