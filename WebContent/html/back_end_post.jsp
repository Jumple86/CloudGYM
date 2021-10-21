<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.posts.model.*"%>

<jsp:useBean id="userSvc" scope="page"
	class="com.user.model.UserService" />
<%
	PostsService postSvc = new PostsService();
	List<PostsVO> list = postSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>文章管理</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/back_end_index.css">
<link rel="stylesheet" href="../css/back_end_post.css">
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
		<div id="left">
			<ul id="btn_fa">
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_video.jsp"> <span
						class="li_btn">影片管理</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_order.jsp"> <span
						class="li_btn">訂單明細管理</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_post.jsp"> <span
						class="li_btn">文章管理</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_user.jsp"> <span
						class="li_btn">會員管理</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_coach.jsp"> <span
						class="li_btn">教練管理</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_sublist.jsp">
						<span class="li_btn">訂閱管理</span>
				</a></li>
			</ul>
		</div>
		<p>文章管理</p>
		<div id="right">
			<div class="main">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">編號</th>
							<th scope="col">文章ID</th>
							<th scope="col">文章標題</th>
							<th scope="col">上傳者</th>
							<th scope="col">上傳時間</th>
							<th scope="col">被檢舉次數</th>
						</tr>
					</thead>
					<tbody>
						<%--                     <%@ include file="/pages/page1.file" %> --%>
						<%
							int rowsPerPage = 10; //每頁的筆數    
							int rowNumber = 0; //總筆數
							int pageNumber = 0; //總頁數      
							int whichPage = 1; //第幾頁
							int pageIndexArray[] = null;
							int pageIndex = 0;
						%>

						<%
							rowNumber = list.size();
							if (rowNumber % rowsPerPage != 0)
								pageNumber = rowNumber / rowsPerPage + 1;
							else
								pageNumber = rowNumber / rowsPerPage;

							pageIndexArray = new int[pageNumber];
							for (int i = 1; i <= pageIndexArray.length; i++)
								pageIndexArray[i - 1] = i * rowsPerPage - rowsPerPage;
						%>

						<%
							try {
								whichPage = Integer.parseInt(request.getParameter("whichPage"));
								pageIndex = pageIndexArray[whichPage - 1];
							} catch (NumberFormatException e) { //第一次執行的時候
								whichPage = 1;
								pageIndex = 0;
							} catch (ArrayIndexOutOfBoundsException e) { //總頁數之外的錯誤頁數
								if (pageNumber > 0) {
									whichPage = pageNumber;
									pageIndex = pageIndexArray[pageNumber - 1];
								}
							}
						%>
						<%
							int number = pageIndex + 1;
						%>
						<c:forEach var="postsVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<tr
								data-href="<%=request.getContextPath()%>/html/back_end_post_page.jsp?postID=${postsVO.postsID}">
								<th scope="row"><%=number++%></th>
								<td>${postsVO.postsID}</td>
								<td style="text-align: left; font-size: 15px">${postsVO.postsTitle}</td>
								<td>${postsVO.userID}-
									${userSvc.findByUserId(postsVO.userID).userName}</td>
								<td>${postsVO.postsPublishDate}</td>
								<td>${postsVO.postsReportedTimes}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="page">
					<%
						for (int i = 0; i < pageIndexArray.length; i++) {
					%>
					<a href="<%request.getRequestURI();%>?whichPage=<%=i + 1%>"><%=i + 1%></a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<script src="../vendors/jquery/jquery-3.6.0.min.js"></script>
	<script src="../js/back_end_post.js"></script>
</body>
</html>