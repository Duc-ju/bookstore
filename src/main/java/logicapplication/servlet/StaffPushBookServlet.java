package logicapplication.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.book.BookDAOImpl;
import logicapplication.book.BookItemDAOImpl;
import model.book.Book;
import model.book.BookItem;

/**
 * Servlet implementation class StaffPushBookServlet
 */
@WebServlet("/staff/pushbook")
public class StaffPushBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffPushBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookID = Integer.parseInt(request.getParameter("id"));
		Book book = new BookDAOImpl().getBookByID(bookID);
		request.setAttribute("book",book);
		request.getRequestDispatcher("BookItemForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookID = Integer.parseInt(request.getParameter("id"));
		String barcode = request.getParameter("barcode");
		float price = Float.parseFloat(request.getParameter("prices"));
		String[] imageArray = request.getParameterValues("image");
		List<String> images = new ArrayList<String>();
		for(int i=0; i<imageArray.length; i++) {
			images.add(imageArray[i]);
		}
		String description = request.getParameter("description");
		String header = request.getParameter("header");
		float discount = Float.parseFloat(request.getParameter("discount"));
		Book book = new Book();
		book.setID(bookID);
		BookItem bookItem = new BookItem(barcode, price, description, images, header, discount, book);
		int bookItemID = new BookItemDAOImpl().addBookItem(bookItem);
		response.sendRedirect(request.getContextPath()+"/staff/listbookitem");
	}

}
