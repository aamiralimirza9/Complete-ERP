package com.model;

public class ProductType {
	private int id;
	private String productTypeName;
	public int getId() {
		return id;
	}
	public String getProductTypeName() {
		return productTypeName;
	}
	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}
	public void setId(int i) {
		this.id = i;
	}
	private String productCategoryName;
	private String allocationNo;
	public String getProductCategoryName() {
		return productCategoryName;
	}
	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}
	public String getAllocationNo() {
		return allocationNo;
	}
	public void setAllocationNo(String alloNumber) {
		this.allocationNo = alloNumber;
	}
	
}
