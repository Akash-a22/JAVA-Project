package taskController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import task.Task;
import task.User;

@WebServlet(value = "/usertask")
public class UserTaskServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user.getTasks() != null && !user.getTasks().isEmpty()) {
			List<Task> list = user.getTasks();
			list.sort((Task t1, Task t2) -> {
				return t1.getStatusOfTask().compareTo(t2.getStatusOfTask());
			});
			session.setAttribute("usertask", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("viewtask.jsp");
			dispatcher.forward(req, resp);
		} else {
			req.setAttribute("notask", "true");
			RequestDispatcher dispatcher = req.getRequestDispatcher("employeedb.jsp");
			dispatcher.forward(req, resp);

		}
	}

}
