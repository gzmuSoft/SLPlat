package edu.gzmu.mapper;

import edu.gzmu.model.Class;
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
public interface ClassMapper extends BaseMapper<Class> {
    /**
     * 通过班级id查询到本身以及其三个上级id、name
     * @param var1 传递过来的集合
     * @return 查询到的班级
     */
    Class queryById(@Param("cm") Map<String, Object> var1);
}