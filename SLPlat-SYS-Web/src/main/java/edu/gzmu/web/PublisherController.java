package edu.gzmu.web;

import edu.gzmu.model.Publisher;
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
 * 出版社  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/publisher")
@Api(value = "出版社接口", description = "出版社接口")
public class PublisherController extends BaseController<ISysProvider> {
	public String getService() {
		return "publisherService";
	}

	@RequiresPermissions("sys.message.publisher.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询出版社", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@ApiOperation(value = "查询出版社", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.message.publisher.read")
	@PutMapping(value = "/read/page")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		return super.query(modelMap, param);
	}

	@RequiresPermissions("sys.message.publisher.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "出版社详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		Publisher param = WebUtil.getParameter(request, Publisher.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("sys.message.publisher.update")
	@ApiOperation(value = "修改出版社", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		Publisher param = WebUtil.getParameter(request, Publisher.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("sys.message.publisher.delete")
	@ApiOperation(value = "删除出版社", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		Publisher param = WebUtil.getParameter(request, Publisher.class);
		return super.del(param);
	}
}