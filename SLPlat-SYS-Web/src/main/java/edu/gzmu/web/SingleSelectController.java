package edu.gzmu.web;

import edu.gzmu.model.SingleSelect;
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
 * 单项选择题  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/singleSelect")
@Api(value = "单项选择题接口", description = "单项选择题接口")
public class SingleSelectController extends BaseController<ISysProvider> {
	public String getService() {
		return "singleSelectService";
	}

	@RequiresPermissions("singleSelect.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询单项选择题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("singleSelect.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "单项选择题详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		SingleSelect param = WebUtil.getParameter(request, SingleSelect.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("singleSelect.update")
	@ApiOperation(value = "修改单项选择题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		SingleSelect param = WebUtil.getParameter(request, SingleSelect.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("singleSelect.delete")
	@ApiOperation(value = "删除单项选择题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		SingleSelect param = WebUtil.getParameter(request, SingleSelect.class);
		return super.del(param);
	}
}