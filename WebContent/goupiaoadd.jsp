<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="util.StringUtil" %>
<%@ page import="com.spring.entity.Dianyingchangci" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<script src="js/jquery.validate.js"></script>


<style type="text/css">
    .demo {
        width: 750px;
        margin: 40px auto 0 auto;
        min-height: 450px;
    }

    @media screen and (max-width: 360px) {
        .demo {
            width: 340px
        }
    }

    .front {
        width: 190px;
        margin: 5px 32px 45px 80px;
        background-color: #f0f0f0;
        color: #666;
        text-align: center;
        padding: 3px;
        border-radius: 5px;
    }

    .booking-details {
        float: right;
        position: relative;
        width: 350px;
        height: 450px;
    }

    .booking-details h3 {
        margin: 5px 5px 0 0;
        font-size: 16px;
    }

    .booking-details p {
        line-height: 26px;
        font-size: 16px;
        color: #999
    }

    .booking-details p span {
        color: #666
    }

    div.seatCharts-cell {

        color: #182C4E;
        height: 25px;
        width: 25px;
        line-height: 25px;
        margin: 3px;
        float: left;
        text-align: center;
        outline: none;
        font-size: 13px;
    }

    div.seatCharts-seat {
        color: #fff;
        cursor: pointer;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
    }

    div.seatCharts-row {
        height: 35px;
    }

    div.seatCharts-seat.available {
        background-color: #a7de52;
    }

    div.seatCharts-seat.available.economy-class {
        background-color: #daa134
    }

    div.seatCharts-seat.focused {
        background-color: #76B474;
        border: none;
    }

    div.seatCharts-seat.selected {
        background-color: #19ae12;
    }

    div.seatCharts-seat.unavailable {
        background-color: #ae2422;
        cursor: not-allowed;
    }


    div.seatCharts-container {
        border-right: 1px dotted #adadad;
        width: 480px;
        padding: 20px;
        float: left;
    }

    div.seatCharts-legend {
        padding-left: 0px;
        position: absolute;
        bottom: 16px;
    }

    ul.seatCharts-legendList {
        padding-left: 0px;
    }

    .seatCharts-legendItem {
        float: left;
        width: 90px;
        margin-top: 10px;
        line-height: 2;
    }

    span.seatCharts-legendDescription {
        margin-left: 5px;
        line-height: 30px;
    }

    .checkout-button {
        display: block;
        width: 80px;
        height: 24px;
        line-height: 20px;
        margin: 10px auto;
        border: 1px solid #999;
        font-size: 14px;
        cursor: pointer
    }

    #selected-seats {
        max-height: 150px;
        overflow-y: auto;
        overflow-x: none;
        width: 100%;
    }

    #selected-seats li {
        width: 140px;
        float: left;
        height: 26px;
        line-height: 26px;
        border: 1px solid #d3d3d3;
        background: #f7f7f7;
        margin: 6px;
        font-size: 14px;
        font-weight: bold;
        text-align: center
    }
</style>
<script src="js/jquery.seat-charts.min.js"></script>

