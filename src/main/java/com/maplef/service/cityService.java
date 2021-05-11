package com.maplef.service;

import com.maplef.entity.City;
import com.maplef.entity.Flight;

import java.util.List;

public interface cityService {
    public List<City> cityList();

    public List<Flight> selFlight(int r,int t);

    public int addFlight(Flight flight);

    public int checkFlightNo(String flightNo);
}
