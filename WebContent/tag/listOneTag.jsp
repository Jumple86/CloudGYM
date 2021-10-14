<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="BIG5"%>
<%@ page import="com.tag.model.*"%>

<%
	TagVO tagVO = (TagVO) request.getAttribute("tagVO");
%>

<html>
<head>
<title>listOneTag.jsp</title>

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

table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>
</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>ListOneTag.jsp</h3>
				<h4>
					<a href="selectTagPage.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>標籤編號</th>
			<th>標籤名稱</th>
		</tr>
		<tr>
			<td><%=tagVO.getTagID()%></td>
			<td><%=tagVO.getTagName()%></td>
		</tr>
	</table>

</body>
</html>