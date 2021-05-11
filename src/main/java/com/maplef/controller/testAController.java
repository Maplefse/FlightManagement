package com.maplef.controller;

import com.alibaba.fastjson.JSON;
import com.maplef.entity.City;
import com.maplef.service.impl.testAServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class testAController {

    @Autowired
    private testAServiceImpl testaimpl;

    @RequestMapping("/test")
    @ResponseBody
    public String test(){
        System.out.println("进入方法");
        List<City> list = testaimpl.list();
        String s = JSON.toJSONString(list);
        return s;

    }


}
