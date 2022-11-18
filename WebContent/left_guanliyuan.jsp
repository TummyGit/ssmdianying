<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


                <li>
        <a href="javascript:;">
            <i class="iconfont left-nav-li" lay-tips="帐号管理">&#xe6a7;</i>
            <cite>帐号管理</cite>
            <i class="iconfont nav_right">&#xe697;</i>
        </a>
        <ul class="sub-menu">
                                            <li>
                    <a onclick="xadmin.add_tab('管理员账号管理','admins_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>管理员账号管理</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('管理员账号添加','admins_add.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>管理员账号添加</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('注册用户管理','zhuceyonghu_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>注册用户管理</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('密码修改','mod.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>密码修改</cite>
                    </a>
                </li>
                    </ul>
    </li>
                <li>
        <a href="javascript:;">
            <i class="iconfont left-nav-li" lay-tips="影片信息管理">&#xe6a7;</i>
            <cite>影片信息管理</cite>
            <i class="iconfont nav_right">&#xe697;</i>
        </a>
        <ul class="sub-menu">
                                            <li>
                    <a onclick="xadmin.add_tab('分类添加','yingpianfenlei_add.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>分类添加</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('分类查询','yingpianfenlei_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>分类查询</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('影片添加','dianyingxinxi_add.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>影片添加</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('影片查询','dianyingxinxi_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>影片查询</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('放映场次查询','dianyingchangci_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>放映场次查询</cite>
                    </a>
                </li>
                    </ul>
    </li>
                <li>
        <a href="javascript:;">
            <i class="iconfont left-nav-li" lay-tips="放映厅管理">&#xe6a7;</i>
            <cite>放映厅管理</cite>
            <i class="iconfont nav_right">&#xe697;</i>
        </a>
        <ul class="sub-menu">
                                            <li>
                    <a onclick="xadmin.add_tab('映厅添加','fangyingting_add.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>映厅添加</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('映厅查询','fangyingting_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>映厅查询</cite>
                    </a>
                </li>
                    </ul>
    </li>
                <li>
        <a href="javascript:;">
            <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe6a7;</i>
            <cite>订单管理</cite>
            <i class="iconfont nav_right">&#xe697;</i>
        </a>
        <ul class="sub-menu">
                                            <li>
                    <a onclick="xadmin.add_tab('订单查询','goupiao_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>订单查询</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('退票查询','yingpiaotuiding_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>退票查询</cite>
                    </a>
                </li>
                    </ul>
    </li>
                <li>
        <a href="javascript:;">
            <i class="iconfont left-nav-li" lay-tips="系统管理">&#xe6a7;</i>
            <cite>系统管理</cite>
            <i class="iconfont nav_right">&#xe697;</i>
        </a>
        <ul class="sub-menu">
                                            <li>
                    <a onclick="xadmin.add_tab('友情链接添加','youqinglianjie_add.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>友情链接添加</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('友情链接查询','youqinglianjie_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>友情链接查询</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('轮播图添加','lunbotu_add.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>轮播图添加</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('轮播图查询','lunbotu_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>轮播图查询</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('评价反馈','pingjiafankui_list.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>评价反馈</cite>
                    </a>
                </li>
                    </ul>
    </li>
    