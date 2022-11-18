<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>电影信息</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    <link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>
<link href="js/tags/tags.css" rel="stylesheet">
<script src="js/tags/tags.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>


</head>
<body>


<form  action="dianyingxinxiupdate.do"  method="post" name="form1" id="form1">
    编辑电影信息:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                                <tr>
                    <td width="200">电影编号：</td>
                    <td>
                                                                            <input style="width:150px;" readonly="readonly" id="dianyingbianhao" name="dianyingbianhao" value="${Info.html(mmm.dianyingbianhao)}" type="text" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">分类：</td>
                    <td>
                                                                            <select data-value="${Info.html(mmm.fenlei)}" id="fenlei" name="fenlei"   class="class_fenlei9"><ssm:sql var="select" type="select">SELECT * FROM yingpianfenlei ORDER BY id desc</ssm:sql>
<c:forEach items="${select}" var="m">
<option value="${m.id}">${m.fenleimingcheng}</option>
</c:forEach>
</select>
<script>
$(".class_fenlei9").val($(".class_fenlei9").attr("data-value"))</script>
                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">电影海报：</td>
                    <td>
                                                                            <input type="hidden" id="dianyinghaibao" name="dianyinghaibao" value="${Info.html(mmm.dianyinghaibao)}" />
        <script>showUploadImages("#dianyinghaibao")</script>
                                                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">电影名称：</td>
                    <td>
                                                                            <input style="width:250px;" id="dianyingmingcheng" name="dianyingmingcheng" value="${Info.html(mmm.dianyingmingcheng)}" type="text" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">导演：</td>
                    <td>
                                                                            <input style="width:150px;" id="daoyan" name="daoyan" value="${Info.html(mmm.daoyan)}" type="text" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">主演：</td>
                    <td>
                                                                            <input id="zhuyan" name="zhuyan" value="${Info.html(mmm.zhuyan)}" type="text" /><script>$(function() {
          $("#zhuyan").tagInput();
        })</script>                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">上映时间：</td>
                    <td>
                                                                            <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" style="width:px;" id="shangyingshijian" name="shangyingshijian" readonly="readonly" value="${Info.html(mmm.shangyingshijian)}" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">是否热映：</td>
                    <td>
                                                                            <select data-value="${Info.html(mmm.shifoureying)}" id="shifoureying" name="shifoureying"   class="class_shifoureying10"><option value="否">否</option>
<option value="是">是</option>
</select>
<script>
$(".class_shifoureying10").val($(".class_shifoureying10").attr("data-value"))</script>
                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">票价：</td>
                    <td>
                                                                            <input style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写票价" number="true" data-msg-number="输入一个有效数字" id="piaojia" name="piaojia" value="${Info.html(mmm.piaojia)}" type="number" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">时长：</td>
                    <td>
                                                                            <input style="width:150px;" id="shichang" name="shichang" value="${Info.html(mmm.shichang)}" type="text" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">简介：</td>
                    <td>
                                                                            <textarea id="jianjie" name="jianjie" style="max-width: 750px;width:100%; height: 300px;">${Info.html(mmm.jianjie)}</textarea><script>
            (function(){
                var um = UM.getEditor('jianjie');
            })();
            </script>                                                                    </td>
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
