package com.maplef.dao;

import com.maplef.entity.City;
import com.maplef.entity.Flight;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface cityMapper {

    //填充下拉框
    public List<City> cityList();

    //查询航班信息
    //r:到达城市
    //t:出发城市
    public List<Flight> selFlight(@Param("r") int r,@Param("t") int t);

    //添加航班
    public int addFlight(Flight flight);

    //验证航班编号是否相同
    public int checkFlightNo(String flightNo);

}
