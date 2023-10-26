package com.jacaranda.repositry;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jacaranda.util.BdUtil;

public class DbRepository {

	public static <E> E find() throws Exception {
		Transaction transaction = null;
		Session session = null;
		E result = null;
		try {
			session = BdUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception("error en la base de datos");
		}
		try {
			result = session.find(null, result);
		} catch (Exception e) {

		}
		return result;
	}

}
