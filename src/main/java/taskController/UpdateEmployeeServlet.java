package taskController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDao;
import task.User;

@WebServlet(value = "/updateemp")
public class UpdateEmployeeServlet extends HttpServlet{
	UserDao dao=new UserDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
		String role=req.getParameter("role");
		String status=req.getParameter("status");
		
		User user=new User(Integer.parseInt(id), name, email, Long.parseLong(phone), password, role, status, null);
		User dbUser=dao.updateEmployee(user);
			RequestDispatcher dispatcher=req.getRequestDispatcher("viewemp.jsp");
			dispatcher.forward(req, resp);
	}

}
