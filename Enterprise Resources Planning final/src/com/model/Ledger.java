package com.model;

public class Ledger {
	int id;	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAcTitle() {
		return acTitle;
	}
	public void setAcTitle(String acTitle) {
		this.acTitle = acTitle;
	}
	public int getDebit() {
		return debit;
	}
	public void setDebit(int debit) {
		this.debit = debit;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	String acTitle;
	int debit;
	int credit;
	int balance;


}
