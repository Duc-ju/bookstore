package logicapplication.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.order.CartDAOImpl;
import logicapplication.order.OrderDAOImpl;
import model.book.BookItem;
import model.customer.Customer;
import model.order.Cart;


/**
 * Servlet implementation class AddItemToCartServlet
 */
@WebServlet("/add-to-cart")
public class AddItemToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItemToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		int id = Integer.parseInt(request.getParameter("id"));
		CartDAOImpl cartDAOImpl = new CartDAOImpl();
		Cart c = new OrderDAOImpl().getLastOrder(customer).getCart();
		List<BookItem> bookItems = new ArrayList<BookItem>();
		BookItem bookItem = new BookItem();
		bookItem.setID(id);
		bookItems.add(bookItem);
		c.setBookItems(bookItems);
		cartDAOImpl.addBookItem(c);
		request.setAttribute("addSuccess", 1);
		request.getRequestDispatcher("/cart").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
