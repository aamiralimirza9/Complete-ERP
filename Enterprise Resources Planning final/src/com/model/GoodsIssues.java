package com.model;

public class GoodsIssues {
	int gId;
	public int getgId() {
		return gId;
	}
	public void setgId(int gId) {
		this.gId = gId;
	}
	public int getBatchId() {
		return batchId;
	}
	public void setBatchId(int batchId) {
		this.batchId = batchId;
	}
	public String getGiDate() {
		return giDate;
	}
	public void setGiDate(String giDate) {
		this.giDate = giDate;
	}
	public String getGiLocation() {
		return GiLocation;
	}
	public void setGiLocation(String giLocation) {
		GiLocation = giLocation;
	}
	public int getBinId() {
		return BinId;
	}
	public void setBinId(int binId) {
		BinId = binId;
	}
	public int getPissuesId() {
		return PissuesId;
	}
	public void setPissuesId(int pissuesId) {
		PissuesId = pissuesId;
	}
	public int getMaterialNo() {
		return materialNo;
	}
	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}
	public int getMtQuantity() {
		return mtQuantity;
	}
	public void setMtQuantity(int mtQuantity) {
		this.mtQuantity = mtQuantity;
	}
	public int getMtPrice() {
		return mtPrice;
	}
	public void setMtPrice(int mtPrice) {
		this.mtPrice = mtPrice;
	}
	int batchId;
	String giDate;
	String  GiLocation;
	int BinId;
	int PissuesId;
	int materialNo;
	int mtQuantity;
	int mtPrice;
	
	

}
