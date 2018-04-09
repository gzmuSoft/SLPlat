package edu.gzmu.web;

import edu.gzmu.model.SysNews;
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
 * 新闻管理    前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "news")
@Api(value = "新闻管理接口", description = "新闻管理接口")
public class SysNewsController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysNewsService";
	}

	@ApiOperation(value = "查询新闻", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.cms.news.read")
	@PutMapping(value = "/read/list")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "新闻详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.cms.news.read")
	@PutMapping(value = "/read/detail")
	public Object get(ModelMap modelMap, @RequestBody SysNews param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改新闻", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.cms.news.update")
	public Object update(ModelMap modelMap, @RequestBody SysNews param) {
		if (param.getStatus() == null) {
			param.setStatus("0");
		}
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除新闻", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.cms.news.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysNews param) {
		return super.delete(modelMap, param);
	}
}
