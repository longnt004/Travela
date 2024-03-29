package com.travela.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtil {
	private static EntityManagerFactory emf;

	public static EntityManager getEntityManager() {
		if (emf == null || emf.isOpen()) {
			emf = Persistence.createEntityManagerFactory("Travela");
		}

		return emf.createEntityManager();
	}

	public static void shutDown() {
		if (emf != null && emf.isOpen()) {
			emf.close();
		}
		emf = null;
	}
}
