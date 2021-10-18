<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.subList.model.*"%>

<%
	SubListVO subListVO = (SubListVO) request.getAttribute("subListVO");
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>訂閱方案新增</title>

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
				<h3>資料新增</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="subList.do" name="form1">

		<table>
			<tr>
				<td>方案編號:</td>
				<td><input type="TEXT" name="subID" size="45"
					value="<%=(subListVO == null) ? "" : subListVO.getSubID()%>" /></td>
			</tr>
			<tr>
				<td>方案時長:</td>
				<td><input type="TEXT" name="duration" size="45"
					value="<%=(subListVO == null) ? "" : subListVO.getDuration()%>" /></td>
			</tr>
			<tr>
				<td>方案名稱:</td>
				<td><input type="TEXT" name="subName" size="45"
					value="<%=(subListVO == null) ? "" : subListVO.getSubName()%>" /></td>
			</tr>
			<tr>
				<td>價格:</td>
				<td><input type="TEXT" name="price" size="45"
					value="<%=(subListVO == null) ? "" : subListVO.getPrice()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>
</html>