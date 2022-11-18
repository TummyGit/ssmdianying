package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.DianyingxinxiMapper;
import com.spring.entity.Dianyingxinxi;
import com.spring.service.DianyingxinxiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("DianyingxinxiService")
public class DianyingxinxiServiceImpl extends ServiceBase<Dianyingxinxi> implements DianyingxinxiService {
    @Resource
    private DianyingxinxiMapper dao;

    @Override
    protected DianyingxinxiMapper getDao() {
        return dao;
    }
}
