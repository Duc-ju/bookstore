package logicapplication.order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.ConnectDB;
import model.book.Author;
import model.order.*;

public class VoucherDAOImpl implements VoucherDAO {

	/**
	 * 
	 * @param v
	 */
	public int addVoucher(Voucher v) {
		// TODO - implement VoucherDAOImpl.addVoucher
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param ID
	 */
	public void deleteVoucher(int ID) {
		// TODO - implement VoucherDAOImpl.deleteVoucher
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param v
	 */
	public void updateVoucher(Voucher v) {
		// TODO - implement VoucherDAOImpl.updateVoucher
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param name
	 */
	public Voucher getVoucherByName(String name) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM voucher WHERE name = ?");
			preparedStatement.setString(1, name.toUpperCase());
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				Voucher voucher = new Voucher();
				voucher.setID(rs.getInt("ID"));
				voucher.setName(rs.getString("Name"));
				voucher.setDiscountPercent(rs.getFloat("DiscountPercent"));
				voucher.setDescription(rs.getString("Description"));
				return voucher;
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
	public Voucher getVoucherByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM voucher WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				Voucher voucher = new Voucher();
				voucher.setID(rs.getInt("ID"));
				voucher.setName(rs.getString("Name"));
				voucher.setDiscountPercent(rs.getFloat("DiscountPercent"));
				voucher.setDescription(rs.getString("Description"));
				return voucher;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}