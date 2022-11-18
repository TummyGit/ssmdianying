package com.spring.controller;

import com.spring.dao.AdminsMapper;
import com.spring.entity.Admins;
import com.spring.service.AdminsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



/**
 * 管理员 */
@Controller
public class AdminsController extends BaseController
{
    @Autowired
    private AdminsMapper dao;
    @Autowired
    private AdminsService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/admins_list")
    public String list()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Admins.class);
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
        List<Admins> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "admins_list";
    }

    public String getWhere()
    {
        String where = " ";

            if(!Request.get("username").equals("")) {
            where += " AND username LIKE '%"+Request.get("username")+"%' ";
        }
            return where;
    }





        @RequestMapping("/admins_add")
    public String add()
    {
        return "admins_add";
    }



    @RequestMapping("/admins_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        Admins mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "admins_updt";
    }
    @RequestMapping("/admins_updtself")
    public String updtself()
    {
        int id = (int)request.getSession().getAttribute("id");
        Admins mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 1);

        return "admins_updtself";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/adminsinsert")
    public String insert()
    {
        String tmp="";
        Admins post = new Admins();
        post.setUsername(Request.get("username"));

        post.setPwd(Request.get("pwd"));


        post.setAddtime(Info.getDateStr());
                service.insert(post);
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/adminsupdate")
    public String update()
    {
        Admins post = new Admins();
        if(!Request.get("username").equals(""))
        post.setUsername(Request.get("username"));
                if(!Request.get("pwd").equals(""))
        post.setPwd(Request.get("pwd"));
        
        post.setId(Request.getInt("id"));
                service.update(post);
        int charuid = post.getId().intValue();
        
        if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "admins_updtself.do");
        }
        return showSuccess("保存成功" , Request.get("referer"));
    }
        /**
    *  删除
    */
    @RequestMapping("/admins_delete")
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
