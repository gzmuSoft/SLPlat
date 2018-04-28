package edu.gzmu.web;

import edu.gzmu.model.College;
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
 * 学院  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/college")
@Api(value = "学院接口", description = "学院接口")
public class CollegeController extends BaseController<ISysProvider> {
	public String getService() { return "collegeService"; }

	@RequiresPermissions("sys.student.college.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询学院", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "查询学院", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.student.college.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}


	@RequiresPermissions("sys.student.college.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "学院详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		College param = WebUtil.getParameter(request, College.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.student.college.update")
	@ApiOperation(value = "修改学院", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		College param = WebUtil.getParameter(request, College.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.student.college.delete")
	@ApiOperation(value = "删除学院", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		College param = WebUtil.getParameter(request, College.class);
		return super.del(param);
	}
}