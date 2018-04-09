package edu.gzmu.mapper;

import org.apache.ibatis.annotations.Param;
import edu.gzmu.model.SysUserThirdparty;

import top.ibase4j.core.base.BaseMapper;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
public interface SysUserThirdpartyMapper extends BaseMapper<SysUserThirdparty> {
	Long queryUserIdByThirdParty(@Param("provider") String provider, @Param("openId") String openId);
}