package com.model;

public class InventoryGoodsRecipts {
	
	int GrNo;
	public int getGrNo() {
		return GrNo;
	}
	public void setGrNo(int grNo) {
		GrNo = grNo;
	}
	public int getProductionOrder() {
		return ProductionOrder;
	}
	public void setProductionOrder(int productionOrder) {
		ProductionOrder = productionOrder;
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public int getGrQuantity() {
		return GrQuantity;
	}
	public void setGrQuantity(int grQuantity) {
		GrQuantity = grQuantity;
	}
	public String getGrDeliveryDate() {
		return GrDeliveryDate;
	}
	public void setGrDeliveryDate(String grDeliveryDate) {
		GrDeliveryDate = grDeliveryDate;
	}
	public int getGrStock() {
		return GrStock;
	}
	public void setGrStock(int grStock) {
		GrStock = grStock;
	}
	public int getPrId() {
		return PrId;
	}
	public void setPrId(int prId) {
		PrId = prId;
	}
	int ProductionOrder;
	int OrderId;
	int GrQuantity;
	String GrDeliveryDate;
	int GrStock;
	int PrId;
	String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
