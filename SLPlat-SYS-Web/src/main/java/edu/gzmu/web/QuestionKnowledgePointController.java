package edu.gzmu.web;

import edu.gzmu.model.QuestionKnowledgePoint;
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
 * 题目与知识点关联  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/questionKnowledgePoint")
@Api(value = "题目与知识点关联接口", description = "题目与知识点关联接口")
public class QuestionKnowledgePointController extends BaseController<ISysProvider> {
	public String getService() {
		return "questionKnowledgePointService";
	}

	@RequiresPermissions("questionKnowledgePoint.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询题目与知识点关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("questionKnowledgePoint.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "题目与知识点关联详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		QuestionKnowledgePoint param = WebUtil.getParameter(request, QuestionKnowledgePoint.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("questionKnowledgePoint.update")
	@ApiOperation(value = "修改题目与知识点关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		QuestionKnowledgePoint param = WebUtil.getParameter(request, QuestionKnowledgePoint.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("questionKnowledgePoint.delete")
	@ApiOperation(value = "删除题目与知识点关联", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		QuestionKnowledgePoint param = WebUtil.getParameter(request, QuestionKnowledgePoint.class);
		return super.del(param);
	}
}