package edu.gzmu.service;

import edu.gzmu.model.Course;
import edu.gzmu.model.CourseType;
import edu.gzmu.model.Specialty;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;

/**
 * <p>
 * 课程  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Course")
public class CourseService extends BaseService<Course> {
    @Autowired
    private CourseTypeService courseTypeService;
    @Autowired
    private SpecialtyService specialtyService;

    @Override
    public Course queryById(Long id) {
        Course course = super.queryById(id);
        if (course != null) {
            if (course.getTypeId() != null && course.getSpecialtyId() != null) {
                CourseType courseType = courseTypeService.queryById(course.getTypeId());
                Specialty specialty = specialtyService.queryById(course.getSpecialtyId());
                if (courseType != null && specialty != null) {
                    course.setTypeName(courseType.getName());
                    course.setSpecialtyName(specialty.getName());
                } else {
                    course.setTypeName(null);
                    course.setSpecialtyName(null);
                }
            }
        }
        return course;
    }

    public Page<Course> query(Map<String, Object> params) {
        Page<Course> pageInfo = super.query(params);
        for (Course course : pageInfo.getRecords()) {
            if (course != null) {
                if (course.getTypeId() != null && course.getSpecialtyId() != null) {
                    CourseType courseType = courseTypeService.queryById(course.getTypeId());
                    Specialty specialty = specialtyService.queryById(course.getSpecialtyId());
                    if (courseType != null && specialty != null) {
                        course.setTypeName(courseType.getName());
                        course.setSpecialtyName(specialty.getName());
                    } else {
                        course.setTypeName(null);
                        course.setSpecialtyName(null);
                    }
                }
            }
        }
        return pageInfo;
    }
}