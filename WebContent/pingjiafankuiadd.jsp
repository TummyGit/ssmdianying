<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<script src="js/jquery.validate.js"></script>



<!--- latest-posts --->
<div id="blog" class="latest-posts">
    <!--- container --->
    <div class="container">
        <div class="latest-posts-text wow bounceIn" data-wow-delay="0.4s">
            <h2>评价反馈</h2>
            <p>Pingjiafankui</p>
        </div>
        <div class="latest-posts-grids wow bounceIn" data-wow-delay="0.4s">
            <div class="clearfix">
                
<form  action="pingjiafankuiinsert.do"  method="post" name="form1" id="form1">
    添加评价反馈:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                                <tr>
                    <td width="200">姓名：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写姓名" id="xingming" name="xingming" value="" type="text" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">联系电话：</td>
                    <td>
                                                                            <input style="width:150px;" data-rule-required="true" data-msg-required="请填写联系电话" id="lianxidianhua" name="lianxidianhua" value="" type="text" />                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">内容：</td>
                    <td>
                                                                            <textarea style="width:450px;height:150px" data-rule-required="true" data-msg-required="请填写内容" id="neirong" name="neirong"></textarea>                                                                            <span style="color: red;">*</span>
                                            </td>
                </tr>
                                                            <tr>
                    <td width="200">评价人：</td>
                    <td>
                                                                            <input style="width:150px;" readonly="readonly" id="pingjiaren" name="pingjiaren" value="${sessionScope.username}" type="text" />                                                                    </td>
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
