package logicapplication.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.book.AuthorDAOImpl;
import logicapplication.book.BookItemDAOImpl;
import logicapplication.book.CategoryDAOImpl;
import logicapplication.book.PublisherDAOImpl;
import model.book.Author;
import model.book.Book;
import model.book.BookItem;
import model.book.Category;
import model.book.Publisher;

/**
 * Servlet implementation class Home
 */
@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String authorString = request.getParameter("author");
		String categoryString = request.getParameter("category");
		String publisherString = request.getParameter("publisher");
		String searchString = request.getParameter("search");
		if(authorString!=null) {
			request.setAttribute("authorRecent", new AuthorDAOImpl().getAuthorByID(Integer.parseInt(authorString)));
		}
		if(categoryString!=null) {
			request.setAttribute("categoryRecent", new CategoryDAOImpl().getCategoryByID(Integer.parseInt(categoryString)));
		}
		if(publisherString!=null) {
			request.setAttribute("publisherRecent", new PublisherDAOImpl().getPublisherByID(Integer.parseInt(publisherString)));
		}
		BookItem bookItem = new BookItem();
		bookItem.setBook(new Book());
		bookItem.setHeader(searchString);
		if(authorString!=null) {
			Author author = new Author();
			author.setID(Integer.parseInt(authorString));
			bookItem.getBook().setAuthor(author);
		}
		if(categoryString!=null) {
			Category category = new Category();
			category.setID(Integer.parseInt(categoryString));
			bookItem.getBook().setCategory(category);
		}
		if(publisherString!=null) {
			Publisher publisher = new Publisher();
			publisher.setID(Integer.parseInt(publisherString));
			bookItem.getBook().setPublisher(publisher);
		}
		List<BookItem> bookItems = new BookItemDAOImpl().searchBookItem(bookItem);
		List<List<BookItem>> bookItemSplit = new ArrayList<List<BookItem>>();
		for(int i=0; i<bookItems.size(); i=i+5) {
			int last = i+5;
			if(last>bookItems.size()) last = bookItems.size();
			bookItemSplit.add(bookItems.subList(i, last));
		}
		request.setAttribute("searchString", searchString);
		request.setAttribute("categories", new CategoryDAOImpl().getAllCategories());
		request.setAttribute("publishers", new PublisherDAOImpl().getAllPublishers());
		request.setAttribute("authors", new AuthorDAOImpl().getAllAuthors());
		request.setAttribute("items", bookItemSplit);
		request.getRequestDispatcher("Home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
