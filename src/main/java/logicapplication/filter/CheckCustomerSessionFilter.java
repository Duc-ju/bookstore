package logicapplication.filter;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.order.CartDAOImpl;
import model.customer.Customer;
/**
 * Servlet Filter implementation class CheckSessionFilter
 */
@WebFilter(urlPatterns = {"/cart","/add-to-cart","/createorder","/delete-item-cart","/profile","/listorder","/orderdetail"})
public class CheckCustomerSessionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CheckCustomerSessionFilter() {
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
		Customer customer = (Customer) req.getSession().getAttribute("customer");
		if(customer==null) {
			rep.sendRedirect("Login.jsp");
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
