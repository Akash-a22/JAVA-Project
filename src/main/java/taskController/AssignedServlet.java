package taskController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.TaskDao;
import task.Task;

@WebServlet(value = "/assigned")
public class AssignedServlet extends HttpServlet {
	TaskDao dao=new TaskDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id=req.getParameter("user_id");
		String task_id=req.getParameter("task_id");
		
		Task task=dao.assignTask(Integer.parseInt(user_id),Integer.parseInt(task_id));
		if(task!=null) {
			req.setAttribute("assigntask", "yes");
			RequestDispatcher dispatcher=req.getRequestDispatcher("managerdb.jsp");
			dispatcher.forward(req, resp);
			
		}else {
			RequestDispatcher dispatcher=req.getRequestDispatcher("task.jsp");
			dispatcher.forward(req, resp);
		}
	}

}
