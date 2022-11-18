<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>


<!--- latest-posts --->
<div id="blog" class="latest-posts">
    <!--- container --->
    <div class="container">
        <div class="latest-posts-text wow bounceIn" data-wow-delay="0.4s">
            <h2>电影信息</h2>
            <p>Dianyingxinxi</p>
        </div>
        <div class="latest-posts-grids wow bounceIn" data-wow-delay="0.4s">
            <div class="clearfix">

                <div class="form-search">
                    <form name="form1" id="form1" method="get" action="">
                        分类：<select data-value="${param.fenlei}" id="fenlei" name="fenlei" class="class_fenlei6">
                        <option value="">请选择</option>
                        <ssm:sql var="select" type="select">SELECT * FROM yingpianfenlei ORDER BY id desc</ssm:sql>
                        <c:forEach items="${select}" var="m">
                            <option value="${m.id}">${m.fenleimingcheng}</option>
                        </c:forEach>
                    </select>
                        <script>
                            $(".class_fenlei6").val($(".class_fenlei6").attr("data-value"))</script>
                        电影名称：<input type="text" style="" name="dianyingmingcheng" value="${param.dianyingmingcheng}"/>
                        <input type="submit" class="btn btn-search" name="Submit" value="查找"/>
                    </form>
                </div>
                <br>
                <div id="portfoliolist">
                    <c:forEach items="${list}" var="t">
                        <div class="portfolio app mix_all" data-cat="app" style="display: inline-block; opacity: 1;">
                            <div class="portfolio-wrapper wow bounceIn" data-wow-delay="0.4s">
                                <a href="dianyingxinxidetail.do?id=${t.id}"
                                   class="b-link-stripe b-animate-go  thickbox play-icon popup-with-zoom-anim">
                                    <div class="img-box pb66">
                                        <div class="img" style="background-image: url(${Info.images(t.dianyinghaibao)})"></div>
                                    </div>
                                    <div class="b-wrapper">
                                        <h3 class="b-animate b-from-left b-delay03 ">${t.dianyingmingcheng}</h3>
                                        <p class="b-animate b-from-left b-delay03 ">
                                            ￥${t.piaojia}
                                            <br><br>
                                            <button class="btn btn-primary">查看详情</button>
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="clearfix"></div>
                </div>

                ${ page.info }

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!--- container --->
</div>

<!--- latest-posts --->
<%@ include file="footer.jsp" %>
