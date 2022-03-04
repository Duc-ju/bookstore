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

import logicapplication.order.CartDAOImpl;
import logicapplication.order.OrderDAOImpl;
import model.customer.Customer;

/**
 * Servlet Filter implementation class SetDefaltAttributeFilter
 */
@WebFilter("/*")
public class SetDefaltAttributeFilter implements Filter {

    /**
     * Default constructor. 
     */
    public SetDefaltAttributeFilter() {
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
		Customer customer = (Customer) req.getSession().getAttribute("customer");
		if(customer!=null) {
			request.setAttribute("numberOfItems", new OrderDAOImpl().getLastOrder(customer).getCart().getQuantity());
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
