<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.collection.model.*" %>
<%@ page import="com.video.model.*" %>
<%@ page import="com.orders.model.*" %>
<%@ page import="com.orderList.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="menuSvc" scope="page" class="com.customMenu.model.CustomMenuService" />
<jsp:useBean id="rightsSvc" scope="page" class="com.userRights.model.UserRightsService" />
<jsp:useBean id="videoSvc" scope="page" class="com.video.model.VideoService" />
<jsp:useBean id="collectionSvc" scope="page" class="com.collection.model.CollectionService" />
<jsp:useBean id="coachSvc" scope="page" class="com.coachMenu.model.CoachMenuService" />
<jsp:useBean id="postsSvc" scope="page" class="com.posts.model.PostsService" />

<%
	List<CollectionVO> collectionlist = collectionSvc.getByUserId(1003);
	List<OrdersVO> order = new OrdersService().getOrdersByUserID(1003);
	List<Integer> itemIDs = new ArrayList<>();
	for(OrdersVO ordersVO : order){
		List<OrderListVO> list = new OrderListService().getOrderListByOrderNo(ordersVO.getOrderNo());
		for(OrderListVO orderlist : list){
			Integer itemID = orderlist.getItemID();
			itemIDs.add(itemID);
		}
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>個人專區總覽</title>

<link rel="stylesheet" href="/page-1/css/style.css">

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

.page {
	overflow: hidden;
	padding-top: 70px;
	padding-bottom: 100px;
}

.first-row {
	overflow: hidden;
}

.overview {
	background-color: #DED0F3;
	padding: 15px 15px;
}

.overview p {
	display: inline-block;
	padding-right: 18px;
	margin-top: 25px;
	font-size: 14px;
}

.info {
	text-align: right;
	color: white;
}

.second-row {
	padding: 50px 0 20px;
	height: 370px;
}

.second-row .menu {
	background-color: #DED0F3;
	margin-right: 40px;
	overflow: scroll !important;
	max-height: 300px;
	border-radius: 5px;
}

.second-row .menu h5 {
	text-align: center;
	margin: 20px 0 20px;
}

.second-row .progress {
	background-color: #DED0F3
}

.progress {
	display: inline-block;
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

.bi {
	margin-top: 7px;
}

#option img {
	color: white;
}

.bar {
	width: 55%;
	float: right;
}

.menu {
	padding-bottom: 3%;
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
		<div class="row first-row">
			<div class="col-4 overview">
				<h5>我的總覽</h5>
				<p>菜單：10</p>
				<p>運動歷程完成度:80%</p>
				<p>收藏數：<%=collectionlist.size() %></p>
			</div>
			<div class="col-8 info">
				<ul>
					<li>修改個人資料</li>
					<li>修改密碼</li>
					<li>歷史訂單</li>
					<li>我的文章</li>
				</ul>
			</div>
		</div>


		<div class="row gx-5 second-row ">
			<div class="col menu">
				<h5>我的菜單</h5>
				<ul class="list-group">
					<c:forEach var="customMenuVO" items="${menuSvc.getAll(1003)}">
						<li class="list-group-item">${customMenuVO.title}</li>
					</c:forEach>
				</ul>
			</div>
			<div class="col menu">
				<h5>我的運動歷程</h5>

				<ul class="list-group">
					<c:forEach var="customMenuVO" items="${menuSvc.getAll(1003)}">
						<li class="list-group-item">${customMenuVO.title}

							<div class="progress bar">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 75%;" aria-valuenow="75" aria-valuemin="0"
									aria-valuemax="100">75%</div>
							</div>

						</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="row gx-5 second-row ">
			<div class="col menu">
				<h5>已購買</h5>
				<ul class="list-group">
<%-- 					<c:forEach var="userRightsVO" items="${rightsSvc.getAll(1003)}"> --%>
<!-- 						<li class="list-group-item">教練菜單1</li>
<!-- 					<li class="list-group-item">教練菜單2</li> -->
<%-- 						<li class="list-group-item">${videoSvc.findByPrimaryKey(userRightsVO.videoID).title}</li> --%>
<%-- 					</c:forEach> --%>
					<%if(itemIDs != null){
						for(Integer itemid : itemIDs){
							if(itemid.toString().startsWith("3")){ %>
								<li class="list-group-item"><%=videoSvc.findByPrimaryKey(itemid).getTitle() %></li>
					<%		}
							if(itemid.toString().startsWith("6")){ %>
								<li class="list-group-item"><%=coachSvc.getByMenuID(itemid).getMenuName() %></li>
					<%		}
						}
					}%>
				</ul>
			</div>
			<div class="col menu">
				<h5>已收藏</h5>
				<ul class="list-group">
 				<%-- ${collectionSvc.getByUserId(1003)[0].menuID} --%>
				<%-- <c:choose>
					<c:when test="${collectionSvc.getByUserId(1003) == null}"
				</c:choose> --%>
					<%-- <c:if
						test="${collectionSvc.getByUserId(1003) == null} | ${fn:length(collectionSvc.getByUserId(1003)) == 0}">
						<c:out value="暫無收藏"></c:out>
					</c:if> --%>
					<%-- <c:forEach var="collectionVO"
						items="${collectionSvc.getByUserId(1001)}">
						<li class="list-group-item">${videoSvc.findByPrimaryKey(collectionVO.videoID).title}</li>
					</c:forEach> --%>
<%-- 					<c:forEach var="coachMenuVO" --%>
<%-- 						items="${collectionSvc.getByUserId(1003)}"> --%>
<%-- 						<li class="list-group-item">${coachSvc.getByMenuID(coachMenuVO.menuID).menuName}</li> --%>
<%-- 						<li class="list-group-item">${videoSvc.findByPrimaryKey(coachMenuVO.videoID).title}</li> --%>
<%-- 					</c:forEach> --%>
					<%
					for(CollectionVO collectionVO : collectionlist){
						Integer itemID = collectionVO.getItemID();
						String str = itemID.toString();
						if(str.startsWith("3")){ %>
							<li class="list-group-item"><%=videoSvc.findByPrimaryKey(itemID).getTitle() %></li>
					<%	} %>
					  <%if(str.startsWith("4")){ %>
							<li class="list-group-item"><%=postsSvc.getByPostsID(itemID).getPostsTitle() %></li>
					  <%} %>
					  <%if(str.startsWith("6")){ %>
					  		<li class="list-group-item"><%=coachSvc.getByMenuID(itemID).getMenuName() %></li>
					  <%} %>
					<%}
					
					%>
				</ul>
			</div>
		</div>
	</div>
</body>

</html>