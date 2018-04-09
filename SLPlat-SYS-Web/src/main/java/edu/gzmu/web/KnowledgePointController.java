package edu.gzmu.web;

import edu.gzmu.model.KnowledgePoint;
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
 * 知识点  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/knowledgePoint")
@Api(value = "知识点接口", description = "知识点接口")
public class KnowledgePointController extends BaseController<ISysProvider> {
	public String getService() {
		return "knowledgePointService";
	}

	@RequiresPermissions("knowledgePoint.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询知识点", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("knowledgePoint.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "知识点详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		KnowledgePoint param = WebUtil.getParameter(request, KnowledgePoint.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("knowledgePoint.update")
	@ApiOperation(value = "修改知识点", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		KnowledgePoint param = WebUtil.getParameter(request, KnowledgePoint.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("knowledgePoint.delete")
	@ApiOperation(value = "删除知识点", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		KnowledgePoint param = WebUtil.getParameter(request, KnowledgePoint.class);
		return super.del(param);
	}
}