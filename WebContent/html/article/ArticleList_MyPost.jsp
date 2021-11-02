<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.posts.model.*"%>

<jsp:useBean id="postsSvc" scope="page"
	class="com.posts.model.PostsService" />
<jsp:useBean id="userSvc" scope="page"
	class="com.user.model.UserService" />
<jsp:useBean id="likesSvc" scope="page"
	class="com.likes.model.LikesService" />
<jsp:useBean id="commentSvc" scope="page"
	class="com.comment.model.CommentService" />
<jsp:useBean id="coachSvc" scope="page"
	class="com.coach.model.CoachService" />

<%
	List<PostsVO> list = postsSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="ZH-TW">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>我的文章</title>
<link rel="stylesheet" href="../css/reset.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<style>
body {
	font-family: arial 微軟正黑體;
	background-color: #31105E;
}

#bar {
	height: 40px;
	background-color: #5C37A1;
}

/* main */
.container {
	background-color: #ECE9F2;
	border-radius: 25px;
	margin: 100px auto 0;
}

.container h1 {
	padding-top: 30px;
	margin-left: 30px;
}

.col-md-4 {
	width: 280px;
	height: 210px;
}

.col-md-4 img {
	width: 100%;
	height: 100%;
}

.card-title {
	font-weight: bold;
}

.card-text {
	display: -webkit-box;
	/*值必須為-webkit-box或者-webkit-inline-box*/
	-webkit-box-orient: vertical;
	/*值必須為vertical*/
	-webkit-line-clamp: 3;
	/*值為數字，表示一共顯示幾行*/
	overflow: hidden;
}
</style>

</head>
<body>

	<!-- Navbar -->
	<div id="bar"></div>


	<!-- main -->
	<div class="container">
		<h1>我的文章</h1>
		<hr>
		<div class="row">
			<div class="col">

				<c:forEach var="PostsVO" items="${list}">
					<c:if test="${PostsVO.userID == userID}">
						<div class="card mb-3">
							<div class="d-flex position-relative">

								<div class="col-md-4">
									<img src="<%=request.getContextPath()%>/Reader?id=${PostsVO.postsID}">
								</div>

								<div class="ms-4 mt-3">
									<h5 class="card-title">${PostsVO.postsTitle}</h5>
									<small class="text-muted">作者：${userSvc.findByUserId(PostsVO.userID).userName}${coachSvc.getByUserID(PostsVO.userID).coachName}</small>
									<p class="card-text">${PostsVO.postsContent}</p>
									<a href="#" class="btn btn-outline-primary" href="<%=request.getContextPath()%>/html/ArticlePage.jsp?postsID=${PostsVO.postsID}">繼續閱讀</a>
									<i class="far fa-thumbs-up" style="margin-left: 750px; font-size: 20px;">
									<span class="mx-2">${likesSvc.getCountLike(PostsVO.postsID)}</span></i>
									<i class="far fa-comment-alt" style="font-size: 20px;">
									<span class="mx-2">${commentSvc.getCountComment(PostsVO.postsID)}</span></i>
								</div>
							</div>
						</div>
						<hr>
					</c:if>
				</c:forEach>

			</div>
		</div>
	</div>

</body>
</html>