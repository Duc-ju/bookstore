package logicapplication.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.customer.AccountDAOImpl;
import logicapplication.customer.AddressDAOImpl;
import logicapplication.customer.FullNameDAOImpl;
import logicapplication.staff.StaffDAOImpl;
import model.customer.Account;
import model.customer.Address;
import model.customer.FullName;
import model.staff.AdminStaff;
import model.staff.Staff;
import model.staff.WarehouseManageStaff;
import model.staff.WebsiteManageStaff;

/**
 * Servlet implementation class StaffUpdateStaffServlet
 */
@WebServlet("/staff/updatestaff")
public class StaffUpdateStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffUpdateStaffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ID = Integer.parseInt(request.getParameter("id"));
		Staff staff = new StaffDAOImpl().getStaffByID(ID);
		switch (staff.getClass().getName()) {
			case "model.staff.AdminStaff": {
				request.setAttribute("type1", "admin");
				break;
				
			}
			case "model.staff.WarehouseManageStaff": {
				request.setAttribute("type1", "warehouse");
				break;
			}
			case "model.staff.WebsiteManageStaff": {
				request.setAttribute("type1", "website");
				break;
			}
		}
		request.setAttribute("staffUpdate", staff);
		request.getRequestDispatcher("StaffForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ID = Integer.parseInt(request.getParameter("id"));
		Staff staff = new StaffDAOImpl().getStaffByID(ID);
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
		//update account
		Account account = new Account(staff.getAccount().getID(),username,password);
		new AccountDAOImpl().updateAccount(account);
		//Update address
		Address address = new Address();
		address.setCity(province);
		address.setDistrict(district);
		address.setDetail(numberHouse);
		address.setStreet(street);
		if(staff.getAddress()!=null) {
			address.setID(staff.getAddress().getID());
			new AddressDAOImpl().updateAddress(address);
		}
		else {
			address.setID(new AddressDAOImpl().addAddress(address));
		}
		//update Fullname
		
		FullName fullName = new FullName();
		fullName.setFirstName(firstName);
		fullName.setMidName(midName);
		fullName.setLastName(lastName);
		if (staff.getFullName() != null) {
			fullName.setID(staff.getFullName().getID());
			new FullNameDAOImpl().updateFullName(fullName);
		}
		else {
			fullName.setID(new FullNameDAOImpl().addFullName(fullName));
		}
		switch (type) {
			case "admin": {
				String certificate = request.getParameter("certificate");
				AdminStaff adminStaff = new AdminStaff(ID,salary, age, gender, expYear, account, address, fullName, certificate);
				new StaffDAOImpl().updateStaff(adminStaff);
				break;
				
			}
			case "warehouse": {
				int storageNum = Integer.parseInt(request.getParameter("storageNum"));
				WarehouseManageStaff warehouseManageStaff = new WarehouseManageStaff(ID,salary, age, gender, expYear, account, address, fullName, storageNum);
				new StaffDAOImpl().updateStaff(warehouseManageStaff);
				break;
			}
			case "website": {
				String seoExp = request.getParameter("seoExp");
				WebsiteManageStaff websiteManageStaff = new WebsiteManageStaff(ID,salary, age, gender, expYear, account, address, fullName, seoExp);
				new StaffDAOImpl().updateStaff(websiteManageStaff);
				break;
			}
		}
		response.sendRedirect(request.getContextPath()+"/staff/liststaff");
	}

}
