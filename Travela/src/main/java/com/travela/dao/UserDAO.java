package com.travela.dao;

import java.util.List;

import com.travela.entity.User;


public interface UserDAO {
	User findById(String id);
	User findLastOne();
	User findByEmail(String email);
	User findByUsername(String username);
	User findByEmailAndPassword(String email, String password);
	List<User> findAll();
	List<User> findAll(int pageNumber, int pageSize);
	User create(User entity);
	User update(User entity);
}
