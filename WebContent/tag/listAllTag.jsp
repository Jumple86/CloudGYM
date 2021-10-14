<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="com.tag.model.*"%>

<%
	TagService tagsvc = new TagService();
	List<TagVO> list = tagsvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>AllTag</title>

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
	width: 800px;
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
				<h3>listAllTag.jsp</h3>
				<h4>
					<a href="selectTagPage.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列           ??????? --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>標籤編號</th>
			<th>標籤名稱</th>
<!-- 			<th>修改</th> -->
<!-- 			<th>刪除</th> -->
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="TagVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${TagVO.tagID}</td>
				<td>${TagVO.tagName}</td>
<!-- 				<td> -->
<%-- 						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/tag/tag.do" style="margin-bottom: 0px;"> --%>
<!-- 						<input type="submit" value="修改"> -->
<%-- 						<input type="hidden" name="tagid" value="${tagVO.tagID}"> --%>
<!-- 						<input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 					</FORM> -->
<!-- 				</td> -->
<!-- 				<td> -->
<%-- 					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/tag/tag.do" style="margin-bottom: 0px;"> --%>
<!-- 						<input type="submit" value="刪除"> -->
<%-- 						<input type="hidden" name="tagid" value="${tagVO.tagID}"> --%>
<!-- 						<input type="hidden" name="action" value="delete"> -->
<!-- 					</FORM> -->
<!-- 				</td> -->
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>