package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.DianyingchangciMapper;
import com.spring.entity.Dianyingchangci;
import com.spring.service.DianyingchangciService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("DianyingchangciService")
public class DianyingchangciServiceImpl extends ServiceBase<Dianyingchangci> implements DianyingchangciService {
    @Resource
    private DianyingchangciMapper dao;

    @Override
    protected DianyingchangciMapper getDao() {
        return dao;
    }
}
