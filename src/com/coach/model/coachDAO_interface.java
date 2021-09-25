package com.coach.model;

import java.util.List;

public interface coachDAO_interface {
	public void insert(coachVO coachVO);
	public void update(coachVO coachVO);
	public void delete(Integer userID);
	public coachVO findByUserID(Integer userID);
	public List<coachVO>findAll();
}
