package com.spring.controller;

import com.spring.dao.YingpiaotuidingMapper;
import com.spring.entity.Yingpiaotuiding;
import com.spring.service.YingpiaotuidingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;


import com.spring.entity.Goupiao;
import com.spring.service.GoupiaoService;

/**
 * 影票退订 */
@Controller
public class YingpiaotuidingController extends BaseController
{
    @Autowired
    private YingpiaotuidingMapper dao;
    @Autowired
    private YingpiaotuidingService service;

    @Autowired
    private GoupiaoService serviceRead;
    /**
     *  后台列表页
     *
     */
    @RequestMapping("/yingpiaotuiding_list")
    public String list()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Yingpiaotuiding.class);
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
        List<Yingpiaotuiding> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "yingpiaotuiding_list";
    }

    public String getWhere()
    {
        String where = " ";
        if(Request.getInt("goupiaoid")>0){
            where += " AND goupiaoid='"+Request.getInt("goupiaoid")+"' ";
        }

            if(!Request.get("fenlei").equals("")) {
            where += " AND fenlei ='"+Request.get("fenlei")+"' ";
        }
                if(!Request.get("dianyingmingcheng").equals("")) {
            where += " AND dianyingmingcheng LIKE '%"+Request.get("dianyingmingcheng")+"%' ";
        }
                if(!Request.get("kaichangshijian").equals("")) {
            where += " AND kaichangshijian LIKE '%"+Request.get("kaichangshijian")+"%' ";
        }
            return where;
    }

    @RequestMapping("/yingpiaotuiding_list_goupiaoren")
    public String listgoupiaoren()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Yingpiaotuiding.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " goupiaoren='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);
        if(sort.equals("desc")){
            example.orderBy(order).desc();
        }else{
            example.orderBy(order).asc();
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1 , page);
        List<Yingpiaotuiding> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "yingpiaotuiding_list_goupiaoren";
    }




        @RequestMapping("/yingpiaotuiding_add")
    public String add()
    {
        int id = Request.getInt("id");
        Goupiao readMap = serviceRead.find(id);
        request.setAttribute("readMap" , readMap);
        return "yingpiaotuiding_add";
    }



    @RequestMapping("/yingpiaotuiding_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        Yingpiaotuiding mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "yingpiaotuiding_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/yingpiaotuidinginsert")
    public String insert()
    {
        String tmp="";
        Yingpiaotuiding post = new Yingpiaotuiding();
        post.setDianyingbianhao(Request.get("dianyingbianhao"));

        post.setFenlei(Request.get("fenlei"));

        post.setDianyingmingcheng(Request.get("dianyingmingcheng"));

        post.setPiaojia(Request.getDouble("piaojia"));

        post.setGoumaishu(Request.getInt("goumaishu"));

        post.setXiaoji(Request.getDouble("xiaoji"));

        post.setGoupiaoren(Request.get("goupiaoren"));

        post.setKaichangshijian(Request.get("kaichangshijian"));

        post.setTuipiaozhangshu(Request.getInt("tuipiaozhangshu"));

        post.setTuikuanjine(Request.getDouble("tuikuanjine"));

        post.setTuipiaoyuanyin(Request.get("tuipiaoyuanyin"));

        post.setGoupiaoid(Request.getInt("goupiaoid"));

        post.setAddtime(Info.getDateStr());
                service.insert(post);
        int charuid = post.getId().intValue();
        Query.execute("UPDATE goupiao SET dingpiaozhuangtai='已退票' WHERE id='"+request.getParameter("goupiaoid")+"'");



        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/yingpiaotuidingupdate")
    public String update()
    {
        Yingpiaotuiding post = new Yingpiaotuiding();
        if(!Request.get("dianyingbianhao").equals(""))
        post.setDianyingbianhao(Request.get("dianyingbianhao"));
                if(!Request.get("fenlei").equals(""))
        post.setFenlei(Request.get("fenlei"));
                if(!Request.get("dianyingmingcheng").equals(""))
        post.setDianyingmingcheng(Request.get("dianyingmingcheng"));
                if(!Request.get("piaojia").equals(""))
        post.setPiaojia(Request.getDouble("piaojia"));
            if(!Request.get("goumaishu").equals(""))
        post.setGoumaishu(Request.getInt("goumaishu"));
            if(!Request.get("xiaoji").equals(""))
        post.setXiaoji(Request.getDouble("xiaoji"));
            if(!Request.get("goupiaoren").equals(""))
        post.setGoupiaoren(Request.get("goupiaoren"));
                if(!Request.get("kaichangshijian").equals(""))
        post.setKaichangshijian(Request.get("kaichangshijian"));
                if(!Request.get("tuipiaozhangshu").equals(""))
        post.setTuipiaozhangshu(Request.getInt("tuipiaozhangshu"));
            if(!Request.get("tuikuanjine").equals(""))
        post.setTuikuanjine(Request.getDouble("tuikuanjine"));
            if(!Request.get("tuipiaoyuanyin").equals(""))
        post.setTuipiaoyuanyin(Request.get("tuipiaoyuanyin"));
        
        post.setId(Request.getInt("id"));
                service.update(post);
        int charuid = post.getId().intValue();
        
        if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "yingpiaotuiding_updtself.do");
        }
        return showSuccess("保存成功" , Request.get("referer"));
    }
    /**
     *  后台详情
     */
    @RequestMapping("/yingpiaotuiding_detail")
    public String detail()
    {
        int id = Request.getInt("id");
        Yingpiaotuiding map = service.find(id);
        request.setAttribute("map" , map);
        return "yingpiaotuiding_detail";
    }
        @RequestMapping("/yingpiaotuiding_batch")
    public String batch()
    {
        if(request.getParameter("delete")!=null)
        {
            String[] ids = request.getParameterValues("ids");
            if(ids!=null) Query.make("yingpiaotuiding").where("id" , "in" , ids).delete();
        }
        return showSuccess("批量处理成功",request.getHeader("referer"));
    }

        /**
    *  删除
    */
    @RequestMapping("/yingpiaotuiding_delete")
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
