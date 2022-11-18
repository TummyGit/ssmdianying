<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>电影信息</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    <link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>


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
            <td><ssm:sql var="mapyingpianfenlei3" type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${map.fenlei}</ssm:sql>${mapyingpianfenlei3.fenleimingcheng}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                电影海报            </td>
            <td><fieldset class="images_box"><div id="gellay_images" class="imagesList"><script>
            var images = "${map.dianyinghaibao}".split(',');
            for(var i=0;i<images.length;i++){
                var image = images[i];
                var uploadImage = '<div class="uploadImage">' +
                '<span class="thumb thumbnail"><img src="'+image+'"/></span>'+
                '</div>';
                document.writeln(uploadImage);
            }
            
</script></div></fieldset></td>
            
                                    <td width="180">
                电影名称            </td>
            <td>${map.dianyingmingcheng}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                导演            </td>
            <td>${map.daoyan}</td>
            
                                    <td width="180">
                主演            </td>
            <td>${map.zhuyan}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                上映时间            </td>
            <td>${map.shangyingshijian}</td>
            
                                    <td width="180">
                是否热映            </td>
            <td>${map.shifoureying}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                票价            </td>
            <td>${map.piaojia}</td>
            
                                    <td width="180">
                时长            </td>
            <td>${map.shichang}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                简介            </td>
            <td>${map.jianjie}</td>
            
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
