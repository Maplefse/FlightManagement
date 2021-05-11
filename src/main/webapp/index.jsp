<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<style>
    #divcss{margin:0 auto;width:600px;}
    body{ margin:0 auto; text-align:center}
    table{margin:0 auto; width:600px}
    table{ border:1px solid #000}
    table tr th{ height:28px; line-height:28px; background:#999}
    table.stripe tr td{ height:28px; line-height:28px; text-align:center;background:#FFF;vertical-align:middle;}
    /* css注释：默认css背景被白色 */
    table.stripe tr.alt td { background:#F2F2F2;}
    /* css 注释：默认隔行背景颜色 */
    table.stripe tr.over td {background:#EEECEB;}
    /* css注释：鼠标经过时候背景颜色 */

</style>
<body  class="container">
<div id="divcss" >
    <h1 class="text-center h1" >航班查询页面</h1>
    <div>
        <a href="addFlight.jsp">添加航班</a>
        <form action="selFilght" onsubmit="return checkThat()" method="post"   >

            <label>起飞城市:</label>
            <select name="departureCity" id="departureCity">
                <option value="" >请选择起飞城市</option>
            </select>

            <label>——到达城市：</label>
            <select name="arrivalCity" id="arrivalCity">
                <option value="" >请选择到达城市</option>
            </select>

            <input type="submit" value="查询">
        </form>

        <c:if test="${sessionScope.flights!=null}">
            <table class="table table-striped table-bordered" >
                <tr>
                    <th>航班编号</th>
                    <th>起飞城市</th>
                    <th>起飞时间</th>
                    <th>到达城市</th>
                    <th>到达时间</th>
                </tr>
                <c:forEach var="flight" items="${sessionScope.flights}" >
                    <tr>
                        <td>${flight.flightNo}</td>
                        <td>${flight.arrivalCity}</td>
                        <td>${flight.arrivalTime}</td>
                        <td>${flight.departureCity}</td>
                        <td>${flight.departureTime}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</div>

<script src="js/jquery-1.12.4.js"></script>
<%--<script src="js/bootstrap.js"/>--%>

<script>
    /*页面加载时,ajax获取到下拉框数据并遍历输出添加到下拉框*/
    $.ajax({
        url: "FlightLogin",
        dataType: "JSON",
        success: function (parm){
            for (var i = 0, len = parm.length; i < len; i++) {
                $("#departureCity").append("<option value="+parm[i].id+">"+parm[i].cityName+"</option>")
                $("#arrivalCity").append("<option value="+parm[i].id+">"+parm[i].cityName+"</option>")
            }
        }
    })



    function checkThat(){

        var arr = $("#arrivalCity").val();
        var dep = $("#departureCity").val();

        if(arr =='' || arr==null){
            alert("请选择到达地")
            return false;
        }
        if(dep =='' || dep==null){
            alert("请选择出发地")
            return false;
        }
        if (arr == dep){
            alert("起飞地与到达地不能一致");
            return false;
        }
    }
</script>
</body>
</html>
