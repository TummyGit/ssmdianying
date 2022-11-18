<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ page import="com.spring.entity.Yingpiaotuiding" %>
<%@ page import="com.spring.entity.Goupiao" %>
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


<form action="yingpiaotuidinginsert.do" method="post" name="form1" id="form1">
    添加影票退订:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1"
           bordercolor="#00FFFF" style="border-collapse:collapse">
        <tr>
            <td width="200">电影编号：</td>
            <td>
                ${readMap.dianyingbianhao}<input type="hidden" id="dianyingbianhao" name="dianyingbianhao"
                                                 value="${readMap.dianyingbianhao}"/></td>
        </tr>
        <tr>
            <td width="200">分类：</td>
            <td>
                <ssm:sql var="mapyingpianfenlei28"
                         type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${readMap.fenlei}</ssm:sql>
                ${mapyingpianfenlei28.fenleimingcheng}<input type="hidden" id="fenlei" name="fenlei"
                                                             value="${readMap.fenlei}"/></td>
        </tr>
        <tr>
            <td width="200">电影名称：</td>
            <td>
                ${readMap.dianyingmingcheng}<input type="hidden" id="dianyingmingcheng" name="dianyingmingcheng"
                                                   value="${readMap.dianyingmingcheng}"/></td>
        </tr>
        <tr>
            <td width="200">票价：</td>
            <td>
                ${readMap.piaojia}<input type="hidden" id="piaojia" name="piaojia" value="${readMap.piaojia}"/></td>
        </tr>
        <tr>
            <td width="200">购买数：</td>
            <td>
                ${readMap.goumaishu}<input type="hidden" id="goumaishu" name="goumaishu" value="${readMap.goumaishu}"/>
            </td>
        </tr>
        <tr>
            <td width="200">小计：</td>
            <td>
                ${readMap.xiaoji}<input type="hidden" id="xiaoji" name="xiaoji" value="${readMap.xiaoji}"/></td>
        </tr>
        <tr>
            <td width="200">购票人：</td>
            <td>
                ${readMap.goupiaoren}<input type="hidden" id="goupiaoren" name="goupiaoren"
                                            value="${readMap.goupiaoren}"/></td>
        </tr>
        <tr>
            <td width="200">开场时间：</td>
            <td>
                ${readMap.kaichangshijian}<input type="hidden" id="kaichangshijian" name="kaichangshijian"
                                                 value="${readMap.kaichangshijian}"/></td>
        </tr>
        <tr>
            <td width="200">退票张数：</td>
            <td>
                <input style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="tuipiaozhangshu" min="1" max="${readMap.goumaishu}"
                       name="tuipiaozhangshu" onkeyup="updatePrice()" value="" type="number"/></td>
        </tr>
        <tr>
            <td width="200">退款金额：</td>
            <td>
                <script>
                    function updatePrice() {
                        var piaojia = Math.floor($('#piaojia').val());    // 票价
                        var number = Math.floor($('#tuipiaozhangshu').val());  // 退票张数
                        $('#tuikuanjine').val(Math.floor(piaojia*number * 0.9));
                    }
                </script>

                <input style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写退款金额" readonly
                       number="true" data-msg-number="输入一个有效数字" id="tuikuanjine" name="tuikuanjine" value=""
                       type="number"/> <span style="color: red;">*</span>
            </td>
        </tr>
        <tr>
            <td width="200">退票原因：</td>
            <td>
                <textarea style="width:450px;height:150px" id="tuipiaoyuanyin" name="tuipiaoyuanyin"></textarea></td>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="goupiaoid" value="${param.id}"/>
                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                &nbsp;
            </td>
            <td><input type="submit" name="Submit" value="提交" style='border:solid 1px #000000; color:#666666'/>
                <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666'/></td>
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
