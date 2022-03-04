package logicapplication.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logicapplication.customer.AccountDAOImpl;
import logicapplication.customer.AddressDAOImpl;
import logicapplication.customer.CustomerDAOImpl;
import logicapplication.customer.FullNameDAOImpl;
import model.customer.Account;
import model.customer.Address;
import model.customer.Customer;
import model.customer.FullName;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Profile.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		request.setCharacterEncoding("utf-8");
		String firstName = request.getParameter("fistname");
		String midName = request.getParameter("midname");
		String lastName = request.getParameter("lastname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String image = request.getParameter("image");
		String sex = request.getParameter("sex");
		
		String province = request.getParameter("province");
		String district = request.getParameter("district");
		String street = request.getParameter("street");
		String numberHouse = request.getParameter("numberhouse");
		
		//Update account
		Account account = new Account();
		account.setID(customer.getAccount().getID());
		account.setPassword(password);
		new AccountDAOImpl().updateAccount(account);
		//Update address
		Address address = new Address();
		address.setCity(province);
		address.setDistrict(district);
		address.setDetail(numberHouse);
		address.setStreet(street);
		if(customer.getAddress()==null) {
			int AddressID = new AddressDAOImpl().addAddress(address);
			address.setID(AddressID);
			customer.setAddress(address);
		}
		else {
			address.setID(customer.getAddress().getID());
			new AddressDAOImpl().updateAddress(address);
		}
		//Update Fullname
		FullName fullName = new FullName();
		fullName.setFirstName(firstName);
		fullName.setMidName(midName);
		fullName.setLastName(lastName);
		if(customer.getFullName()==null) {
			int FullNameID = new FullNameDAOImpl().addFullName(fullName);
			fullName.setID(FullNameID);
			customer.setFullName(fullName);
		}
		else {
			fullName.setID(customer.getFullName().getID());
			new FullNameDAOImpl().updateFullName(fullName);
		}
	
		customer.setAvatar(image);
		customer.setEmail(mail);
		customer.setGender(sex);
		customer.setPhoneNumber(phone);
		new CustomerDAOImpl().updateCustomer(customer);
		Customer newCustomer = new CustomerDAOImpl().getCustomerByID(customer.getID());
		HttpSession session = request.getSession();
		session.setAttribute("customer",newCustomer);
		response.sendRedirect("Profile.jsp");
	}

}
