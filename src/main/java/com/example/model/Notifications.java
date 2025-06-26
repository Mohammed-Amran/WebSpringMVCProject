package com.example.model;

public class Notifications {

	private int notifiId;
	private int userId;
	private int orderId;
	private String itemName;
	private String deliveryAddress;
	private String status;
	private boolean isRead;
	
	
	//Constructor
	public Notifications() {}


	//Getters & Setters
	public int getNotifiId() {
		return notifiId;
	}


	public void setNotifiId(int notifiId) {
		this.notifiId = notifiId;
	}

	
	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}
	

	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
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


	public boolean isRead() {
		return isRead;
	}


	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}
	
	
	
	
	
	
}//closing brace of the class.
