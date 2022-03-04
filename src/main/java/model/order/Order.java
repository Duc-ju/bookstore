package model.order;

import model.customer.*;

public class Order {

	private int ID;
	private String status;
	private float totalAmount;
	private Customer customer;
	private Cart cart;
	private Voucher voucher;
	private Shipment shipment;
	private Payment payment;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Voucher getVoucher() {
		return voucher;
	}
	public void setVoucher(Voucher voucher) {
		this.voucher = voucher;
	}
	public Shipment getShipment() {
		return shipment;
	}
	public void setShipment(Shipment shipment) {
		this.shipment = shipment;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public Order(int iD, String status, float totalAmount, Customer customer, Cart cart, Voucher voucher,
			Shipment shipment, Payment payment) {
		super();
		ID = iD;
		this.status = status;
		this.totalAmount = totalAmount;
		this.customer = customer;
		this.cart = cart;
		this.voucher = voucher;
		this.shipment = shipment;
		this.payment = payment;
	}
	public Order(String status, float totalAmount, Customer customer, Cart cart, Voucher voucher, Shipment shipment,
			Payment payment) {
		super();
		this.status = status;
		this.totalAmount = totalAmount;
		this.customer = customer;
		this.cart = cart;
		this.voucher = voucher;
		this.shipment = shipment;
		this.payment = payment;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Object getHeaderItem() {
		if(cart.getBookItems().size()>0) return (Object)cart.getBookItems().get(0);
		return null;
	}

}