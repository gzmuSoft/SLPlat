package edu.gzmu.web;

import edu.gzmu.model.SysMsg;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;

import java.util.Map;

/**
 * <p>
 * 短信  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/msg")
@Api(value = "短信接口", description = "短信接口")
public class SysMsgController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysMsgService";
	}

	@ApiOperation(value = "查询短信", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("msg.list.read")
	@PutMapping(value = "/read/list")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "短信详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("msg.list.read")
	@PutMapping(value = "/read/detail")
	public Object get(ModelMap modelMap, @RequestBody SysMsg param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改短信", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("msg.list.update")
	public Object update(ModelMap modelMap, @RequestBody SysMsg param) {
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除短信", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("msg.list.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysMsg param) {
		return super.delete(modelMap, param);
	}
}