package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.GoupiaoMapper;
import com.spring.entity.Goupiao;
import com.spring.service.GoupiaoService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("GoupiaoService")
public class GoupiaoServiceImpl extends ServiceBase<Goupiao> implements GoupiaoService {
    @Resource
    private GoupiaoMapper dao;

    @Override
    protected GoupiaoMapper getDao() {
        return dao;
    }
}
