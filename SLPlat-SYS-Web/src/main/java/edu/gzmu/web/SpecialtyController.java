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
    @Override
    public String getService() {
        return "specialtyService";
    }

    @RequiresPermissions("sys.student.specialty.read")
    @PutMapping(value = "/read/list")
    @ApiOperation(value = "查询专业", produces = MediaType.APPLICATION_JSON_VALUE)
    public Object list(ModelMap modelMap, @RequestBody Map<String, Object> param) {
        return super.queryList(modelMap, param);
    }

    @Override
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


    /**
     * 获取当前专业的所有信息
     * @param modelMap 消息体
     * @param param 前台传参
     * @return 成功或失败代码以及数据
     */
    @RequiresPermissions("sys.student.specialty.read")
    @PutMapping(value = "/read/infoOne")
    @ApiOperation(value = "查询专业", produces = MediaType.APPLICATION_JSON_VALUE)
    public Object queryById(ModelMap modelMap, @RequestBody Map<String, Object> param) {
        Parameter parameter = new Parameter(this.getService(), "queryBySpecialtyId",param);
        Object result = provider.execute(parameter).getResult();
        return setSuccessModelMap(modelMap,result);
    }

    /**
     * 获取三笠联动的所有列表
     * @param modelMap 消息体
     * @return 成功或失败代码以及数据
     */
    @RequiresPermissions("sys.student.college.read")
    @PutMapping(value = "/read/hierarchy")
    @ApiOperation(value = "三级联动", produces = MediaType.APPLICATION_JSON_VALUE)
    public Object queryOne(ModelMap modelMap) {
        Parameter parameter = new Parameter(this.getService(), "queryHierarchyTwo");
        List<?> list = provider.execute(parameter).getResultList();
        return setSuccessModelMap(modelMap, list);
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