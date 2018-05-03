package edu.gzmu.web;

import edu.gzmu.model.CeeAnnualScore;
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
 * 历年分数线  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/ceeAnnualScore")
@Api(value = "历年分数线接口", description = "历年分数线接口")
public class CeeAnnualScoreController extends BaseController<ISysProvider> {
	public String getService() {
		return "ceeAnnualScoreService";
	}

	@RequiresPermissions("sys.baseInfo.ceeAnnualScore.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询历年分数线", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@ApiOperation(value = "查询历年分数线", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.baseInfo.ceeAnnualScore.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.baseInfo.ceeAnnualScore.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "历年分数线详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		CeeAnnualScore param = WebUtil.getParameter(request, CeeAnnualScore.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.baseInfo.ceeAnnualScore.update")
	@ApiOperation(value = "修改历年分数线", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		CeeAnnualScore param = WebUtil.getParameter(request, CeeAnnualScore.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.baseInfo.ceeAnnualScore.delete")
	@ApiOperation(value = "删除历年分数线", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		CeeAnnualScore param = WebUtil.getParameter(request, CeeAnnualScore.class);
		return super.del(param);
	}
}