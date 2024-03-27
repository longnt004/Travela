package com.travela.dao.impl;

import java.util.Date;
import java.util.List;

import com.travela.dao.AbstractDAO;
import com.travela.dao.BookingDAO;
import com.travela.entity.Booking;

public class BookingDAOImpl extends AbstractDAO<Booking> implements BookingDAO {

	@Override
	public Booking findById(String id) {
		// TODO Auto-generated method stub
		return super.findById(Booking.class, id);
	}

	@Override
	public List<Booking> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(Booking.class, false);
	}

	@Override
	public List<Booking> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Booking.class, false, pageNumber, pageSize);
	}

	@Override
	public List<Booking> findFromDateToDate(Date checkIn, Date checkOut) {
		// TODO Auto-generated method stub
		String sql = "Select o From Booking o Where CONVERT(date,o.postDate) between ?0 and ?1";
		return super.findMany(Booking.class, sql, checkIn, checkOut);
	}

}
