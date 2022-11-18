<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>电影场次</title>

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
            <td><ssm:sql var="mapyingpianfenlei9" type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${map.fenlei}</ssm:sql>${mapyingpianfenlei9.fenleimingcheng}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                电影名称            </td>
            <td>${map.dianyingmingcheng}</td>
            
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
                    </tr>
        <tr>
            
                                    <td width="180">
                票价            </td>
            <td>${map.piaojia}</td>
            
                                    <td width="180">
                放映厅            </td>
            <td><ssm:sql var="mapfangyingting10" type="find">SELECT yingtingmingcheng FROM fangyingting where id=${map.fangyingting}</ssm:sql>${mapfangyingting10.yingtingmingcheng}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                开场时间            </td>
            <td>${map.kaichangshijian}</td>
            
                                    <td width="180">
                散场时间            </td>
            <td>${map.sanchangshijian}</td>
                    </tr>
        <tr>
            
                                    <td width="180">
                剩余票数            </td>
            <td>${map.shengyupiaoshu}</td>
            
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
