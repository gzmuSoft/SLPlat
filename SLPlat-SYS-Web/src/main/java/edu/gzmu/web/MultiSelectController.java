package edu.gzmu.web;

import edu.gzmu.model.MultiSelect;
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
 * 多项选择题  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/multiSelect")
@Api(value = "多项选择题接口", description = "多项选择题接口")
public class MultiSelectController extends BaseController<ISysProvider> {
	public String getService() {
		return "multiSelectService";
	}

	@RequiresPermissions("multiSelect.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询多项选择题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("multiSelect.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "多项选择题详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		MultiSelect param = WebUtil.getParameter(request, MultiSelect.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("multiSelect.update")
	@ApiOperation(value = "修改多项选择题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		MultiSelect param = WebUtil.getParameter(request, MultiSelect.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("multiSelect.delete")
	@ApiOperation(value = "删除多项选择题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		MultiSelect param = WebUtil.getParameter(request, MultiSelect.class);
		return super.del(param);
	}
}