package edu.gzmu.mapper;

import edu.gzmu.model.SysUser;
import org.apache.ibatis.annotations.Param;
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
public interface SysUserMapper extends BaseMapper<SysUser> {
    List<Long> selectIdPage(@Param("cm") SysUser sysUser);
}
