package com.example.model;

public class CartItems {

	private int userId;
	private int itemId;
	private String itemName;
	private int selectedQuantity;
	private double itemPrice;
	
	
	public double getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}


	public void setUserId(int userId) {
		
		this.userId = userId;
	}
	
	
	public int getUserId() {
		
		return userId;
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

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
	
	
	
}//closing brace of the class.
