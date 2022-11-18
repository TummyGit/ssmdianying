package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.FangyingtingMapper;
import com.spring.entity.Fangyingting;
import com.spring.service.FangyingtingService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("FangyingtingService")
public class FangyingtingServiceImpl extends ServiceBase<Fangyingting> implements FangyingtingService {
    @Resource
    private FangyingtingMapper dao;

    @Override
    protected FangyingtingMapper getDao() {
        return dao;
    }
}
