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
<title>�޲z�����</title>
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
				<li class="option"><a class="logout" href="#">�n�X</a></li>
				<li class="option"><a class="login_ad"
					href="<%=request.getContextPath()%>/html/back_end_Admin.jsp">�޲z��</a></li>
			</ul>
		</div>
	</div>
	<div id="wrap">
		<div id="left">
			<ul id="btn_fa">
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_video.jsp"> <span
						class="li_btn">�v���޲z</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_order.jsp"> <span
						class="li_btn">�q����Ӻ޲z</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_post.jsp"> <span
						class="li_btn">�峹�޲z</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_user.jsp"> <span
						class="li_btn">�|���޲z</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_coach.jsp"> <span
						class="li_btn">�нm�޲z</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/html/back_end_sublist.jsp">
						<span class="li_btn">�q�\�޲z</span>
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

				<%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">�Эץ��H�U���~:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>

				<c:forEach var="adminVO" items="${list}">
					<c:if test="${adminVO.adminID != adminNo}">
						<div class="main-out">
							<div class="admin">�޲z��</div>
							<div class="name">
								<FORM METHOD="post" ACTION="admin.do" name="form1">
									<ul>
										<li class="name-li">AdminID: <span>${adminVO.adminID}</span></li>
										<li class="name-li">�m�W: <span>${adminVO.adminName}</span></li>
										<li class="name-li">�v��: <span> <input
												type="checkbox" name="commentAuth"
												value="${adminVO.commentAuth}"
												${adminVO.commentAuth == 1 ? "checked='true'" : ""}
												${states == true ?  "" : 'disabled'}>�Q�װ�
										</span> <span> <input type="checkbox" name="videoAuth"
												value="${adminVO.videoAuth}"
												${adminVO.videoAuth == 1 ? "checked='true'" : ""}
												${states == true ? "" : 'disabled'}>�v���f��
										</span> <span> <input type="checkbox" name="subAuth"
												value="${adminVO.subAuth}"
												${adminVO.subAuth == 1 ? "checked='true'" : ""}
												${states == true ? "" : 'disabled'}>��׽վ�
										</span> <span> <input type="checkbox" name="userAuth"
												value="${adminVO.userAuth}"
												${adminVO.userAuth == 1 ? "checked='true'" : ""}
												${states == true ? "" : 'disabled'}>�|������
										</span> <c:if test="${states == true}">
												<span> <input type="hidden" name="action"
													value="updatebyAuth"> <input type="hidden"
													name="id" value="${adminVO.adminID}"> <input
													type="submit" value="�e�X�ק�">
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