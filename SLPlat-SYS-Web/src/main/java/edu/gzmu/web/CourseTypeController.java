package edu.gzmu.web;

import edu.gzmu.model.CourseType;
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
 * 课程类型  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/courseType")
@Api(value = "课程类型接口", description = "课程类型接口")
public class CourseTypeController extends BaseController<ISysProvider> {
	public String getService() {
		return "courseTypeService";
	}

	@RequiresPermissions("sys.message.courseType.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询课程类型", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@ApiOperation(value = "查询课程类型", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.message.courseType.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.message.courseType.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "课程类型详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		CourseType param = WebUtil.getParameter(request, CourseType.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.message.courseType.update")
	@ApiOperation(value = "修改课程类型", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		CourseType param = WebUtil.getParameter(request, CourseType.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.message.courseType.delete")
	@ApiOperation(value = "删除课程类型", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		CourseType param = WebUtil.getParameter(request, CourseType.class);
		return super.del(param);
	}
}