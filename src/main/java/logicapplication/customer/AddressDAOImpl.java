package logicapplication.customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.ConnectDB;
import model.customer.*;

public class AddressDAOImpl implements AddressDAO {

	/**
	 * 
	 * @param a
	 */
	public int addAddress(Address a) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("INSERT INTO address (detail, street, district, city) VALUES (? , ?, ?, ?);");
			preparedStatement.setString(1, a.getDetail());
			preparedStatement.setString(2, a.getStreet());
			preparedStatement.setString(3, a.getDistrict());
			preparedStatement.setString(4, a.getCity());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT MAX(ID) FROM address;");
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				int addressID = rs.getInt(1);
				return addressID;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	/**
	 * 
	 * @param a
	 */
	public void updateAddress(Address a) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("UPDATE address SET detail = ? , street = ?, district = ?, city = ? WHERE ID = ?;");
			preparedStatement.setString(1, a.getDetail());
			preparedStatement.setString(2, a.getStreet());
			preparedStatement.setString(3, a.getDistrict());
			preparedStatement.setString(4, a.getCity());
			preparedStatement.setInt(5, a.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param ID
	 */
	public Address getAddressByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT * FROM address\r\n"
							+ "WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				Address address = new Address();
				address.setID(rs.getInt("ID"));
				address.setDetail(rs.getString("Detail"));
				address.setStreet(rs.getString("Street"));
				address.setDistrict(rs.getString("District"));
				address.setCity(rs.getString("City"));
				return address;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @param ID
	 */
	public void deleteAddress(int ID) {
		try {

			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("DELETE FROM `address` WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}