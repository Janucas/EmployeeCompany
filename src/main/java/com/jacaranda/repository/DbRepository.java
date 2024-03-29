package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.jacaranda.model.Company;
import com.jacaranda.util.BdUtil;

public class DbRepository {

	public static <E> E find(Class<E> c, int id) throws Exception {
		Transaction transaction = null;
		Session session;
		E result = null;
		try {
			session = BdUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		try {
			result = session.find(c, id);
		} catch (Exception e) {
			throw new Exception("Error al obtener la identidad.");
		}
		return result;
	}

	public static <E> List<E> findAll(Class<E> c) throws Exception {
		Transaction transaction = null;
		Session session;
		List<E> result = null;
		try {
			session = BdUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		try {
			result = (List<E>) session.createSelectionQuery("From " + c.getName()).getResultList();
		} catch (Exception e) {
			throw new Exception("Error al obtener la identidad.");
		}
		return result;

	}
	
	public static Company addCompany(String name) {
		Company result = null;
		Session session = BdUtil.getSessionFactory().openSession();

		SelectionQuery<Company> q =
				session.createSelectionQuery("From Company where name = :name", Company.class);
				q.setParameter("name", name);
				List<Company> companys = q.getResultList(); 
				if(companys.size() != 0) {
					result = companys.get(0);
				}
				session.close();
				return result;
	}
	
	public static <T> void addEntity(T t){
		Transaction transaction = null; 
		Session session = BdUtil.getSessionFactory().openSession();

		transaction = session.beginTransaction();
		try {
			session.persist(t);
			transaction.commit();
		}catch (Exception e) {
			transaction.rollback();
		}
		session.close();
	}

}
