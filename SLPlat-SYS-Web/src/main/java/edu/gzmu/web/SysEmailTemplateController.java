package edu.gzmu.web;

import edu.gzmu.model.SysEmailTemplate;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import top.ibase4j.core.base.provider.BaseController;

import java.util.Map;

/**
 * <p>
 * 邮件模版  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "emailTemplate")
@Api(value = "邮件模版接口", description = "邮件模版接口")
public class SysEmailTemplateController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysEmailTemplateService";
	}

	@ApiOperation(value = "查询邮件模版", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.template.read")
	@RequestMapping(value = "/read/list", method = RequestMethod.PUT)
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "邮件模版详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.template.read")
	@RequestMapping(value = "/read/detail", method = RequestMethod.PUT)
	public Object get(ModelMap modelMap, @RequestBody SysEmailTemplate param) {
		return super.get(modelMap, param);
	}

	@ApiOperation(value = "修改邮件模版", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.template.update")
	@RequestMapping(method = RequestMethod.POST)
	public Object update(ModelMap modelMap, @RequestBody SysEmailTemplate param) {
		return super.update(modelMap, param);
	}

	@ApiOperation(value = "删除邮件模版", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.template.delete")
	@RequestMapping(method = RequestMethod.DELETE)
	public Object delete(ModelMap modelMap, @RequestBody SysEmailTemplate param) {
		return super.delete(modelMap, param);
	}
}
