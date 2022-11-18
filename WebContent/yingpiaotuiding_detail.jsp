<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>影票退订</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>

<div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                电影编号            </td>
            <td>${map.dianyingbianhao}</td>
            
                                    <td width="180">
                分类            </td>
            <td><ssm:sql var="mapyingpianfenlei27" type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${map.fenlei}</ssm:sql>${mapyingpianfenlei27.fenleimingcheng}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                电影名称            </td>
            <td>${map.dianyingmingcheng}</td>
            
                                    <td width="180">
                票价            </td>
            <td>${map.piaojia}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                购买数            </td>
            <td>${map.goumaishu}</td>
            
                                    <td width="180">
                小计            </td>
            <td>${map.xiaoji}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                购票人            </td>
            <td>${map.goupiaoren}</td>
            
                                    <td width="180">
                开场时间            </td>
            <td>${map.kaichangshijian}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                退票张数            </td>
            <td>${map.tuipiaozhangshu}</td>
            
                                    <td width="180">
                退款金额            </td>
            <td>${map.tuikuanjine}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                退票原因            </td>
            <td>${map.tuipiaoyuanyin}</td>
            
                    </tr>
    </table>
</div>


<div class="button-list">
    <div class="">
        <button class="btn btn-history" onclick="history.go(-1);">返回
        </button>
        <button onclick="window.print()" class="btn btn-print">打印本页
        </button>
    </div>
</div>


</body>
</html>
