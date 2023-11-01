package Dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import task.Task;
import task.User;

public class TaskDao {
	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("akash");
	EntityManager entityManager = entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction = entityManager.getTransaction();

	public Task createTask(Task task) {
		entityTransaction.begin();
		entityManager.persist(task);
		entityTransaction.commit();
		return task;

	}

	public List<User> getAllEmployee() {
		Query query = entityManager.createQuery("select u from User u where u.role=?1 and u.status=?2");
		query.setParameter(1, "employee");
		query.setParameter(2, "active");

		List<User> list = query.getResultList();
		return list;

	}

	public Task assignTask(int user_id, int task_id) {
		User user = entityManager.find(User.class, user_id);
		Task task = entityManager.find(Task.class, task_id);
		if (user != null && task != null) {
			if (user.getTasks() != null && !user.getTasks().isEmpty()) {
				task.setStatusOfTask("assigned");

				List<Task> list = user.getTasks();
				list.add(task);

				user.setTasks(list);
				task.setUser(user);

				entityTransaction.begin();
				entityManager.merge(user);
				entityManager.merge(task);
				entityTransaction.commit();
			} else {
				List<Task> list = new ArrayList<>();
				list.add(task);
				task.setStatusOfTask("assigned");

				user.setTasks(list);
				task.setUser(user);

				entityTransaction.begin();
				entityManager.merge(user);
				entityManager.merge(task);
				entityTransaction.commit();

			}

			return task;

		}
		return null;

	}

	public Task updateTask(Task task) {
		Task dbTask = entityManager.find(Task.class, task.getId());
		if (dbTask.getStatusOfTask().equals("notassign")){
			task.setStatusOfTask("notassign");
			task.setCompletedDateAndTime(null);
		}
		task.setCreadtedDateAndTime(dbTask.getCreadtedDateAndTime());
		task.setUser(dbTask.getUser());
		entityTransaction.begin();
		entityManager.merge(task);
		entityTransaction.commit();
		return task;
	}

	public List<Task> getAllTask() {
		Query query = entityManager.createQuery("select u from Task u ");

		List<Task> list = query.getResultList();
		return list;

	}

	public boolean removeTask(int id) {
		Task task = entityManager.find(Task.class, id);
		User user = task.getUser();
		if (user != null) {
			if (user.getTasks() != null && !user.getTasks().isEmpty()) {
				List<Task> list = user.getTasks();
				for (Task dbTask : list) {
					if (dbTask.getId() == id) {
						task.setUser(null);
						list.remove(dbTask);
						user.setTasks(list);
						entityTransaction.begin();
						entityManager.remove(task);
						entityManager.merge(user);
						entityTransaction.commit();
						return true;

					}
				}
			}
		}
		return false;

	}

}
