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
    <script src="js/datepicker/WdatePicker.js"></script>


</head>
<body>


<form  action="dianyingchangciinsert.do"  method="post" name="form1" id="form1">
    添加电影场次:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                                <tr>
                    <td width="200">电影编号：</td>
                    <td>
                                                                            ${readMap.dianyingbianhao}<input type="hidden" id="dianyingbianhao" name="dianyingbianhao" value="${readMap.dianyingbianhao}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">分类：</td>
                    <td>
                                                                            <ssm:sql var="mapyingpianfenlei13" type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${readMap.fenlei}</ssm:sql>${mapyingpianfenlei13.fenleimingcheng}<input type="hidden" id="fenlei" name="fenlei" value="${readMap.fenlei}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">电影名称：</td>
                    <td>
                                                                            ${readMap.dianyingmingcheng}<input type="hidden" id="dianyingmingcheng" name="dianyingmingcheng" value="${readMap.dianyingmingcheng}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">电影海报：</td>
                    <td>
                                                                            <c:choose>
<c:when test="${'' == readMap.dianyinghaibao }">
-</c:when><c:otherwise><img width="100" src="${Info.images(readMap.dianyinghaibao)}" /></c:otherwise></c:choose><input type="hidden" id="dianyinghaibao" name="dianyinghaibao" value="${readMap.dianyinghaibao}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">票价：</td>
                    <td>
                                                                            ${readMap.piaojia}<input type="hidden" id="piaojia" name="piaojia" value="${readMap.piaojia}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">放映厅：</td>
                    <td>
                                                                            <select data-value="" id="fangyingting" name="fangyingting"   class="class_fangyingting13"><ssm:sql var="select" type="select">SELECT * FROM fangyingting ORDER BY id desc</ssm:sql>
<c:forEach items="${select}" var="m">
<option value="${m.id}">${m.yingtingmingcheng}</option>
</c:forEach>
</select>                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">开场时间：</td>
                    <td>
                                                                            <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" style="width:px;" id="kaichangshijian" name="kaichangshijian" readonly="readonly" value="" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">散场时间：</td>
                    <td>
                                                                            <input type="text" onfocus="WdatePicker({dateFmt:'HH:mm',lang:'zh-cn'})" style="width:px;" id="sanchangshijian" name="sanchangshijian" readonly="readonly" value="" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">剩余票数：</td>
                    <td>
                                                                            <input style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="shengyupiaoshu" name="shengyupiaoshu" value="" type="number" />                                                                    </td>
                </tr>
                            <tr>
            <td>
                                        <input type="hidden" name="dianyingxinxiid" value="${param.id}" />
                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden" />
                        &nbsp;</td>
            <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
                <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
        </tr>
    </table>
</form>



<script>
    $(function () {
        $('#form1').validate();
    })

</script>


</body>
</html>
