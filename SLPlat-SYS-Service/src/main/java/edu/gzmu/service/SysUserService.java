package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import org.apache.commons.lang3.StringUtils;
import edu.gzmu.mapper.SysUserThirdpartyMapper;
import edu.gzmu.model.SysDept;
import edu.gzmu.model.SysUser;
import edu.gzmu.model.SysUserThirdparty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.ibase4j.core.base.BaseService;
import top.ibase4j.core.exception.BusinessException;
import top.ibase4j.core.support.login.ThirdPartyUser;
import top.ibase4j.core.util.DataUtil;
import top.ibase4j.core.util.InstanceUtil;
import top.ibase4j.core.util.SecurityUtil;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 用户  服务实现类
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "sysUser")
public class SysUserService extends BaseService<SysUser> {
    @Autowired
    private SysUserThirdpartyMapper thirdpartyMapper;
    @Autowired
    private SysDicService sysDicService;
    @Autowired
    private SysDeptService sysDeptService;
    @Autowired
    private SysAuthorizeService sysAuthorizeService;

    @Transactional
    public SysUser update(SysUser record) {
        if (DataUtil.isEmpty(record.getPassword())) {
            record.setPassword(null);
        } else {
            record.setPassword(SecurityUtil.encryptPassword(record.getPassword()));
        }
        if (DataUtil.isNotEmpty(record.getOldPassword())) {
            SysUser sysUser = super.queryById(record.getId());
            String encryptPassword = SecurityUtil.encryptPassword(record.getOldPassword());
            if (!sysUser.getPassword().equals(encryptPassword)) {
                throw new BusinessException("原密码错误.");
            }
        }
        return super.update(record);
    }

    public Page<SysUser> query(Map<String, Object> params) {
        Map<String, String> userTypeMap = sysDicService.queryDicByType("USERTYPE");
        Page<SysUser> pageInfo = super.query(params);
        for (SysUser sysUser : pageInfo.getRecords()) {
            if (sysUser.getDeptId() != null) {
                SysDept sysDept = sysDeptService.queryById(sysUser.getDeptId());
                if (sysDept != null) {
                    sysUser.setDeptName(sysDept.getName());
                } else {
                    sysUser.setDeptId(null);
                }
            }
            if (sysUser.getUserType() != null) {
                sysUser.setUserTypeText(userTypeMap.get(sysUser.getUserType()));
            }
            List<String> permissions = sysAuthorizeService.queryUserPermission(sysUser.getId());
            for (String permission : permissions) {
                if (StringUtils.isBlank(sysUser.getPermission())) {
                    sysUser.setPermission(permission);
                } else {
                    sysUser.setPermission(sysUser.getPermission() + ";" + permission);
                }
            }
            sysUser.setPassword(null);
        }
        return pageInfo;
    }

    /** 查询第三方帐号用户Id */
    @Cacheable
    public Long queryUserIdByThirdParty(ThirdPartyUser param) {
        return thirdpartyMapper.queryUserIdByThirdParty(param.getProvider(), param.getOpenid());
    }

    /** 保存第三方帐号 */
    @Transactional
    public SysUser insertThirdPartyUser(ThirdPartyUser thirdPartyUser) {
        SysUser sysUser = new SysUser();
        sysUser.setSex(0);
        sysUser.setUserType("1");
        sysUser.setPassword(SecurityUtil.encryptPassword("123456"));
        sysUser.setName(thirdPartyUser.getUserName());
        sysUser.setAvatar(thirdPartyUser.getAvatarUrl());
        // 初始化第三方信息
        SysUserThirdparty thirdparty = new SysUserThirdparty();
        thirdparty.setProvider(thirdPartyUser.getProvider());
        thirdparty.setOpenId(thirdPartyUser.getOpenid());
        thirdparty.setCreateTime(new Date());

        this.update(sysUser);
        sysUser.setAccount(thirdparty.getProvider() + sysUser.getId());
        this.update(sysUser);
        thirdparty.setUserId(sysUser.getId());
        thirdpartyMapper.insert(thirdparty);
        return sysUser;
    }

    public void init() {
        queryList(InstanceUtil.newHashMap());
    }
}
