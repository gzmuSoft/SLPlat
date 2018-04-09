package edu.gzmu.web;

import edu.gzmu.model.SelectOptions;
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
 * 选择题选项  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/selectOptions")
@Api(value = "选择题选项接口", description = "选择题选项接口")
public class SelectOptionsController extends BaseController<ISysProvider> {
	public String getService() {
		return "selectOptionsService";
	}

	@RequiresPermissions("selectOptions.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询选择题选项", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("selectOptions.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "选择题选项详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		SelectOptions param = WebUtil.getParameter(request, SelectOptions.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("selectOptions.update")
	@ApiOperation(value = "修改选择题选项", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		SelectOptions param = WebUtil.getParameter(request, SelectOptions.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("selectOptions.delete")
	@ApiOperation(value = "删除选择题选项", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		SelectOptions param = WebUtil.getParameter(request, SelectOptions.class);
		return super.del(param);
	}
}