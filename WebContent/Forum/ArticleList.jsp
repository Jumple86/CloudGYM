<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.posts.model.*"%>

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

<jsp:useBean id="userSvc" scope="page"
	class="com.user.model.UserService" />
<jsp:useBean id="likesSvc" scope="page"
	class="com.likes.model.LikesService" />
<jsp:useBean id="commentSvc" scope="page"
	class="com.comment.model.CommentService" />

<!DOCTYPE html>
<html lang="ZH-TW">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CloudGYM討論區</title>
<link rel="stylesheet" href="./css/reset.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet" href="./css/ArticleList.css">
</head>
<body>

	<!-- header -->
	<div class="bar"></div>

	<div class="navimg">
		<img src="./img/navimg.png">
	</div>

	<div class="menu-wrapper">
		<nav class="main-nav grid-container grid-parent">
			<ul class="menu">
				<li class="nav-shou-ye"><a href="#">首頁</a></li>
				<li class="nav-ren-wu-zhuan-fang"><a href="#">健身知識</a></li>
				<li class="nav-sheng-huo-zhuan-ti"><a href="#">健康飲食</a></li>
				<li class="nav-kua-ling-yu-xue-xi"><a href="#">成果分享</a></li>
				<li class="nav-ji-neng-qu-shi"><a href="#">商品推薦</a></li>
				<li class="nav-ji-neng-qu-shi"><a href="#">綜合閒聊</a></li>
			</ul>
		</nav>
	</div>


	<!-- main -->
	<a href="AddArticle.jsp">
		<button type="button" class="btn btn-outline-light"
			style="margin: 40px 0px 0px 220px;">
			<i class="far fa-edit me-2"></i>新增文章
		</button>
	</a>


	<div class="container">
		<div class="row">

			<div class="col-8">

				<%@ include file="page1.file"%>
				<c:forEach var="PostsVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">

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
									<small class="text-muted">作者：${userSvc.findByUserId(PostsVO.userID).userName}</small>
									<p class="card-text">${PostsVO.postsContent}</p>
									<div class="cb">
										<a class="btn btn-outline-primary"
											href="<%=request.getContextPath()%>/Forum/ArticlePage.jsp?postsID=${PostsVO.postsID}">繼續閱讀</a>
										<i class="far fa-thumbs-up"><span>${likesSvc.getCountLike(PostsVO.postsID)}</span></i>
										<i class="far fa-comment-alt"><span>${commentSvc.getCountComment(PostsVO.postsID)}</span></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>
				</c:forEach>

				<!-- 分頁  待改善 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<%
							if (whichPage == 1) {
						%>
						<li class="page-item disabled"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=1">第一頁</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=1">第一頁</a></li>
						<%
							}
						%>

						<%
							if (whichPage == 1) {
						%>
						<li class="page-item disabled"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage%>"><%=whichPage%></a></li>
						<li class="page-item"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage + 1%>"><%=whichPage + 1%></a></li>
						<li class="page-item"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage + 2%>"><%=whichPage + 2%></a></li>
						<%
							} else if (whichPage == pageNumber) {
						%>
						<li class="page-item"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage - 2%>"><%=whichPage - 2%></a></li>
						<li class="page-item"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage - 1%>"><%=whichPage - 1%></a></li>
						<li class="page-item disabled"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage%>"><%=whichPage%></a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage - 1%>"><%=whichPage - 1%></a></li>
						<li class="page-item disabled"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage%>"><%=whichPage%></a></li>
						<li class="page-item"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=whichPage + 1%>"><%=whichPage + 1%></a></li>
						<%
							}
						%>

						<%
							if (whichPage == pageNumber) {
						%>
						<li class="page-item disabled"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=pageNumber%>">最後一頁</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="<%=request.getRequestURI()%>?whichPage=<%=pageNumber%>">最後一頁</a></li>
						<%
							}
						%>

					</ul>
				</nav>
				<!-- 分頁結尾 -->

			</div>


			<!-- 其他功能 -->
			<div class="col-4">

				<!-- Search widget-->
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

				<!-- 熱門文章XXXXX -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fab fa-hotjar me-2"></i>熱門文章
					</div>
					<ol class="recent-posts">
						<c:forEach var="PostsVO" items="${top}" begin="0" end="4">
							<li><a
								href="<%=request.getContextPath()%>/Forum/ArticlePage.jsp?postsID=${PostsVO.postsID}">${PostsVO.postsTitle}</a></li>
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
								href="<%=request.getContextPath()%>/Forum/ArticlePage.jsp?postsID=${PostsVO.postsID}">${PostsVO.postsTitle}</a></li>
						</c:forEach>
					</ol>
				</div>

				<!-- 累計瀏覽人數 -->
				<%!int count = 0;%>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-user-friends me-2"></i>瀏覽人氣
					</div>
					<ol class="recent-posts">
						<li>本日人氣：</li>
						<li>總人氣量：<%=++count%></li>
					</ol>
				</div>

				<!-- 課程影片推薦 -->

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

	<script>
	
// 	$("div.sub button").on("click", function(){
// 	$.ajax({
<%-- 		  url: "<%=request.getContextPath()%>/Forum/Article.do",           // 資料請求的網址 --%>
// 		  type: "post",                  // GET | POST | PUT | DELETE | PATCH
// 		  dataType: "json",             // 預期會接收到回傳資料的格式： json | xml | html
// 		  success: function(){      // request 成功取得回應後執行
// 		    console.log("AAA");
// 		  },
// 			error: function(){
// 			console.log("fail");
// 		},
// 		});
// 	});	
	
	</script>


</body>

</html>