package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.County;
import edu.gzmu.model.Town;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 镇  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Town")
public class TownService extends BaseService<Town> {
    @Autowired
    private CountyService countyService;

    public List<Town> queryListByProvinceId(Map<String, Object> params) { return super.queryList(params); }
    @Override
    public Town queryById(Long id) {
        Town town = super.queryById(id);
        if (town != null) {
            if (town.getCountyId() != null) {
                County county = countyService.queryById(town.getCountyId());
                if (county != null) {
                    town.setCountyName(county.getName());
                    town.setCityName(county.getCityName());
                    town.setProvinceName(county.getProvinceName());
                    town.setCountyId(county.getId());
                    town.setCityId(county.getCityId());
                    town.setProvinceId(county.getProvinceId());
                } else {
                    town.setCountyName(null);
                    town.setCityName(null);
                    town.setProvinceName(null);
                    town.setCountyId(null);
                    town.setCityId(null);
                    town.setProvinceId(null);
                }
            }
        }
        return town;
    }

    @Override
    public Page<Town> query(Map<String, Object> params) {
        Page<Town> pageInfo = super.query(params);
        for (Town town : pageInfo.getRecords()) {
            if (town.getCountyId() != null) {
                County county = countyService.queryById(town.getCountyId());
                if (county != null) {
                    town.setCountyName(county.getName());
                    town.setCityName(county.getCityName());
                    town.setProvinceName(county.getProvinceName());
                    town.setCityId(county.getCityId());
                    town.setProvinceId(county.getProvinceId());
                }
            }
        }
        return pageInfo;
    }
}