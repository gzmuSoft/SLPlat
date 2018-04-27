package edu.gzmu.service;

import edu.gzmu.model.AdministrativePost;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 行政职务  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "AdministrativePost")
public class AdministrativePostService extends BaseService<AdministrativePost> {
    public AdministrativePost queryById(Long id){
        AdministrativePost administrativePost = super.queryById(id);
        return administrativePost;
    }
}