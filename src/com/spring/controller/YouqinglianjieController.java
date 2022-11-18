package com.spring.controller;

import com.spring.dao.YouqinglianjieMapper;
import com.spring.entity.Youqinglianjie;
import com.spring.service.YouqinglianjieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



/**
 * 友情链接 */
@Controller
public class YouqinglianjieController extends BaseController
{
    @Autowired
    private YouqinglianjieMapper dao;
    @Autowired
    private YouqinglianjieService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/youqinglianjie_list")
    public String list()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Youqinglianjie.class);
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
        List<Youqinglianjie> list = service.selectPageExample(example , page , 12);
        request.setAttribute("list" , list);
        assign("orderBy" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "youqinglianjie_list";
    }

    public String getWhere()
    {
        String where = " ";

        return where;
    }





        @RequestMapping("/youqinglianjie_add")
    public String add()
    {
        return "youqinglianjie_add";
    }



    @RequestMapping("/youqinglianjie_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        Youqinglianjie mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "youqinglianjie_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/youqinglianjieinsert")
    public String insert()
    {
        String tmp="";
        Youqinglianjie post = new Youqinglianjie();
        post.setWangzhanmingcheng(Request.get("wangzhanmingcheng"));

        post.setWangzhi(Request.get("wangzhi"));


        post.setAddtime(Info.getDateStr());
                service.insert(post);
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/youqinglianjieupdate")
    public String update()
    {
        Youqinglianjie post = new Youqinglianjie();
        if(!Request.get("wangzhanmingcheng").equals(""))
        post.setWangzhanmingcheng(Request.get("wangzhanmingcheng"));
                if(!Request.get("wangzhi").equals(""))
        post.setWangzhi(Request.get("wangzhi"));
        
        post.setId(Request.getInt("id"));
                service.update(post);
        int charuid = post.getId().intValue();
        
        if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "youqinglianjie_updtself.do");
        }
        return showSuccess("保存成功" , Request.get("referer"));
    }
        /**
    *  删除
    */
    @RequestMapping("/youqinglianjie_delete")
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
