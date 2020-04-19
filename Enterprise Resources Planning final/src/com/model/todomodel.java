package com.model;

public class todomodel {
	String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	int poNo;
    public int getPoNo() {
		return poNo;
	}
	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}
	public int getOrderNo() {
		return OrderNo;
	}
	public void setOrderNo(int orderNo) {
		OrderNo = orderNo;
	}
	public int getMtNo() {
		return MtNo;
	}
	public void setMtNo(int mtNo) {
		MtNo = mtNo;
	}
	public int getMtQuantity() {
		return MtQuantity;
	}
	public void setMtQuantity(int mtQuantity) {
		MtQuantity = mtQuantity;
	}
	int OrderNo;
	int MtNo;
	int MtQuantity;
}
