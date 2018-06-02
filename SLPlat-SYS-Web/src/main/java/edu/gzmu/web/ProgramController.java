package edu.gzmu.web;

import edu.gzmu.model.Program;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * 编程题  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/program")
@Api(value = "编程题接口", description = "编程题接口")
public class ProgramController extends BaseController<ISysProvider> {
	public String getService() {
		return "programService";
	}

	@RequiresPermissions("sys.baseInfo.program.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询编程题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.queryList(modelMap, param);
	}

//	@ApiOperation(value = "查询编程题", produces = MediaType.APPLICATION_JSON_VALUE)
//	@RequiresPermissions("sys.baseInfo.program.read")
//	@PutMapping(value = "/read/page")
//	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
//		return super.query(modelMap, param);
//	}

	@RequiresPermissions("sys.baseInfo.program.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "编程题详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Program param = WebUtil.getParameter(request, Program.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.baseInfo.program.update")
	@ApiOperation(value = "修改编程题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Program param = WebUtil.getParameter(request, Program.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.baseInfo.program.delete")
	@ApiOperation(value = "删除编程题", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Program param = WebUtil.getParameter(request, Program.class);
		return super.del(param);
	}
}