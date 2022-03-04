package logicapplication.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicapplication.book.AuthorDAOImpl;
import logicapplication.order.CartDAOImpl;
import logicapplication.order.OrderDAOImpl;
import logicapplication.order.PaymentDAOImpl;
import logicapplication.order.ShipmentDAOImpl;
import logicapplication.order.VoucherDAOImpl;
import model.customer.Customer;
import model.order.Cart;
import model.order.Cash;
import model.order.Credit;
import model.order.Order;
import model.order.Payment;
import model.order.Shipment;
import model.order.Tranfer;
import model.order.Voucher;

/**
 * Servlet implementation class CreateOrderServlet
 */
@WebServlet("/createorder")
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		Cart cart = new OrderDAOImpl().getLastOrder(customer).getCart();
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("CreateOrder.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		request.setCharacterEncoding("utf-8");
		String address = request.getParameter("address");
		String shipmentType = request.getParameter("shipmentType");
		float shippingFee = 0;
		String paymentMethod = request.getParameter("paymentMethod");
		String discount = request.getParameter("discount");
		switch (shipmentType){
			case "fast": {
				shippingFee = 50000;
				shipmentType = "Vận chuyển hỏa tốc";
				break;
			}
			case "quick":{
				shippingFee = 40000;
				shipmentType = "Vận chuyển nhanh";
				break;
			}
			case "normal":{
				shippingFee = 30000;
				shipmentType = "Vận chuyển tiết kiệm";
				break;
			}
		}
		Order order = new OrderDAOImpl().getLastOrder(customer);
		//Thêm shipment
		Shipment shipment = new Shipment(shipmentType, shippingFee, address);
		shipment.setID(new ShipmentDAOImpl().addShipment(shipment));
		order.setShipment(shipment);
		// Thêm Voucher
		Voucher voucher = null;
		if (discount != null && discount.length() > 0) {
			voucher = new VoucherDAOImpl().getVoucherByName(discount);
			if (voucher != null) {
				order.setVoucher(voucher);
			}
		}
		//Thêm payment
		switch (paymentMethod) {
		case "cash": {
			Cash cash = new Cash();
			cash.setCashier("Vui lòng thanh toán khi nhận hàng");
			if(voucher==null) {
				cash.setTotalAmount(shippingFee+order.getCart().getTotalPrices());
			}
			else {
				cash.setTotalAmount(shippingFee+order.getCart().getTotalPrices()*(100-voucher.getDiscountPercent())/100);
			}
			order.setPayment(cash);
			cash.setID(new PaymentDAOImpl().addPayment(order));
			order.setPayment(cash);
			break;
		}
		
		case "credit":{
			String number = request.getParameter("number");
			String type = request.getParameter("typeCredit");
			Date expDate = Date.valueOf(request.getParameter("expDate"));
			Credit credit = new Credit();
			if(voucher==null) {
				credit.setTotalAmount(shippingFee+order.getCart().getTotalPrices());
			}
			else {
				credit.setTotalAmount(shippingFee+order.getCart().getTotalPrices()*(100-voucher.getDiscountPercent())/100);
			}
			credit.setNumber(number);
			credit.setType(type);
			credit.setExDate(expDate);
			order.setPayment(credit);
			credit.setID(new PaymentDAOImpl().addPayment(order));
			order.setPayment(credit);
			break;
		}
		
		case "tranfer":{
			String name = request.getParameter("nameTranfer");
			String bankID = request.getParameter("bankID");
			Tranfer tranfer = new Tranfer();
			tranfer.setBankID(bankID);
			tranfer.setName(name);
			if(voucher==null) {
				tranfer.setTotalAmount(shippingFee+order.getCart().getTotalPrices());
			}
			else {
				tranfer.setTotalAmount(shippingFee+order.getCart().getTotalPrices()*(100-voucher.getDiscountPercent())/100);
			}
			order.setPayment(tranfer);
			tranfer.setID(new PaymentDAOImpl().addPayment(order));
			order.setPayment(tranfer);
		}
		
		}
		
		//Check Out Order
		new OrderDAOImpl().checkOutOrder(order);
		//Tạo order và giỏ hàng mới
		Order newOrder = new Order();
		newOrder.setCustomer(customer);
		int cartID = new CartDAOImpl().addCart(new Cart());
		Cart cart = new Cart();
		cart.setID(cartID);
		newOrder.setCart(cart);
		new OrderDAOImpl().addOrder(newOrder);
//		response.sendRedirect(request.getContextPath()+"/orderdetail?id="+order.getID());
		response.sendRedirect(request.getContextPath()+"/orderdetail?id="+order.getID());
	}

}
