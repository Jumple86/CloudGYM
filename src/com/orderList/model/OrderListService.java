package com.orderList.model;

import java.util.List;

public class OrderListService {
	 private OrderListDAO_interface dao;
	 
	 public OrderListService() {
		 dao = new OrderListJDBCDAO();
	 }
	 
	 public OrderListVO addOrderList(Integer orderNo, Integer itemID) {
		 OrderListVO orderListVO = new OrderListVO();
		 
		 orderListVO.setOrderNo(orderNo);
		 orderListVO.setItemID(itemID);
		 dao.insert(orderListVO);
		 return orderListVO;
	 }
	 
	 public OrderListVO updateOrderList(Integer orderNo, Integer itemID, Integer orderListNo) {
		 OrderListVO orderListVO = new OrderListVO();
		 
		 orderListVO.setOrderNo(orderNo);
		 orderListVO.setItemID(itemID);
		 orderListVO.setOrderListNo(orderListNo);
		 dao.update(orderListVO);
		 return orderListVO;
	 }
	 
	 public void deleteOrderList(Integer orderListNo) {
		 dao.delete(orderListNo);
	 }
	 
	 public OrderListVO getOrderListByOrderListNo(Integer orderListNo) {
		 return dao.findByOrderListNo(orderListNo);
	 }
	 
	 public List<OrderListVO> getOrderListByOrderNo(Integer orderNo){
		 return dao.findByOrderNo(orderNo);
	 }
	 
	 public List<OrderListVO> getAll(){
		 return dao.findAll();
	 }
}
