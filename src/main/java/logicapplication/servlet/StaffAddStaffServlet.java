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
import logicapplication.staff.StaffDAOImpl;
import model.customer.Account;
import model.customer.Address;
import model.customer.Customer;
import model.customer.FullName;
import model.staff.AdminStaff;
import model.staff.WarehouseManageStaff;
import model.staff.WebsiteManageStaff;

/**
 * Servlet implementation class StaffAddStaffServlet
 */
@WebServlet("/staff/addstaff")
public class StaffAddStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffAddStaffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		request.setAttribute("type1", type);
		System.out.println(type);
		request.getRequestDispatcher("StaffForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("fistname");
		String midName = request.getParameter("midname");
		String lastName = request.getParameter("lastname");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		float salary = Float.parseFloat(request.getParameter("salary"));
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("sex");
		int expYear = Integer.parseInt(request.getParameter("expYear"));

		String numberHouse = request.getParameter("numberhouse");
		String province = request.getParameter("province");
		String district = request.getParameter("district");
		String street = request.getParameter("street");
		
		String type = request.getParameter("type");
		//add account
		Account account = new Account(username,password);
		account.setID(new AccountDAOImpl().addAccount(account));
		//Update address
		Address address = new Address();
		address.setCity(province);
		address.setDistrict(district);
		address.setDetail(numberHouse);
		address.setStreet(street);
		address.setID(new AddressDAOImpl().addAddress(address));
		
		//add Fullname
		FullName fullName = new FullName();
		fullName.setFirstName(firstName);
		fullName.setMidName(midName);
		fullName.setLastName(lastName);
		fullName.setID(new FullNameDAOImpl().addFullName(fullName));
		
		switch (type) {
			case "admin": {
				String certificate = request.getParameter("certificate");
				AdminStaff adminStaff = new AdminStaff(salary, age, gender, expYear, account, address, fullName, certificate);
				new StaffDAOImpl().addStaff(adminStaff);
				break;
				
			}
			case "warehouse": {
				int storageNum = Integer.parseInt(request.getParameter("storageNum"));
				WarehouseManageStaff warehouseManageStaff = new WarehouseManageStaff(salary, age, gender, expYear, account, address, fullName, storageNum);
				new StaffDAOImpl().addStaff(warehouseManageStaff);
				break;
			}
			case "website": {
				String seoExp = request.getParameter("seoExp");
				WebsiteManageStaff websiteManageStaff = new WebsiteManageStaff(salary, age, gender, expYear, account, address, fullName, seoExp);
				new StaffDAOImpl().addStaff(websiteManageStaff);
				break;
			}
		}
		response.sendRedirect(request.getContextPath()+"/staff/liststaff");
	}

}
