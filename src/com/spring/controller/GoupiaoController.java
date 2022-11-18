package com.spring.controller;

import com.spring.dao.GoupiaoMapper;
import com.spring.entity.Goupiao;
import com.spring.service.GoupiaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;

import java.util.*;


import com.spring.entity.Dianyingchangci;
import com.spring.service.DianyingchangciService;

/**
 * 购票
 */
@Controller
public class GoupiaoController extends BaseController {
    @Autowired
    private GoupiaoMapper dao;
    @Autowired
    private GoupiaoService service;

    @Autowired
    private DianyingchangciService serviceRead;

    /**
     * 后台列表页
     */
    @RequestMapping("/goupiao_list")
    public String list() {
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id");
        String sort = Request.get("sort", "desc");

        Example example = new Example(Goupiao.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " 1=1 ";
        where += getWhere();
        criteria.andCondition(where);
        if (sort.equals("desc")) {
            example.orderBy(order).desc();
        } else {
            example.orderBy(order).asc();
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1, page);
        List<Goupiao> list = service.selectPageExample(example, page, 12);
        request.setAttribute("list", list);
        assign("orderBy", order);
        assign("sort", sort);
        assign("where", where);
        return "goupiao_list";
    }

    public String getWhere() {
        String where = " ";
        if (Request.getInt("dianyingchangciid") > 0) {
            where += " AND dianyingchangciid='" + Request.getInt("dianyingchangciid") + "' ";
        }

        if (!Request.get("fenlei").equals("")) {
            where += " AND fenlei ='" + Request.get("fenlei") + "' ";
        }
        if (!Request.get("dianyingmingcheng").equals("")) {
            where += " AND dianyingmingcheng LIKE '%" + Request.get("dianyingmingcheng") + "%' ";
        }
        if (!Request.get("kaichangshijian").equals("")) {
            where += " AND kaichangshijian LIKE '%" + Request.get("kaichangshijian") + "%' ";
        }
        if (!Request.get("xuanzuo").equals("")) {
            where += " AND xuanzuo LIKE '%" + Request.get("xuanzuo") + "%' ";
        }
        return where;
    }

    @RequestMapping("/goupiao_list_goupiaoren")
    public String listgoupiaoren() {
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }
        String order = Request.get("order", "id");
        String sort = Request.get("sort", "desc");

        Example example = new Example(Goupiao.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " goupiaoren='" + request.getSession().getAttribute("username") + "' ";
        where += getWhere();

        criteria.andCondition(where);
        if (sort.equals("desc")) {
            example.orderBy(order).desc();
        } else {
            example.orderBy(order).asc();
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1, page);
        List<Goupiao> list = service.selectPageExample(example, page, 12);
        request.setAttribute("list", list);
        assign("orderBy", order);
        assign("sort", sort);
        assign("where", where);
        return "goupiao_list_goupiaoren";
    }


    @RequestMapping("/goupiao_add")
    public String add() {
        int id = Request.getInt("id");
        Dianyingchangci readMap = serviceRead.find(id);
        request.setAttribute("readMap", readMap);
        return "goupiao_add";
    }

    @RequestMapping("/goupiaoadd")
    public String addWeb() {
        if (!checkLogin()) {
            return showError("尚未登录", "./");
        }
        int id = Request.getInt("id");
        Dianyingchangci readMap = serviceRead.find(id);
        request.setAttribute("readMap", readMap);
        return "goupiaoadd";
    }


    @RequestMapping("/goupiao_updt")
    public String updt() {
        int id = Request.getInt("id");
        Goupiao mmm = service.find(id);
        request.setAttribute("mmm", mmm);
        request.setAttribute("updtself", 0);
        return "goupiao_updt";
    }

    /**
     * 添加内容
     *
     * @return
     */
    @RequestMapping("/goupiaoinsert")
    public String insert() {
        String tmp = "";
        Goupiao post = new Goupiao();
        post.setDianyingbianhao(Request.get("dianyingbianhao"));

        post.setFenlei(Request.get("fenlei"));

        post.setDianyingmingcheng(Request.get("dianyingmingcheng"));

        post.setPiaojia(Request.getDouble("piaojia"));

        post.setFangyingting(Request.get("fangyingting"));

        post.setKaichangshijian(Request.get("kaichangshijian"));

        post.setSanchangshijian(Request.get("sanchangshijian"));

        post.setGoumaishu(Request.getInt("goumaishu"));

        post.setXuanzuo(Request.get("xuanzuo"));

        post.setXiaoji(Request.getDouble("xiaoji"));

        post.setGoupiaoren(Request.get("goupiaoren"));

        post.setDingpiaozhuangtai(Request.get("dingpiaozhuangtai"));

        post.setDianyingchangciid(Request.getInt("dianyingchangciid"));
        post.setIszf("否");

        post.setAddtime(Info.getDateStr());
        service.insert(post);
        int charuid = post.getId().intValue();
        Query.execute("UPDATE goupiao SET xiaoji=(piaojia*goumaishu) WHERE id='" + charuid + "'");


        Query.execute("UPDATE goupiao SET dingpiaozhuangtai='待支付' WHERE id='" + charuid + "'");


        Query.execute("update dianyingchangci set shengyupiaoshu=shengyupiaoshu-'" + request.getParameter("goumaishu") + "' where id='" + request.getParameter("dianyingchangciid") + "'");


        return showSuccess("保存成功", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     *
     * @return
     */
    @RequestMapping("/goupiaoupdate")
    public String update() {
        Goupiao post = new Goupiao();
        if (!Request.get("dianyingbianhao").equals(""))
            post.setDianyingbianhao(Request.get("dianyingbianhao"));
        if (!Request.get("fenlei").equals(""))
            post.setFenlei(Request.get("fenlei"));
        if (!Request.get("dianyingmingcheng").equals(""))
            post.setDianyingmingcheng(Request.get("dianyingmingcheng"));
        if (!Request.get("piaojia").equals(""))
            post.setPiaojia(Request.getDouble("piaojia"));
        if (!Request.get("fangyingting").equals(""))
            post.setFangyingting(Request.get("fangyingting"));
        if (!Request.get("kaichangshijian").equals(""))
            post.setKaichangshijian(Request.get("kaichangshijian"));
        if (!Request.get("sanchangshijian").equals(""))
            post.setSanchangshijian(Request.get("sanchangshijian"));
        if (!Request.get("goumaishu").equals(""))
            post.setGoumaishu(Request.getInt("goumaishu"));
        if (!Request.get("xuanzuo").equals(""))
            post.setXuanzuo(Request.get("xuanzuo"));
        if (!Request.get("xiaoji").equals(""))
            post.setXiaoji(Request.getDouble("xiaoji"));
        if (!Request.get("goupiaoren").equals(""))
            post.setGoupiaoren(Request.get("goupiaoren"));
        if (!Request.get("dingpiaozhuangtai").equals(""))
            post.setDingpiaozhuangtai(Request.get("dingpiaozhuangtai"));

        post.setId(Request.getInt("id"));
        service.update(post);
        int charuid = post.getId().intValue();
        Query.execute("UPDATE goupiao SET xiaoji=(piaojia*goumaishu) WHERE id='" + request.getParameter("id") + "'");


        if (Request.getInt("updtself") == 1) {
            return showSuccess("保存成功", "goupiao_updtself.do");
        }
        return showSuccess("保存成功", Request.get("referer"));
    }

    @RequestMapping("/goupiao_batch")
    public String batch() {
        if (request.getParameter("delete") != null) {
            String[] ids = request.getParameterValues("ids");
            if (ids != null) Query.make("goupiao").where("id", "in", ids).delete();
        }
        return showSuccess("批量处理成功", request.getHeader("referer"));
    }

    /**
     * 删除
     */
    @RequestMapping("/goupiao_delete")
    public String delete() {
        if (!checkLogin()) {
            return showError("尚未登录");
        }
        int id = Request.getInt("id");
        //delete_before
        service.delete(id);
        return showSuccess("删除成功", request.getHeader("referer"));
    }
}
