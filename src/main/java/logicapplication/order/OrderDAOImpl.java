package logicapplication.order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectDB;
import logicapplication.customer.CustomerDAOImpl;
import model.customer.Customer;
import model.order.*;

public class OrderDAOImpl implements OrderDAO {

	/**
	 * 
	 * @param o
	 */
	public int addOrder(Order o) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect
					.prepareStatement("INSERT INTO `order` (CustomerID, Status, CartID) VALUES (?,?,?);");

			preparedStatement.setInt(1, o.getCustomer().getID());
			preparedStatement.setString(2, "new");
			preparedStatement.setInt(3, o.getCart().getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			try {
				PreparedStatement preparedStatement1 = ConnectDB.connect
						.prepareStatement("SELECT MAX(ID) FROM `order`;");
				System.out.println(preparedStatement1);
				ResultSet rs1 = preparedStatement1.executeQuery();
				if (rs1.next()) {
					return rs1.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 
	 * @param o
	 */
	public void checkOutOrder(Order o) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement(
					"UPDATE `order` SET `VoucherID`=?,`PaymentID`=?,`ShipmentID`=?,`Status`=? WHERE `ID`=?");
			if(o.getVoucher()!=null) {
				preparedStatement.setInt(1, o.getVoucher().getID());
			}
			else {
				preparedStatement.setString(1, null);
			}
			preparedStatement.setInt(2, o.getPayment().getID());
			preparedStatement.setInt(3, o.getShipment().getID());
			preparedStatement.setString(4, "process");
			preparedStatement.setInt(5, o.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param o
	 */
	public void updateStatus(Order o) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement(
					"UPDATE `order` SET `Status`=? WHERE `ID`=?");
			preparedStatement.setString(1, o.getStatus());
			preparedStatement.setInt(2, o.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Order getLastOrder(Customer c) {
		Order order = new Order();
		order.setCustomer(c);
		String select = "Select * from `order` where CustomerID=? and Status='new'";
		order.setStatus("new");
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement(select);
			preparedStatement.setInt(1, c.getID());
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				order.setID(resultSet.getInt("ID"));
				int CartID = resultSet.getInt("CartID");
				order.setCart(new CartDAOImpl().getCartByID(CartID));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public List<Order> getAllOrders(Customer c) {
		String select = "Select ID from `order` where CustomerID=? AND status !='new' order by id desc";
		List<Order> orders = new ArrayList<Order>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement(select);
			preparedStatement.setInt(1, c.getID());
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				orders.add(new OrderDAOImpl().getOrderByID(resultSet.getInt("ID")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public Order getOrderByID(int ID) {
		String select = "Select * from `order` where ID=?";
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement(select);
			preparedStatement.setInt(1, ID);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				Order order = new Order();
				order.setID(resultSet.getInt("ID"));
				order.setStatus(resultSet.getString("Status"));
				order.setCustomer(new CustomerDAOImpl().getCustomerByID(resultSet.getInt("CustomerID")));
				order.setCart(new CartDAOImpl().getCartByID(resultSet.getInt("CartID")));
				order.setPayment(new PaymentDAOImpl().getPaymentByID(resultSet.getInt("PaymentID")));
				order.setShipment(new ShipmentDAOImpl().getShipmentByID(resultSet.getInt("ShipmentID")));
				String voucher = resultSet.getString("VoucherID");
				if(voucher!=null) {
					order.setVoucher(new VoucherDAOImpl().getVoucherByID(Integer.parseInt(voucher)));
					order.setTotalAmount(order.getCart().getTotalPrices()*(100-order.getVoucher().getDiscountPercent())/100+order.getShipment().getCost());
				}
				else {
					order.setTotalAmount(order.getCart().getTotalPrices()+order.getShipment().getCost());
				}
				return order;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}