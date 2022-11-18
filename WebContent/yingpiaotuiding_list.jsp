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
    <script src="js/datepicker/WdatePicker.js"></script>


</head>
<body>



<h3 class="route-postion">
    <span class="module-name"> 影票退订</span> <span>列表</span>
</h3>

<div class="form-search">
    <form name="form1" id="formSearch" method="get" action="">
        搜索:
                                                分类：<select data-value="${param.fenlei}" id="fenlei" name="fenlei"   class="class_fenlei17"><option value="">请选择</option><ssm:sql var="select" type="select">SELECT * FROM yingpianfenlei ORDER BY id desc</ssm:sql>
<c:forEach items="${select}" var="m">
<option value="${m.id}">${m.fenleimingcheng}</option>
</c:forEach>
</select>
<script>
$(".class_fenlei17").val($(".class_fenlei17").attr("data-value"))</script>
                                        电影名称：<input type="text" style="" name="dianyingmingcheng" value="${param.dianyingmingcheng}" />                                                                                        开场时间：<input type="text" name="kaichangshijian_start" readonly="readonly" onfocus="WdatePicker({dateFmt:'HH:mm',lang:'zh-cn'})" >-<input type="text" name="kaichangshijian_end" onfocus="WdatePicker({dateFmt:'HH:mm',lang:'zh-cn'})" >                                                
        <select name="order" id="orderby">
            <option value="id">按发布时间</option>
                                <option value="piaojia">
                    按票价                    </option>
                                    <option value="tuikuanjine">
                    按退款金额                    </option>
                        </select>
        <select name="sort" id="sort">
            <option value="desc">倒序</option>
            <option value="asc">升序</option>
        </select>
        <script>$("#orderby").val("${orderBy}");$("#sort").val("${sort}");</script>
        <input type="submit" class="btn btn-search" name="Submit" value="查找" />

        
    </form>
</div>
<form action="yingpiaotuiding_batch.do" method="post" id="form-batch">
    <div class="list-table">
        <table width="100%" border="1" class="table table-list table-bordered table-hover">
            <thead>
            <tr align="center">
                <th width="60" align="center" bgcolor="CCFFFF">序号</th>
                <th> 分类 </th>
<th> 电影名称 </th>
<th> 票价 </th>
<th> 购买数 </th>
<th> 小计 </th>
<th> 购票人 </th>
<th> 开场时间 </th>
<th> 退票张数 </th>
<th> 退款金额 </th>
<th> 退票原因 </th>
                                                <th width="180" align="center" bgcolor="CCFFFF">添加时间</th>
                <th width="120" align="center" bgcolor="CCFFFF">操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${list}" var="map">
            <tr>
                <td width="30" align="center">
                    <label>
                                            <input type="checkbox" name="ids" value="${map.id}" />
                                        ${map.id}
                    </label>
                </td>
                <td> <ssm:sql var="mapyingpianfenlei25" type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${map.fenlei}</ssm:sql>${mapyingpianfenlei25.fenleimingcheng} </td>
<td> ${map.dianyingmingcheng} </td>
<td> ${map.piaojia} </td>
<td> ${map.goumaishu} </td>
<td> ${map.xiaoji} </td>
<td> ${map.goupiaoren} </td>
<td> ${map.kaichangshijian} </td>
<td> ${map.tuipiaozhangshu} </td>
<td> ${map.tuikuanjine} </td>
<td> ${map.tuipiaoyuanyin} </td>
                                                <td align="center">${map.addtime}</td>
                <td align="center">

                                                                            <a href="yingpiaotuiding_detail.do?id=${map.id}">
                                详细
                            </a>
                                                <a href="yingpiaotuiding_updt.do?id=${map.id}">修改</a>
                        <a href="yingpiaotuiding_delete.do?id=${map.id}" onClick="return confirm('真的要删除？')">删除</a>

                    <!--qiatnalijne-->
                </td>
            </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
        <div class="" style="margin-top: 10px;">
                    <label><input type="checkbox" value="1" onclick="$('.list-table input[name=ids]').prop('checked' , this.checked)" /> 全选/全不选</label>
            <input type="submit" name="delete" onclick="return confirm('确定批量删除该内容？')" value="批量删除" />
            </div>
</form>
    ${ page.info }

            <p>
            <%
            HashMap total = Query.make("yingpiaotuiding").field("(sum(xiaoji)) sum_xiaoji").where((String)request.getAttribute("where")).find();
            request.setAttribute("total" , total);
            %>
                            小计总和: ${total.sum_xiaoji} 　　
                    </p>
        

</body>
</html>
