package Dao;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import task.Task;
import task.User;

public class UserDao {
	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("akash");
	EntityManager entityManager = entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction = entityManager.getTransaction();

	public User getUserDetails(String username) {
		Query query = entityManager.createQuery("select u from User u where u.email=?1");
		query.setParameter(1, username);
		List<User> list = query.getResultList();
		if (list != null && !list.isEmpty()) {
			User user = list.get(0);
			return user;
		}
		return null;

	}

	public User updateEmployee(User user) {
		Query query = entityManager.createQuery("select u from User u where u.id=?1");
		query.setParameter(1, user.getId());
		List<User> list = query.getResultList();
		if (list != null && !list.isEmpty()) {
			User dbUser = list.get(0);
			if (dbUser != null && !dbUser.getTasks().isEmpty()) {
				user.setTasks(dbUser.getTasks());
				entityTransaction.begin();
				entityManager.merge(user);
				entityTransaction.commit();
				return user;
			}else {
				entityTransaction.begin();
				entityManager.merge(user);
				entityTransaction.commit();
				return user;
			}
		}
		return null;
	}

	public void removeEmployee(int id) {
		User user=entityManager.find(User.class, id);
		if(user.getTasks()!=null&&!user.getTasks().isEmpty()) {
			entityTransaction.begin();
			List<Task> list=user.getTasks();
			for(Task task:list) {
				task.setUser(null);
				
				entityManager.merge(task);
				
			}
			entityManager.remove(user);
			entityTransaction.commit();
		}else {
			entityTransaction.begin();
			entityManager.remove(user);
			entityTransaction.commit();
			
			
		}
		
		
	}

}
