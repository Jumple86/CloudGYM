<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="videoSvc" scope="page" class="com.video.model.VideoService"/>
<jsp:useBean id="menuSvc" scope="page" class="com.customMenu.model.CustomMenuService"/>
<jsp:useBean id="listSvc" scope="page" class="com.customMenuList.model.CustomMenuListService"/>
<jsp:useBean id="rightsSvc" scope="page" class="com.userRights.model.UserRightsService"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>個人已購買菜單及影片</title>
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

.left {
	color: white;
	background-color: #5C37A1;
	height: 1500px;
}

.checklist {
	padding: 80px 50px;
}

.menu {
	padding: 80px 20px;
}

.video {
	padding: 0px 20px;
}

.title {
	color: white;
}

.title-video {
	color: white;
	padding-top: 0px;
}

.card-block {
	margin-top: 0;
}

.cards {
	text-align: right;
}

.card-zone {
	margin-right: 10px;
	text-align: left;
}

.form-display {
	display: inline-block;
	float: right;
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

	<div class="row main">
		<div class="col-2 left">
			<div class="checklist">
				<p>強度</p>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="strong"
						id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault"> 強 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="medium"
						id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckChecked"> 中 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="low"
						id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault"> 弱 </label>
				</div>
			</div>
		</div>
		<div class="col-10 right">
			<div class="row menu row-cols-1 g-4">
				<p class="title">菜單</p>
				<div class="card-group cards">
					<c:forEach var="customMenuVO" items="${menuSvc.getAll(1003)}">
						<%-- 省略pageScope --%>
						<div class="card card-zone">
							<div class="card-body">
								<h5 class="card-title">${customMenuVO.title}</h5>
								
								<p class="card-text">
									<small class="text-muted">${customMenuVO.content}</small>
									${customMenuVO.menuID}
								</p>
								<hr>
								<!-- eachlist -->
								 <c:forEach var="customMenuListVO" items="${listSvc.getAll(customMenuVO.menuID)}">
									<p class="card-text">
									<div class="row">
										<div class="col-8">
										${videoSvc.findByPrimaryKey(customMenuListVO.videoID).title} 
										${customMenuListVO.listID}
											<%-- <c:forEach var="videoVO" items="${videoSvc.findByPrimaryKey(customMenuListVO.videoID)}">
												<small class="text-muted">${videoVO.title}</small>
											</c:forEach>  --%>
										</div>
										<div class="col-4">
											<FORM id="delete_post1" METHOD="post" class="form-inline form-display" ACTION="<%=request.getContextPath()%>/userMenuAndVideo/userMenu.do">
												<input type="hidden" name="listID" value="${customMenuListVO.listID}"> 
												<input type="hidden" name="action" value="delete_list">
												<button form="delete_post1" type="submit" class="btn btn-secondary btn-sm delete-btn">刪除</button>
											</FORM>
										</div>
									</div>
									</p>
								</c:forEach>
								<br>
								<FORM id="update_post_menu" METHOD="post" class="form-inline" ACTION="<%=request.getContextPath()%>/userMenuAndVideo/userMenu.do">
									<input type="hidden" name="menuID" value="${customMenuVO.menuID}"> 
									<input type="hidden" name="action" value="update_prepare">
								</FORM>
								<button form="update_post_menu" type="submit"
									class="btn btn-outline-secondary btn-sm delete-btn btn-block">${customMenuVO.menuID}</button>


								<FORM id="delete_post_menu" METHOD="post" class="form-inline form-display">
									<input type="hidden" name="menuID" value="${customMenuVO.menuID}"> 
									<input type="hidden" name="action" value="delete_menu">
								</FORM>
								<button form="delete_post_menu" type="submit"
									class="btn btn-secondary btn-sm delete-btn btn-block">刪除</button>
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="row video">
				<p class="title-video">影片</p>
				<div class="row row-cols-1 row-cols-md-3 g-4">
				<c:forEach var="userRightsVO" items="${rightsSvc.getAll(1003)}">
					<div class="col">
						<div class="card">
							<img src="<%=request.getContextPath()%>/Reader?id=${userRightsVO.videoID}" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">${videoSvc.findByPrimaryKey(userRightsVO.videoID).title}</h5>
								<p class="card-text">${videoSvc.findByPrimaryKey(userRightsVO.videoID).intro}</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>