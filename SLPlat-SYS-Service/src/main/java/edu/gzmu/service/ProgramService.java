package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.ChapterAndSections;
import edu.gzmu.model.Program;
import org.springframework.beans.factory.annotation.Autowired;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 编程题  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Program")
public class ProgramService extends BaseService<Program> {
    @Autowired
    private ChapterAndSectionsService chapterAndSectionsService;

    @Override
    public Program queryById(Long id) {
        Program program = super.queryById(id);
        if (program != null) {
            if (program.getSectionId() != null) {
                ChapterAndSections chapterAndSections = chapterAndSectionsService.queryById(program.getSectionId());
                if (chapterAndSections != null) {
                    program.setSectionName(chapterAndSections.getName());
                    program.setCourseName(chapterAndSections.getCourseName());
                    program.setCourseId(chapterAndSections.getCourseId());
                } else {
                    program.setSectionName(null);
                    program.setCourseName(null);
                    program.setCourseId(null);
                }
            }
        }
        return program;
    }
    @Override
    public Page<Program> query(Map<String, Object> params) {
        Page<Program> pageInfo = super.query(params);
        for (Program program : pageInfo.getRecords()) {
            if (program.getSectionId() != null) {
                ChapterAndSections chapterAndSections = chapterAndSectionsService.queryById(program.getSectionId());
                if (chapterAndSections != null) {
                    program.setSectionName(chapterAndSections.getName());
                    program.setCourseName(chapterAndSections.getCourseName());
                    program.setCourseId(chapterAndSections.getCourseId());
                } else {
                    program.setSectionName(null);
                    program.setCourseName(null);
                    program.setCourseId(null);
                }
            }
        }
        return pageInfo;
    }
}