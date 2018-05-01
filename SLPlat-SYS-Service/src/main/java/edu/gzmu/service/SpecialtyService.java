package edu.gzmu.service;

import edu.gzmu.mapper.SchoolMapper;
import edu.gzmu.mapper.SpecialtyMapper;
import edu.gzmu.model.School;
import edu.gzmu.model.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 专业  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Specialty")
public class SpecialtyService extends BaseService<Specialty> {
//    @Autowired
//    private CollegeService collegeService;
//    private College college;
//
    private SchoolMapper schoolMapper;
    private final SpecialtyMapper specialtyMapper;
    /**
     * 依赖注入
     * @param schoolMapper 属性注入
     */
    @Autowired
    public SpecialtyService(SchoolMapper schoolMapper, SpecialtyMapper specialtyMapper) {
        this.schoolMapper = schoolMapper;
        this.specialtyMapper = specialtyMapper;
    }

    /**
     * 三级联动获取列表
     * @return 列表
     */
    public List<School> queryHierarchyTwo() {
        return schoolMapper.queryHierarchyTwo();
    }

    /**
     * 通过id查询
     * @param var 前台参数
     * @return 专业
     */
    public Specialty queryBySpecialtyId(Map<String, Object> var) {
        return specialtyMapper.queryById(var);
    }


//TODO 待确定是否删除
//    public Specialty queryById(Long id) {
//        Specialty specialty = super.queryById(id);
//        /**
//         * 首先通过ID获取自身信息
//         * 把返回的信息放入一个对象，方便判断
//         */
//        if (specialty != null && specialty.getCollegeId() != null) {
//            college = collegeService.queryById(specialty.getCollegeId());
//            /**
//             * 然后通过父级ID获取父级信息
//             * 在父级的Service类里面已经返回了父级信息了，所以导入了父级逻辑处理函数，直接调用即可
//             * 把返回的信息放入一个对象，方便判断
//             */
//            if (college != null) {
//                specialty.setCollegeName(college.getName());
////                specialty.setSchoolName(college.getSchoolName());
//                specialty.setSchoolId(college.getSchoolId());
//                /**
//                 * 父级信息我们不是全部都在子级目录使用，我们只取出需要用的，把这些信息加到子级的模型里
//                 */
//            } else {
//                specialty.setCollegeName(null);
//                specialty.setSchoolName(null);
//                specialty.setSchoolId(null);
//                /**
//                 * 如果父级信息为空，则set函数设置为空
//                 */
//            }
//        }
//        return specialty;
//        /**
//         * 模型处理装载完毕，返回该对象到模型
//         */
//    }/**
//     * 通过ID获取对象进行装载处理又返回到模型
//     */
//
//    public Page<Specialty> query(Map<String, Object> params) {
//        Page<Specialty> pageInfo = super.query(params);
//        for (Specialty specialty : pageInfo.getRecords()) {
//            if (specialty.getCollegeId() != null) {
//                college = collegeService.queryById(specialty.getCollegeId());
//                if (college != null) {
//                    specialty.setCollegeName(college.getName());
////                    specialty.setSchoolName(college.getSchoolName());
//                    specialty.setSchoolId(college.getSchoolId());
//                } else {
//                    specialty.setCollegeName(null);
//                    specialty.setSchoolName(null);
////                    specialty.setSchoolId(null);
//                }
//            }
//        }
//        return pageInfo;
//    }
//    /**
//     * 返回到Controller层的是列表信息形式
//     */

}