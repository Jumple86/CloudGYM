package com.videoAction.model;

import java.io.Serializable;

public class VideoActionVO implements Serializable {
	private Integer actionNo;
	private Integer videoID;
	private String action;
	private Integer times;
	private Integer sets;
	public Integer getActionNo() {
		return actionNo;
	}
	public void setActionNo(Integer actionNo) {
		this.actionNo = actionNo;
	}
	public Integer getVideoID() {
		return videoID;
	}
	public void setVideoID(Integer videoID) {
		this.videoID = videoID;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Integer getTimes() {
		return times;
	}
	public void setTimes(Integer times) {
		this.times = times;
	}
	public Integer getSets() {
		return sets;
	}
	public void setSets(Integer sets) {
		this.sets = sets;
	}
}
