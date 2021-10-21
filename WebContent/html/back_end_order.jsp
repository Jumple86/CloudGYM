<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orderList.model.*"%>
<%@ page import="com.orders.model.*"%>
<%@ page import="com.user.model.*"%>

<jsp:useBean id="userSvc" scope="page" class="com.user.model.UserService" />
<jsp:useBean id="ordersSvc" scope="page" class="com.orders.model.OrdersService" />
<jsp:useBean id="videoSvc" scope="page"	class="com.video.model.VideoService" />
<jsp:useBean id="coachmenuSvc" scope="page"	class="com.coachMenu.model.CoachMenuService" />
<jsp:useBean id="sublistSvc" scope="page" class="com.subList.model.SubListService" />
<%
	OrderListService orderListSvc = new OrderListService();
	List<OrderListVO> list = orderListSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!-- --------------------------------- -->
<%-- ${userSvc.findByUserId(ordersSvc.gerOrdersByOrderNo(90001).userID).userMobile } --%>
<!-- --------------------------------------- -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>�q����Ӻ޲z</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/back_end_index.css">
<link rel="stylesheet" href="../css/back_end_order.css">
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
		<p>�q����Ӻ޲z</p>
		<div id="right">
			<div class="main">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">�s��</th>
							<th scope="col">�q��s��</th>
							<th scope="col">�ʶR�H</th>
							<th scope="col">�~��</th>
							<th scope="col">�ʶR�H���</th>
							<th scope="col">�q��إ߮ɶ�</th>
						</tr>
					</thead>
					<tbody>
						<%-- 						<%@ include file="/pages/page1.file"%> --%>
						<%
							int rowsPerPage = 10; //�C��������    
							int rowNumber = 0; //�`����
							int pageNumber = 0; //�`����      
							int whichPage = 1; //�ĴX��
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
							} catch (NumberFormatException e) { //�Ĥ@�����檺�ɭ�
								whichPage = 1;
								pageIndex = 0;
							} catch (ArrayIndexOutOfBoundsException e) { //�`���Ƥ��~�����~����
								if (pageNumber > 0) {
									whichPage = pageNumber;
									pageIndex = pageIndexArray[pageNumber - 1];
								}
							}
						%>
						<%
							int number = pageIndex + 1;
						%>

						<c:forEach var="orderListVO" items="${list}"
							begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<tr>
								<th scope="row"><%=number++%></th>
								<td>${orderListVO.orderNo}
								</th>
								<td>${ordersSvc.gerOrdersByOrderNo(orderListVO.orderNo).userID}-
									${userSvc.findByUserId(ordersSvc.gerOrdersByOrderNo(orderListVO.orderNo).userID).userName}</td>
								<td>${orderListVO.itemID}-
									<c:if
										test="${orderListVO.itemID.toString().substring(0,1)=='3'}">
										${videoSvc.findByPrimaryKey(orderListVO.itemID).getTitle()}(�v��)</c:if>
									<c:if
										test="${orderListVO.itemID.toString().substring(0,1)=='6'}">
										${coachmenuSvc.getByMenuID(orderListVO.itemID).getMenuName()}(�нm���)</c:if>
									<c:if
										test="${orderListVO.itemID.toString().substring(0,1)=='7'}">
										${sublistSvc.getBySubID(orderListVO.itemID).getSubName()}(�q�\)</c:if>
								</td>
								<td>${userSvc.findByUserId(ordersSvc.gerOrdersByOrderNo(orderListVO.orderNo).userID).userMobile }</td>
								<td>
									${ordersSvc.gerOrdersByOrderNo(orderListVO.orderNo).builtDate}
								</td>
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


</body>
</html>