<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.subList.model.*"%>

<%
	SubListService sublistSvc = new SubListService();
	List<SubListVO> list = sublistSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>訂閱管理</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/back_end_index.css">
<link rel="stylesheet" href="../css/back_end_sublist.css">
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
		<p>訂閱管理</p>
		<div id="right">
<%-- 		<a href="<%=request.getContextPath()%>/html/back_end_sublist_add.jsp"> --%>
<!-- 				<button id="bat_btn" type="submit">新增方案</button> -->
<!-- 		</a> -->
			<div class="main">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">方案名稱</th>
							<th scope="col">方案時長</th>
							<th scope="col">售價</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sublistVO" items="${list}">
							<tr>
								<th scope="row">${sublistVO.subName}
								</td>
								<td>${sublistVO.duration}</td>
								<td>${sublistVO.price}</td>
								<td><a href="<%=request.getContextPath()%>/html/back_end_sublist_update.jsp?subID=${sublistVO.subID}">
										<button class="update" type="submit">修改</button>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>