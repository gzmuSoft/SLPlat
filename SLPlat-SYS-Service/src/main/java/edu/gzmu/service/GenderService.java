package edu.gzmu.service;

import edu.gzmu.model.Gender;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 性别  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Gender")
public class GenderService extends BaseService<Gender> {
    public Gender queryById(Long id){
        Gender gender = super.queryById(id);
        return gender;
    }
}