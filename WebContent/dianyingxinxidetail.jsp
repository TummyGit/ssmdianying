<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>

<link rel="stylesheet" href="css/pictureViewer.css">
<script src="js/jquery.mousewheel.min.js"></script>
<script src="js/pictureViewer.js"></script>


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

                <style>
                    .neirong {
                        margin-bottom: 20px;
                        vertical-align: middle;
                    }

                    .neirong.Image {
                        float: right;
                    }

                    .button {
                        padding: 8px 15px;
                    }
                </style>
                <style>
                    .detail-thumb {
                        width: 400px;
                        float: left;
                    }

                    .detail-text-content {
                        margin-left: 420px;
                    }

                    @media (max-width: 768px) {
                        .detail-thumb {
                            width: 100%;
                            float: none;
                        }

                        .detail-text-content {
                            margin-left: 0px;
                        }
                    }
                </style>

                <div class="clearfix">
                    <p><ssm:sql var="mapyingpianfenlei4"
                                type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${map.fenlei}</ssm:sql>
                        ${mapyingpianfenlei4.fenleimingcheng} </p>
                    <div class="clearfix">
                        <div class="detail-thumb">
                            <div class="img-box pb100">
                                <div class="img"
                                     style="background-image: url('${Info.images(map.dianyinghaibao)}')"></div>
                            </div>
                        </div>
                        <div class="detail-text-content">
                            <h2 class="neirong LongText">
                                ${map.dianyingmingcheng} </h2>

                            <div class="neirong Text">
                                电影编号：
                                ${map.dianyingbianhao}            </div>
                            <div class="neirong Text">
                                导演：
                                ${map.daoyan}            </div>
                            <div class="neirong Spec">
                                主演：
                                ${map.zhuyan}            </div>
                            <div class="neirong Date">
                                上映时间：
                                ${map.shangyingshijian}            </div>
                            <div class="neirong Money">
                                票价：
                                ${map.piaojia}            </div>
                            <div class="neirong Text">
                                时长：
                                ${map.shichang}            </div>

                        </div>
                        <div style="clear: both;height: 30px"></div>
                        <div class="neirong Images">
                            <fieldset class="images_box">
                                <div id="gellay_images" class="imagesList">
                                    <script>
                                        var images = "${map.dianyinghaibao}".split(',');
                                        for (var i = 0; i < images.length; i++) {
                                            var image = images[i];
                                            var uploadImage = '<div class="uploadImage">' +
                                                '<span class="thumb thumbnail"><img src="' + image + '"/></span>' +
                                                '</div>';
                                            document.writeln(uploadImage);
                                        }

                                    </script>
                                </div>
                            </fieldset>
                        </div>
                        <script>
                            $(function () {
                                $('.imagesList').on('click', '.uploadImage', function () {
                                    var this_ = $(this);
                                    var images = this_.parents('.imagesList').find('.uploadImage');
                                    console.log(images);
                                    var imagesArr = new Array();

                                    $.each(images, function (i, image) {
                                        imagesArr.push($(image).find('img').attr('src'));
                                    });
                                    $.pictureViewer({
                                        images: imagesArr, //需要查看的图片，数据类型为数组
                                        initImageIndex: this_.index() + 1, //初始查看第几张图片，默认1
                                        scrollSwitch: true //是否使用鼠标滚轮切换图片，默认false
                                    });
                                });
                            });
                        </script>
                        <div class="editor-detail">
                            ${map.jianjie}
                        </div>
                    </div>
                </div>
            </div>
            <style>
                .news-item {
                    border-bottom: 1px solid #dedede;
                    overflow: hidden;
                    margin-bottom: 10px;
                    padding-bottom: 10px;
                }

                .thumb {
                    float: left;
                    width: 150px;
                    display: inline;
                }

                .news-item .text {
                    padding-left: 180px;
                    width: auto;
                    border: none;
                }

                .news-item h3 {
                    font-weight: 700;
                    font-size: 16px;
                }

                .news-item .desc {
                    font-size: 12px;
                    margin-top: 10px;
                    color: #969696;
                }

                .news-item .times {
                    margin-top: 10px;
                    color: #969696;
                }

                .news-item .times span {
                    font-size: 14px;
                    display: inline-block;
                    margin-right: 15px;
                }

            </style>
            <% ArrayList<HashMap> changci = Query.make("dianyingchangci").where("dianyingxinxiid", Info.jstl("map.id")).order("id desc").select();
                request.setAttribute("changci", changci);
            %>

            <c:forEach items="${changci}" var="t">
                <div class="news-item clearfix">

                    <h3>
                        <a href="goupiaoadd.do?id=${t.id}">
                            <ssm:sql var="mapfangyingting6"
                                     type="find">SELECT yingtingmingcheng FROM fangyingting where id=${t.fangyingting}</ssm:sql>
                                ${mapfangyingting6.yingtingmingcheng}
                        </a>
                    </h3>
                    <div class="desc">
                        开映时间：${t.kaichangshijian}
                    </div>

                </div>

            </c:forEach>

            <br>


            <div class="button-list">
                <div class="">
                    <button onclick="history.go(-1);" class="btn btn-default">返回</button>
                    <button class="btn btn-default"
                            onclick="location.href='collect.do?id=${map.id}&biao=dianyingxinxi&ziduan=dianyingmingcheng'">
                        收藏
                    </button>
                </div>
            </div>

        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--- container --->
</div>

<!--- latest-posts --->
<%@ include file="footer.jsp" %>
