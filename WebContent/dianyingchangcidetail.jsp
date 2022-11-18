<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>



<!--- latest-posts --->
<div id="blog" class="latest-posts">
    <!--- container --->
    <div class="container">
        <div class="latest-posts-text wow bounceIn" data-wow-delay="0.4s">
            <h2>电影场次</h2>
            <p>Dianyingchangci</p>
        </div>
        <div class="latest-posts-grids wow bounceIn" data-wow-delay="0.4s">
            <div class="clearfix">
                
<style>
    .neirong{
        margin-bottom: 20px;
        vertical-align: middle;
    }
    .neirong.Image{
        float: right;
    }
    .button{
        padding: 8px 15px;
    }
</style>



<div class="clearfix">
    <p>电影场次详情：</p>
    <div class="clearfix">
        
            <div class="neirong Text">
                电影编号：
                ${map.dianyingbianhao}            </div>

        
            <div class="neirong Select">
                分类：
                <ssm:sql var="mapyingpianfenlei11" type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${map.fenlei}</ssm:sql>${mapyingpianfenlei11.fenleimingcheng}            </div>

        
            <div class="neirong LongText">
                电影名称：
                ${map.dianyingmingcheng}            </div>

        
            <div class="neirong Images">
                电影海报：
                <fieldset class="images_box"><div id="gellay_images" class="imagesList"><script>
            var images = "${map.dianyinghaibao}".split(',');
            for(var i=0;i<images.length;i++){
                var image = images[i];
                var uploadImage = '<div class="uploadImage">' +
                '<span class="thumb thumbnail"><img src="'+image+'"/></span>'+
                '</div>';
                document.writeln(uploadImage);
            }
            
</script></div></fieldset>            </div>

        
            <div class="neirong Money">
                票价：
                ${map.piaojia}            </div>

        
            <div class="neirong Select">
                放映厅：
                <ssm:sql var="mapfangyingting12" type="find">SELECT yingtingmingcheng FROM fangyingting where id=${map.fangyingting}</ssm:sql>${mapfangyingting12.yingtingmingcheng}            </div>

        
            <div class="neirong DateTime">
                开场时间：
                ${map.kaichangshijian}            </div>

        
            <div class="neirong Time">
                散场时间：
                ${map.sanchangshijian}            </div>

        
            <div class="neirong Number">
                剩余票数：
                ${map.shengyupiaoshu}            </div>

                
    </div>
</div>


<div class="button-list">
    <div class="">
        <button onclick="history.go(-1);" class="btn btn-default">返回</button>
        <button onclick="window.print()" class="btn btn-default">打印本页</button>
                
        <a class="btn btn-success" href="goupiaoadd.do?id=${map.id}">添加</a>
    </div>
</div>

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!--- container --->
</div>

<!--- latest-posts --->
<%@ include file="footer.jsp" %>
