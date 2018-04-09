package edu.gzmu.web;

import edu.gzmu.model.Student;
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
 * 学生  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/student")
@Api(value = "学生接口", description = "学生接口")
public class StudentController extends BaseController<ISysProvider> {
	public String getService() {
		return "studentService";
	}

	@RequiresPermissions("student.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询学生", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("student.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "学生详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Student param = WebUtil.getParameter(request, Student.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("student.update")
	@ApiOperation(value = "修改学生", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Student param = WebUtil.getParameter(request, Student.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("student.delete")
	@ApiOperation(value = "删除学生", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Student param = WebUtil.getParameter(request, Student.class);
		return super.del(param);
	}
}