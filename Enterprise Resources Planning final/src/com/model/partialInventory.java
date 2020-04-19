package com.model;

public class partialInventory {
	int PInvId;
	public int getPInvId() {
		return PInvId;
	}
	public void setPInvId(int pInvId) {
		PInvId = pInvId;
	}
	public int getMaterialId() {
		return MaterialId;
	}
	public void setMaterialId(int materialId) {
		MaterialId = materialId;
	}
	public int getMaterialTypeId() {
		return MaterialTypeId;
	}
	public void setMaterialTypeId(int materialTypeId) {
		MaterialTypeId = materialTypeId;
	}
	public int getBinId() {
		return BinId;
	}
	public void setBinId(int binId) {
		BinId = binId;
	}
	public int getBatchId() {
		return BatchId;
	}
	public void setBatchId(int batchId) {
		BatchId = batchId;
	}
	int MaterialId;
	int MaterialTypeId;
	int BinId;
	int BatchId;
	String name;
	int Mprice;
	int materialQuantity;
	
	public int getMaterialQuantity() {
		return materialQuantity;
	}
	public void setMaterialQuantity(int materialQuantity) {
		this.materialQuantity = materialQuantity;
	}
	public int getMprice() {
		return Mprice;
	}
	public void setMprice(int mprice) {
		Mprice = mprice;
	}
	public int getGrId() {
		return GrId;
	}
	public void setGrId(int grId) {
		GrId = grId;
	}
	int GrId;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
