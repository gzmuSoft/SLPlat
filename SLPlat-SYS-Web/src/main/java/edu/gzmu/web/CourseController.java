package edu.gzmu.web;

import edu.gzmu.model.Course;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.util.WebUtil;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.ModelMap;

/**
 * <p>
 * 课程  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/course")
@Api(value = "课程接口", description = "课程接口")
public class CourseController extends BaseController<ISysProvider> {
	public String getService() {
		return "courseService";
	}

	@RequiresPermissions("sys.baseInfo.course.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询课程", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "查询课程", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.baseInfo.course.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.baseInfo.course.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "课程详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Course param = WebUtil.getParameter(request, Course.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.baseInfo.course.read")
	@ApiOperation(value = "修改课程", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Course param = WebUtil.getParameter(request, Course.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.baseInfo.course.read")
	@ApiOperation(value = "删除课程", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Course param = WebUtil.getParameter(request, Course.class);
		return super.del(param);
	}
}