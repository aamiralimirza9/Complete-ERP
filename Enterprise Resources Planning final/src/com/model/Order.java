package com.model;

public class Order {

	private int productId;
	private int customerId;
	private String deleveryDate;
	private int orderState;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getDeleveryDate() {
		return deleveryDate;
	}
	public void setDeleveryDate(String deleveryDate) {
		this.deleveryDate = deleveryDate;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
     
}
