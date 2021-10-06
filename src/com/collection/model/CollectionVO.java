package com.collection.model;

import java.io.Serializable;

public class CollectionVO implements Serializable{
	
	private Integer collectionNo;
	private Integer userID;
	private Integer menuID;
	private Integer videoID;
		
	public CollectionVO() {
		super();
	}
		
	public CollectionVO(Integer collectionNo, Integer userID, Integer menuID, Integer videoID) {
		super();
		this.collectionNo = collectionNo;
		this.userID = userID;
		this.menuID = menuID;
		this.videoID = videoID;
	}

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
	public Integer getMenuID() {
		return menuID;
	}
	public void setMenuID(Integer menuID) {
		this.menuID = menuID;
	}
	public Integer getVideoID() {
		return videoID;
	}
	public void setVideoID(Integer videoID) {
		this.videoID = videoID;
	}
	
	

}
