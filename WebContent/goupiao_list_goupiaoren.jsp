<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购票</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/datepicker/WdatePicker.js"></script>


</head>
<body>


<h3 class="route-postion">
    <span class="module-name"> 购票</span> <span>列表</span>
</h3>


<form action="goupiao_batch.do" method="post" id="form-batch">
    <div class="list-table">
        <table width="100%" border="1" class="table table-list table-bordered table-hover">
            <thead>
            <tr align="center">
                <th width="60" align="center" bgcolor="CCFFFF">序号</th>
                <th> 分类</th>
                <th> 电影名称</th>
                <th> 票价</th>
                <th> 放映厅</th>
                <th> 开场时间</th>
                <th> 散场时间</th>
                <th> 购买数</th>
                <th> 选座</th>
                <th> 小计</th>
                <th> 购票人</th>
                <th> 订票状态</th>
                <th width="80">是否支付</th>
                <th width="180" align="center" bgcolor="CCFFFF">添加时间</th>
                <th width="120" align="center" bgcolor="CCFFFF">操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${list}" var="map">
                <tr>
                    <td width="30" align="center">
                        <label>
                            <input type="checkbox" name="ids" value="${map.id}"/>
                                ${map.id}
                        </label>
                    </td>
                    <td><ssm:sql var="mapyingpianfenlei17"
                                 type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${map.fenlei}</ssm:sql>${mapyingpianfenlei17.fenleimingcheng} </td>
                    <td> ${map.dianyingmingcheng} </td>
                    <td> ${map.piaojia} </td>
                    <td><ssm:sql var="mapfangyingting18"
                                 type="find">SELECT yingtingmingcheng FROM fangyingting where id=${map.fangyingting}</ssm:sql>${mapfangyingting18.yingtingmingcheng} </td>
                    <td> ${map.kaichangshijian} </td>
                    <td> ${map.sanchangshijian} </td>
                    <td> ${map.goumaishu} </td>
                    <td> ${map.xuanzuo} </td>
                    <td> ${map.xiaoji} </td>
                    <td> ${map.goupiaoren} </td>
                    <td> ${map.dingpiaozhuangtai} </td>
                    <td>
                            ${map.iszf} <c:choose>
                        <c:when test="${'否' == map.iszf }">
                            <a href="zhifu/index.jsp?id=${map.id}&biao=goupiao">
                                去支付
                            </a>
                        </c:when></c:choose></td>
                    <td align="center">${map.addtime}</td>
                    <td align="center">
                        <c:choose><c:when test="${map.dingpiaozhuangtai =='已出票'}">
                            <a href="yingpiaotuiding_add.do?id=${map.id}">退票</a>
                        </c:when></c:choose>
                        <a href="goupiao_delete.do?id=${map.id}" onClick="return confirm('真的要删除？')">删除</a>

                        <!--qiatnalijne-->
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="" style="margin-top: 10px;">
        <label><input type="checkbox" value="1"
                      onclick="$('.list-table input[name=ids]').prop('checked' , this.checked)"/> 全选/全不选</label>
        <input type="submit" name="delete" onclick="return confirm('确定批量删除该内容？')" value="批量删除"/>
    </div>
</form>
${ page.info }

<p>
    <%
        HashMap total = Query.make("goupiao").field("(sum(xiaoji)) sum_xiaoji").where((String) request.getAttribute("where")).find();
        request.setAttribute("total", total);
    %>
    小计总和: ${total.sum_xiaoji} 　　
</p>


</body>
</html>
