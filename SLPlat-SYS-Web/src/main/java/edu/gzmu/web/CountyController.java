package edu.gzmu.web;

import edu.gzmu.model.County;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.util.WebUtil;
import top.ibase4j.core.base.provider.Parameter;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 区县  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/county")
@Api(value = "区县接口", description = "区县接口")
public class CountyController extends BaseController<ISysProvider> {
	public String getService() {
		return "countyService";
	}

	@RequiresPermissions("sys.site.county.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询区县", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "查询区县", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.site.county.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.site.county.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "区县详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		County param = WebUtil.getParameter(request, County.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.site.county.update")
	@ApiOperation(value = "修改区县", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		County param = WebUtil.getParameter(request, County.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.site.county.delete")
	@ApiOperation(value = "删除区县", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		County param = WebUtil.getParameter(request, County.class);
		return super.del(param);
	}
}