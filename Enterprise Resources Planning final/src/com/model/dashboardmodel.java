package com.model;

public class dashboardmodel {
	int expense;
	int sale;
	int profit;
	int cash;
	int payable;
	int recieveable;
	public int getPayable() {
		return payable;
	}
	public void setPayable(int payable) {
		this.payable = payable;
	}
	public int getRecieveable() {
		return recieveable;
	}
	public void setRecieveable(int recieveable) {
		this.recieveable = recieveable;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public int getExpense() {
		return expense;
	}
	public void setExpense(int expense) {
		this.expense = expense;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}

}
