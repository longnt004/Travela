package com.travela.dao.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.travela.dao.AbstractDAO;
import com.travela.dao.BookingDetailDAO;
import com.travela.entity.BookingDetail;
import com.travela.entity.User;
import com.travela.util.TravelaUtil;

public class BookingDetailDAOImpl extends AbstractDAO<BookingDetail> implements BookingDetailDAO {

	@Override
	public BookingDetail findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BookingDetail findLastBookingDetail() {
		// TODO Auto-generated method stub
		String jpql = "Select b From BookingDetail b Order By b.bookingDetailId desc";
		return super.findOne(BookingDetail.class, jpql);
	}

	@Override
	public List<BookingDetail> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookingDetail> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BookingDetail create(BookingDetail entity) {
		// TODO Auto-generated method stub
		return super.create(entity);
	}
}
