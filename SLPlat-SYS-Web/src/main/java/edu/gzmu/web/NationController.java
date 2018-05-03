package edu.gzmu.web;

import edu.gzmu.model.Nation;
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
 * 民族  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/nation")
@Api(value = "民族接口", description = "民族接口")
public class NationController extends BaseController<ISysProvider> {
	public String getService() {
		return "nationService";
	}

	@RequiresPermissions("sys.baseInfo.nation.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询民族", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@ApiOperation(value = "查询民族", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.baseInfo.nation.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.baseInfo.nation.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "民族详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Nation param = WebUtil.getParameter(request, Nation.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.baseInfo.nation.update")
	@ApiOperation(value = "修改民族", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Nation param = WebUtil.getParameter(request, Nation.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.baseInfo.nation.delete")
	@ApiOperation(value = "删除民族", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Nation param = WebUtil.getParameter(request, Nation.class);
		return super.del(param);
	}
}