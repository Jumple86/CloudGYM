<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orders.model.*" %>

<%
	OrdersService ordersSvc = new OrdersService();
	List<OrdersVO> list = ordersSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach var="orders" items="${list}">
			<tr>
				<td>${orders.orderNo}</td>
				<td>${orders.userID}</td>
				<td>${orders.builtDate}</td>
				<td>${orders.totalPrice}</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>