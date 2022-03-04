package logicapplication.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.book.BookItemDAOImpl;
import model.book.Book;
import model.book.BookItem;

/**
 * Servlet implementation class StaffUpdateBookItemServlet
 */
@WebServlet("/staff/updatebookitem")
public class StaffUpdateBookItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffUpdateBookItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookItemID = Integer.parseInt(request.getParameter("id"));
		BookItem bookItem = new BookItemDAOImpl().getBookItemByID(bookItemID);
		request.setAttribute("bookItem", bookItem);
		request.getRequestDispatcher("BookItemForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookItemID = Integer.parseInt(request.getParameter("id"));
		String barcode = request.getParameter("barcode");
		float price = Float.parseFloat(request.getParameter("prices"));
		String[] imageArray = request.getParameterValues("image");
		System.out.println(imageArray.length);
		List<String> images = new ArrayList<String>();
		for(int i=0; i<imageArray.length; i++) {
			images.add(imageArray[i]);
		}
		String description = request.getParameter("description");
		String header = request.getParameter("header");
		float discount = Float.parseFloat(request.getParameter("discount"));
		BookItem bookItem = new BookItem(bookItemID,barcode, price, description, images, header, discount, null);
		new BookItemDAOImpl().updateBookItem(bookItem);
		response.sendRedirect(request.getContextPath()+"/staff/listbookitem");
	}

}
