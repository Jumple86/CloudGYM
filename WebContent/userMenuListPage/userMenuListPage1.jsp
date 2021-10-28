<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orders.model.*"%>
<%@ page import="com.orderList.model.*"%>
<%@ page import="com.customMenuList.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:useBean id="menuSvc" scope="page"
	class="com.customMenu.model.CustomMenuService" />
<jsp:useBean id="listSvc" scope="page"
	class="com.customMenuList.model.CustomMenuListService" />
<jsp:useBean id="videoSvc" scope="page"
	class="com.video.model.VideoService" />
<jsp:useBean id="coachSvc" scope="page"
	class="com.coachMenu.model.CoachMenuService" />

<%
	List<OrdersVO> order = new OrdersService().getOrdersByUserID(1003); //很多個orderVO
	List<Integer> itemIDs = new ArrayList<>();
	for (OrdersVO ordersVO : order) {
		List<OrderListVO> list = new OrderListService().getOrderListByOrderNo(ordersVO.getOrderNo());
		for (OrderListVO orderlist : list) {
			Integer itemID = orderlist.getItemID();
			itemIDs.add(itemID);
		}
	}
/* 	List<CustomMenuListVO> menulist = (List<CustomMenuListVO>) request.getAttribute("menulist");
	System.out.println("jsp" + menulist);
	request.setAttribute("menulist", menulist); */
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>個人專區菜單</title>
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
	padding-top: 80px;
	padding-left: 70px;
	color: white;
}

.progress-section {
	text-align: center;
	margin-bottom: 10%;
}

.seperate {
	border-right: 3px solid white;
	height: 600px;
	overflow-y: scroll;
	scroll-behavior: smooth;
}

.img-size {
	width: 100%;
	height: 30vh;
	object-fit: cover;
	margin-bottom: 40%;
}

.list-padding {
	padding: 0 !important;
}

.img-fluid {
	width: 100%;
	height: 40vh;
	object-fit: cover;
}

.seperate p {
	text-align: center;
	margin-top: 3%;
}

.right-zone {
	height: 600px;
	overflow-y: scroll;
	scroll-behavior: smooth;
	margin: 0;
}

.right-zone img {
	width: 100%;
	height: 18vh;
	object-fit: cover;
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

	<div class="page">
		<div class="row">
			<div class="col-2 seperate">
				<p style="font-weight: bold;">自訂菜單</p>
				<ul class="nav flex-column nav-pills nav-fills">
					<c:forEach var="customMenuVO" items="${menuSvc.getAll(1003)}">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="userMenuList.do?action=getAll&menuID=${customMenuVO.menuID}"
							style="color: white;">${customMenuVO.title}</a></li>
					</c:forEach>
				</ul>
				<br>
				<p style="font-weight: bold;">已購買菜單</p>
				<ul class="nav flex-column nav-pills nav-fills">
					<%
						if (itemIDs != null) {
							for (Integer itemid : itemIDs) {
								if (itemid.toString().startsWith("6")) {
					%>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="userMenuList.do?action=getCoach&itemID=<%=itemid%>"
						style="color: white;"><%=coachSvc.getByMenuID(itemid).getMenuName()%></a></li>
					<%
						}
							}
						}
					%>
				</ul>
			</div>
			<c:if test="${menulist != null}">
				<div class="col-4 seperate">
					<div class="progress-section">
						<div>
							<img
								src="<%=request.getContextPath()%>/Reader?id=${menulist[0].videoID}"
								class="img-size">
						</div>
						<div>
							<p>Progress</p>
							<span>20%</span> <span>1/5</span>
							<p>completed</p>
						</div>
					</div>
				</div>
				<div class="col-6 right-zone">
					<c:forEach var="list" items="${menulist}">
						<div class="card mb-3"
							style="max-width: 600px; background-color: #31105E;">
							<div class="row g-0">
								<div class="col-md-4">
									<a href="userMenuList.do?action=goto&menuID=${list.menuID}&listID=${list.listID}">
										<img
										src="<%=request.getContextPath()%>/Reader?id=${list.videoID}"
										class="img-fluid rounded-start" alt="請重新載入">
									</a>
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">${videoSvc.findByPrimaryKey(list.videoID).title}</h5>
										<p class="card-text">${videoSvc.findByPrimaryKey(list.videoID).intro}</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>

			<c:if test="${coachlist != null}">
				<div class="col-4 seperate">
					<div class="progress-section">
						<div>
							<img
								src="<%=request.getContextPath()%>/Reader?id=${coachlist[0].videoID}"
								class="img-size">
						</div>
						<div>
							<p>Progress</p>
							<span>20%</span> <span>1/5</span>
							<p>completed</p>
						</div>
					</div>
				</div>
				<div class="col-6 right-zone">
					<c:forEach var="list" items="${coachlist}">
						<div class="card mb-3"
							style="max-width: 600px; background-color: #31105E;">
							<div class="row g-0">
								<div class="col-md-4">
									<img
										src="<%=request.getContextPath()%>/Reader?id=${list.videoID}"
										class="img-fluid rounded-start" alt="請重新載入">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">${videoSvc.findByPrimaryKey(list.videoID).title}</h5>
										<p class="card-text">${videoSvc.findByPrimaryKey(list.videoID).intro}</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
</body>

<script>
	
</script>

</html>