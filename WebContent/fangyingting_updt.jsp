<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>放映厅</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>


<form  action="fangyingtingupdate.do"  method="post" name="form1" id="form1">
    编辑放映厅:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                                <tr>
                    <td width="200">影厅编号：</td>
                    <td>
                                                                            <input style="width:150px;" readonly="readonly" id="yingtingbianhao" name="yingtingbianhao" value="${Info.html(mmm.yingtingbianhao)}" type="text" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">影厅名称：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写影厅名称" id="yingtingmingcheng" name="yingtingmingcheng" value="${Info.html(mmm.yingtingmingcheng)}" type="text" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">几排：</td>
                    <td>
                                                                            <input style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="jipai" name="jipai" value="${Info.html(mmm.jipai)}" type="number" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">几列：</td>
                    <td>
                                                                            <input style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="jilie" name="jilie" value="${Info.html(mmm.jilie)}" type="number" />                                                                    </td>
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
