package logicapplication.order;

import model.order.*;

public interface VoucherDAO {

	/**
	 * 
	 * @param v
	 */
	int addVoucher(Voucher v);

	/**
	 * 
	 * @param ID
	 */
	void deleteVoucher(int ID);

	/**
	 * 
	 * @param v
	 */
	void updateVoucher(Voucher v);

	/**
	 * 
	 * @param name
	 */
	Voucher getVoucherByName(String name);

	/**
	 * 
	 * @param ID
	 */
	Voucher getVoucherByID(int ID);

}