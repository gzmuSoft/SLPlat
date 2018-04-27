package edu.gzmu.service;

import edu.gzmu.model.HighSchoolCategory;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 高中类别  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "HighSchoolCategory")
public class HighSchoolCategoryService extends BaseService<HighSchoolCategory> {
    public HighSchoolCategory queryById(Long id){
        HighSchoolCategory highSchoolCategory = super.queryById(id);
        return highSchoolCategory;
    }
}