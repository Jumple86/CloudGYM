package com.video.model;

import java.util.List;

public interface VideoDAO_interface {
	void add(VideoVO videoVO);
	void update(VideoVO videoVO);
	void delete(Integer videoID);
	VideoVO findByPrimaryKey(Integer videoID);
	List<VideoVO> findByUserID(Integer userID);
	List<VideoVO> getAll();
	
}
