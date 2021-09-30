package com.subList.model;

import java.util.List;

public interface subListDAO_interface {
	public void insert(subListVO subListVO);
	public void update(subListVO subListVO);
	public void delete(Integer subID);
	public subListVO findBySubID(Integer subID);
	public List<subListVO> findAll();
}
