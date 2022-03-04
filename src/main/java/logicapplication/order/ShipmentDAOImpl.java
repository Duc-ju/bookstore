package logicapplication.order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import config.ConnectDB;
import model.order.*;

public class ShipmentDAOImpl implements ShipmentDAO {

	/**
	 * 
	 * @param s
	 */
	public int addShipment(Shipment s) {
		String insert = "insert into shipment(Type, Cost, Address) values(?,?,?)";
        try {
            PreparedStatement ps = ConnectDB.connect.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, s.getType());
            ps.setFloat(2, s.getCost());
            ps.setString(3, s.getAddress());
            ps.executeUpdate();
            ResultSet result = ps.getGeneratedKeys();
            if(result.next()){
                return result.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
		return -1;
	}

	/**
	 * 
	 * @param ID
	 */
	public void deleteShipment(int ID) {
		// TODO - implement ShipmentDAOImpl.deleteShipment
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param s
	 */
	public void updateShipment(Shipment s) {
		// TODO - implement ShipmentDAOImpl.updateShipment
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param ID
	 */
	public Shipment getShipmentByID(int ID) {
		// TODO - implement ShipmentDAOImpl.getShipmentByID
		String selectString = "SELECT * FROM shipment WHERE id = ?";
		try {
            PreparedStatement ps = ConnectDB.connect.prepareStatement(selectString);
            ps.setInt(1, ID);
            ResultSet result = ps.executeQuery();
            if(result.next()){
            	return new Shipment(result.getInt("ID"),
            			result.getString("Type"),
            			result.getFloat("Cost"),
            			result.getString("Address"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
		return null;
	}

	@Override
	public Payment getPayment(Payment p) {
		// TODO Auto-generated method stub
		return null;
	}

	

}