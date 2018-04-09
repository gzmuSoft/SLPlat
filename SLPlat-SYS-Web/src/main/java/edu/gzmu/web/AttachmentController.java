package edu.gzmu.web;

import edu.gzmu.model.Attachment;
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
 * 附件文档  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/attachment")
@Api(value = "附件文档接口", description = "附件文档接口")
public class AttachmentController extends BaseController<ISysProvider> {
	public String getService() {
		return "attachmentService";
	}

	@RequiresPermissions("attachment.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询附件文档", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("attachment.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "附件文档详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Attachment param = WebUtil.getParameter(request, Attachment.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("attachment.update")
	@ApiOperation(value = "修改附件文档", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Attachment param = WebUtil.getParameter(request, Attachment.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("attachment.delete")
	@ApiOperation(value = "删除附件文档", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Attachment param = WebUtil.getParameter(request, Attachment.class);
		return super.del(param);
	}
}