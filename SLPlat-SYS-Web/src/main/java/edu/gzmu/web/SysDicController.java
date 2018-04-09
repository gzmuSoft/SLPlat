package edu.gzmu.web;

import edu.gzmu.model.SysDic;
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
 * 数据字典  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "/dic")
@Api(value = "数据字典接口", description = "数据字典接口")
public class SysDicController extends BaseController<ISysProvider> {

	public String getService() {
		return "sysDicService";
	}

	@ApiOperation(value = "查询数据字典", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dic.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		param.put("orderBy", "type_,sort_no");
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "查询数据字典", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dic.read")
	@PutMapping(value = "/read/list")
	public Object queryList(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		param.put("orderBy", "type_,sort_no");
		param.put("sortAsc", "desc");
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "数据字典详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dic.read")
	@PutMapping(value = "/read/detail")
	public Object get(ModelMap modelMap, @RequestBody SysDic param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改数据字典", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dic.update")
	public Object update(ModelMap modelMap, @RequestBody SysDic param) {
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除数据字典", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dic.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysDic param) {
		return super.delete(modelMap, param);
	}
}
