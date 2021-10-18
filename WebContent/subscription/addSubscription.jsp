<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.subscription.model.*"%>

<%
	SubscriptionVO subscriptionVO = (SubscriptionVO) request.getAttribute("subscriptionVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�нm�q�\�s�W</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>��Ʒs�W</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="subscription.do" name="form1">

		<table>
			<tr>
				<td>�q�\�s��:</td>
				<td><input type="TEXT" name="subNo" size="45"
					value="<%=(subscriptionVO == null) ? "" : subscriptionVO.getSubNo()%>" /></td>
			</tr>
			<tr>
				<td>��׽s��:</td>
				<td><input type="TEXT" name="subID" size="45"
					value="<%=(subscriptionVO == null) ? "" : subscriptionVO.getSubID()%>" /></td>
			</tr>
			<tr>
				<td>�нm�s��:</td>
				<td><input type="TEXT" name="userID" size="45"
					value="<%=(subscriptionVO == null) ? "" : subscriptionVO.getUserID()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
	</FORM>
</body>
</html>