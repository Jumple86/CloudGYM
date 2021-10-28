<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
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
<jsp:useBean id="processSvc" scope="page"
	class="com.process.model.ProcessService" />
<jsp:useBean id="actionSvc" scope="page"
	class="com.videoAction.model.VideoActionService" />

<%
	/* List<CustomMenuListVO> menulist = (List<CustomMenuListVO>) request.getAttribute("menulist");
	System.out.println("jsp" + menulist);
	request.setAttribute("menulist", menulist); */
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>個人專區運動歷程</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 

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
	padding-top: 60px;
	color: white;
}

.progress-section {
	
}

.seperate {
	border-right: 3px solid white;
}

.img-size {
	width: 100%;
	height: 50vh;
	object-fit: cover;
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
	height: 700px;
	overflow-y: scroll;
	scroll-behavior: smooth;
	background-color: #DED0F3;
	color: black !important;
}

.right-zone button {
	border-radius: 50%;
	margin-left: 5%;
	background-color: none;
	border: none;
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
		<div class="row">
			<div class="col-3 seperate">
				<p style="font-weight: bold;">${menuTitle}</p>
				<ul class="nav flex-column nav-pills nav-fills">
					<c:forEach var="list" items="${menulist}">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="userMenuList.do?action=playVideo&id=${list.videoID}&menuTitle=${menuTitle}&listID=${list.listID}"
							style="color: white;">${videoSvc.findByPrimaryKey(list.videoID).title}</a>
						</li>
					</c:forEach>
				</ul>
				<button type="button" class="btn btn-outline-light"><a href="userMenuListPage1.jsp">回菜單總覽</a></button>
			</div>
			<div class="col-6 seperate">
				<div>
					<div>
						<video class="img-size" controls>
							<source
								src="<%=request.getContextPath()%>/VideoReader?id=${play.videoID}">
						</video>
					</div>
					<div class="progress-section">
						<div style="border-bottom: 1px solid white;">
							<p>${play.title}</p>
						</div>
						<p>${play.intro}</p>
						${process}
					</div>
				</div>
			</div>
			<div class="col-3 right-zone">
				<br>
				<c:forEach var="actions" items="${actions}">
					<ul>
						<li>${actions.action}</li>
						<li><c:forEach begin="1" end="${actions.sets}">
						
								<input type="checkbox" style="width: 0; height: 0;">
									<i class="far fa-check-circle"></i>${process[0].processNo}
								</input>
							</c:forEach></li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script>

</script>
</html>