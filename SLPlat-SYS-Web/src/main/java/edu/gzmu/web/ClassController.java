package edu.gzmu.web;

import edu.gzmu.model.Class;
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
 * 班级  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/class")
@Api(value = "班级接口", description = "班级接口")
public class ClassController extends BaseController<ISysProvider> {
	public String getService() {
		return "classService";
	}

	@RequiresPermissions("sys.student.class.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询班级", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "查询班级", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.student.class.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.student.class.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "班级详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Class param = WebUtil.getParameter(request, Class.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.student.class.update")
	@ApiOperation(value = "修改班级", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Class param = WebUtil.getParameter(request, Class.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.student.class.delete")
	@ApiOperation(value = "删除班级", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Class param = WebUtil.getParameter(request, Class.class);
		return super.del(param);
	}
}