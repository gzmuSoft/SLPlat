package edu.gzmu.web;

import edu.gzmu.model.Teacher;
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
 * 教师  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/teacher")
@Api(value = "教师接口", description = "教师接口")
public class TeacherController extends BaseController<ISysProvider> {
	public String getService() {
		return "teacherService";
	}

	@RequiresPermissions("teacher.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询教师", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("teacher.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "教师详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Teacher param = WebUtil.getParameter(request, Teacher.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("teacher.update")
	@ApiOperation(value = "修改教师", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Teacher param = WebUtil.getParameter(request, Teacher.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("teacher.delete")
	@ApiOperation(value = "删除教师", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Teacher param = WebUtil.getParameter(request, Teacher.class);
		return super.del(param);
	}
}