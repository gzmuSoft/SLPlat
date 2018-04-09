package edu.gzmu.web;

import edu.gzmu.model.HighSchoolCategory;
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
 * 高中类别  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/highSchoolCategory")
@Api(value = "高中类别接口", description = "高中类别接口")
public class HighSchoolCategoryController extends BaseController<ISysProvider> {
	public String getService() {
		return "highSchoolCategoryService";
	}

	@RequiresPermissions("highSchoolCategory.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询高中类别", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("highSchoolCategory.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "高中类别详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		HighSchoolCategory param = WebUtil.getParameter(request, HighSchoolCategory.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("highSchoolCategory.update")
	@ApiOperation(value = "修改高中类别", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		HighSchoolCategory param = WebUtil.getParameter(request, HighSchoolCategory.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("highSchoolCategory.delete")
	@ApiOperation(value = "删除高中类别", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		HighSchoolCategory param = WebUtil.getParameter(request, HighSchoolCategory.class);
		return super.del(param);
	}
}