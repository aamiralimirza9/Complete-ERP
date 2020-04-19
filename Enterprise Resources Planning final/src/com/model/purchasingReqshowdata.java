package com.model;

public class purchasingReqshowdata {

	int productionOId;
	public int getProductionOId() {
		return productionOId;
	}
	public void setProductionOId(int productionOId) {
		this.productionOId = productionOId;
	}
	public int getProductionId() {
		return productionId;
	}
	public void setProductionId(int productionId) {
		this.productionId = productionId;
	}
	public String getMaterialName() {
		return MaterialName;
	}
	public void setMaterialName(String materialName) {
		MaterialName = materialName;
	}
	public int getPrQuantity() {
		return prQuantity;
	}
	public void setPrQuantity(int prQuantity) {
		this.prQuantity = prQuantity;
	}
	public int getMaterialPrice() {
		return MaterialPrice;
	}
	public void setMaterialPrice(int materialPrice) {
		MaterialPrice = materialPrice;
	}
	public String getVendorName() {
		return VendorName;
	}
	public void setVendorName(String vendorName) {
		VendorName = vendorName;
	}
	int productionId;
	String MaterialName;
	int prQuantity;
	int MaterialPrice;
	String VendorName;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	int orderId;
	
}
