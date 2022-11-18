package com.spring.controller;

import com.spring.dao.PingjiafankuiMapper;
import com.spring.entity.Pingjiafankui;
import com.spring.service.PingjiafankuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



/**
 * 评价反馈 */
@Controller
public class PingjiafankuiController extends BaseController
{
    @Autowired
    private PingjiafankuiMapper dao;
    @Autowired
    private PingjiafankuiService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/pingjiafankui_list")
    public String list()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Pingjiafankui.class);
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
        List<Pingjiafankui> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "pingjiafankui_list";
    }

    public String getWhere()
    {
        String where = " ";

        return where;
    }

    @RequestMapping("/pingjiafankui_list_pingjiaren")
    public String listpingjiaren()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Pingjiafankui.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " pingjiaren='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);
        if(sort.equals("desc")){
            example.orderBy(order).desc();
        }else{
            example.orderBy(order).asc();
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1 , page);
        List<Pingjiafankui> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "pingjiafankui_list_pingjiaren";
    }


    /**
    *  前台列表页
    *
    */
    @RequestMapping("/pingjiafankuilist")
    public String index()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./");
        }
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Pingjiafankui.class);
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
        List<Pingjiafankui> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        request.setAttribute("where" , where);
        assign("orderBy" , order);
        assign("sort" , sort);
        return "pingjiafankuilist";
    }


        @RequestMapping("/pingjiafankui_add")
    public String add()
    {
        return "pingjiafankui_add";
    }

    @RequestMapping("/pingjiafankuiadd")
    public String addWeb()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./");
        }
        return "pingjiafankuiadd";
    }


    @RequestMapping("/pingjiafankui_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        Pingjiafankui mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "pingjiafankui_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/pingjiafankuiinsert")
    public String insert()
    {
        String tmp="";
        Pingjiafankui post = new Pingjiafankui();
        post.setXingming(Request.get("xingming"));

        post.setLianxidianhua(Request.get("lianxidianhua"));

        post.setNeirong(Request.get("neirong"));

        post.setPingjiaren(Request.get("pingjiaren"));

        post.setHuifuneirong(Request.get("huifuneirong"));


        post.setAddtime(Info.getDateStr());
                service.insert(post);
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/pingjiafankuiupdate")
    public String update()
    {
        Pingjiafankui post = new Pingjiafankui();
        if(!Request.get("xingming").equals(""))
        post.setXingming(Request.get("xingming"));
                if(!Request.get("lianxidianhua").equals(""))
        post.setLianxidianhua(Request.get("lianxidianhua"));
                if(!Request.get("neirong").equals(""))
        post.setNeirong(Request.get("neirong"));
                if(!Request.get("pingjiaren").equals(""))
        post.setPingjiaren(Request.get("pingjiaren"));
                if(!Request.get("huifuneirong").equals(""))
        post.setHuifuneirong(Request.get("huifuneirong"));
        
        post.setId(Request.getInt("id"));
                service.update(post);
        int charuid = post.getId().intValue();
        
        if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "pingjiafankui_updtself.do");
        }
        return showSuccess("保存成功" , Request.get("referer"));
    }
        /**
    *  删除
    */
    @RequestMapping("/pingjiafankui_delete")
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
