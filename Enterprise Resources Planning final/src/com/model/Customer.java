package com.model;

public class Customer {

	private int Id;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	private String customerName;
	private String customerCompnayName;
	private String customerPostalAddress;
	private String customerMobNo;
	private String customerBankAccount;
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerCompnayName() {
		return customerCompnayName;
	}
	public void setCustomerCompnayName(String customerCompnayName) {
		this.customerCompnayName = customerCompnayName;
	}
	public String getCustomerPostalAddress() {
		return customerPostalAddress;
	}
	public void setCustomerPostalAddress(String customerPostalAddress) {
		this.customerPostalAddress = customerPostalAddress;
	}
	public String getCustomerMobNo() {
		return customerMobNo;
	}
	public void setCustomerMobNo(String customerMobNo) {
		this.customerMobNo = customerMobNo;
	}
	public String getCustomerBankAccount() {
		return customerBankAccount;
	}
	public void setCustomerBankAccount(String customerBankAccount) {
		this.customerBankAccount = customerBankAccount;
	}
	
}
