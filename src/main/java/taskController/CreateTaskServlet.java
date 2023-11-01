package taskController;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.TaskDao;
import task.Task;

@WebServlet(value = "/createtask")
public class CreateTaskServlet extends HttpServlet {
	TaskDao dao=new TaskDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String  desc=req.getParameter("description");
		String  created=req.getParameter("created");
		
		Task task=new Task(0, desc, LocalDateTime.parse(req.getParameter("created")), null, "notassign", null);
		
		dao.createTask(task);
		req.setAttribute("taskcreated", "yes");
		RequestDispatcher dispatcher=req.getRequestDispatcher("managerdb.jsp");
		dispatcher.forward(req, resp);
		
		
	}

}
