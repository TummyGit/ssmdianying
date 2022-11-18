<%@ page language="java" import="dao.CommDAO" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="java.util.HashMap"%>
<html>
<head>
  <title>留言板</title>
    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script>
        function checkform() {
            var val = $.trim($("#huifuneirong").val());
            if(val == ""){
                alert("请填写回复内容");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
  <form action="./hfSave.do?id=${mmm.id}"  method="post" name="f1"  onsubmit="return checkform();">
  回复留言:
  <br>
  <br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"><tr>
     <td>回复内容：</td><td><textarea name="huifu" cols="50" rows="5" id="huifuneirong">${mmm.huifu}</textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

