package edu.gzmu.web;

import edu.gzmu.model.Batch;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * 批次  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/batch")
@Api(value = "批次接口", description = "批次接口")
public class BatchController extends BaseController<ISysProvider> {
	public String getService() {
		return "batchService";
	}

	@RequiresPermissions("batch.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询批次", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("batch.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "批次详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Batch param = WebUtil.getParameter(request, Batch.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("batch.update")
	@ApiOperation(value = "修改批次", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Batch param = WebUtil.getParameter(request, Batch.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("batch.delete")
	@ApiOperation(value = "删除批次", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Batch param = WebUtil.getParameter(request, Batch.class);
		return super.del(param);
	}
}