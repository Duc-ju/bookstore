package logicapplication.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.order.VoucherDAOImpl;
import model.order.Voucher;

/**
 * Servlet implementation class VoucherServlet
 */
@WebServlet("/voucher")
public class VoucherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoucherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voucherString = request.getParameter("voucher");
		Voucher voucher = new VoucherDAOImpl().getVoucherByName(voucherString);
		if(voucher==null) {
			response.getWriter().write("empty");
		}
		else {
			response.getWriter().write(""+voucher.getDiscountPercent());
		}
		
	}

}
