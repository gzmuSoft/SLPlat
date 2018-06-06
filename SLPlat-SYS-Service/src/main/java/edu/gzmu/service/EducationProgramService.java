package edu.gzmu.service;
import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.mapper.EducationProgramMapper;
import edu.gzmu.model.Attachment;
import edu.gzmu.model.EducationProgram;
import edu.gzmu.model.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.Map;


/**
 * <p>
 * 培养方案  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "EducationProgram")
public class EducationProgramService extends BaseService<EducationProgram> {
    @Autowired
    private SpecialtyService specialtyService;

    @Autowired
    private AttachmentService attachmentService;


    /**
     * 依赖注入
     */
    private final EducationProgramMapper educationProgramMapper;

    /**
     * set方法
     * @param educationProgramMapper 属性注入
     */
    @Autowired
    public EducationProgramService(EducationProgramMapper educationProgramMapper) {
        this.educationProgramMapper = educationProgramMapper;
    }

    /**
     * 通过培养方案id查询
     * @param var 集合
     * @return 查询到的培养方案
     */
    public EducationProgram queryByeducationProgramId(Map<String, Object> var){
        return educationProgramMapper.queryById(var);
    }

    public EducationProgram queryById(long id){
        EducationProgram educationProgram=super.queryById(id);
        if (educationProgram != null && educationProgram.getSpecialtyId() != null) {
            Specialty specialty = specialtyService.queryById(educationProgram.getSpecialtyId());
            if (specialty != null) {
                educationProgram.setSpecialty(specialty);
            }
        }
        return educationProgram;
    }


    @Override
	public Page<EducationProgram> query(Map<String,Object> params){
        Specialty specialty = null;
        Page<EducationProgram> pageInfo=super.query(params);
        for (EducationProgram item : pageInfo.getRecords()) {
            if (item.getSpecialtyId() != null) {
                specialty = specialtyService.queryById(item.getSpecialtyId());
                if (specialty != null) {
                    item.setSpecialty(specialty);
                }
            }
        }
        return pageInfo;
    }
}