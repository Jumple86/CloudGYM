package com.collection.model;

import java.io.Serializable;

public class CollectionVO implements Serializable{
	
	private Integer collectionNo;
	private Integer userID;
	private Integer itemID;
	public Integer getCollectionNo() {
		return collectionNo;
	}
	public void setCollectionNo(Integer collectionNo) {
		this.collectionNo = collectionNo;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public Integer getItemID() {
		return itemID;
	}
	public void setItemID(Integer itemID) {
		this.itemID = itemID;
	}
}
