<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--- footer ---->
<div class="footer">
    <!--- container --->
    <div class="container">

        <div class="footer-right">
            <ul>
                <li><a href="#"><span> </span></a></li>
                <li><a href="#"><span class="twitter"> </span></a></li>
                <li><a href="#"><span class="in"> </span></a></li>
            </ul>
        </div>

        <div class="clearfix"></div>
        <div class="copy-right">
            <% ArrayList<HashMap> youqinglianjieList = Query.make("youqinglianjie").order("id desc").select();
                request.setAttribute("youqinglianjieList", youqinglianjieList);
            %>
            <p>友情链接&nbsp;
                <c:forEach items="${youqinglianjieList}" var="t">
                    | &nbsp; <a href="${t.wangzhi}" target="_blank"
                                style="color: #FFFFFF;">${t.wangzhanmingcheng}</a> &nbsp;
                </c:forEach>
            </p>
            <p>Copyright &copy; 影院票务系统.
            </p>
        </div>
    </div>
    <!--- container --->
</div>

<!--- footer ---->
<!---smoth-scrlling---->
<script type="text/javascript">
    $(document).ready(function () {
        $('a[href^="#"]').on('click', function (e) {
            e.preventDefault();
            var target = this.hash,
                $target = $(target);
            $('html, body').stop().animate({
                'scrollTop': $target.offset().top
            }, 1000, 'swing', function () {
                window.location.hash = target;
            });
        });
    });
</script>

<!---//smoth-scrlling---->
<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>


</body>
</html>