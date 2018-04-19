package edu.gzmu.service;

import edu.gzmu.model.School;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 学校  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "School")
public class SchoolService extends BaseService<School> {
    private  School school;
    public School queryById(Long id) {
        school = super.queryById(id);
        /**
         * 一层级目录的信息逻辑处理就调用BaseService里面的queryById方法（根据ID获取数据的一个函数）
         * 把返回的信息放入一个对象，方便操作与复用
         */
        return school;
        /**
         * 模型处理装载完毕，返回该对象到Controller层
         */
    }
}