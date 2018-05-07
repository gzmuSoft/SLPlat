package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.Batch;
import edu.gzmu.model.CeeAnnualScore;
import edu.gzmu.model.Province;
import edu.gzmu.model.ExamineeCategory;
import org.apache.ibatis.jdbc.Null;
import org.apache.log4j.Category;
import org.springframework.beans.factory.annotation.Autowired;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 历年分数线  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "CeeAnnualScore")
public class CeeAnnualScoreService extends BaseService<CeeAnnualScore> {
    @Autowired
    private BatchService batchService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private ExamineeCategoryService examineeCategoryService;


    public CeeAnnualScore queryById(Long id) {
        CeeAnnualScore ceeAnnualScore = super.queryById(id);
        if (ceeAnnualScore != null) {
            if (ceeAnnualScore.getProvinceId() != null) {
                Province province = provinceService.queryById(ceeAnnualScore.getProvinceId());
                if (province != null) {
                    ceeAnnualScore.setProvinceName(province.getName());
                } else {
                    ceeAnnualScore.setProvinceName(null);
                }
            }
            if (ceeAnnualScore.getBatchId() != null) {
                Batch batch = batchService.queryById(ceeAnnualScore.getBatchId());
                if (batch != null) {
                    ceeAnnualScore.setBatchName(batch.getName());
                } else {
                    ceeAnnualScore.setBatchName(null);
                }
            }
            if (ceeAnnualScore.getCategoryId() != null) {
                ExamineeCategory category = examineeCategoryService.queryById(ceeAnnualScore.getCategoryId());
                if (category != null) {
                    ceeAnnualScore.setCategoryName(category.getName());
                } else {
                    ceeAnnualScore.setCategoryName(null);
                }
            }
        }
        return ceeAnnualScore;
    }

    public Page<CeeAnnualScore> query(Map<String, Object> params) {
        Page<CeeAnnualScore> pageInfo = super.query(params);
        for (CeeAnnualScore ceeAnnualScore : pageInfo.getRecords()) {
            if (ceeAnnualScore.getProvinceId() != null) {
                Province province = provinceService.queryById(ceeAnnualScore.getProvinceId());
                if (province != null) {
                    ceeAnnualScore.setProvinceName(province.getName());
                } else {
                    ceeAnnualScore.setProvinceName(null);
                }
            }
            if (ceeAnnualScore.getBatchId() != null) {
                Batch batch = batchService.queryById(ceeAnnualScore.getBatchId());
                if (batch != null) {
                    ceeAnnualScore.setBatchName(batch.getName());
                } else {
                    ceeAnnualScore.setBatchName(null);
                }
            }
            if (ceeAnnualScore.getCategoryId() != null) {
                ExamineeCategory category = examineeCategoryService.queryById(ceeAnnualScore.getCategoryId());
                if (category != null) {
                    ceeAnnualScore.setCategoryName(category.getName());
                } else {
                    ceeAnnualScore.setCategoryName(null);
                }
            }
            /**
             * 返回到Controller层的是列表信息形式
             */
        }
        return pageInfo;
    }
}