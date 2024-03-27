package com.travela.dao;

import java.util.List;

import com.travela.entity.Room;

public interface RoomDAO {
	Room findById(String id);
	List<Room> findAll();
	List<Room> findAll(int pageNumber, int pageSize);
	Room create(Room entity);
	Room update(Room entity);
}
