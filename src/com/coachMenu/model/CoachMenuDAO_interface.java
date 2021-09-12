package com.coachMenu.model;

import java.util.List;

public interface CoachMenuDAO_interface {
	public void insert(CoachMenuVO coachMenuVO);
	public void update(CoachMenuVO coachMenuVO);
	public void delete(Integer menuID);
	public CoachMenuVO findByMenuID(Integer menuID);
	public List<CoachMenuVO> findByUserID(Integer userID);
	public List<CoachMenuVO> findAll();
}
