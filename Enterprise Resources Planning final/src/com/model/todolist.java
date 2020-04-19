package com.model;

public class todolist {
	int pr;
	String vendor;
	String type;
	private String getType() {
		return type;
	}
	public void setType(String string) {
		this.type = string;
	}
	public int getPr() {
		return pr;
	}
	public void setPr(int pr) {
		this.pr = pr;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	int amount;
	

}
