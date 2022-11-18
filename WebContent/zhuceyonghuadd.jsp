<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<script src="js/jquery.validate.js"></script>



<!--- latest-posts --->
<div id="blog" class="latest-posts">
    <!--- container --->
    <div class="container">
        <div class="latest-posts-text wow bounceIn" data-wow-delay="0.4s">
            <h2>注册用户</h2>
            <p>Zhuceyonghu</p>
        </div>
        <div class="latest-posts-grids wow bounceIn" data-wow-delay="0.4s">
            <div class="clearfix">
                
<form  action="zhuceyonghuinsert.do"  method="post" name="form1" id="form1">
    添加注册用户:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                                <tr>
                    <td width="200">用户名：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写用户名" remote="checkno.do?checktype=insert&table=zhuceyonghu&col=yonghuming" data-msg-remote="内容重复了" id="yonghuming" name="yonghuming" value="" type="text" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">密码：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写密码" id="mima" name="mima" value="" type="password" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">姓名：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写姓名" id="xingming" name="xingming" value="" type="text" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">性别：</td>
                    <td>
                                                                            <select data-value="" id="xingbie" name="xingbie"   class="class_xingbie4"><option value="男">男</option>
<option value="女">女</option>
</select>                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">手机号：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-phone="true" data-msg-phone="请输入正确手机号码" id="shoujihao" name="shoujihao" value="" type="text" />                                                                    </td>
                </tr>
                                                            <tr>
                    <td width="200">头像：</td>
                    <td>
                                                                            <input type="text" id="touxiang" name="touxiang" value="" />
<input type="button" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=touxiang'})" value="上传" />                                                                    </td>
                </tr>
                            <tr>
            <td>
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

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!--- container --->
</div>

<!--- latest-posts --->
<%@ include file="footer.jsp" %>