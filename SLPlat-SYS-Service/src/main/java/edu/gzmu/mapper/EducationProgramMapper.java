package edu.gzmu.mapper;

import edu.gzmu.model.EducationProgram;
import edu.gzmu.model.EducationProgram;
import org.apache.ibatis.annotations.Param;
import top.ibase4j.core.base.BaseMapper;

import java.util.Map;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
public interface EducationProgramMapper extends BaseMapper<EducationProgram> {

    EducationProgram queryById(@Param("cm") Map<String, Object> var1);

}