package logicapplication.customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.ConnectDB;
import model.customer.*;

public class AccountDAOImpl implements AccountDAO {

	/**
	 * 
	 * @param a
	 */
	public int addAccount(Account a) {
		try {
			
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("INSERT INTO Account(username, password) " 
							 + "VALUES (?, ?);");
			preparedStatement.setString(1, a.getUsername());
			preparedStatement.setString(2, a.getPassword());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			Account account = checkAccount(a);
			return account.getID();
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
	public void updateAccount(Account a) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("UPDATE Account SET password = ? WHERE ID = ?;");
			preparedStatement.setString(1, a.getPassword());
			preparedStatement.setInt(2, a.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param a
	 */
	public Account checkAccount(Account a) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT * FROM Account\r\n"
							+ "WHERE username = ?\r\n"
							+ "AND passWord = ?");
			preparedStatement.setString(1, a.getUsername());
			preparedStatement.setString(2, a.getPassword());
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				a.setID(rs.getInt(1));
				return a;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @param username
	 */
	public boolean checkDupplicatedUsername(String username) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT * FROM Account\r\n"
							+ "WHERE username = ?\r\n");
			preparedStatement.setString(1, username);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Account getAccountByID(int ID) {
		try {

			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("select * from account where id = ?");
			preparedStatement.setInt(1, ID);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return new Account(resultSet.getInt("ID"), resultSet.getString("Username"),
						resultSet.getString("Password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void deleteAccount(int ID) {
		try {

			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("DELETE FROM `account` WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}