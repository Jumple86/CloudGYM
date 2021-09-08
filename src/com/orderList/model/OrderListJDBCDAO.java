package com.orderList.model;

import java.util.List;

public class OrderListJDBCDAO implements OrderListDAO_interface {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/GROUP3?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "123456";
	
	private static final String INSERT_STMT = "INSERT INTO orderList(orderNo, itemID) VALUES(?, ?)";
	private static final String UPDATE_STMT = "UPDATE FROM orderList SET orderNo=?, itemID=?";
	private static final String DELETE_STMT = "DELETE FROM orderList WHERE orderListNo=?";
	private static final String FIND_BY_ORDERLISTNO = "SELECT * FROM orderList WHERE orderListNo=?";
	private static final String FIND_BY_ORDERNO = "SELECT * FROM orderList WHERE orderNo=?";
	private static final String FIND_ALL = "SELECT * FROM orderList";
	
	
	@Override
	public void insert(OrderListVO orderListVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void update(OrderListVO orderListVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(Integer orderListNo) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public OrderListVO findByOrderListNo(Integer orderListNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<OrderListVO> findByOrderNo(Integer orderNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<OrderListVO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}


}