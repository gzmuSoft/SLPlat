package edu.gzmu.mapper;

import edu.gzmu.model.SysSession;
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
public interface SysSessionMapper extends BaseMapper<SysSession> {

    void deleteBySessionId(String sessionId);

    Long queryBySessionId(String sessionId);

    List<String> querySessionIdByAccount(String account);
}