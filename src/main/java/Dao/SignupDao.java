package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import task.User;

public class SignupDao {
	EntityManagerFactory entityManagerFactory=Persistence.createEntityManagerFactory("akash");
	EntityManager entityManager=entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction=entityManager.getTransaction();
	public User createEmployee(User user){
		Query query=entityManager.createQuery("select u from User u where u.email=?1");
		query.setParameter(1, user.getEmail());
		List<User> list=query.getResultList();
		if(list!=null && !list.isEmpty()) {
			return null;
		}
		else {
			entityTransaction.begin();
			entityManager.persist(user);
			entityTransaction.commit();
			return user;
		}
		
	}

}