<!--- latest-posts --->
<div id="blog" class="latest-posts">
    <!--- container --->
    <div class="container">
        <div class="latest-posts-text wow bounceIn" data-wow-delay="0.4s">
            <h2>购票</h2>
            <p>Goupiao</p>
        </div>
        <div class="latest-posts-grids wow bounceIn" data-wow-delay="0.4s">
            <div class="clearfix">

                <form action="goupiaoinsert.do" method="post" name="form1" id="form1">
                    添加购票:
                    <br><br>
                    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3"
                           cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                        <tr>
                            <td width="200">电影编号：</td>
                            <td>
                                ${readMap.dianyingbianhao}<input type="hidden" id="dianyingbianhao"
                                                                 name="dianyingbianhao"
                                                                 value="${readMap.dianyingbianhao}"/></td>
                        </tr>
                        <tr>
                            <td width="200">分类：</td>
                            <td>
                                <ssm:sql var="mapyingpianfenlei23"
                                         type="find">SELECT fenleimingcheng FROM yingpianfenlei where id=${readMap.fenlei}</ssm:sql>
                                ${mapyingpianfenlei23.fenleimingcheng}<input type="hidden" id="fenlei" name="fenlei"
                                                                             value="${readMap.fenlei}"/></td>
                        </tr>
                        <tr>
                            <td width="200">电影名称：</td>
                            <td>
                                ${readMap.dianyingmingcheng}<input type="hidden" id="dianyingmingcheng"
                                                                   name="dianyingmingcheng"
                                                                   value="${readMap.dianyingmingcheng}"/></td>
                        </tr>
                        <tr>
                            <td width="200">票价：</td>
                            <td>
                                ${readMap.piaojia}<input type="hidden" id="piaojia" name="piaojia"
                                                         value="${readMap.piaojia}"/></td>
                        </tr>
                        <tr>
                            <td width="200">放映厅：</td>
                            <td>
                                <ssm:sql var="mapfangyingting24"
                                         type="find">SELECT yingtingmingcheng FROM fangyingting where id=${readMap.fangyingting}</ssm:sql>
                                ${mapfangyingting24.yingtingmingcheng}<input type="hidden" id="fangyingting"
                                                                             name="fangyingting"
                                                                             value="${readMap.fangyingting}"/></td>
                        </tr>
                        <tr>
                            <td width="200">开场时间：</td>
                            <td>
                                ${readMap.kaichangshijian}<input type="hidden" id="kaichangshijian"
                                                                 name="kaichangshijian"
                                                                 value="${readMap.kaichangshijian}"/></td>
                        </tr>
                        <tr>
                            <td width="200">散场时间：</td>
                            <td>
                                ${readMap.sanchangshijian}<input type="hidden" id="sanchangshijian"
                                                                 name="sanchangshijian"
                                                                 value="${readMap.sanchangshijian}"/></td>
                        </tr>
                        <tr>
                            <td width="200">购买数：</td>
                            <td>
                                <input style="width:150px;" data-rule-required="true" data-msg-required="请填写购买数" readonly
                                       number="true" data-msg-number="输入一个有效数字" id="goumaishu" name="goumaishu" value=""
                                       type="number"/> <span style="color: red;">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td width="200">选座：</td>
                            <td>
                                <div id="seat-map">
                                    <div class="front">屏幕</div>
                                </div>
                                <div class="booking-details">
                                    <h3>已选中的座位 (<span id="counter">0</span>):</h3>
                                    <ul id="selected-seats">
                                    </ul>
                                    <p>总价: <b>$<span id="total">0</span></b></p>
                                    <div id="legend"></div>
                                </div>

                                <%
                                    Dianyingchangci readMap = (Dianyingchangci)request.getAttribute("readMap");
                                    HashMap bofangting = Query.make("fangyingting").where("id", readMap.getFangyingting()).find();
                                %>

                                <script>
                                    $(document).ready(function () {
                                        var $cart = $('#selected-seats'), //座位区
                                            $counter = $('#counter'), //票数
                                            $number = $('#goumaishu'), // 表单购买张数


                                            $total = $('#total'); //总计金额
                                        var row =<%=bofangting.get("jipai") %>;
                                        var col =<%=bofangting.get("jilie") %>;

                                        var map = [];
                                        for (var i = 0; i < row; i++) {
                                            var str = "";
                                            for (var j = 0; j < col; j++) {
                                                str += "a";
                                            }
                                            map.push(str);
                                        }

                                        var sc = $('#seat-map').seatCharts({
                                            map: map,
                                            seats: {
                                                a: {
                                                    price: ${readMap.piaojia},
                                                    classes: 'first-class', //your custom CSS class
                                                    category: '座位'
                                                }
                                            },
                                            naming: {
                                                top: false,
                                                getLabel: function (character, row, column) {
                                                    return column;
                                                }
                                            },
                                            legend: { //定义图例
                                                node: $('#legend'),
                                                items: [
                                                    ['a', 'available', '可选'],
                                                    ['a', 'selected', '已选'],
                                                    ['a', 'unavailable', '已售'],
                                                ]
                                            },
                                            click: function () { //点击事件
                                                if (this.status() == 'available') { //可选座


                                                    $('<li><input type="hidden" name="xuanzuo" value="' + (this.settings.row + 1) + '_' + this.settings.label + '">' + (this.settings.row + 1) + '排' + this.settings.label + '号' + ' <a href="javascript:;" class="cancel-cart-item">[删除]</a></li>')
                                                        .attr('id', 'cart-item-' + this.settings.id)
                                                        .data('seatId', this.settings.id)
                                                        .appendTo($cart);

                                                    //$cart.html((this.settings.row + 1) + '排' + this.settings.label + '号');

                                                    $counter.text(sc.find('selected').length + 1);
                                                    $number.val(sc.find('selected').length + 1);
                                                    //$total.text(recalculateTotal(this));
                                                    $total.text(recalculateTotal(sc) + this.data().price);
                                                    return 'selected';
                                                } else if (this.status() == 'selected') { //已选中
                                                    $counter.text(sc.find('selected').length - 1);
                                                    $number.val(sc.find('selected').length - 1);
                                                    //and total
                                                    $total.text(recalculateTotal(sc) - this.data().price);

                                                    //remove the item from our cart
                                                    $('#cart-item-' + this.settings.id).remove();

                                                    //seat has been vacated
                                                    return 'available';

                                                } else if (this.status() == 'unavailable') { //已售出
                                                    return 'unavailable';
                                                } else {
                                                    return this.style();
                                                }
                                            }
                                        });
                                        $('#selected-seats').on('click', '.cancel-cart-item', function () {
                                            //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
                                            sc.get($(this).parents('li:first').data('seatId')).click();
                                        });

                                        //已售出的座位
                                        <% List<String> lis = Query.make("goupiao")
                                        .where("dingpiaozhuangtai" , "已出票")
                                        .where("dianyingchangciid" ,request.getParameter("id"))
                                        .getCol("xuanzuo");
                                        String[] xxs = StringUtil.join("," , lis).split(",");
                                        %>
                                        <% if(lis.size()>0){ %>
                                        sc.get(<%=JSON.toJSONString(xxs)%>).status('unavailable');
                                        <% } %>

                                        function recalculateTotal(sc) {
                                            var total = 0;
                                            //basically find every selected seat and sum its price
                                            sc.find('selected').each(function () {
                                                total += this.data().price;
                                            });
                                            return total;
                                        }

                                    });

                                </script>


                            </td>
                        </tr>

                       <%-- <tr>
                            <td width="200">选座：</td>
                            <td>
                                <input style="width:150px;" id="xuanzuo" name="xuanzuo" value="" type="text"/></td>
                        </tr>--%>
                        <tr>
                            <td width="200">购票人：</td>
                            <td>
                                <input style="width:150px;" readonly="readonly" id="goupiaoren" name="goupiaoren"
                                       value="${sessionScope.username}" type="text"/></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" name="dianyingchangciid" value="${param.id}"/>
                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                                &nbsp;
                            </td>
                            <td><input type="submit" name="Submit" value="提交"
                                       style='border:solid 1px #000000; color:#666666'/>
                                <input type="reset" name="Submit2" value="重置"
                                       style='border:solid 1px #000000; color:#666666'/></td>
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
