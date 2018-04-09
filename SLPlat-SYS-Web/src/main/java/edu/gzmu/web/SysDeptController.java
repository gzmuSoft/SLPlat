package edu.gzmu.web;

import edu.gzmu.model.SysDept;
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
 * 部门  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "dept")
@Api(value = "部门接口", description = "部门接口")
public class SysDeptController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysDeptService";
	}

	@ApiOperation(value = "查询部门", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dept.read")
	@PutMapping(value = "/read/list")
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

	@ApiOperation(value = "查询部门", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dept.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@ApiOperation(value = "部门详情", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dept.read")
	@PutMapping(value = "/read/detail")
	public Object get(ModelMap modelMap, @RequestBody SysDept param) {
		return super.get(modelMap, param);
	}

	@PostMapping
	@ApiOperation(value = "修改部门", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dept.update")
	public Object update(ModelMap modelMap, @RequestBody SysDept param) {
		return super.update(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除部门", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.dept.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysDept param) {
		return super.delete(modelMap, param);
	}
}
