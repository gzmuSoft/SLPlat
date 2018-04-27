package edu.gzmu.web;

import edu.gzmu.model.PoliticalStatus;
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
 * 政治面貌  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/politicalStatus")
@Api(value = "政治面貌接口", description = "政治面貌接口")
public class PoliticalStatusController extends BaseController<ISysProvider> {
	public String getService() {
		return "politicalStatusService";
	}

	@RequiresPermissions("sys.message.politicalStatus.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询政治面貌", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@ApiOperation(value = "查询政治面貌", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.message.politicalStatus.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.message.politicalStatus.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "政治面貌详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		PoliticalStatus param = WebUtil.getParameter(request, PoliticalStatus.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.message.politicalStatus.update")
	@ApiOperation(value = "修改政治面貌", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		PoliticalStatus param = WebUtil.getParameter(request, PoliticalStatus.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.message.politicalStatus.delete")
	@ApiOperation(value = "删除政治面貌", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		PoliticalStatus param = WebUtil.getParameter(request, PoliticalStatus.class);
		return super.del(param);
	}
}