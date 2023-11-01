package taskController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDao;

@WebServlet(value = "/removeemp")
public class RemoveEmployeeServlet extends HttpServlet {
	UserDao dao=new UserDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		dao.removeEmployee(Integer.parseInt(id));
		RequestDispatcher dispatcher=req.getRequestDispatcher("viewemp.jsp");
		dispatcher.forward(req, resp);
	}

}
