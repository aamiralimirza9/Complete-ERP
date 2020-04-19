package com.model;

public class OrderInvoice {

	private int oInviceId;
	private String dDescription;
	private String dDate;
	private String dFrom;
	private String dTo;
	private String driverName;
	private int   vechileNo;
	private int   price; 
	private int   customerNo;
	private int   contactNo;
	private int   weight;
	private int   dId;
	private int routId;
	private int venderId;
	private int paymentAmount;
	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getdDescription() {
		return dDescription;
	}

	public void setdDescription(String dDescription) {
		this.dDescription = dDescription;
	}

	public String getdDate() {
		return dDate;
	}

	public void setdDate(String dDate) {
		this.dDate = dDate;
	}

	public String getdFrom() {
		return dFrom;
	}

	public void setdFrom(String dFrom) {
		this.dFrom = dFrom;
	}

	public String getdTo() {
		return dTo;
	}

	public void setdTo(String dTo) {
		this.dTo = dTo;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public int getVechileNo() {
		return vechileNo;
	}

	public void setVechileNo(int vechileNo) {
		this.vechileNo = vechileNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public int getContactNo() {
		return contactNo;
	}

	public void setContactNo(int contactNo) {
		this.contactNo = contactNo;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public int getRoutId() {
		return routId;
	}

	public void setRoutId(int routId) {
		this.routId = routId;
	}

	public int getVenderId() {
		return venderId;
	}

	public void setVenderId(int venderId) {
		this.venderId = venderId;
	}

	
	public int getoInviceId() {
		return oInviceId;
	}

	public void setoInviceId(int oInviceId) {
		this.oInviceId = oInviceId;
	}
}
