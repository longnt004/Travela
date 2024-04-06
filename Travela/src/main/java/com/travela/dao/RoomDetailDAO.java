package com.travela.dao;

import java.util.List;

import com.travela.entity.RoomDetail;

public interface RoomDetailDAO {
	RoomDetail findById(String id);
	List<RoomDetail> findByRoomId(String id);
	List<RoomDetail> findAll();
	List<RoomDetail> findAll(int pageNumber, int pageSize);
	RoomDetail create(RoomDetail entity);
	RoomDetail update(RoomDetail entity);
}
