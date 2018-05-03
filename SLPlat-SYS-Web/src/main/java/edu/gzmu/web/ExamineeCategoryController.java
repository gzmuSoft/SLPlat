package edu.gzmu.web;

import edu.gzmu.model.ExamineeCategory;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * 考生类别  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/examineeCategory")
@Api(value = "考生类别接口", description = "考生类别接口")
public class ExamineeCategoryController extends BaseController<ISysProvider> {
	public String getService() {
		return "examineeCategoryService";
	}

	@RequiresPermissions("sys.baseInfo.examineeCategory.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询考生类别", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@ApiOperation(value = "查询考生类别", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.baseInfo.examineeCategory.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.baseInfo.examineeCategory.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "考生类别详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		ExamineeCategory param = WebUtil.getParameter(request, ExamineeCategory.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.baseInfo.examineeCategory.update")
	@ApiOperation(value = "修改考生类别", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		ExamineeCategory param = WebUtil.getParameter(request, ExamineeCategory.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.baseInfo.examineeCategory.delete")
	@ApiOperation(value = "删除考生类别", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		ExamineeCategory param = WebUtil.getParameter(request, ExamineeCategory.class);
		return super.del(param);
	}
}