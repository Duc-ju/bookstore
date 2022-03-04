package logicapplication.staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectDB;
import logicapplication.book.BookDAOImpl;
import logicapplication.customer.AccountDAOImpl;
import logicapplication.customer.AddressDAOImpl;
import logicapplication.customer.FullNameDAOImpl;
import model.book.Book;
import model.customer.Account;
import model.customer.FullName;
import model.staff.*;

public class StaffDAOImpl implements StaffDAO {

	/**
	 * 
	 * @param s
	 */
	public int addStaff(Staff s) {
		PreparedStatement preparedStatement;
		try {
			preparedStatement = ConnectDB.connect.
					prepareStatement("INSERT INTO `staff`(`FullNameID`, `AddressID`, `AccountID`, `Salary`, `Age`, `Gender`, `ExpYear`) VALUES (?,?,?,?,?,?,?)");
			if(s.getFullName()!=null) {
				preparedStatement.setInt(1, s.getFullName().getID());
			}
			else {
				preparedStatement.setString(1, null);
			}
			if(s.getAddress()!=null) {
				preparedStatement.setInt(2, s.getAddress().getID());
			}
			else {
				preparedStatement.setString(2, null);
			}
			if(s.getAccount()!=null) {
				preparedStatement.setInt(3, s.getAccount().getID());
			}
			else {
				preparedStatement.setString(3, null);
			}
			preparedStatement.setFloat(4, s.getSalary());
			preparedStatement.setInt(5, s.getAge());
			preparedStatement.setString(6, s.getGender());
			preparedStatement.setInt(7, s.getExpYear());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT MAX(ID) FROM staff");
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println("Loại nhân viên đang thêm là: "+s.getClass().getName());
			if(resultSet.next()) {
				int staffID = resultSet.getInt(1);
				switch (s.getClass().getName()){
					case "model.staff.AdminStaff": {
						PreparedStatement preparedStatement1 = ConnectDB.connect.
								prepareStatement("INSERT INTO `adminstaff`(`Certificate`, `StaffID`) VALUES (?,?)");
						AdminStaff adminStaff = (AdminStaff) s;
						preparedStatement1.setString(1, adminStaff.getCertificate());
						preparedStatement1.setInt(2, staffID);
						System.out.println(preparedStatement1);
						preparedStatement1.executeUpdate();
						break;
					}
					case "model.staff.WarehouseManageStaff":{
						PreparedStatement preparedStatement2 = ConnectDB.connect.
								prepareStatement("INSERT INTO `warehousemanagestaff`(`StorageNum`, `StaffID`) VALUES (?,?)");
						WarehouseManageStaff warehouseManageStaff = (WarehouseManageStaff) s;
						preparedStatement2.setInt(1, warehouseManageStaff.getStorageNum());
						preparedStatement2.setInt(2, staffID);
						System.out.println(preparedStatement2);
						preparedStatement2.executeUpdate();
						break;
					}
					case "model.staff.WebsiteManageStaff":{
						PreparedStatement preparedStatement3 = ConnectDB.connect.
								prepareStatement("INSERT INTO `websitemanagestaff`(`SeoExp`, `StaffID`) VALUES (?,?)");
						WebsiteManageStaff websiteManageStaff = (WebsiteManageStaff) s;
						preparedStatement3.setString(1, websiteManageStaff.getSeoExp());
						preparedStatement3.setInt(2, staffID);
						System.out.println(preparedStatement3);
						preparedStatement3.executeUpdate();
						break;
					}
						
				}
				return staffID;
			}
			System.out.println(preparedStatement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	/**
	 * 
	 * @param s
	 */
	public void updateStaff(Staff s) {
		try {
			new AccountDAOImpl().updateAccount(s.getAccount());
			new AddressDAOImpl().updateAddress(s.getAddress());
			new FullNameDAOImpl().updateFullName(s.getFullName());
			PreparedStatement preparedStatement = ConnectDB.connect
					.prepareStatement("UPDATE `staff` SET `FullNameID`=?,`AddressID`=?,`Salary`=?,`Age`=?,`Gender`=?,`ExpYear`=? WHERE ID=?");
			if(s.getFullName()==null) {
				preparedStatement.setString(1, null);
			} else {
				preparedStatement.setInt(1,s.getFullName().getID());
			}
			if(s.getAddress()==null) {
				preparedStatement.setString(2, null);
			} else {
				preparedStatement.setInt(2, s.getAddress().getID());
			}
			preparedStatement.setFloat(3, s.getSalary());
			preparedStatement.setInt(4, s.getAge());
			preparedStatement.setString(5, s.getGender());
			preparedStatement.setInt(6, s.getExpYear());
			preparedStatement.setInt(7, s.getID());
			preparedStatement.executeUpdate();
			switch (s.getClass().getName()) {
			case "model.staff.AdminStaff": {
				PreparedStatement preparedStatement1 = ConnectDB.connect
						.prepareStatement("UPDATE `adminstaff` SET `Certificate`=? WHERE StaffID = ?");
				AdminStaff adminStaff = (AdminStaff) s;
				preparedStatement1.setString(1, adminStaff.getCertificate());
				preparedStatement1.setInt(2, s.getID());
				System.out.println(preparedStatement1);
				preparedStatement1.executeUpdate();
				break;
			}
			case "model.staff.WarehouseManageStaff": {
				PreparedStatement preparedStatement2 = ConnectDB.connect
						.prepareStatement("UPDATE `warehousemanagestaff` SET `StorageNum`=? WHERE StaffID=?");
				WarehouseManageStaff warehouseManageStaff = (WarehouseManageStaff) s;
				preparedStatement2.setInt(1, warehouseManageStaff.getStorageNum());
				preparedStatement2.setInt(2, s.getID());
				System.out.println(preparedStatement2);
				preparedStatement2.executeUpdate();
				break;
			}
			case "model.staff.WebsiteManageStaff": {
				PreparedStatement preparedStatement3 = ConnectDB.connect
						.prepareStatement("UPDATE `websitemanagestaff` SET `SeoExp`=? WHERE StaffID=?");
				WebsiteManageStaff websiteManageStaff = (WebsiteManageStaff) s;
				preparedStatement3.setString(1, websiteManageStaff.getSeoExp());
				preparedStatement3.setInt(2, s.getID());
				System.out.println(preparedStatement3);
				preparedStatement3.executeUpdate();
				break;
			}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param s
	 */
	public void deleteStaff(Staff s) {
		// TODO - implement StaffDAOImpl.deleteStaff
		PreparedStatement preparedStatement;
		try {
			PreparedStatement preparedStatement1 = ConnectDB.connect
					.prepareStatement("DELETE FROM `adminstaff` WHERE StaffID=?");
			preparedStatement1.setInt(1, s.getID());
			System.out.println(preparedStatement1);
			preparedStatement1.executeUpdate();

			PreparedStatement preparedStatement2 = ConnectDB.connect
					.prepareStatement("DELETE FROM `warehousemanagestaff` WHERE StaffID=?");
			preparedStatement2.setInt(1, s.getID());
			System.out.println(preparedStatement2);
			preparedStatement2.executeUpdate();

			PreparedStatement preparedStatement3 = ConnectDB.connect
					.prepareStatement("DELETE FROM `websitemanagestaff` WHERE StaffID=?");
			preparedStatement3.setInt(1, s.getID());
			System.out.println(preparedStatement3);
			preparedStatement3.executeUpdate();
			//
			preparedStatement = ConnectDB.connect.prepareStatement("DELETE FROM `staff` WHERE ID=?");
			preparedStatement.setInt(1, s.getID());
			preparedStatement.executeUpdate();
			if(s.getFullName()!=null) {
				new FullNameDAOImpl().deleteFullName(s.getFullName().getID());
			}
			if(s.getAccount()!=null) {
				new AccountDAOImpl().deleteAccount(s.getAccount().getID());
			}
			if(s.getAddress()!=null) {
				new AddressDAOImpl().deleteAddress(s.getAddress().getID());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

	/**
	 * 
	 * @param ID
	 */
	public Staff getStaffByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT * FROM staff\r\n"
							+ "WHERE ID=?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				//Admin
				PreparedStatement preparedStatement1 = ConnectDB.connect.
						prepareStatement("SELECT * FROM adminstaff\r\n"
								+ "WHERE StaffID = ?");
				preparedStatement1.setInt(1, rs.getInt("ID"));
				System.out.println(preparedStatement1);
				ResultSet rs1 = preparedStatement1.executeQuery();
				if(rs1.next()) {
					AdminStaff adminStaff = new AdminStaff();
					adminStaff.setID(rs.getInt("ID"));
					adminStaff.setAddress(new AddressDAOImpl().getAddressByID(rs.getInt("AddressID")));
					adminStaff.setFullName(new FullNameDAOImpl().getFullNameByID(rs.getInt("FullNameID")));
					adminStaff.setAccount(new AccountDAOImpl().getAccountByID(rs.getInt("AccountID")));
					adminStaff.setAge(rs.getInt("age"));
					adminStaff.setExpYear(rs.getInt("ExpYear"));
					adminStaff.setGender(rs.getString("Gender"));
					adminStaff.setSalary(rs.getFloat("Salary"));
					adminStaff.setCertificate(rs1.getString("Certificate"));
					return adminStaff;
				}
				//Warehouse Manage Staff
				PreparedStatement preparedStatement2 = ConnectDB.connect.
						prepareStatement("SELECT * FROM warehousemanagestaff\r\n"
								+ "WHERE StaffID = ?");
				preparedStatement2.setInt(1, rs.getInt("ID"));
				System.out.println(preparedStatement2);
				ResultSet rs2 = preparedStatement2.executeQuery();
				if(rs2.next()) {
					WarehouseManageStaff warehouseManageStaff = new WarehouseManageStaff();
					warehouseManageStaff.setID(rs.getInt("ID"));
					warehouseManageStaff.setAddress(new AddressDAOImpl().getAddressByID(rs.getInt("AddressID")));
					warehouseManageStaff.setFullName(new FullNameDAOImpl().getFullNameByID(rs.getInt("FullNameID")));
					warehouseManageStaff.setAccount(new AccountDAOImpl().getAccountByID(rs.getInt("AccountID")));
					warehouseManageStaff.setAge(rs.getInt("age"));
					warehouseManageStaff.setExpYear(rs.getInt("ExpYear"));
					warehouseManageStaff.setGender(rs.getString("Gender"));
					warehouseManageStaff.setSalary(rs.getFloat("Salary"));
					warehouseManageStaff.setStorageNum(rs2.getInt("StorageNum"));
					return warehouseManageStaff;
				}
				//Website Manage Staff
				PreparedStatement preparedStatement3 = ConnectDB.connect.
						prepareStatement("SELECT * FROM websitemanagestaff\r\n"
								+ "WHERE StaffID = ?");
				preparedStatement3.setInt(1, rs.getInt("ID"));
				System.out.println(preparedStatement3);
				ResultSet rs3 = preparedStatement3.executeQuery();
				if(rs3.next()) {
					WebsiteManageStaff websiteManageStaff = new WebsiteManageStaff();
					websiteManageStaff.setID(rs.getInt("ID"));
					websiteManageStaff.setAddress(new AddressDAOImpl().getAddressByID(rs.getInt("AddressID")));
					websiteManageStaff.setFullName(new FullNameDAOImpl().getFullNameByID(rs.getInt("FullNameID")));
					websiteManageStaff.setAccount(new AccountDAOImpl().getAccountByID(rs.getInt("AccountID")));
					websiteManageStaff.setAge(rs.getInt("age"));
					websiteManageStaff.setExpYear(rs.getInt("ExpYear"));
					websiteManageStaff.setGender(rs.getString("Gender"));
					websiteManageStaff.setSalary(rs.getFloat("Salary"));
					websiteManageStaff.setSeoExp(rs3.getString("SeoExp"));
					return websiteManageStaff;
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Staff> getAllStaff() {
		List<Staff> staffs = new ArrayList<Staff>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT ID FROM staff ORDER BY ID DESC");
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				staffs.add(new StaffDAOImpl().getStaffByID(rs.getInt(1)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return staffs;
	}

	@Override
	public Staff getStaff(Staff s) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.
					prepareStatement("SELECT * FROM staff\r\n"
							+ "WHERE AccountID = ?");
			preparedStatement.setInt(1, s.getAccount().getID());
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				//Admin
				PreparedStatement preparedStatement1 = ConnectDB.connect.
						prepareStatement("SELECT * FROM adminstaff\r\n"
								+ "WHERE StaffID = ?");
				preparedStatement1.setInt(1, rs.getInt("ID"));
				System.out.println(preparedStatement1);
				ResultSet rs1 = preparedStatement1.executeQuery();
				if(rs1.next()) {
					AdminStaff adminStaff = new AdminStaff();
					adminStaff.setAccount(s.getAccount());
					adminStaff.setID(rs.getInt("ID"));
					adminStaff.setAddress(new AddressDAOImpl().getAddressByID(rs.getInt("AddressID")));
					adminStaff.setFullName(new FullNameDAOImpl().getFullNameByID(rs.getInt("FullNameID")));
					adminStaff.setAge(rs.getInt("age"));
					adminStaff.setExpYear(rs.getInt("ExpYear"));
					adminStaff.setGender(rs.getString("Gender"));
					adminStaff.setSalary(rs.getFloat("Salary"));
					adminStaff.setCertificate(rs1.getString("Certificate"));
					return adminStaff;
				}
				//Warehouse Manage Staff
				PreparedStatement preparedStatement2 = ConnectDB.connect.
						prepareStatement("SELECT * FROM warehousemanagestaff\r\n"
								+ "WHERE StaffID = ?");
				preparedStatement2.setInt(1, rs.getInt("ID"));
				System.out.println(preparedStatement2);
				ResultSet rs2 = preparedStatement2.executeQuery();
				if(rs2.next()) {
					WarehouseManageStaff warehouseManageStaff = new WarehouseManageStaff();
					warehouseManageStaff.setAccount(s.getAccount());
					warehouseManageStaff.setID(rs.getInt("ID"));
					warehouseManageStaff.setAddress(new AddressDAOImpl().getAddressByID(rs.getInt("AddressID")));
					warehouseManageStaff.setFullName(new FullNameDAOImpl().getFullNameByID(rs.getInt("FullNameID")));
					warehouseManageStaff.setAge(rs.getInt("age"));
					warehouseManageStaff.setExpYear(rs.getInt("ExpYear"));
					warehouseManageStaff.setGender(rs.getString("Gender"));
					warehouseManageStaff.setSalary(rs.getFloat("Salary"));
					warehouseManageStaff.setStorageNum(rs2.getInt("StorageNum"));
					return warehouseManageStaff;
				}
				//Website Manage Staff
				PreparedStatement preparedStatement3 = ConnectDB.connect.
						prepareStatement("SELECT * FROM websitemanagestaff\r\n"
								+ "WHERE StaffID = ?");
				preparedStatement3.setInt(1, rs.getInt("ID"));
				System.out.println(preparedStatement3);
				ResultSet rs3 = preparedStatement3.executeQuery();
				if(rs3.next()) {
					WebsiteManageStaff websiteManageStaff = new WebsiteManageStaff();
					websiteManageStaff.setAccount(s.getAccount());
					websiteManageStaff.setID(rs.getInt("ID"));
					websiteManageStaff.setAddress(new AddressDAOImpl().getAddressByID(rs.getInt("AddressID")));
					websiteManageStaff.setFullName(new FullNameDAOImpl().getFullNameByID(rs.getInt("FullNameID")));
					websiteManageStaff.setAge(rs.getInt("age"));
					websiteManageStaff.setExpYear(rs.getInt("ExpYear"));
					websiteManageStaff.setGender(rs.getString("Gender"));
					websiteManageStaff.setSalary(rs.getFloat("Salary"));
					websiteManageStaff.setSeoExp(rs3.getString("SeoExp"));
					return websiteManageStaff;
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}