package com.travela.dao.impl;

import java.util.List;

import com.travela.dao.AbstractDAO;
import com.travela.dao.UserDAO;
import com.travela.entity.User;

public class UserDAOImpl extends AbstractDAO<User> implements UserDAO {

	@Override
	public User findById(String id) {
		// TODO Auto-generated method stub
		return super.findById(User.class, id);
	}

	@Override
	public User findLastOne() {
		// TODO Auto-generated method stub
		String jpql = "Select o From User o Order By o.id desc";
		return super.findOne(User.class, jpql);
	}
	
	@Override
	public User findByEmail(String email) {
		String sql = "Select o From User o Where o.email = ?0";
		return super.findOne(User.class, sql, email);
	}

	@Override
	public User findByUsername(String username) {
		String sql = "Select o From User o Where o.username = ?0";
		return super.findOne(User.class, sql, username);
	}

	@Override
	public User findByEmailAndPassword(String email, String password) {
		String sql = "Select o From User o Where o.email = ?0 And o.password = ?1";
		return super.findOne(User.class, sql, email, password);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(User.class, false);
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(User.class, false, pageNumber, pageSize);
	}
	
	@Override
	public User create(User entity) {
		// TODO Auto-generated method stub
		return super.create(entity);
	}

	@Override
	public User update(User entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}

}
