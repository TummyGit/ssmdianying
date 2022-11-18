package com.spring.controller;

import com.spring.dao.FangyingtingMapper;
import com.spring.entity.Fangyingting;
import com.spring.service.FangyingtingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



/**
 * 放映厅 */
@Controller
public class FangyingtingController extends BaseController
{
    @Autowired
    private FangyingtingMapper dao;
    @Autowired
    private FangyingtingService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/fangyingting_list")
    public String list()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Fangyingting.class);
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
        List<Fangyingting> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "fangyingting_list";
    }

    public String getWhere()
    {
        String where = " ";

            if(!Request.get("yingtingmingcheng").equals("")) {
            where += " AND yingtingmingcheng LIKE '%"+Request.get("yingtingmingcheng")+"%' ";
        }
            return where;
    }





        @RequestMapping("/fangyingting_add")
    public String add()
    {
        return "fangyingting_add";
    }



    @RequestMapping("/fangyingting_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        Fangyingting mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "fangyingting_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/fangyingtinginsert")
    public String insert()
    {
        String tmp="";
        Fangyingting post = new Fangyingting();
        post.setYingtingbianhao(Request.get("yingtingbianhao"));

        post.setYingtingmingcheng(Request.get("yingtingmingcheng"));

        post.setJipai(Request.getInt("jipai"));

        post.setJilie(Request.getInt("jilie"));


        post.setAddtime(Info.getDateStr());
                service.insert(post);
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/fangyingtingupdate")
    public String update()
    {
        Fangyingting post = new Fangyingting();
        if(!Request.get("yingtingbianhao").equals(""))
        post.setYingtingbianhao(Request.get("yingtingbianhao"));
                if(!Request.get("yingtingmingcheng").equals(""))
        post.setYingtingmingcheng(Request.get("yingtingmingcheng"));
                if(!Request.get("jipai").equals(""))
        post.setJipai(Request.getInt("jipai"));
            if(!Request.get("jilie").equals(""))
        post.setJilie(Request.getInt("jilie"));
    
        post.setId(Request.getInt("id"));
                service.update(post);
        int charuid = post.getId().intValue();
        
        if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "fangyingting_updtself.do");
        }
        return showSuccess("保存成功" , Request.get("referer"));
    }
        /**
    *  删除
    */
    @RequestMapping("/fangyingting_delete")
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
