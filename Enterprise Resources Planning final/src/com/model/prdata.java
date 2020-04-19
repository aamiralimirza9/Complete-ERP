package com.model;

public class prdata {
	int PrId;
	public int getPrId() {
		return PrId;
	}
	public void setPrId(int prId) {
		PrId = prId;
	}
	public int getVendorId() {
		return VendorId;
	}
	public void setVendorId(int vendorId) {
		VendorId = vendorId;
	}
	public int getProOrderId() {
		return ProOrderId;
	}
	public void setProOrderId(int proOrderId) {
		ProOrderId = proOrderId;
	}
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public int getActive() {
		return Active;
	}
	public void setActive(int active) {
		Active = active;
	}
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	int orderID;
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	int VendorId;
	int ProOrderId;
	int ProductId;
	int Active;
	int paymentId;
	String name;
	String Deliverydate;
	public String getDeliverydate() {
		return Deliverydate;
	}
	public void setDeliverydate(String deliverydate) {
		Deliverydate = deliverydate;
	}
	public String getCurrentdate() {
		return currentdate;
	}
	public void setCurrentdate(String currentdate) {
		this.currentdate = currentdate;
	}
	String currentdate;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
