package com.travela.dao;

import java.util.List;

import com.travela.entity.BookingDetail;


public interface BookingDetailDAO {
	BookingDetail findById(String id);
	BookingDetail findLastBookingDetail();
	List<BookingDetail> findAll();
	List<BookingDetail> findAll(int pageNumber, int pageSize);
	BookingDetail create(BookingDetail entity);
	BookingDetail update(BookingDetail entity);
}
