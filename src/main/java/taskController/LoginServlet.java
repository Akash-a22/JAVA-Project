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

import Dao.LoginDao;
import Dao.TaskDao;
import task.Task;
import task.User;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
	LoginDao loginDao = new LoginDao();
	TaskDao dao = new TaskDao();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		User dbUser = loginDao.loginUser(username, password);
		HttpSession session = req.getSession();
		if (dbUser != null) {
			if (dbUser.getRole().equals("manager")) {
				List<Task> list = dao.getAllTask();
				session.setAttribute("task", list);
				RequestDispatcher dispatcher = req.getRequestDispatcher("managerdb.jsp");
				dispatcher.forward(req, resp);

			} else if (dbUser.getRole().equals("employee")) {
				session.setAttribute("user", dbUser);
				List<Task> list = dao.getAllTask();
				session.setAttribute("task", list);
				RequestDispatcher dispatcher = req.getRequestDispatcher("employeedb.jsp");
				dispatcher.forward(req, resp);
			}
		} else {
			req.setAttribute("loginfail", "wrongcredentials");
			RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.forward(req, resp);

		}

	}

}
