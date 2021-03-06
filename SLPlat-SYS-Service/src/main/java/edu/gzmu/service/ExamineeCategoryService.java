package edu.gzmu.service;

import edu.gzmu.model.ExamineeCategory;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 考生类别  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "ExamineeCategory")
public class ExamineeCategoryService extends BaseService<ExamineeCategory> {
    public ExamineeCategory queryById(Long id){
        ExamineeCategory examineeCategory = super.queryById(id);
        return examineeCategory;
    }
}