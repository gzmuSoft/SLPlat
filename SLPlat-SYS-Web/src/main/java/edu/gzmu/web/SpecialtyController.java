package edu.gzmu.web;

import edu.gzmu.model.Specialty;
import edu.gzmu.provider.ISysProvider;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.ibase4j.core.base.provider.BaseController;
import top.ibase4j.core.base.provider.Parameter;
import top.ibase4j.core.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 专业  前端控制器
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@RestController
@RequestMapping("/specialty")
@Api(value = "专业接口", description = "专业接口")
public class SpecialtyController extends BaseController<ISysProvider> {
    public String getService() {
        return "specialtyService";
    }

    @RequiresPermissions("sys.student.specialty.read")
    @PutMapping(value = "/read/list")
    @ApiOperation(value = "查询专业", produces = MediaType.APPLICATION_JSON_VALUE)
    public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
        return super.queryList(modelMap, param);
    }

    @ApiOperation(value = "查询专业", produces = MediaType.APPLICATION_JSON_VALUE)
    @RequiresPermissions("sys.student.specialty.read")
    @PutMapping(value = "/read/page")
    public Object query(ModelMap modelMap, @RequestBody Map<String, Object> param) {
        return super.query(modelMap, param);
    }


    @RequiresPermissions("sys.student.specialty.read")
    @PutMapping(value = "/read/detail")
    @ApiOperation(value = "专业详情", produces = MediaType.APPLICATION_JSON_VALUE)
    public Object get(HttpServletRequest request) {
        Specialty param = WebUtil.getParameter(request, Specialty.class);
        return super.get(param);
    }

    @PostMapping
    @RequiresPermissions("sys.student.specialty.update")
    @ApiOperation(value = "修改专业", produces = MediaType.APPLICATION_JSON_VALUE)
    public Object update(HttpServletRequest request) {
        Specialty param = WebUtil.getParameter(request, Specialty.class);
        return super.update(param);
    }

    @DeleteMapping
    @RequiresPermissions("sys.student.specialty.delete")
    @ApiOperation(value = "删除专业", produces = MediaType.APPLICATION_JSON_VALUE)
    public Object del(HttpServletRequest request) {
        Specialty param = WebUtil.getParameter(request, Specialty.class);
        return super.del(param);
    }
}