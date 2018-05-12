package edu.gzmu.service;

import edu.gzmu.model.ChapterAndSections;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import edu.gzmu.model.Course;
import com.baomidou.mybatisplus.plugins.Page;
import java.util.Map;

/**
 * <p>
 * 章节  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "ChapterAndSections")
public class ChapterAndSectionsService extends BaseService<ChapterAndSections> {
    @Autowired
    private CourseService courseService;

    @Override
    public ChapterAndSections queryById(Long id) {
        ChapterAndSections chapterAndSections = super.queryById(id);
        if (chapterAndSections != null) {
            if (chapterAndSections.getCourseId() != null) {
                Course course = courseService.queryById(chapterAndSections.getCourseId());
                if (course != null) {
                    chapterAndSections.setCourseName(course.getName());
                } else {
                    chapterAndSections.setCourseName(null);
                }
            }
        }
        return chapterAndSections;
    }
    public Page<ChapterAndSections> query(Map<String, Object> params) {
        Page<ChapterAndSections> pageInfo = super.query(params);
        for (ChapterAndSections chapterAndSections  : pageInfo.getRecords()) {
            if (chapterAndSections.getCourseId() != null) {
                Course course = courseService.queryById(chapterAndSections.getCourseId());
                if (course != null) {
                    chapterAndSections.setCourseName(course.getName());
                } else {
                    chapterAndSections.setCourseName(null);
                }
            }
        }
        return pageInfo;
    }
}