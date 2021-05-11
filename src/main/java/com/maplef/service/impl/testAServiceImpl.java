package com.maplef.service.impl;

import com.maplef.dao.testAMapper;
import com.maplef.entity.City;
import com.maplef.service.testAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class testAServiceImpl implements testAService {

    @Autowired
    private testAMapper testa;

    @Override
    public List<City> list() {
        return testa.list();
    }
}
