package com.model;

public class Journal {

	String jvdate;
	int jvno;
	String debit;
	String credit;
	int dbamount;
	int cramount;
	public String getJvdate() {
		return jvdate;
	}
	public void setJvdate(String jvdate) {
		this.jvdate = jvdate;
	}
	public int getJvno() {
		return jvno;
	}
	public void setJvno(int jvno) {
		this.jvno = jvno;
	}
	public String getDebit() {
		return debit;
	}
	public void setDebit(String debit) {
		this.debit = debit;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public int getDbamount() {
		return dbamount;
	}
	public void setDbamount(int dbamount) {
		this.dbamount = dbamount;
	}
	public int getCramount() {
		return cramount;
	}
	public void setCramount(int cramount) {
		this.cramount = cramount;
	}
	
}
