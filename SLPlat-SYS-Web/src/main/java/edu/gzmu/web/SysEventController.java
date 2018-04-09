package edu.gzmu.web;

import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.ibase4j.core.base.provider.BaseController;

import java.util.Map;

/**
 * <p>
 * 系统日志    前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "event")
@Api(value = "系统日志接口", description = "系统日志接口")
public class SysEventController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysEventService";
	}

	@ApiOperation(value = "查询系统日志", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.event.read")
	@PutMapping(value = "/read/list")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}
}
