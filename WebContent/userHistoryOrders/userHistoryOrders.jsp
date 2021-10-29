<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="orderlistSvc" scope="page"
	class="com.orderList.model.OrderListService" />
<jsp:useBean id="videoSvc" scope="page"
	class="com.video.model.VideoService" />
<jsp:useBean id="coachSvc" scope="page"
	class="com.coachMenu.model.CoachMenuService" />
<jsp:useBean id="subSvc" scope="page"
	class="com.subscription.model.SubscriptionService" />
<jsp:useBean id="sublistSvc" scope="page"
	class="com.subList.model.SubListService" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>個人歷史訂單</title>
<link rel="stylesheet" href="./css/style.css">
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>

<style>
* {
	margin: 0;
}

li {
	list-style-type: none;
}

body {
	background-color: #31105E !important;
}

#bar {
	height: 40px;
	background-color: #5C37A1;
	overflow: hidden;
	position: fixed;
	width: 100%;
	z-index: 10;
}

#title {
	float: left;
	margin-left: 20px;
	overflow: hidden;
}

img {
	width: 35px;
	margin-top: 3px;
}

.bar_li {
	float: left;
}

a {
	color: #fff;
	text-decoration: none;
	line-height: 40px;
	margin-left: 10px;
}

#option {
	float: right;
	overflow: hidden;
}

.option {
	float: left;
	color: white;
	line-height: 40px;
	margin: 0 10px;
	font-size: 14px;
}

.content {
	padding: 30px;
	width: 70%;
	background-color: #DED0F3;
	border-radius: 1%;
	display: inline-block;
}

.page {
	padding-top: 70px;
	color: white;
}
</style>
</head>

<body>
	<div id="bar">
		<div id="title">
			<ul>
				<li class="bar_li"><img src="./img/logo.png" alt=""
					for="#CloudGYM"></li>
				<li class="bar_li"><a href="#" id="CloudGYM">CloudGYM</a></li>
			</ul>
		</div>
		<div id="option">
			<ul>
				<li class="option">運動類型</li>
				<li class="option">教練</li>
				<li class="option">個人專區</li>
				<li class="option">討論區</li>
				<li class="option">註冊/登入</li>
				<li class="option"><svg xmlns="http://www.w3.org/2000/svg"
						width="25" height="25" fill="currentColor" class="bi bi-cart-fill"
						viewBox="0 0 16 16">
                        <path
							d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                    </svg></li>
			</ul>
		</div>
	</div>

	<div class="container page">
		<h5 style="text-align: center;">歷史訂單</h5>
		<br>
		<c:forEach var="orders" items="${orders}">
			<div class="card">
				<div class="card-header" style="color: black; font-weight: bold;">訂單編號：
					${orders.orderNo}</div>
				<div class="card-body" style="color: grey;">

					<c:forEach var="orderlist"
						items="${orderlistSvc.getOrderListByOrderNo(orders.orderNo)}">
						<c:if test="${orderlist.itemID.toString().startsWith(3)}">
							<p class="card-text">購買品項：${videoSvc.findByPrimaryKey(orderlist.itemID).title}</p>
						</c:if>
						<c:if test="${orderlist.itemID.toString().startsWith(6)}">
							<p class="card-text">購買品項：${coachSvc.getByMenuID(orderlist.itemID).menuName}</p>
						</c:if>
						<c:if test="${orderlist.itemID.toString().startsWith(7)}">
							<p class="card-text">購買品項：${sublistSvc.getBySubID(orderlist.itemID).subName}</p>
						</c:if>

					</c:forEach>
					<br>
					
					<p class="card-text">訂單總金額： ${orders.totalPrice}</p>
					<p class="card-text">訂單建立時間： ${orders.builtDate}</p>
				</div>
			</div>
			<br>
		</c:forEach>
	</div>
</body>

</html>