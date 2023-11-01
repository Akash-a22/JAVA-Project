package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import task.User;

public class LoginDao {
	EntityManagerFactory entityManagerFactory=Persistence.createEntityManagerFactory("akash");
	EntityManager entityManager=entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction=entityManager.getTransaction();
	public User loginUser(String username,String password) {
		Query query =entityManager.createQuery("select u from User u where u.email=?1");
		query.setParameter(1, username);
		
		List<User> list= query.getResultList();
		
		if(list!=null && !list.isEmpty()) {
			User user=list.get(0);
			if(user.getPassword().equals(password)) {
				return user;
			}
		}
		return null;
		
	}

}
