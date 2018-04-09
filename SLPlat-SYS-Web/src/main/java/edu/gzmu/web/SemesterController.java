package edu.gzmu.web;

import edu.gzmu.model.Semester;
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
 * 学期  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/semester")
@Api(value = "学期接口", description = "学期接口")
public class SemesterController extends BaseController<ISysProvider> {
	public String getService() {
		return "semesterService";
	}

	@RequiresPermissions("semester.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询学期", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("semester.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "学期详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Semester param = WebUtil.getParameter(request, Semester.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("semester.update")
	@ApiOperation(value = "修改学期", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Semester param = WebUtil.getParameter(request, Semester.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("semester.delete")
	@ApiOperation(value = "删除学期", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Semester param = WebUtil.getParameter(request, Semester.class);
		return super.del(param);
	}
}