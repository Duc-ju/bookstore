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
import logicapplication.staff.StaffDAOImpl;
import model.customer.Account;
import model.customer.Customer;
import model.staff.Staff;

/**
 * Servlet implementation class StaffLogin
 */
@WebServlet(urlPatterns = {"/staff/login","/staff"})
public class StaffLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("StaffLogin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		Account account = new AccountDAOImpl().checkAccount(new Account(userName,password));
		if(account!=null) {
			Staff staff = new Staff();
			staff.setAccount(account);
			staff = new StaffDAOImpl().getStaff(staff);
			if(staff!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("staffSession",staff);
				System.out.println(staff.getClass().getName());
				switch (staff.getClass().getName()){
					case "model.staff.AdminStaff": {
						
						response.sendRedirect(request.getContextPath()+"/staff/liststaff");
						break;
					}
					case "model.staff.WarehouseManageStaff":{
						
						response.sendRedirect(request.getContextPath()+"/staff/listbook");
						break;
					}
					case "model.staff.WebsiteManageStaff":{
						
						response.sendRedirect(request.getContextPath()+"/staff/listbookitem");
						break;
					}
						
				}
			}
			else {
				request.setAttribute("errorLogin", 1);
				request.getRequestDispatcher("StaffLogin.jsp").forward(request, response);
			}
		}
		else {
			request.setAttribute("errorLogin", 1);
			request.getRequestDispatcher("StaffLogin.jsp").forward(request, response);
		}
	}

}
