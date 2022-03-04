package logicapplication.order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import config.ConnectDB;
import model.order.*;

public class PaymentDAOImpl implements PaymentDAO {

	/**
	 * 
	 * @param o
	 */
	public int addPayment(Order o) {
		// TODO - implement PaymentDAOImpl.addPayment
		String insertPayment = "insert into payment(TotalAmount,CartID,ShipmentID)"
				+ "values(?,?,?)";
		switch (o.getPayment().getClass().getName()) {
			case "model.order.Cash" :{
				String insertCash = "insert into cash(Cashier, PaymentID) values(?,?)";
		        try {
		        	Cash cash =(Cash) o.getPayment();
		            PreparedStatement ps = ConnectDB.connect.prepareStatement(insertPayment, Statement.RETURN_GENERATED_KEYS);
		            ps.setFloat(1, cash.getTotalAmount());
		            ps.setInt(2, o.getCart().getID());
		            ps.setInt(3, o.getShipment().getID());
		            ps.executeUpdate();
		            ResultSet result = ps.getGeneratedKeys();
		            if(result.next()){
		            	cash.setID(result.getInt(1));
		            }
		            ps = ConnectDB.connect.prepareStatement(insertCash);
		            ps.setString(1, cash.getCashier());
		            ps.setInt(2, cash.getID());
		            ps.executeUpdate();
		            return cash.getID();
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
			}
			case "model.order.Credit":{
				String insertCredit = "INSERT INTO `credit`(`Number`, `Type`, `ExDate`, `PaymentID`) VALUES (?,?,?,?)";
				Credit credit = (Credit) o.getPayment();
				PreparedStatement ps;
				try {
					ps = ConnectDB.connect.prepareStatement(insertPayment, Statement.RETURN_GENERATED_KEYS);
					ps.setFloat(1, credit.getTotalAmount());
					ps.setInt(2, o.getCart().getID());
					ps.setInt(3, o.getShipment().getID());
					ps.executeUpdate();
					ResultSet result = ps.getGeneratedKeys();
					if (result.next()) {
						credit.setID(result.getInt(1));
					}
					ps = ConnectDB.connect.prepareStatement(insertCredit);
					ps.setString(1, credit.getNumber());
					ps.setString(2, credit.getType());
					ps.setDate(3, credit.getExDate());
					ps.setInt(4, credit.getID());
					ps.executeUpdate();
					return credit.getID();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	           
			}
			case "model.order.Tranfer":{
				String insertTranfer = "INSERT INTO `tranfer`(`Name`, `BankID`, `PaymentID`) VALUES (?,?,?)";
				Tranfer tranfer = (Tranfer) o.getPayment();
				PreparedStatement ps;
				try {
					ps = ConnectDB.connect.prepareStatement(insertPayment, Statement.RETURN_GENERATED_KEYS);
					ps.setFloat(1, tranfer.getTotalAmount());
					ps.setInt(2, o.getCart().getID());
					ps.setInt(3, o.getShipment().getID());
					ps.executeUpdate();
					ResultSet result = ps.getGeneratedKeys();
					if (result.next()) {
						tranfer.setID(result.getInt(1));
					}
					ps = ConnectDB.connect.prepareStatement(insertTranfer);
					ps.setString(1, tranfer.getName());
					ps.setString(2, tranfer.getBankID());
					ps.setInt(3, tranfer.getID());
					ps.executeUpdate();
					return tranfer.getID();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		return -1;
	}

	/**
	 * 
	 * @param ID
	 */
	public void deletePayment(int ID) {
		// TODO - implement PaymentDAOImpl.deletePayment
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param p
	 */
	public void updatePayment(Payment p) {
		// TODO - implement PaymentDAOImpl.updatePayment
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param ID
	 */
	public Payment getPaymentByID(int ID) {
		String selectString = "SELECT * FROM payment WHERE id = ?";
		String cashString = "SELECT * FROM cash where PaymentID = ?";
		try {
            PreparedStatement ps = ConnectDB.connect.prepareStatement(selectString);
            ps.setInt(1, ID);
            ResultSet result = ps.executeQuery();
            if(result.next()){
            	Payment payment = new Payment();
            	payment.setID(ID);
            	payment.setTotalAmount(result.getFloat("TotalAmount"));
            	//cash
            	PreparedStatement ps1 = ConnectDB.connect.prepareStatement(cashString);
                ps1.setInt(1, ID);
                ResultSet cashResultSet = ps1.executeQuery();
                if(cashResultSet.next()) {
                	Cash cash = new Cash();
                	cash.setID(ID);
                	cash.setTotalAmount(payment.getTotalAmount());
                	cash.setCashier(cashResultSet.getString("Cashier"));
                	return cash;
                }
                //credit
                
                //tranfer
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
		return null;
	}

}