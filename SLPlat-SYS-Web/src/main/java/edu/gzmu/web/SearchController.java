package edu.gzmu.web;

import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.base.provider.Parameter;

import java.util.List;
import java.util.Map;

@RestController
@Api(value = "搜索", description = "搜索")
public class SearchController extends BaseController<ISysProvider> {

	public String getService() {
		return "searchService";
	}

	@PutMapping("query")
	@ApiOperation(value = "全库搜索")
	public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		Parameter parameter = new Parameter(getService(), "query", param);
		List<?> list = provider.execute(parameter).getResultList();
		return setSuccessModelMap(modelMap, list);
	}
}
