<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.posts.model.*"%>

<jsp:useBean id="userSvc" scope="page"
	class="com.user.model.UserService" />
<jsp:useBean id="likesSvc" scope="page"
	class="com.likes.model.LikesService" />
<jsp:useBean id="commentSvc" scope="page"
	class="com.comment.model.CommentService" />
<jsp:useBean id="coachSvc" scope="page" class="com.coach.model.CoachService" />
<%
	PostsService postssvc = new PostsService();
	List<PostsVO> list = postssvc.getAll();
	pageContext.setAttribute("list", list);
	List<PostsVO> top = postssvc.getTopPost();
	pageContext.setAttribute("top", top);

	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="ZH-TW">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CloudGYM討論區</title>
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
<link rel="stylesheet" href="../css/ArticleList.css">
</head>
<body>

	<!-- header -->
	<div id="bar">
        <div id="title">
            <ul>
                <li class="bar_li">
                    <img src="../img/logo.png" alt="" for="#CloudGYM">
                </li>
                <li class="bar_li">
                    <a href="#" id="CloudGYM">CloudGYM</a>
                </li>
            </ul>
        </div>
        <div id="option">
            <ul>
                <li class="option">運動類型</li>
                <li class="option">教練</li>
                <li class="option">個人專區</li>
                <li class="option">討論區</li>
                <li class="option">註冊/登入</li>
                <li class="option">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                      </svg>
                </li>
            </ul>
        </div>
    </div>
    <!-- header_end -->

	<div class="navimg">
		<img src="../img/forum_navimg.png">
	</div>

	<div class="menu-wrapper">
		<nav class="main-nav grid-container grid-parent">
			<ul class="menu">
				<li class="nav-shou-ye"><a href="ArticleList.jsp">首頁</a></li>
				<li class="nav-ren-wu-zhuan-fang"><a href="ArticleList_A.jsp">健身知識</a></li>
				<li class="nav-sheng-huo-zhuan-ti"><a href="ArticleList_B.jsp">健康飲食</a></li>
				<li class="nav-kua-ling-yu-xue-xi"><a href="ArticleList_C.jsp">成果分享</a></li>
				<li class="nav-ji-neng-qu-shi"><a href="ArticleList_D.jsp">商品推薦</a></li>
				<li class="nav-ji-neng-qu-shi"><a href="ArticleList_E.jsp">綜合閒聊</a></li>
			</ul>
		</nav>
	</div>


	<!-- main -->
	<div id="addarticle">
		<div class="container">
			<div class="row">
				<div class="col">
					<a href="AddArticle.jsp">
						<button type="button" class="btn btn-outline-light">
							<i class="far fa-edit me-2"></i>新增文章
						</button>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">

			<div class="col-8">

				<c:forEach var="PostsVO" items="${list}">
					<c:if test="${PostsVO.tagID == 40}">
						<div class="card mb-3">
							<div class="row g-0">
								<div class="col-md-4">
									<img
										src="<%=request.getContextPath()%>/Reader?id=${PostsVO.postsID}"
										alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body ms-3">
										<h5 class="card-title">${PostsVO.postsTitle}</h5>
										<small class="text-muted">作者：${userSvc.findByUserId(PostsVO.userID).userName}${coachSvc.getByUserID(PostsVO.userID).coachName}</small>
										<p class="card-text">${PostsVO.postsContent}</p>
										<div class="cb">
											<a class="btn btn-outline-primary"
												href="<%=request.getContextPath()%>/html/ArticlePage.jsp?postsID=${PostsVO.postsID}">繼續閱讀</a>
											<i class="far fa-thumbs-up"><span>${likesSvc.getCountLike(PostsVO.postsID)}</span></i>
											<i class="far fa-comment-alt"><span>${commentSvc.getCountComment(PostsVO.postsID)}</span></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
					</c:if>
				</c:forEach>

			</div>


			<!-- 其他功能 -->
			<div class="col-4">

				<!-- 搜尋文章-->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-search me-2"></i>搜尋文章
					</div>
					<div class="card-body">
						<div class="input-group">
							<input class="form-control" type="text" placeholder="請輸入關鍵字"
								aria-describedby="button-search" />
							<button class="btn btn-outline-dark" id="button-search"
								type="button">搜尋</button>
						</div>
					</div>
				</div>

				<!-- 熱門文章 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fab fa-hotjar me-2"></i>熱門文章
					</div>
					<ol class="recent-posts">
						<c:forEach var="PostsVO" items="${top}" begin="0" end="4">
							<li><a
								href="<%=request.getContextPath()%>/html/ArticlePage.jsp?postsID=${PostsVO.postsID}">${PostsVO.postsTitle}</a></li>
						</c:forEach>
					</ol>
				</div>

				<!-- 最新文章 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-rss me-2"></i>最新文章
					</div>
					<ol class="recent-posts">
						<c:forEach var="PostsVO" items="${list}" begin="0" end="4">
							<li><a
								href="<%=request.getContextPath()%>/html/ArticlePage.jsp?postsID=${PostsVO.postsID}">${PostsVO.postsTitle}</a></li>
						</c:forEach>
					</ol>
				</div>


				<!-- 累計瀏覽人數 -->
				<%!int countAll = 0;
	int countToday = 0;%>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-user-friends me-2"></i>瀏覽人氣
					</div>
					<ol class="recent-posts">
						<li>本日人氣：</li>
						<li>總人氣量：<%=++countAll%></li>
					</ol>
				</div>



			</div>
			<!-- 其他功能-end -->

		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</body>

</html>