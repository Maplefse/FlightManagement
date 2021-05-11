package com.maplef.controller;

import com.alibaba.fastjson.JSON;
import com.maplef.entity.City;
import com.maplef.entity.Flight;
import com.maplef.service.impl.cityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class filghtController {

    @Autowired
    private cityServiceImpl city;

    @RequestMapping("/FlightLogin")
    @ResponseBody
    public String filghtLogin(HttpSession session){
        List<City> cities = city.cityList();
        System.out.println("分割线--------------------------------------------");
        System.out.println(cities);
        session.setAttribute("citylist",cities);
        //System.out.println(citylist);
        String s = JSON.toJSONString(cities);
        System.out.println(s);
        return s;
    }

    //r:到达城市
    //t:出发城市
    @RequestMapping("/selFilght")
    public ModelAndView selFilght(int arrivalCity,int departureCity,HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        List<Flight> flights = city.selFlight(arrivalCity, departureCity);
        System.out.println(flights);
        session.setAttribute("flights",flights);
        modelAndView.setViewName("index");
        return modelAndView;
    };

    @RequestMapping("/addFilght")
    public String addFilght(Flight flight){
        int i = city.addFlight(flight);
        if(i>0){
            System.out.println("添加成功");
        }else{
            System.out.println("添加失败");
        }

        return "redirect:index.jsp";
    }

    @RequestMapping("/checkFlightNo")
    @ResponseBody
    public String checkFlightNo(String flightNo){
        int i = city.checkFlightNo(flightNo);
        String s = JSON.toJSONString(i);
        System.out.println(s);
        return s;
    }


}
