package com.maplef.entity;


public class Flight {

  private Integer id;
  private String flightNo;
  private String departureCity;
  private java.sql.Date departureTime;
  private String arrivalCity;
  private java.sql.Date arrivalTime;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getFlightNo() {
    return flightNo;
  }

  public void setFlightNo(String flightNo) {
    this.flightNo = flightNo;
  }




  public java.sql.Date getDepartureTime() {
    return departureTime;
  }

  public void setDepartureTime(java.sql.Date departureTime) {
    this.departureTime = departureTime;
  }


  public String getDepartureCity() {
    return departureCity;
  }

  public void setDepartureCity(String departureCity) {
    this.departureCity = departureCity;
  }

  public String getArrivalCity() {
    return arrivalCity;
  }

  public void setArrivalCity(String arrivalCity) {
    this.arrivalCity = arrivalCity;
  }

  public java.sql.Date getArrivalTime() {
    return arrivalTime;
  }

  public void setArrivalTime(java.sql.Date arrivalTime) {
    this.arrivalTime = arrivalTime;
  }



  @Override
  public String toString() {
    return "Flight{" +
            "id=" + id +
            ", flightNo='" + flightNo + '\'' +
            ", departureCity=" + departureCity +
            ", departureTime=" + departureTime +
            ", arrivalCity=" + arrivalCity +
            ", arrivalTime=" + arrivalTime +
            '}';
  }
}
