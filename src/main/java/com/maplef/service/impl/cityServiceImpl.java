package com.maplef.service.impl;

import com.maplef.dao.cityMapper;
import com.maplef.entity.City;
import com.maplef.entity.Flight;
import com.maplef.service.cityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class cityServiceImpl implements cityService {

    @Autowired
    private cityMapper citymapper;

    @Override
    public List<City> cityList() {
        return citymapper.cityList();
    }

    @Override
    public List<Flight> selFlight(int r, int t) {
        return citymapper.selFlight(r, t);
    }

    @Override
    public int addFlight(Flight flight) {
        return citymapper.addFlight(flight);
    }

    @Override
    public int checkFlightNo(String flightNo) {
        return citymapper.checkFlightNo(flightNo);
    }


}
