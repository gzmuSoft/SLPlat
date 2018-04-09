package edu.gzmu.web;

import edu.gzmu.model.SysEmailConfig;
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
import top.ibase4j.core.base.provider.Parameter;
import top.ibase4j.core.util.DataUtil;
import top.ibase4j.core.util.SecurityUtil;

import java.util.Map;

/**
 * <p>
 * 邮件配置  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "emailConfig")
@Api(value = "邮件配置接口", description = "邮件配置接口")
public class SysEmailConfigController extends BaseController<ISysProvider> {

	public String getService() {
		return "sysEmailConfigService";
	}

	@ApiOperation(value = "查询邮件配置", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.config.read")
	@RequestMapping(value = "/read/list", method = RequestMethod.PUT)
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "邮件配置详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.config.read")
	@RequestMapping(value = "/read/detail", method = RequestMethod.PUT)
	public Object get(ModelMap modelMap, @RequestBody SysEmailConfig param) {
		return super.get(modelMap, param);
	}

	@ApiOperation(value = "修改邮件配置", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.config.update")
	@RequestMapping(method = RequestMethod.POST)
	public Object update(ModelMap modelMap, @RequestBody SysEmailConfig param) {
		if (param.getId() != null) {
			Parameter parameter = new Parameter("sysEmailConfigService", "queryById", param.getId());
			SysEmailConfig result = (SysEmailConfig) provider.execute(parameter).getResult();
			if (param.getSenderPassword() != null && !param.getSenderPassword().equals(result.getSenderPassword())) {
				param.setSenderPassword(SecurityUtil.encryptMd5(param.getSenderPassword()));
			}
		} else if (DataUtil.isNotEmpty(param.getSenderPassword())) {
			param.setSenderPassword(SecurityUtil.encryptMd5(param.getSenderPassword()));
		}
		return super.update(modelMap, param);
	}

	@ApiOperation(value = "删除邮件配置", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.email.config.delete")
	@RequestMapping(method = RequestMethod.DELETE)
	public Object delete(ModelMap modelMap, @RequestBody SysEmailConfig param) {
		return super.delete(modelMap, param);
	}
}
