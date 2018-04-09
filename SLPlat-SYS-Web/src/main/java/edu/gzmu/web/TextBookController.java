package edu.gzmu.web;

import edu.gzmu.model.TextBook;
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
 * 教材  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/textBook")
@Api(value = "教材接口", description = "教材接口")
public class TextBookController extends BaseController<ISysProvider> {
	public String getService() {
		return "textBookService";
	}

	@RequiresPermissions("textBook.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询教材", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("textBook.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "教材详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		TextBook param = WebUtil.getParameter(request, TextBook.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("textBook.update")
	@ApiOperation(value = "修改教材", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		TextBook param = WebUtil.getParameter(request, TextBook.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("textBook.delete")
	@ApiOperation(value = "删除教材", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		TextBook param = WebUtil.getParameter(request, TextBook.class);
		return super.del(param);
	}
}