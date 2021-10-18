package com.orders.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.*;

public interface OrdersDAO_interface {
	public Integer insert(OrdersVO ordersVO);
	public void update(OrdersVO ordersVO);
	public OrdersVO findByOrderNo(Integer orderNo);
	public List<OrdersVO> findByUserID(Integer userID);
	public List<OrdersVO> findByDate(String date);
	public List<OrdersVO> findAll();
	
}