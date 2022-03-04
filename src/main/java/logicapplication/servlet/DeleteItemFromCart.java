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
 * Servlet implementation class DeleteItemFromCart
 */
@WebServlet("/delete-item-cart")
public class DeleteItemFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItemFromCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("customer");

		int id = Integer.parseInt(request.getParameter("ID"));
		CartDAOImpl cartDAOImpl = new CartDAOImpl();
		int idCart = new OrderDAOImpl().getLastOrder(customer).getCart().getID();
		Cart cart = new Cart();
		cart.setID(idCart);
		BookItem bookItem = new BookItem();
		bookItem.setID(id);
		List<BookItem> bookItems = new ArrayList<BookItem>();
		bookItems.add(bookItem);
		cart.setBookItems(bookItems);
		cartDAOImpl.deleteBookItem(cart);
		request.setAttribute("deleteSuccess", 1);
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
