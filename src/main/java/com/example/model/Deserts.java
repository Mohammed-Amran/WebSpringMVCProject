package com.example.model;

public class Deserts {

	private int desertsId;
	private String itemName;
	private double itemPrice;
	private String imgURL;
	private String itemDesc;
	private String itemType;
	
	
	//Default Constructor
	public Deserts() {
		
	}
	
	public void setItemType(String itemType) {
		
		this.itemType = itemType;
	}

	public String getItemType() {
		
		return itemType;
	}

	public int getId() {
		return desertsId;
	}


	public void setId(int desertsId) {
		this.desertsId = desertsId;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public double getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}


	public String getImgURL() {
		return imgURL;
	}


	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}


	public String getItemDesc() {
		return itemDesc;
	}


	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	
	
	
	
}//closing brace of the class.
