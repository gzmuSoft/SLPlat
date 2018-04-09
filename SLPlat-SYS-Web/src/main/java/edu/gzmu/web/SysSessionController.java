package edu.gzmu.web;

import edu.gzmu.model.SysSession;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.listener.SessionListener;

import java.util.Map;

/**
 * <p>
 * 用户会话管理  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping(value = "/session")
@Api(value = "用户会话管理接口", description = "用户会话管理接口")
public class SysSessionController extends BaseController<ISysProvider> {
	public String getService() {
		return "sysSessionService";
	}
	
	@Autowired
	SessionListener sessionListener;

	// 查询会话
	@ApiOperation(value = "查询会话", produces = MediaType.APPLICATION_JSON_VALUE)
	@PutMapping(value = "/read/list")
	@RequiresPermissions("sys.base.session.read")
	public Object get(ModelMap modelMap, @RequestBody Map<String, Object> param) {
		Integer number = sessionListener.getAllUserNumber();
		modelMap.put("userNumber", number); // 用户数大于会话数,有用户没有登录
		return super.query(modelMap, param);
	}

	@DeleteMapping
	@ApiOperation(value = "删除会话", produces = MediaType.APPLICATION_JSON_VALUE)
	@RequiresPermissions("sys.base.session.delete")
	public Object delete(ModelMap modelMap, @RequestBody SysSession param) {
		return super.delete(modelMap, param);
	}
}
