package edu.gzmu.web;

import edu.gzmu.model.ChapterAndSections;
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
 * 章节  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/chapterAndSections")
@Api(value = "章节接口", description = "章节接口")
public class ChapterAndSectionsController extends BaseController<ISysProvider> {
	public String getService() {
		return "chapterAndSectionsService";
	}

	@RequiresPermissions("chapterAndSections.read")
	@PutMapping(value = "/read/list")
	@ApiOperation(value = "查询章节", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object query(HttpServletRequest request) {
		Map<String, Object> param = WebUtil.getParameter(request);
		return super.query(param);
	}

	@RequiresPermissions("chapterAndSections.read")
	@PutMapping(value = "/read/detail")
	@ApiOperation(value = "章节详情", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object get(HttpServletRequest request) {
		ChapterAndSections param = WebUtil.getParameter(request, ChapterAndSections.class);
		return super.get(param);
	}

	@PostMapping
	@RequiresPermissions("chapterAndSections.update")
	@ApiOperation(value = "修改章节", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object update(HttpServletRequest request) {
		ChapterAndSections param = WebUtil.getParameter(request, ChapterAndSections.class);
		return super.update(param);
	}

	@DeleteMapping
	@RequiresPermissions("chapterAndSections.delete")
	@ApiOperation(value = "删除章节", produces = MediaType.APPLICATION_JSON_VALUE)
	public Object del(HttpServletRequest request) {
		ChapterAndSections param = WebUtil.getParameter(request, ChapterAndSections.class);
		return super.del(param);
	}
}