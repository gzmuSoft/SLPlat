package edu.gzmu.service;

import edu.gzmu.model.QuestionKnowledgePoint;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 题目与知识点关联  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "QuestionKnowledgePoint")
public class QuestionKnowledgePointService extends BaseService<QuestionKnowledgePoint> {
	
}