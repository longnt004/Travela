package com.travela.dao;

import java.util.Date;
import java.util.List;

import com.travela.entity.Booking;


public interface BookingDAO {
	Booking findById(String id);
	List<Booking> findAll();
	List<Booking> findAll(int pageNumber, int pageSize);
	List<Booking> findFromDateToDate(Date checkIn, Date checkOut);
	Booking create(Booking entity);
	Booking update(Booking entity);
}
