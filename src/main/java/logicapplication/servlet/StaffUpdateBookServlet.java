package logicapplication.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.book.AuthorDAOImpl;
import logicapplication.book.BookDAOImpl;
import logicapplication.book.CategoryDAOImpl;
import logicapplication.book.PublisherDAOImpl;
import model.book.Author;
import model.book.Book;
import model.book.Category;
import model.book.Publisher;

/**
 * Servlet implementation class StaffUpdateBookServlet
 */
@WebServlet("/staff/updatebook")
public class StaffUpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffUpdateBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Book book = new BookDAOImpl().getBookByID(id);
		request.setAttribute("book", book);
		List<Category> categories = new CategoryDAOImpl().getAllCategories();
		request.setAttribute("categories", categories);
		List<Publisher> publishers = new PublisherDAOImpl().getAllPublishers();
		request.setAttribute("publishers", publishers);
		List<Author> authors = new AuthorDAOImpl().getAllAuthors();
		request.setAttribute("authors", authors);
		request.getRequestDispatcher("BookForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookID = Integer.parseInt(request.getParameter("id"));
		Book book = new BookDAOImpl().getBookByID(bookID);
		String type = request.getParameter("type");
		switch (type) {
			case "author": {
				String name = request.getParameter("name");
				String biography = request.getParameter("biography");
				String mail = request.getParameter("mail");
				String address = request.getParameter("address");
				Author author = new Author(name, biography, mail, address);
				author.setID(book.getAuthor().getID());
				new AuthorDAOImpl().updateAuthor(author);
				break;
			}
			case "publisher": {
				String name = request.getParameter("name");
				String address = request.getParameter("address");
				Publisher publisher = new Publisher(name, address);
				publisher.setID(book.getPublisher().getID());
				new PublisherDAOImpl().updatePublisher(publisher);
				break;
			}
			case "category": {
				String name = request.getParameter("name");
				Category category = new Category(name);
				category.setID(book.getCategory().getID());
				new CategoryDAOImpl().updateCategory(category);
				break;
			}
			case "book": {
				int AuthorID = Integer.parseInt(request.getParameter("author"));
				int PublisherID = Integer.parseInt(request.getParameter("publisher"));
				int CategoryID = Integer.parseInt(request.getParameter("category"));
				String ISBN = request.getParameter("ISBN");
				String title = request.getParameter("title");
				String language = request.getParameter("language");
				Date publicationDate = Date.valueOf(request.getParameter("publicationDate"));
				int numberOfPage = Integer.parseInt(request.getParameter("numberOfPage"));
				Author author = new Author();
				author.setID(AuthorID);
				Publisher publisher = new Publisher();
				publisher.setID(PublisherID);
				Category category = new Category();
				category.setID(CategoryID);
				Book newBook = new Book(ISBN, title, language, publicationDate, numberOfPage, category, publisher, author);
				newBook.setID(book.getID());
				new BookDAOImpl().updateBook(newBook);
				break;
			}
			
		}
		response.sendRedirect(request.getContextPath()+"/staff/updatebook?id="+bookID);
	}

}
