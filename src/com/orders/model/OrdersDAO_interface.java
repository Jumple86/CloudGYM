package com.orders.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.*;

public interface OrdersDAO_interface {
	public void insert(OrdersVO ordersVO);
	public void update(OrdersVO ordersVO);
	public OrdersVO findByOrderNo(Integer orderNo);
	public OrdersVO findByUserID(Integer userID);
	public List<OrdersVO> findByDate(String date);
	public List<OrdersVO> findAll();
	
}