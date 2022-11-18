<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
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
    

</head>
<body>


<form  action="goupiaoinsert.do"  method="post" name="form1" id="form1">
    添加购票:
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
                                                                            <ssm:sql var="mapyingpianfenlei19" type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${readMap.fenlei}</ssm:sql>${mapyingpianfenlei19.fenleimingcheng}<input type="hidden" id="fenlei" name="fenlei" value="${readMap.fenlei}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">电影名称：</td>
                    <td>
                                                                            ${readMap.dianyingmingcheng}<input type="hidden" id="dianyingmingcheng" name="dianyingmingcheng" value="${readMap.dianyingmingcheng}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">票价：</td>
                    <td>
                                                                            ${readMap.piaojia}<input type="hidden" id="piaojia" name="piaojia" value="${readMap.piaojia}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">放映厅：</td>
                    <td>
                                                                            <ssm:sql var="mapfangyingting20" type="find">SELECT yingtingmingcheng FROM fangyingting where id=${readMap.fangyingting}</ssm:sql>${mapfangyingting20.yingtingmingcheng}<input type="hidden" id="fangyingting" name="fangyingting" value="${readMap.fangyingting}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">开场时间：</td>
                    <td>
                                                                            ${readMap.kaichangshijian}<input type="hidden" id="kaichangshijian" name="kaichangshijian" value="${readMap.kaichangshijian}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">散场时间：</td>
                    <td>
                                                                            ${readMap.sanchangshijian}<input type="hidden" id="sanchangshijian" name="sanchangshijian" value="${readMap.sanchangshijian}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">购买数：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写购买数" number="true" data-msg-number="输入一个有效数字" id="goumaishu" name="goumaishu" value="" type="number" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">选座：</td>
                    <td>
                                                                            <input style="width:150px;" id="xuanzuo" name="xuanzuo" value="" type="text" />                                                                    </td>
                </tr>
                                                                                            <tr>
                    <td width="200">购票人：</td>
                    <td>
                                                                            <input style="width:150px;" readonly="readonly" id="goupiaoren" name="goupiaoren" value="${sessionScope.username}" type="text" />                                                                    </td>
                </tr>
                                        <tr>
            <td>
                                        <input type="hidden" name="dianyingchangciid" value="${param.id}" />
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
