package com.model;

public class Vendor {
int VId;
public int getVId() {
	return VId;
}
public void setVId(int vId) {
	VId = vId;
}
public String getVName() {
	return VName;
}
public void setVName(String vName) {
	VName = vName;
}
public String getCompanyTile() {
	return companyTile;
}
public void setCompanyTile(String companyTile) {
	this.companyTile = companyTile;
}
public String getCompanyAddress() {
	return companyAddress;
}
public void setCompanyAddress(String companyAddress) {
	this.companyAddress = companyAddress;
}
public int getVcontact() {
	return Vcontact;
}
public void setVcontact(int vcontact) {
	Vcontact = vcontact;
}
public int getVmobile() {
	return vmobile;
}
public void setVmobile(int vmobile) {
	this.vmobile = vmobile;
}
public int getVNtn() {
	return VNtn;
}
public void setVNtn(int vNtn) {
	VNtn = vNtn;
}
String VName;
String companyTile;
String companyAddress;
int    Vcontact;
int    vmobile;
int    VNtn;
String  BankName;
public String getBankName() {
	return BankName;
}
public void setBankName(String bankName) {
	BankName = bankName;
}
public int getBankAccount() {
	return BankAccount;
}
public void setBankAccount(int bankAccount) {
	BankAccount = bankAccount;
}
int BankAccount;

}
