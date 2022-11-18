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


<form  action="yingpiaotuidingupdate.do"  method="post" name="form1" id="form1">
    编辑影票退订:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                                <tr>
                    <td width="200">电影编号：</td>
                    <td>
                                                                            ${mmm.dianyingbianhao}<input type="hidden" id="dianyingbianhao" name="dianyingbianhao" value="${mmm.dianyingbianhao}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">分类：</td>
                    <td>
                                                                            <ssm:sql var="mapyingpianfenlei29" type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${mmm.fenlei}</ssm:sql>${mapyingpianfenlei29.fenleimingcheng}<input type="hidden" id="fenlei" name="fenlei" value="${mmm.fenlei}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">电影名称：</td>
                    <td>
                                                                            ${mmm.dianyingmingcheng}<input type="hidden" id="dianyingmingcheng" name="dianyingmingcheng" value="${mmm.dianyingmingcheng}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">票价：</td>
                    <td>
                                                                            ${mmm.piaojia}<input type="hidden" id="piaojia" name="piaojia" value="${mmm.piaojia}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">购买数：</td>
                    <td>
                                                                            ${mmm.goumaishu}<input type="hidden" id="goumaishu" name="goumaishu" value="${mmm.goumaishu}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">小计：</td>
                    <td>
                                                                            ${mmm.xiaoji}<input type="hidden" id="xiaoji" name="xiaoji" value="${mmm.xiaoji}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">购票人：</td>
                    <td>
                                                                            ${mmm.goupiaoren}<input type="hidden" id="goupiaoren" name="goupiaoren" value="${mmm.goupiaoren}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">开场时间：</td>
                    <td>
                                                                            ${mmm.kaichangshijian}<input type="hidden" id="kaichangshijian" name="kaichangshijian" value="${mmm.kaichangshijian}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">退票张数：</td>
                    <td>
                                                                            <input style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="tuipiaozhangshu" name="tuipiaozhangshu" value="${Info.html(mmm.tuipiaozhangshu)}" type="number" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">退款金额：</td>
                    <td>
                                                                            <input style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写退款金额" number="true" data-msg-number="输入一个有效数字" id="tuikuanjine" name="tuikuanjine" value="${Info.html(mmm.tuikuanjine)}" type="number" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">退票原因：</td>
                    <td>
                                                                            <textarea style="width:450px;height:150px" id="tuipiaoyuanyin" name="tuipiaoyuanyin">${Info.html(mmm.tuipiaoyuanyin)}</textarea>                                                                    </td>
                </tr>
                            <tr>
            <td>
                            <input name="id" value="${mmm.id}" type="hidden" />

                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden" />
                <input name="updtself" value="${updtself}" type="hidden" />
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
