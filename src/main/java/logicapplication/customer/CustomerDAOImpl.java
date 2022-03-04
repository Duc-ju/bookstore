package logicapplication.customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.ConnectDB;
import model.customer.*;

public class CustomerDAOImpl implements CustomerDAO {

	/**
	 * 
	 * @param c
	 */
	public int addCustomer(Customer c) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("INSERT INTO Customer (PhoneNumber, Email,AccountID) VALUES (?, ? ,?);");
			preparedStatement.setString(1, c.getPhoneNumber());
			preparedStatement.setString(2, c.getEmail());
			preparedStatement.setInt(3, c.getAccount().getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT MAX(ID) FROM Customer;");
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				int customerID = rs.getInt(1);
				return customerID;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	/**
	 * 
	 * @param c
	 */
	public void updateCustomer(Customer c) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement(
					"UPDATE customer SET PhoneNumber = ?, Email = ?, Avatar = ?, Gender = ?, FullNameID=?, AddressID=? WHERE ID = ?");
			preparedStatement.setString(1, c.getPhoneNumber());
			preparedStatement.setString(2, c.getEmail());
			preparedStatement.setString(3, c.getAvatar());
			preparedStatement.setString(4, c.getGender());
			preparedStatement.setInt(5, c.getFullName().getID());
			preparedStatement.setInt(6, c.getAddress().getID());
			
			preparedStatement.setInt(7, c.getID());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param id
	 */
	public Customer getCustomerByID(int id) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT * FROM customer\r\n"
							+ "WHERE ID = ?");
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			Customer customer = new Customer();
			if(rs.next()) {
				customer.setID(rs.getInt("ID"));
				customer.setPhoneNumber(rs.getString("PhoneNumber"));
				customer.setEmail(rs.getString("Email"));
				customer.setAvatar(rs.getString("Avatar"));
				customer.setGender(rs.getString("Gender"));
				customer.setAccount(new AccountDAOImpl().getAccountByID(rs.getInt("AccountID")));
				customer.setAddress(new AddressDAOImpl().getAddressByID(rs.getInt("AddressID")));
				customer.setFullName(new FullNameDAOImpl().getFullNameByID(rs.getInt("FullNameID")));
			}
			return customer;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Customer getCustomer(Customer c) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT * FROM customer\r\n"
							+ "WHERE AccountID = ?");
			preparedStatement.setInt(1, c.getAccount().getID());
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				c.setID(rs.getInt("ID"));
				c.setPhoneNumber(rs.getString("PhoneNumber"));
				c.setEmail(rs.getString("Email"));
				c.setAvatar(rs.getString("Avatar"));
				c.setGender(rs.getString("Gender"));
				c.setAccount(new AccountDAOImpl().getAccountByID(rs.getInt("AccountID")));
				c.setAddress(new AddressDAOImpl().getAddressByID(rs.getInt("AddressID")));
				c.setFullName(new FullNameDAOImpl().getFullNameByID(rs.getInt("FullNameID")));
				return c;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}