<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.admin.model.*"%>

<%
	AdminService adminSvc = new AdminService();
	List<AdminVO> list = adminSvc.getAll();
	pageContext.setAttribute("list", list);
	session.setAttribute("adminNo", 9001);
	session.getAttribute("adminNo");
%>
<c:if test="${adminNo == 9001}">
	<c:set var="states" value="true"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>管理員表單</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/back_end_index.css">
<link rel="stylesheet" href="../css/back_end_Admin.css">
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

		<div id="right">
			<div class="main">
				<a href="<%=request.getContextPath()%>/html/back_end_Admin_page.jsp">
					<button class="update" type="submit">
						<i class="bi bi-pencil-fill"></i>
					</button>
				</a>

				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>

				<c:forEach var="adminVO" items="${list}">
					<c:if test="${adminVO.adminID != adminNo}">
						<div class="main-out">
							<div class="admin">管理員</div>
							<div class="name">
								<FORM METHOD="post" ACTION="admin.do" name="form1">
									<ul>
										<li class="name-li">AdminID: <span>${adminVO.adminID}</span></li>
										<li class="name-li">姓名: <span>${adminVO.adminName}</span></li>
										<li class="name-li">權限: <span> <input
												type="checkbox" name="commentAuth"
												value="${adminVO.commentAuth}"
												${adminVO.commentAuth == 1 ? "checked='true'" : ""}
												${states == true ?  "" : 'disabled'}>討論區
										</span> <span> <input type="checkbox" name="videoAuth"
												value="${adminVO.videoAuth}"
												${adminVO.videoAuth == 1 ? "checked='true'" : ""}
												${states == true ? "" : 'disabled'}>影片審核
										</span> <span> <input type="checkbox" name="subAuth"
												value="${adminVO.subAuth}"
												${adminVO.subAuth == 1 ? "checked='true'" : ""}
												${states == true ? "" : 'disabled'}>方案調整
										</span> <span> <input type="checkbox" name="userAuth"
												value="${adminVO.userAuth}"
												${adminVO.userAuth == 1 ? "checked='true'" : ""}
												${states == true ? "" : 'disabled'}>會員封鎖
										</span> <c:if test="${states == true}">
												<span> <input type="hidden" name="action"
													value="updatebyAuth"> <input type="hidden"
													name="id" value="${adminVO.adminID}"> <input
													type="submit" value="送出修改">
												</span>
											</c:if>
								</Form>

								</li>
								</ul>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>