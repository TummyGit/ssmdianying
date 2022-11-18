<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="header.jsp" %>


<!---content-recent-works ---->
<div id="portfolio" class="recent-works-text">
    <!--- container --->
    <div class="container">
        <div class="portfolio-text wow bounceIn" data-wow-delay="0.4s">
            <h2>最新上映</h2>
            <p>
                Product
            </p>
        </div>
        <% ArrayList<HashMap> shangpinList = Query.make("dianyingxinxi").order("id desc").limit(6).select();
            request.setAttribute("shangpinList", shangpinList);
        %>
        <!--<ul id="filters" class="clearfix wow bounceIn" data-wow-delay="0.4s">
            <li><span class="filter active" data-filter="app card icon logo web">全部</span></li>
            <li><span class="filter" data-filter="app">WEB</span></li>
            <li><span class="filter" data-filter="card">MOBILE</span></li>
            <li><span class="filter" data-filter="icon">DESIGN</span></li>
            <li><span class="filter" data-filter="logo">PHOTOGRAPHY</span></li>
        </ul>-->


        <div id="portfoliolist">
            <c:forEach items="${shangpinList}" var="t">
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
        <!---- Script for gallery Here --->

        <!--- Gallery Script Ends --->
        <div class="clearfix"></div>
    </div>
</div>

<!----- script-for-caption----->

<!---content-recent-works ---->


<!--- our-team --->
<div class="our-team">
    <!--- container --->
    <div class="container">
        <div class="our-team-grids">
            <div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
                <div class="our-team-left-grid">
                    <h2>热映推荐</h2>
                    <p>我们一直在做不一样的电影
                    </p>
                    <a href="dianyingxinxilist.do">更多</a>
                </div>
            </div>
            <div class="col-md-9">
                <% ArrayList<HashMap> tuijianList = Query.make("dianyingxinxi").where("shifoureying","是").order("id desc").limit(3).select();
                    request.setAttribute("tuijianList", tuijianList);
                %>
                <c:forEach items="${tuijianList}" var="t">
                    <div class="col-md-4 wow bounceIn" data-wow-delay="0.4s">
                        <div class="grid-right-left">
                            <div class="img-box pb70">
                                <div class="img" style="background-image: url('${Info.images(t.dianyinghaibao)}')"></div>
                            </div>
                            <h4><a href="dianyingxinxidetail.do?id=${t.id}"
                                   style="font-size: 14px">${t.dianyingmingcheng}</a></h4>
                            <p>${t.piaojia}</p>
                            <p><a href="dianyingxinxidetail.do?id=${t.id}" class="btn btn-danger">查看详情</a></p>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!--- container --->
</div>

<!--- our-team --->

<!--- latest-posts --->


<!--- latest-posts --->

<%@ include file="footer.jsp" %>
