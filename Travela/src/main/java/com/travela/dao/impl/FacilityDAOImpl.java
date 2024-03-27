package com.travela.dao.impl;

import java.util.List;

import com.travela.dao.AbstractDAO;
import com.travela.dao.FacilityDAO;
import com.travela.entity.Facility;

public class FacilityDAOImpl extends AbstractDAO<Facility> implements FacilityDAO {

	@Override
	public Facility findById(String id) {
		// TODO Auto-generated method stub
		return super.findById(Facility.class, id);
	}

	@Override
	public List<Facility> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(Facility.class, false);
	}

	@Override
	public List<Facility> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Facility.class, false, pageNumber, pageSize);
	}
	
	@Override
	public Facility create(Facility entity) {
		// TODO Auto-generated method stub
		return super.create(entity);
	}
	
	@Override
	public Facility update(Facility entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}

}
