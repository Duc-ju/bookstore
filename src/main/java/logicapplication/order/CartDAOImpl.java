package logicapplication.order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectDB;
import logicapplication.book.BookItemDAOImpl;
import model.book.BookItem;
import model.customer.Customer;
import model.order.*;

public class CartDAOImpl implements CartDAO {

	/**
	 * 
	 * @param c
	 */
	public void addBookItem(Cart c) {
		try {
			
			PreparedStatement preparedStatement = ConnectDB.connect
					.prepareStatement("INSERT INTO cart_bookitem(CartID, BookItemID) " + "VALUES (?, ?);");
			preparedStatement.setInt(1, c.getID());
			preparedStatement.setInt(2, c.getBookItems().get(0).getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param c
	 */
	public void deleteBookItem(Cart c) {
		try {

			PreparedStatement preparedStatement = ConnectDB.connect
					.prepareStatement("DELETE FROM cart_bookitem WHERE CartID = ? AND BookItemID = ?;");
			preparedStatement.setInt(1, c.getID());
			preparedStatement.setInt(2, c.getBookItems().get(0).getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param c
	 */
	public int addCart(Cart c) {
		try {
        	PreparedStatement preparedStatement = ConnectDB.connect.
    				prepareStatement("INSERT INTO `cart` VALUES (null)");

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            try {
    			PreparedStatement preparedStatement1 = ConnectDB.connect.
    					prepareStatement("SELECT MAX(ID) FROM cart");
    			System.out.println(preparedStatement1);
    			ResultSet rs1 = preparedStatement1.executeQuery();
    			if(rs1.next()) {
					return rs1.getInt(1);
				}
    			return rs1.getInt(1);
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}

        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return 0;
	}

	/**
	 * 
	 * @param ID
	 */
	public Cart getCartByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect
					.prepareStatement("SELECT * FROM cart where ID=?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			Cart cart = new Cart();
			if(rs.next()) {
				cart.setID(rs.getInt(1));
				cart.setBookItems(new CartDAOImpl().getBookItems(cart));
				cart.setQuantity(cart.getBookItems().size());
				float total = 0;
				for(BookItem bookItem : cart.getBookItems()) {
					total+=bookItem.getPrices()*(1-bookItem.getDiscount());
				}
				cart.setTotalPrices(total);
				return cart;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @param c
	 */
	public void updateCart(Cart c) {
		// TODO - implement CartDAOImpl.updateCart
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param ID
	 */
	public void deleteCart(int ID) {
		// TODO - implement CartDAOImpl.deleteCart
		throw new UnsupportedOperationException();
	}

	@Override
	public List<BookItem> getBookItems(Cart c) {
		List<BookItem> bookItems = new ArrayList<BookItem>();
		try {

			PreparedStatement preparedStatement = ConnectDB.connect
					.prepareStatement("SELECT BookItemID FROM cart_bookitem WHERE CartID = ?");
			preparedStatement.setInt(1, c.getID());
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				bookItems.add(new BookItemDAOImpl().getBookItemByID(rs.getInt("BookItemID")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookItems;
	}

	@Override
	public Payment getPayment(Payment p) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}