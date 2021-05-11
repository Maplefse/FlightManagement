<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<style>
    #divcss{margin:0 auto;width:250px;}
    h1{ margin:0 auto; text-align:center}
    form div{width:250px;  padding: 15px 0px; }

</style>
<body  >
<div id="divcss" >
    <h1 class="container " >添加航班</h1>
    <form method="post" action="addFilght" onsubmit="return checkThat()">
    <div>
        <label>航班编号</label>
        <input type="text" name="flightNo" id="flightNo"/>
    </div>
    <div>
        <label>起飞城市:</label>
        <select name="departureCity" id="departureCity">
            <option value="" >请选择起飞城市</option>
        </select>
    </div>
    <div>
        <label>起飞时间</label>
        <input type="date" name="departureTime" id="departureTime">
    </div>
    <div>
        <label>到达城市：</label>
        <select name="arrivalCity" id="arrivalCity">
            <option value="" >请选择到达城市</option>
        </select>
    </div>
    <div>
        <label>到达时间</label>
        <input type="date" name="arrivalTime" id="arrivalTime">
    </div>

    <input type="submit" value="提交">
    </form>

</div>

<script src="js/jquery-1.12.4.js"></script>

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

        var flightNo = $("#flightNo").val();
        var departureTime = $("#departureTime").val();
        var arrivalTime = $("#arrivalTime").val();
        var arr = $("#arrivalCity").val();
        var dep = $("#departureCity").val();


        if(flightNo =='' || flightNo==null){
            alert("请填写航班编号")
            return false;
        }
        if(dep =='' || dep==null){
            alert("请选择出发地")
            return false;
        }
        if(departureTime =='' || departureTime==null){
            alert("请选择出发时间")
            return false;
        }
        if(arr =='' || arr==null){
            alert("请选择到达地")
            return false;
        }
        if(arrivalTime =='' || arrivalTime==null){
            alert("请选择到达时间")
            return false;
        }

        if (arr == dep){
            alert("起飞地与到达地不能一致");
            return false;
        }


    }

    $("#flightNo").blur(function () {
        $.ajax({
            url: "checkFlightNo",
            data: "flightNo="+$("#flightNo").val(),
            type: "post",
            dataType: "JSON",
            success: function (parm){
                if (parm>0){
                    /*大于0证明编号重复*/
                    alert("航班编号重复!")
                    return false
                }
            }
        })
    })

</script>
</body>
</html>
