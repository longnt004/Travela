package com.travela.dao;

import java.util.List;

import com.travela.entity.Facility;


public interface FacilityDAO {
	Facility findById(String id);
	List<Facility> findAll();
	List<Facility> findAll(int pageNumber, int pageSize);
	Facility create(Facility entity);
	Facility update(Facility entity);
}
