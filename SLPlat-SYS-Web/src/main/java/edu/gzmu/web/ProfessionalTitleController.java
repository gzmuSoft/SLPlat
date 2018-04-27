package edu.gzmu.web;

import edu.gzmu.model.ProfessionalTitle;
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
 * 职称  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/professionalTitle")
@Api(value = "职称接口", description = "职称接口")
public class ProfessionalTitleController extends BaseController<ISysProvider> {
	public String getService() {
		return "professionalTitleService";
	}

	@RequiresPermissions("sys.message.professionalTitle.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询职称", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@ApiOperation(value = "查询职称", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.message.professionalTitle.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.message.professionalTitle.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "职称详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		ProfessionalTitle param = WebUtil.getParameter(request, ProfessionalTitle.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.message.professionalTitle.update")
	@ApiOperation(value = "修改职称", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		ProfessionalTitle param = WebUtil.getParameter(request, ProfessionalTitle.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.message.professionalTitle.delete")
	@ApiOperation(value = "删除职称", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		ProfessionalTitle param = WebUtil.getParameter(request, ProfessionalTitle.class);
		return super.del(param);
	}
}