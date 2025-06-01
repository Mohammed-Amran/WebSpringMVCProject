package com.example.model;

public class Breads {

private int breadsId;
private String itemName;
private double itemPrice;
private String imgURL;
private String itemDesc;
private String itemType;


//Default constructor.
public Breads() {
	
}//closing brace of the default constructor.


public String getItemType() {
	return itemType;
}


public void setItemType(String itemType) {
	this.itemType = itemType;
}



public int getId() {
	return breadsId;
}


public void setId(int breadsId) {
	this.breadsId = breadsId;
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
