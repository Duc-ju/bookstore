package logicapplication.book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectDB;
import model.book.*;

public class CategoryDAOImpl implements CategoryDAO {

	/**
	 * 
	 * @param c
	 */
	public int addCategory(Category c) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect
					.prepareStatement("INSERT INTO `category`" + "  (Name) VALUES " + " (?);");
			preparedStatement.setString(1, c.getName());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			try {
				PreparedStatement preparedStatement1 = ConnectDB.connect.prepareStatement("SELECT MAX(ID) FROM `author`;");
				System.out.println(preparedStatement1);
				ResultSet rs1 = preparedStatement1.executeQuery();
				if (rs1.next()) {
					return rs1.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 
	 * @param c
	 */
	public void updateCategory(Category c) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("UPDATE `category` SET `Name`=? WHERE ID=?");
			preparedStatement.setString(1, c.getName());
			preparedStatement.setInt(2, c.getID());
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
	public void deleteCategory(int ID) {
		// TODO - implement CategoryDAOImpl.deleteCategory
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param ID
	 */
	public Category getCategoryByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM category WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				Category category = new Category();
				category.setID(rs.getInt(1));
				category.setName(rs.getString(2));
				return category;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Category> getAllCategories() {
		List<Category> categories = new ArrayList<>();
      	try {
             	PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM category;");
             	System.out.println(preparedStatement);
             	ResultSet rs = preparedStatement.executeQuery();

             	while (rs.next()) {
                   	int id = rs.getInt("ID");
                   	String name = rs.getString("Name");


                   	categories.add(new Category(id, name));
             	}
      	} catch (SQLException e) {
             	// TODO Auto-generated catch block
             	e.printStackTrace();
      	}
      	return categories;
	}

}