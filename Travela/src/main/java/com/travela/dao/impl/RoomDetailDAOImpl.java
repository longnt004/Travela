package com.travela.dao.impl;

import java.util.List;

import com.travela.dao.AbstractDAO;
import com.travela.dao.RoomDetailDAO;
import com.travela.entity.RoomDetail;

public class RoomDetailDAOImpl extends AbstractDAO<RoomDetail> implements RoomDetailDAO {

	@Override
	public RoomDetail findById(String id) {
		// TODO Auto-generated method stub
		return super.findById(RoomDetail.class, id);
	}

	@Override
	public List<RoomDetail> findByRoomId(String id) {
		// TODO Auto-generated method stub
		String jpql = "Select rd From RoomDetail rd Where rd.room.roomId = ?0";
		return super.findMany(RoomDetail.class, jpql, id);
	}

	@Override
	public List<RoomDetail> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(RoomDetail.class, false);
	}

	@Override
	public List<RoomDetail> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(RoomDetail.class, false, pageNumber, pageSize);
	}

	@Override
	public RoomDetail create(RoomDetail entity) {
		// TODO Auto-generated method stub
		return super.create(entity);
	}

	@Override
	public RoomDetail update(RoomDetail entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}
}
