package edu.gzmu.service;

import edu.gzmu.model.ShortAnswerQuestion;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 简答题  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "ShortAnswerQuestion")
public class ShortAnswerQuestionService extends BaseService<ShortAnswerQuestion> {
	
}