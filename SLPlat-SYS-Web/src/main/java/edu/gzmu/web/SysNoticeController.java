package edu.gzmu.web;

import edu.gzmu.model.SysNotice;
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
 * 通知管理    前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "notice")
@Api(value = "通知管理接口", description = "通知管理接口")
public class SysNoticeController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysNoticeService";
	}

	@ApiOperation(value = "查询通知", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("cms.notice.read")
	@RequestMapping(value = "/read/list", method = RequestMethod.PUT)
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "通知详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("cms.notice.read")
	@RequestMapping(value = "/read/detail", method = RequestMethod.PUT)
	public Object get(ModelMap modelMap, @RequestBody SysNotice param) {
		return super.get(modelMap, param);
	}

	@ApiOperation(value = "修改通知", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("cms.notice.update")
	@RequestMapping(method = RequestMethod.POST)
	public Object update(ModelMap modelMap, @RequestBody SysNotice param) {
		if (param.getStatus() == null) {
			param.setStatus("0");
		}
		return super.update(modelMap, param);
	}

	@ApiOperation(value = "删除通知", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("cms.notice.delete")
	@RequestMapping(method = RequestMethod.DELETE)
	public Object delete(ModelMap modelMap, @RequestBody SysNotice param) {
		return super.delete(modelMap, param);
	}
}
