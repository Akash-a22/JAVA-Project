package taskController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.TaskDao;
import task.User;

@WebServlet(value = "/assign")
public class TaskAssignServlet extends HttpServlet{
	TaskDao dao=new TaskDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> list=dao.getAllEmployee();
		if(list!=null && !list.isEmpty()) {
			RequestDispatcher dispatcher=req.getRequestDispatcher("assigntask.jsp");
			dispatcher.forward(req, resp);
		}else {
			req.setAttribute("noemp", "true");
			RequestDispatcher dispatcher=req.getRequestDispatcher("managerdb.jsp");
			dispatcher.forward(req, resp);
		}
	}

}
