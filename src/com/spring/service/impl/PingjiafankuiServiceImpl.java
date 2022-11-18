package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.PingjiafankuiMapper;
import com.spring.entity.Pingjiafankui;
import com.spring.service.PingjiafankuiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("PingjiafankuiService")
public class PingjiafankuiServiceImpl extends ServiceBase<Pingjiafankui> implements PingjiafankuiService {
    @Resource
    private PingjiafankuiMapper dao;

    @Override
    protected PingjiafankuiMapper getDao() {
        return dao;
    }
}
