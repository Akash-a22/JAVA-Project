package taskController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.TaskDao;

@WebServlet(value = "/removetask")
public class RemoveTaskServlet extends HttpServlet {
	TaskDao dao=new TaskDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		if(dao.removeTask(Integer.parseInt(id))) {
			req.setAttribute("remove", "yes");
			RequestDispatcher dispatcher=req.getRequestDispatcher("updatetask.jsp");
			dispatcher.forward(req, resp);
		}else {
			req.setAttribute("remove", "no");
			RequestDispatcher dispatcher=req.getRequestDispatcher("updatetask.jsp");
			dispatcher.forward(req, resp);
		}
	}

}
