package edu.gzmu.web;

import edu.gzmu.model.CourseTeaching;
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
 * 课程讲授  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/courseTeaching")
@Api(value = "课程讲授接口", description = "课程讲授接口")
public class CourseTeachingController extends BaseController<ISysProvider> {
	public String getService() {
		return "courseTeachingService";
	}

	@RequiresPermissions("courseTeaching.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询课程讲授", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("courseTeaching.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "课程讲授详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		CourseTeaching param = WebUtil.getParameter(request, CourseTeaching.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("courseTeaching.update")
	@ApiOperation(value = "修改课程讲授", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		CourseTeaching param = WebUtil.getParameter(request, CourseTeaching.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("courseTeaching.delete")
	@ApiOperation(value = "删除课程讲授", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		CourseTeaching param = WebUtil.getParameter(request, CourseTeaching.class);
		return super.del(param);
	}
}