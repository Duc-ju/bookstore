package logicapplication.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logicapplication.customer.AccountDAOImpl;
import logicapplication.customer.CustomerDAOImpl;
import model.customer.Account;
import model.customer.Customer;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		Account account = new AccountDAOImpl().checkAccount(new Account(userName,password));
		if(account!=null) {
			Customer customer = new Customer();
			customer.setAccount(account);
			customer = new CustomerDAOImpl().getCustomer(customer);
			if(customer!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("customer",customer);
				response.sendRedirect(request.getContextPath()+"/home");
			}
			else {
				request.setAttribute("errorLogin", 1);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			
		}
		else {
			request.setAttribute("errorLogin", 1);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

}
