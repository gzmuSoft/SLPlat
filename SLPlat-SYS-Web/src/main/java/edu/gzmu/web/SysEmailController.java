package edu.gzmu.web;

import edu.gzmu.model.SysEmail;
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
 * 邮件  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "email")
@Api(value = "邮件接口", description = "邮件接口")
public class SysEmailController extends BaseController<ISysProvider> {

	public String getService() {
		return "sysEmailService";
	}

	@ApiOperation(value = "查询邮件", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.list.read")
	@PutMapping(value = "/read/list")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "邮件详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.list.read")
	@PutMapping(value = "/read/detail")
	public Object get(ModelMap modelMap, @RequestBody SysEmail param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改邮件", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.list.update")
	public Object update(ModelMap modelMap, @RequestBody SysEmail param) {
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除邮件", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.list.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysEmail param) {
		return super.delete(modelMap, param);
	}
}
