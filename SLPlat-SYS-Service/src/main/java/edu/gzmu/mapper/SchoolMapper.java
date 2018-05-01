package edu.gzmu.mapper;

import edu.gzmu.model.School;
import org.springframework.stereotype.Repository;
import top.ibase4j.core.base.BaseMapper;

import java.util.List;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Repository
public interface SchoolMapper extends BaseMapper<School> {
    /**
     * 学校、学院的二级联动
     * @return 二级菜单，包含学校集合以及每个学校下的学院集合
     */
    List<School> queryHierarchy();

    /**
     * 学校、学院、专业的三级联动
     * @return 三级菜单，包含学校集合、每个学校下的所有学院集合、每个学院下的所有专业集合
     */
    List<School> queryHierarchyTwo();

}