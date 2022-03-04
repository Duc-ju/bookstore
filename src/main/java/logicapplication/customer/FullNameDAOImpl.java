package logicapplication.customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.ConnectDB;
import model.customer.*;

public class FullNameDAOImpl implements FullNameDAO {

	/**
	 * 
	 * @param f
	 */
	public int addFullName(FullName f) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("INSERT INTO fullname (firstName, midName, lastName) VALUES (?, ?, ?);");
			preparedStatement.setString(1, f.getFirstName());
			preparedStatement.setString(2, f.getMidName());
			preparedStatement.setString(3, f.getLastName());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT MAX(ID) FROM fullname;");
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				int fullNameID = rs.getInt(1);
				return fullNameID;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	/**
	 * 
	 * @param f
	 */
	public void updateFullName(FullName f) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("UPDATE fullname SET firstName = ?, midName = ?, lastName = ? WHERE ID = ?;");
			preparedStatement.setString(1, f.getFirstName());
			preparedStatement.setString(2, f.getMidName());
			preparedStatement.setString(3, f.getLastName());
			preparedStatement.setInt(4, f.getID());
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
	public FullName getFullNameByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT * FROM fullname\r\n"
							+ "WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				return new FullName(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4));
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
	public void deleteFullName(int ID) {
		try {

			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("DELETE FROM `fullname` WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}