package com.model;

public class Product {
	
	private String productName;
	private int productPrice;
	private String productionPlant;
	private String storageLocation;
	private int materialGroup;
	private int unit;
	private int weight;
	private int availbilityCheck;
	private int productTypeId;
	private int product_id;
	private int getProduct_id() {
		return product_id;
	}
	private void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductionPlant() {
		return productionPlant;
	}
	public void setProductionPlant(String productionPlant) {
		this.productionPlant = productionPlant;
	}
	public String getStorageLocation() {
		return storageLocation;
	}
	public void setStorageLocation(String storageLocation) {
		this.storageLocation = storageLocation;
	}
	public int getMaterialGroup() {
		return materialGroup;
	}
	public void setMaterialGroup(int matGroup) {
		this.materialGroup = matGroup;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getAvailbilityCheck() {
		return availbilityCheck;
	}
	public void setAvailbilityCheck(int availbilityCheck) {
		this.availbilityCheck = availbilityCheck;
	}
	public int getProductTypeId() {
		return productTypeId;
	}
	public void setProductTypeId(int productTypeId) {
		this.productTypeId = productTypeId;
	}
	

}
