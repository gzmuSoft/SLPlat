package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.Class;
import edu.gzmu.model.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.Map;
/**
 * <p>
 * 班级  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Class")
public class ClassService extends BaseService<Class> {
    @Autowired
    private SpecialtyService specialtyService;
    private Specialty specialty;
    private Class aClass;

    public Class queryById(Long id) {
        aClass = super.queryById(id);
        /**
         * 首先通过ID获取自身信息
         * 把返回的信息放入一个对象，方便判断
         */
        if (aClass != null && aClass.getSpecialtyId() != null) {
            specialty = specialtyService.queryById(aClass.getSpecialtyId());
            /**
             * 然后通过父级ID获取父级信息
             * 在父级的Service类里面已经返回了父级信息了，所以导入了父级逻辑处理函数，直接调用即可
             * 把返回的信息放入一个对象，方便判断
             */
            if (specialty != null) {
                aClass.setCollegeName(specialty.getCollegeName());
                aClass.setSchoolName(specialty.getSchoolName());
                aClass.setSpecialtyName(specialty.getName());
                aClass.setCollegeId(specialty.getCollegeId());
                aClass.setSchoolId(specialty.getSchoolId());
                /**
                 * 父级信息我们不是全部都在子级目录使用，我们只取出需要用的，把这些信息加到子级的模型里
                 */
            } else {
                aClass.setCollegeName(null);
                aClass.setSchoolName(null);
                aClass.setSpecialtyName(null);
                aClass.setCollegeId(null);
                aClass.setSchoolId(null);
                /**
                 * 如果父级信息为空，则set函数设置为空
                 */
            }
        }
        return aClass;
        /**
         * 模型处理装载完毕，返回该对象到模型
         */
    }
    /**
     * 通过ID获取对象进行装载处理又返回到模型
     */


    public Page<Class> query(Map<String, Object> params) {
        Page<Class> pageInfo = super.query(params);
        for (Class aClass : pageInfo.getRecords()) {
            if (aClass.getSpecialtyId() != null) {
                specialty = specialtyService.queryById(aClass.getSpecialtyId());
                if (specialty != null) {
                    aClass.setCollegeName(specialty.getCollegeName());
                    aClass.setSchoolName(specialty.getSchoolName());
                    aClass.setSpecialtyName(specialty.getName());
                    aClass.setCollegeId(specialty.getCollegeId());
                    aClass.setSchoolId(specialty.getSchoolId());
                } else {
                    aClass.setCollegeName(null);
                    aClass.setSchoolName(null);
                    aClass.setSpecialtyName(null);
                    aClass.setCollegeId(null);
                    aClass.setSchoolId(null);

                }
            }
        }
        return pageInfo;
    }
    /**
     * 返回到Controller层的是列表信息形式
     */
}