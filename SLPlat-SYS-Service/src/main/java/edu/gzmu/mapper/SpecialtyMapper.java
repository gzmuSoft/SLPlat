package edu.gzmu.mapper;

import edu.gzmu.model.Specialty;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
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
@Repository
public interface SpecialtyMapper extends BaseMapper<Specialty> {
    /**
     * 通过专业id查询当前专业id、name，其上级的id、name
     * @param var1 传递过来的集合，务必含有id属性
     * @return 查询到的专业集合
     */
    Specialty queryById(@Param("cm") Map<String, Object> var1);
}