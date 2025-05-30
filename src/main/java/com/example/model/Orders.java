package com.example.model;

public class Orders {

	//Instance variables:
	private int orderId;
	private int userId;
	private String userPhoneNo;
	private int itemId;
	private String itemName;
	private int selectedQuantity;
	private int itemPriceSum;
	private String location;
	private String deliveryAddress;
	private String status;
	
	
	public Orders() {}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserPhoneNo() {
		return userPhoneNo;
	}


	public void setUserPhoneNo(String userPhoneNo) {
		this.userPhoneNo = userPhoneNo;
	}


	public int getItemId() {
		return itemId;
	}


	public void setItemId(int itemId) {
		this.itemId = itemId;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public int getSelectedQuantity() {
		return selectedQuantity;
	}


	public void setSelectedQuantity(int selectedQuantity) {
		this.selectedQuantity = selectedQuantity;
	}


	public int getItemPriceSum() {
		return itemPriceSum;
	}


	public void setItemPriceSum(int itemPriceSum) {
		this.itemPriceSum = itemPriceSum;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getDeliveryAddress() {
		return deliveryAddress;
	}


	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}//closing brace of the class.
