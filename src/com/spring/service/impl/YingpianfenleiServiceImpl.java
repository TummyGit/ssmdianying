package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.YingpianfenleiMapper;
import com.spring.entity.Yingpianfenlei;
import com.spring.service.YingpianfenleiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("YingpianfenleiService")
public class YingpianfenleiServiceImpl extends ServiceBase<Yingpianfenlei> implements YingpianfenleiService {
    @Resource
    private YingpianfenleiMapper dao;

    @Override
    protected YingpianfenleiMapper getDao() {
        return dao;
    }
}
