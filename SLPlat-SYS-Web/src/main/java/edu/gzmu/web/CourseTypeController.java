package edu.gzmu.web;

import edu.gzmu.model.CourseType;
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

	@RequiresPermissions("courseType.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询课程类型", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("courseType.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "课程类型详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		CourseType param = WebUtil.getParameter(request, CourseType.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("courseType.update")
	@ApiOperation(value = "修改课程类型", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		CourseType param = WebUtil.getParameter(request, CourseType.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("courseType.delete")
	@ApiOperation(value = "删除课程类型", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		CourseType param = WebUtil.getParameter(request, CourseType.class);
		return super.del(param);
	}
}