<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ page import="com.spring.entity.Pingjiafankui" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>


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
                <div class="form-search">
                    <form name="form1" id="form1" method="get" action="">
                        <select name="sort" id="sort">
                            <option value="desc">倒序</option>
                            <option value="asc">升序</option>
                        </select>
                        <script>$("#orderby").val("${orderBy}");
                        $("#sort").val("${sort}");</script>
                        <input type="submit" class="btn btn-search" name="Submit" value="查找"/>
                    </form>
                </div>

                <style>
                    .pinglun {
                        padding: 10px;
                    }

                    .pinglun .pinglunneirong {
                        padding-bottom: 10px;
                        margin-bottom: 10px;
                        border-bottom: 1px #dedede dashed;
                    }

                    .headerimgurl {
                        float: left;
                        width: 64px;
                    }

                    .pinglun-text {
                        margin-left: 74px;
                    }

                </style>
                <br>
                <div class="pinglun">
                    <c:forEach items="${list}" var="map">
                        <% Pingjiafankui map = (Pingjiafankui) pageContext.getAttribute("map"); %>
                        <% HashMap yonghu = Query.make("zhuceyonghu").where("yonghuming", map.getPingjiaren()).find();%>
                        <div class="pinglunneirong clearfix">
                            <div class="headerimgurl thumbnail">
                                <img src="<%=yonghu.get("touxiang")%>"/>
                            </div>
                            <div class="pinglun-text">
                                @${map.xingming}
                                <p style="margin-top: 10px">${map.neirong}
                                </p>
                                <p>管理员回复：${map.huifuneirong}
                                </p>
                            </div>
                        </div>
                    </c:forEach>
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
