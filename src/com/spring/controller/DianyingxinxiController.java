package com.spring.controller;

import com.spring.dao.DianyingxinxiMapper;
import com.spring.entity.Dianyingxinxi;
import com.spring.service.DianyingxinxiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



/**
 * 电影信息 */
@Controller
public class DianyingxinxiController extends BaseController
{
    @Autowired
    private DianyingxinxiMapper dao;
    @Autowired
    private DianyingxinxiService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/dianyingxinxi_list")
    public String list()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Dianyingxinxi.class);
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
        List<Dianyingxinxi> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "dianyingxinxi_list";
    }

    public String getWhere()
    {
        String where = " ";

            if(!Request.get("fenlei").equals("")) {
            where += " AND fenlei ='"+Request.get("fenlei")+"' ";
        }
                if(!Request.get("dianyingmingcheng").equals("")) {
            where += " AND dianyingmingcheng LIKE '%"+Request.get("dianyingmingcheng")+"%' ";
        }
            return where;
    }



    /**
    *  前台列表页
    *
    */
    @RequestMapping("/dianyingxinxilist")
    public String index()
    {
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Dianyingxinxi.class);
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
        List<Dianyingxinxi> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        request.setAttribute("where" , where);
        assign("orderBy" , order);
        assign("sort" , sort);
        return "dianyingxinxilist";
    }


        @RequestMapping("/dianyingxinxi_add")
    public String add()
    {
        return "dianyingxinxi_add";
    }



    @RequestMapping("/dianyingxinxi_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        Dianyingxinxi mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "dianyingxinxi_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/dianyingxinxiinsert")
    public String insert()
    {
        String tmp="";
        Dianyingxinxi post = new Dianyingxinxi();
        post.setDianyingbianhao(Request.get("dianyingbianhao"));

        post.setFenlei(Request.get("fenlei"));

        post.setDianyinghaibao(Request.get("dianyinghaibao"));

        post.setDianyingmingcheng(Request.get("dianyingmingcheng"));

        post.setDaoyan(Request.get("daoyan"));

        post.setZhuyan(Request.get("zhuyan"));

        post.setShangyingshijian(Request.get("shangyingshijian"));

        post.setShifoureying(Request.get("shifoureying"));

        post.setPiaojia(Request.getDouble("piaojia"));

        post.setShichang(Request.get("shichang"));

        post.setJianjie(util.DownloadRemoteImage.run(Request.get("jianjie")));


        post.setAddtime(Info.getDateStr());
                service.insert(post);
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/dianyingxinxiupdate")
    public String update()
    {
        Dianyingxinxi post = new Dianyingxinxi();
        if(!Request.get("dianyingbianhao").equals(""))
        post.setDianyingbianhao(Request.get("dianyingbianhao"));
                if(!Request.get("fenlei").equals(""))
        post.setFenlei(Request.get("fenlei"));
                if(!Request.get("dianyinghaibao").equals(""))
        post.setDianyinghaibao(Request.get("dianyinghaibao"));
                if(!Request.get("dianyingmingcheng").equals(""))
        post.setDianyingmingcheng(Request.get("dianyingmingcheng"));
                if(!Request.get("daoyan").equals(""))
        post.setDaoyan(Request.get("daoyan"));
                if(!Request.get("zhuyan").equals(""))
        post.setZhuyan(Request.get("zhuyan"));
                if(!Request.get("shangyingshijian").equals(""))
        post.setShangyingshijian(Request.get("shangyingshijian"));
                if(!Request.get("shifoureying").equals(""))
        post.setShifoureying(Request.get("shifoureying"));
                if(!Request.get("piaojia").equals(""))
        post.setPiaojia(Request.getDouble("piaojia"));
            if(!Request.get("shichang").equals(""))
        post.setShichang(Request.get("shichang"));
                if(!Request.get("jianjie").equals(""))
        post.setJianjie(util.DownloadRemoteImage.run(Request.get("jianjie")));
    
        post.setId(Request.getInt("id"));
                service.update(post);
        int charuid = post.getId().intValue();
        
        if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "dianyingxinxi_updtself.do");
        }
        return showSuccess("保存成功" , Request.get("referer"));
    }
    /**
     *  后台详情
     */
    @RequestMapping("/dianyingxinxi_detail")
    public String detail()
    {
        int id = Request.getInt("id");
        Dianyingxinxi map = service.find(id);
        request.setAttribute("map" , map);
        return "dianyingxinxi_detail";
    }
    /**
     *  前台详情
     */
    @RequestMapping("/dianyingxinxidetail")
    public String detailweb()
    {
        int id = Request.getInt("id");
        Dianyingxinxi map = service.find(id);
        
        request.setAttribute("map" , map);
        return "dianyingxinxidetail";
    }
        @RequestMapping("/dianyingxinxi_batch")
    public String batch()
    {
        if(request.getParameter("delete")!=null)
        {
            String[] ids = request.getParameterValues("ids");
            if(ids!=null) Query.make("dianyingxinxi").where("id" , "in" , ids).delete();
        }
        return showSuccess("批量处理成功",request.getHeader("referer"));
    }

        /**
    *  删除
    */
    @RequestMapping("/dianyingxinxi_delete")
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
