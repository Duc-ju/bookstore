package logicapplication.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer.Customer;
import model.staff.Staff;

/**
 * Servlet Filter implementation class CheckAdminStaffSessionFilter
 */
@WebFilter(urlPatterns = {"/staff/liststaff","/staff/addstaff","/staff/updatestaff","/staff/deletestaff"})
public class CheckAdminStaffSessionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CheckAdminStaffSessionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse rep = (HttpServletResponse) response;
		Staff staff = (Staff) req.getSession().getAttribute("staffSession");
		if(staff==null||!staff.getClass().getName().equals("model.staff.AdminStaff")) {
			rep.sendRedirect(req.getContextPath()+"/staff/login");
			return;
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
