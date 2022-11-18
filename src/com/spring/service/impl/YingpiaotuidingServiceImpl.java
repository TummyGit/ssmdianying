package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.YingpiaotuidingMapper;
import com.spring.entity.Yingpiaotuiding;
import com.spring.service.YingpiaotuidingService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("YingpiaotuidingService")
public class YingpiaotuidingServiceImpl extends ServiceBase<Yingpiaotuiding> implements YingpiaotuidingService {
    @Resource
    private YingpiaotuidingMapper dao;

    @Override
    protected YingpiaotuidingMapper getDao() {
        return dao;
    }
}
