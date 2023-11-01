package taskController;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.TaskDao;
import task.Task;

@WebServlet(value = "/updatetask")
public class UpdateTaskServlet extends HttpServlet{
	TaskDao dao=new TaskDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String desc=req.getParameter("description");
		String compeleted=req.getParameter("completed");
		String status="completed";
		
		Task task=new Task();
		task.setId(Integer.parseInt(id));
		task.setDescription(desc);
		task.setCompletedDateAndTime(LocalDateTime.parse(compeleted));
		task.setStatusOfTask(status);
		dao.updateTask(task);
		
		req.setAttribute("updated", "yes");
		RequestDispatcher dispatcher=req.getRequestDispatcher("updatetask.jsp");
		dispatcher.forward(req, resp);
		
		
		
		
	}

}
