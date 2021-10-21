<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.posts.model.*"%>
<%@ page import="com.comment.model.*"%>

<jsp:useBean id="userSvc" scope="page"
	class="com.user.model.UserService" />
<%
	PostsService postSvc = new PostsService();
	PostsVO postsVO = postSvc.getByPostsID(Integer.parseInt(request.getParameter("postID")));
	pageContext.setAttribute("postsVO", postsVO);

	CommentService commentSvc = new CommentService();
	List<CommentVO> list = commentSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>文章管理頁面</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/back_end_index.css">
<link rel="stylesheet" href="../css/back_end_post_page.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
	<div id="bar">
		<div id="title">
			<ul>
				<li class="bar_li"><img src="../img/logo.png" alt=""
					for="#CloudGYM"></li>
				<li class="bar_li"><a href="#" id="CloudGYM">CloudGYM</a></li>
			</ul>
		</div>
		<div id="option">
			<ul>
				<li class="option"><a class="logout" href="#">登出</a></li>
				<li class="option"><a class="login_ad"
					href="<%=request.getContextPath()%>/html/back_end_Admin.jsp">管理員</a></li>
			</ul>
		</div>
	</div>
	<div id="wrap">
		<div id="left"></div>
		<p>文章管理</p>
		<div id="right">
			<div class="main">
				<div class="main_right">
					<span>所有留言:</span>
					<div class="comment">

						<c:forEach var="commentVO" items="${list}">
							<form method="post" action="xxx.do" name="">
								<c:if test="${commentVO.postsID == postsVO.postsID}">
									<ul class="com_ul">
										<span>${commentVO.userID} -
											${userSvc.findByUserId(commentVO.userID).userName}</span>
										<form method="post" action="xxx">
											<button type="submit">
												<i class="bi bi-trash-fill"></i>
											</button>
										</form>
										<li class="comment_li">${commentVO.commentContent}</li>
										<li class="time">${commentVO.commentPublishDate}</li>
									</ul>
								</c:if>
							</form>
						</c:forEach>

					</div>
				</div>
				<div class="post">
					${postsVO.postsID}<br>${postsVO.postsTitle}</div>
				<form>
					<div class="post_text">文章內容:</div>
					<div class="postshow">
						<input type="radio" name="postshow" value="open"
							${postsVO.postsShow == true ? "checked='true'" : ""}>公開 <input
							type="radio" name="postshow" value="close"
							${postsVO.postsShow == false ? "checked='true'" : ""}>不公開
						<input type="hidden" name="action" value=""> <input
							type="submit" value="修改">
					</div>
				</form>
				<textarea id="content">${postsVO.postsContent}</textarea>
				<a
					href="<%=request.getContextPath()%>/html/PostsImageOutput?postsID=${postsVO.postsID}">
					<i class="bi bi-images"></i>
				</a>
				<div class="up_name">
					上傳者: &nbsp&nbsp<span>${postsVO.userID} -
						${userSvc.findByUserId(postsVO.userID).userName}</span>
				</div>
				<div class="up_time">
					上傳時間: <span>${postsVO.postsPublishDate}</span>
				</div>
			</div>
		</div>
	</div>

	<script src="../vendors/jquery/jquery-3.6.0.min.js"></script>
	<script src="../js/back_end_post_page.js"></script>
</body>
</html>