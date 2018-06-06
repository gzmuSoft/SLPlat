package edu.gzmu.web;

import edu.gzmu.model.EducationProgram;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.base.provider.Parameter;
import top.ibase4j.core.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * 培养方案  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/educationProgram")
@Api(value = "培养方案接口", description = "培养方案接口")
public class EducationProgramController extends BaseController<ISysProvider> {
	public String getService() {
		return "educationProgramService";
	}

	@RequiresPermissions("sys.baseInfo.educationProgram.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询培养方案", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("sys.baseInfo.educationProgram.read")
	@PutMapping(value = "/read/infoOne")
	@ApiOperation(value = "培养方案信息", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object queryById(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		Parameter parameter = new Parameter(this.getService(),"queryByeducationProgramId",param);
		Object result = provider.execute(parameter).getResult();
		return setSuccessModelMap(modelMap, result);
	}

	@Override
	@ApiOperation(value = "查询班级", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.baseInfo.educationProgram.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.baseInfo.educationProgram.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "培养方案详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		EducationProgram param = WebUtil.getParameter(request, EducationProgram.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.baseInfo.educationProgram.update")
	@ApiOperation(value = "修改培养方案", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		EducationProgram param = WebUtil.getParameter(request, EducationProgram.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.baseInfo.educationProgram.delete")
	@ApiOperation(value = "删除培养方案", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		EducationProgram param = WebUtil.getParameter(request, EducationProgram.class);
		return super.del(param);
	}
}