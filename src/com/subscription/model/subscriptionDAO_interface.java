package com.subscription.model;

import java.util.List;

public interface subscriptionDAO_interface {
	public void insert(subscriptionVO subscriptionVO);
	public void update(subscriptionVO subscriptionVO);
	public void delete(Integer subNo);
	public subscriptionVO findBySubNo(Integer subNo);
	public List<subscriptionVO> findAll();
}
