package logicapplication.order;

import model.order.*;

public interface ShipmentDAO {

	/**
	 * 
	 * @param s
	 */
	int addShipment(Shipment s);

	/**
	 * 
	 * @param ID
	 */
	void deleteShipment(int ID);

	/**
	 * 
	 * @param s
	 */
	void updateShipment(Shipment s);

	/**
	 * 
	 * @param ID
	 */
	Shipment getShipmentByID(int ID);

	/**
	 * 
	 * @param p
	 */
	Payment getPayment(Payment p);
}