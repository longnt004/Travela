package com.travela.dao.impl;

import java.util.List;

import com.travela.dao.AbstractDAO;
import com.travela.dao.RoomDAO;
import com.travela.entity.Room;

public class RoomDAOImpl extends AbstractDAO<Room> implements RoomDAO {

	@Override
	public List<Room> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(Room.class, false);
	}

	@Override
	public List<Room> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Room.class, false, pageNumber, pageSize);
	}

	@Override
	public Room findById(String id) {
		// TODO Auto-generated method stub
		return super.findById(Room.class, id);
	}

	@Override
	public Room create(Room entity) {
		// TODO Auto-generated method stub
		return super.create(entity);
	}
	
	@Override
	public Room update(Room entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}
}
