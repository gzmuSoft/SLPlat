package edu.gzmu.web;

import edu.gzmu.model.City;
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
 * 市  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/city")
@Api(value = "市接口", description = "市接口")
public class CityController extends BaseController<ISysProvider> {
	public String getService() {
		return "cityService";
	}

	@RequiresPermissions("city.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询市", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("city.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "市详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		City param = WebUtil.getParameter(request, City.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("city.update")
	@ApiOperation(value = "修改市", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		City param = WebUtil.getParameter(request, City.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("city.delete")
	@ApiOperation(value = "删除市", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		City param = WebUtil.getParameter(request, City.class);
		return super.del(param);
	}
}