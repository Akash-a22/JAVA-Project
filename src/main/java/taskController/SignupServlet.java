package taskController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.SignupDao;
import task.User;

@WebServlet(value = "/signup")
public class SignupServlet extends HttpServlet{
	SignupDao signupDao=new SignupDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
//		String role=req.getParameter("role");
//		String status=req.getParameter("status");
		
		User user=new User(0, name, email, Long.parseLong(phone), password, "employee", "active", null);
		
		User dbUser=signupDao.createEmployee(user);
		if(dbUser!=null) {
			req.setAttribute("created", "yes");
			RequestDispatcher dispatcher=req.getRequestDispatcher("managerdb.jsp");
			dispatcher.forward(req, resp);
		}else {
			RequestDispatcher dispatcher=req.getRequestDispatcher("managerdb.jsp");
			dispatcher.forward(req, resp);
			
		}
		
		
		
		
		
	}

}
