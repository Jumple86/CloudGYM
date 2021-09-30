package com.subscription.model;

import java.util.List;

public class SubscriptionService {
	private SubscriptionDAO_interface dao;
	
	public SubscriptionService() {
		dao = new SubscriptionJDBCDAO();
	}
	
	public SubscriptionVO addSubscription(Integer subNo,Integer subID,Integer userID) {
		SubscriptionVO subscriptionVO = new SubscriptionVO();
		
		subscriptionVO.setSubNo(subNo);
		subscriptionVO.setSubID(subID);
		subscriptionVO.setUserID(userID);
		dao.insert(subscriptionVO);
		
		return subscriptionVO;
	}
	
	public void addSubscription(SubscriptionVO subscriptionVO) {
		dao.insert(subscriptionVO);
	}
	
	public SubscriptionVO updateSubscription(Integer subNo,Integer subID,Integer userID) {
		SubscriptionVO subscriptionVO = new SubscriptionVO();
		
		subscriptionVO.setSubNo(subNo);
		subscriptionVO.setSubID(subID);
		subscriptionVO.setUserID(userID);
		
		dao.update(subscriptionVO);
		
		return subscriptionVO;
	}
	
	public void updateSubscription(SubscriptionVO subscriptionVO) {
		dao.update(subscriptionVO);
	}
	
	public void deleteSubscription(Integer subNo) {
		dao.delete(subNo);
	}
	
	public SubscriptionVO getBySubNo(Integer subNo) {
		return dao.findBySubNo(subNo);
	}
	public List<SubscriptionVO> getAll() {
		return dao.findAll();
	}
}
