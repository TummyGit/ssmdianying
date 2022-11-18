package com.spring.controller;

import com.spring.dao.DianyingchangciMapper;
import com.spring.entity.Dianyingchangci;
import com.spring.service.DianyingchangciService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;


import com.spring.entity.Dianyingxinxi;
import com.spring.service.DianyingxinxiService;

/**
 * 电影场次 */
@Controller
public class DianyingchangciController extends BaseController
{
    @Autowired
    private DianyingchangciMapper dao;
    @Autowired
    private DianyingchangciService service;

    @Autowired
    private DianyingxinxiService serviceRead;
    /**
     *  后台列表页
     *
     */
    @RequestMapping("/dianyingchangci_list")
    public String list()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Dianyingchangci.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " 1=1 ";
        where += getWhere();
        criteria.andCondition(where);
        if(sort.equals("desc")){
            example.orderBy(order).desc();
        }else{
            example.orderBy(order).asc();
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1 , page);
        List<Dianyingchangci> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "dianyingchangci_list";
    }

    public String getWhere()
    {
        String where = " ";
        if(Request.getInt("dianyingxinxiid")>0){
            where += " AND dianyingxinxiid='"+Request.getInt("dianyingxinxiid")+"' ";
        }

            if(!Request.get("fenlei").equals("")) {
            where += " AND fenlei ='"+Request.get("fenlei")+"' ";
        }
                if(!Request.get("dianyingmingcheng").equals("")) {
            where += " AND dianyingmingcheng LIKE '%"+Request.get("dianyingmingcheng")+"%' ";
        }
                if(!Request.get("kaichangshijian_start").equals("")) {
            where += " AND kaichangshijian >='"+Request.get("kaichangshijian_start")+"' ";
        }
        if(!Request.get("kaichangshijian_end").equals("")) {
            where += " AND kaichangshijian <= '"+Request.get("kaichangshijian_end")+"' ";
        }
            return where;
    }



    /**
    *  前台列表页
    *
    */
    @RequestMapping("/dianyingchangcilist")
    public String index()
    {
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Dianyingchangci.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " 1=1 ";
        where += getWhere();
        criteria.andCondition(where);
        if(sort.equals("desc")){
            example.orderBy(order).desc();
        }else{
            example.orderBy(order).asc();
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1 , page);
        List<Dianyingchangci> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        request.setAttribute("where" , where);
        assign("orderBy" , order);
        assign("sort" , sort);
        return "dianyingchangcilist";
    }


        @RequestMapping("/dianyingchangci_add")
    public String add()
    {
        int id = Request.getInt("id");
        Dianyingxinxi readMap = serviceRead.find(id);
        request.setAttribute("readMap" , readMap);
        return "dianyingchangci_add";
    }



    @RequestMapping("/dianyingchangci_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        Dianyingchangci mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "dianyingchangci_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/dianyingchangciinsert")
    public String insert()
    {
        String tmp="";
        Dianyingchangci post = new Dianyingchangci();
        post.setDianyingbianhao(Request.get("dianyingbianhao"));

        post.setFenlei(Request.get("fenlei"));

        post.setDianyingmingcheng(Request.get("dianyingmingcheng"));

        post.setDianyinghaibao(Request.get("dianyinghaibao"));

        post.setPiaojia(Request.getDouble("piaojia"));

        post.setFangyingting(Request.get("fangyingting"));

        post.setKaichangshijian(Request.get("kaichangshijian"));

        post.setSanchangshijian(Request.get("sanchangshijian"));

        post.setShengyupiaoshu(Request.getInt("shengyupiaoshu"));

        post.setDianyingxinxiid(Request.getInt("dianyingxinxiid"));

        post.setAddtime(Info.getDateStr());
                service.insert(post);
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/dianyingchangciupdate")
    public String update()
    {
        Dianyingchangci post = new Dianyingchangci();
        if(!Request.get("dianyingbianhao").equals(""))
        post.setDianyingbianhao(Request.get("dianyingbianhao"));
                if(!Request.get("fenlei").equals(""))
        post.setFenlei(Request.get("fenlei"));
                if(!Request.get("dianyingmingcheng").equals(""))
        post.setDianyingmingcheng(Request.get("dianyingmingcheng"));
                if(!Request.get("dianyinghaibao").equals(""))
        post.setDianyinghaibao(Request.get("dianyinghaibao"));
                if(!Request.get("piaojia").equals(""))
        post.setPiaojia(Request.getDouble("piaojia"));
            if(!Request.get("fangyingting").equals(""))
        post.setFangyingting(Request.get("fangyingting"));
                if(!Request.get("kaichangshijian").equals(""))
        post.setKaichangshijian(Request.get("kaichangshijian"));
                if(!Request.get("sanchangshijian").equals(""))
        post.setSanchangshijian(Request.get("sanchangshijian"));
                if(!Request.get("shengyupiaoshu").equals(""))
        post.setShengyupiaoshu(Request.getInt("shengyupiaoshu"));
    
        post.setId(Request.getInt("id"));
                service.update(post);
        int charuid = post.getId().intValue();
        
        if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "dianyingchangci_updtself.do");
        }
        return showSuccess("保存成功" , Request.get("referer"));
    }
    /**
     *  后台详情
     */
    @RequestMapping("/dianyingchangci_detail")
    public String detail()
    {
        int id = Request.getInt("id");
        Dianyingchangci map = service.find(id);
        request.setAttribute("map" , map);
        return "dianyingchangci_detail";
    }
    /**
     *  前台详情
     */
    @RequestMapping("/dianyingchangcidetail")
    public String detailweb()
    {
        int id = Request.getInt("id");
        Dianyingchangci map = service.find(id);
        
        request.setAttribute("map" , map);
        return "dianyingchangcidetail";
    }
        @RequestMapping("/dianyingchangci_batch")
    public String batch()
    {
        if(request.getParameter("delete")!=null)
        {
            String[] ids = request.getParameterValues("ids");
            if(ids!=null) Query.make("dianyingchangci").where("id" , "in" , ids).delete();
        }
        return showSuccess("批量处理成功",request.getHeader("referer"));
    }

        /**
    *  删除
    */
    @RequestMapping("/dianyingchangci_delete")
    public String delete()
    {
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");
        //delete_before
                service.delete(id);
                return showSuccess("删除成功",request.getHeader("referer"));
    }
}
