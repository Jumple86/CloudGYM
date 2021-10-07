package com.thePosition.model;

import java.io.Serializable;

public class ThePositionVO implements Serializable{
	private Integer positionNo;
	private String positionName;
	public Integer getPositionNo() {
		return positionNo;
	}
	public void setPositionNo(Integer positionNo) {
		this.positionNo = positionNo;
	}
	public String getPostionName() {
		return positionName;
	}
	public void setPostionName(String postionName) {
		this.positionName = postionName;
	}
}
