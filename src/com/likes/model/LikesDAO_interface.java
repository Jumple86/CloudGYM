package com.likes.model;

import java.util.List;

public interface LikesDAO_interface {
	
	public void insert(LikesVO likesVO);
//	public void update(LikesVO likesVO);
	public void delete(Integer likesID);
	public LikesVO findByPrimaryKey(Integer likesID);
//	public LikesVO findByUserID(Integer userID);
	public List<LikesVO> findAll();
}
