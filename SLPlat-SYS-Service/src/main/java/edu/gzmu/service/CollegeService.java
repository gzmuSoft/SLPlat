package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.College;
import edu.gzmu.model.School;
import org.springframework.beans.factory.annotation.Autowired;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 学院  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "College")
public class CollegeService extends BaseService<College> {
    @Autowired
    private SchoolService schoolService;
    private School school;
    private College college;

    /**
     * 二级目录的信息逻辑处理不仅要获取自身的信息，
     * 还要获取的父级的信息，父级的信息也要通过ID获取，
     * 便用到了子级里面的父级ID（这里是schoolId（根据model层而来））
     */
    public College queryById(Long id) {
        college = super.queryById(id);
        /**
         * 首先通过ID获取自身信息
         * 把返回的信息放入一个对象，方便判断
         */
        if (college != null && college.getSchoolId() != null) {
            school = schoolService.queryById(college.getSchoolId());
            /**
             * 然后通过父级ID获取父级信息
             * 在父级的Service类里面已经返回了父级信息了，所以导入了父级逻辑处理函数，直接调用即可
             * 把返回的信息放入一个对象，方便判断
             */
            if (school != null) {
                college.setSchoolName(school.getName());
                /**
                 * 父级信息我们不是全部都在子级目录使用，我们只取出需要用的，把这些信息加到子级的模型里
                 */
            } else {
                college.setSchoolName(null);
                /**
                 * 如果父级信息为空，则set函数设置为空
                 */
            }
        }
        return college;
        /**
         * 模型处理装载完毕，返回该对象到模型
         */
    }/**
     * 通过ID获取对象进行装载处理又返回到模型
     */


    public Page<College> query(Map<String, Object> params) {
        Page<College> pageInfo = super.query(params);
        for (College college : pageInfo.getRecords()) {
            if (college.getSchoolId() != null) {
                school = schoolService.queryById(college.getSchoolId());
                if (school != null) {
                    college.setSchoolName(school.getName());
                } else {
                    college.setSchoolName(null);
                }
            }
            /**
             * 返回到Controller层的是列表信息形式
             */
        }
        return pageInfo;
    }
}