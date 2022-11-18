<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册用户</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    <link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>


</head>
<body>


<form  action="zhuceyonghuupdate.do"  method="post" name="form1" id="form1">
    编辑注册用户:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                                <tr>
                    <td width="200">用户名：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写用户名" remote="checkno.do?checktype=update&id=${mmm.id}&table=zhuceyonghu&col=yonghuming" data-msg-remote="内容重复了" id="yonghuming" name="yonghuming" value="${Info.html(mmm.yonghuming)}" type="text" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                                        <tr>
                    <td width="200">姓名：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写姓名" id="xingming" name="xingming" value="${Info.html(mmm.xingming)}" type="text" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">性别：</td>
                    <td>
                                                                            <select data-value="${Info.html(mmm.xingbie)}" id="xingbie" name="xingbie"   class="class_xingbie3"><option value="男">男</option>
<option value="女">女</option>
</select>
<script>
$(".class_xingbie3").val($(".class_xingbie3").attr("data-value"))</script>
                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">手机号：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-phone="true" data-msg-phone="请输入正确手机号码" id="shoujihao" name="shoujihao" value="${Info.html(mmm.shoujihao)}" type="text" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">头像：</td>
                    <td>
                                                                            <input type="text" id="touxiang" name="touxiang" value="${Info.html(mmm.touxiang)}" />
<input type="button" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=touxiang'})" value="上传" />                                                                    </td>
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
