package edu.gzmu.core;


import edu.gzmu.provider.ISysProvider;

import com.alibaba.dubbo.config.annotation.Service;
import com.weibo.api.motan.config.springsupport.annotation.MotanService;

import top.ibase4j.core.base.provider.BaseProviderImpl;

@Service(interfaceClass = ISysProvider.class)
@MotanService(interfaceClass = ISysProvider.class)
public class SysProviderImpl extends BaseProviderImpl implements ISysProvider {

}