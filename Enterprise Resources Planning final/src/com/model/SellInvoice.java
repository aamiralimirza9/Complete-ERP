package com.model;

public class SellInvoice {

	private String 	productName;
	private int quantity;
	private int price;
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSellInvoiceId() {
		return sellInvoiceId;
	}
	public void setSellInvoiceId(int sellInvoiceId) {
		this.sellInvoiceId = sellInvoiceId;
	}
	private int sellInvoiceId;
}
