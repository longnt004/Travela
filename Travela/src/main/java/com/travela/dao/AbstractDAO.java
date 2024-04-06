package com.travela.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.travela.util.JpaUtil;

public class AbstractDAO<T> {
public static final EntityManager entityManager = JpaUtil.getEntityManager();
	
	@SuppressWarnings("removal")
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
//		entityManager.close();
	}
	
	public T findById(Class<T> clazz, String id) {
		return entityManager.find(clazz, id);
	}
	
	public List<T> findAll(Class<T> clazz, boolean exsitIsActive){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if(exsitIsActive) {
			sql.append(" WHERE isActive = 1");
		}
		
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		return query.getResultList();
	}
	
	public List<T> findAll(Class<T> clazz, boolean exsitIsActive, int pageNumber, int pageSize){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if(exsitIsActive) {
			sql.append(" WHERE isActive = 1");
		}
		
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		query.setFirstResult((pageNumber - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
	
	public T findOne(Class<T> clazz, String sql, Object... params) {
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		
		List<T> result = query.getResultList();
		if(result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}
	
	public List<T> findMany(Class<T> clazz, String sql, Object... params) {
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> findManyByNativeQuery(Class<T> clazz, String sql, Object... params) {
		Query query = entityManager.createNativeQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	
	public T create(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			entityManager.getTransaction().rollback();
			System.out.println("Cannot insert entity " + entity.getClass().getSimpleName() + " to DB");
			throw new RuntimeException(e);
		}
	}
	
	public T update(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(entity);
			entityManager.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			entityManager.getTransaction().rollback();
			System.out.println("Cannot update entity " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}

}
