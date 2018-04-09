package edu.gzmu.web;

import edu.gzmu.model.SysMsgConfig;
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
 * 短信配置  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/msgConfig")
@Api(value = "短信配置接口", description = "短信配置接口")
public class SysMsgConfigController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysMsgConfigService";
	}

	@ApiOperation(value = "查询短信配置", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("msg.config.read")
	@PutMapping(value = "/read/list")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "短信配置详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("msg.config.read")
	@PutMapping(value = "/read/detail")
	public Object get(ModelMap modelMap, @RequestBody SysMsgConfig param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改短信配置", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("msg.config.update")
	public Object update(ModelMap modelMap, @RequestBody SysMsgConfig param) {
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除短信配置", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("msg.config.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysMsgConfig param) {
		return super.delete(modelMap, param);
	}
}