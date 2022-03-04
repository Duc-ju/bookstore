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
import logicapplication.order.CartDAOImpl;
import logicapplication.order.OrderDAOImpl;
import model.customer.Account;
import model.customer.Customer;
import model.order.Cart;
import model.order.Order;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Register.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("re_pass");
		if(!pass.equals(repass)) {
			request.setAttribute("errorMessage", "Password and re-pass are different");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
			return;
		}
		AccountDAOImpl accountDAOImpl = new AccountDAOImpl();
		boolean check = accountDAOImpl.checkDupplicatedUsername(username);
		if(check) {
			request.setAttribute("errorMessage", "Dupplicated username");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
			return;	
		}
		else {
			Account c = new Account(username,pass);
			int ID = accountDAOImpl.addAccount(c);
			if(ID==-1) {
				request.setAttribute("errorMessage", "Adding error");
				request.getRequestDispatcher("Register.jsp").forward(request, response);
				return;	
			}
			else{
				c.setID(ID);
				int cusID = new CustomerDAOImpl().addCustomer(new Customer(phoneNumber,email,c));
				Customer customer = new CustomerDAOImpl().getCustomerByID(cusID);
				System.out.println(customer.getID());
				HttpSession session = request.getSession();
				session.setAttribute("customer",customer);
				Order order = new Order();
				order.setCustomer(customer);
				int cartID = new CartDAOImpl().addCart(new Cart());
				Cart cart = new Cart();
				cart.setID(cartID);
				order.setCart(cart);
				new OrderDAOImpl().addOrder(order);
				response.sendRedirect(request.getContextPath()+"/home");
			}
		}
	}

}
