package edu.gzmu.web;

import edu.gzmu.model.Province;
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
 * 省份  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/province")
@Api(value = "省份接口", description = "省份接口")
public class ProvinceController extends BaseController<ISysProvider> {
	public String getService() {
		return "provinceService";
	}

	@RequiresPermissions("province.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询省份", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("province.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "省份详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Province param = WebUtil.getParameter(request, Province.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("province.update")
	@ApiOperation(value = "修改省份", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Province param = WebUtil.getParameter(request, Province.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("province.delete")
	@ApiOperation(value = "删除省份", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Province param = WebUtil.getParameter(request, Province.class);
		return super.del(param);
	}
}