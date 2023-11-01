package taskController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDao;
import task.User;

@WebServlet(value = "/userdetails")
public class UserDetailsServlet extends HttpServlet {
	UserDao dao = new UserDao();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		req.setAttribute("user", user);
		RequestDispatcher dispatcher = req.getRequestDispatcher("userdetails.jsp");
		dispatcher.forward(req, resp);

	}

}
