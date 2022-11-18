<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


                <li>
        <a href="javascript:;">
            <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe6a7;</i>
            <cite>订单管理</cite>
            <i class="iconfont nav_right">&#xe697;</i>
        </a>
        <ul class="sub-menu">
                                            <li>
                    <a onclick="xadmin.add_tab('我的影票','goupiao_list_goupiaoren.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>我的影票</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('退票查询','yingpiaotuiding_list_goupiaoren.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>退票查询</cite>
                    </a>
                </li>
                    </ul>
    </li>
                <li>
        <a href="javascript:;">
            <i class="iconfont left-nav-li" lay-tips="评价反馈管理">&#xe6a7;</i>
            <cite>评价反馈管理</cite>
            <i class="iconfont nav_right">&#xe697;</i>
        </a>
        <ul class="sub-menu">
                                            <li>
                    <a onclick="xadmin.add_tab('我的评价','pingjiafankui_list_pingjiaren.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>我的评价</cite>
                    </a>
                </li>
                    </ul>
    </li>
                <li>
        <a href="javascript:;">
            <i class="iconfont left-nav-li" lay-tips="个人中心">&#xe6a7;</i>
            <cite>个人中心</cite>
            <i class="iconfont nav_right">&#xe697;</i>
        </a>
        <ul class="sub-menu">
                                            <li>
                    <a onclick="xadmin.add_tab('修改个人资料','zhuceyonghu_updtself.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>修改个人资料</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('修改密码','mod.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>修改密码</cite>
                    </a>
                </li>
                                            <li>
                    <a onclick="xadmin.add_tab('我的收藏','shoucangjilu_list2.do')">
                        <i class="iconfont">&#xe6a7;</i>
                        <cite>我的收藏</cite>
                    </a>
                </li>
                    </ul>
    </li>
    