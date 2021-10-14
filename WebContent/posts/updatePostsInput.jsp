<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.posts.model.*"%>

<%
	PostsVO postsVO = (PostsVO) request.getAttribute("postsVO");
%>

<html>
<head>
<title>updatePostsInput</title>
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
				<h3>updatePostsInput</h3>
				<h4><a href="selectPostsPage.jsp">回首頁</a></h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="posts.do" name="form1">
		<table>
			<tr>
				<td>文章編號:<font color=red><b>*</b></font></td>
				<td><%=postsVO.getPostsID()%></td>
			</tr>
			<tr>
				<td>文章標題:</td>
				<td><input type="TEXT" name="poststitle" size="45" value="<%=postsVO.getPostsTitle()%>" /></td>
			</tr>
			<tr>
				<td>文章內容:</td>
				<td><input type="TEXT" name="postscontent" size="45" value="<%=postsVO.getPostsContent()%>" /></td>
			</tr>
			<tr>
				<td>文章圖片:</td>
				<td><input type="file" name="postsimg" size="45"></td>
			</tr>
			<tr>
				<td>發文日期:</td>
				<td><input name="postspublishdate" size="45"></td>
			</tr>

			<jsp:useBean id="tagSvc" scope="page" class="com.tag.model.TagService" />
			<tr>
				<td>標籤:<font color=red><b>*</b></font></td>
				<td><select size="1" name="tagid">
						<c:forEach var="tagVO" items="${tagSvc.all}">
							<option value="${tagVO.tagID}" ${(postsVO.tagID==tagVO.tagID)? 'selected':'' }>${tagVO.tagName}
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<td>是否顯示:</td>
				<td><select size="1" name="postsshow">
				<option value="1" selected>是</option>
    			<option value="0">否</option>
				</select></td>
			</tr>

		</table>
		<br> 
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="postsid" value="<%=postsVO.getPostsID()%>">
		<input type="submit" value="送出修改">
	</FORM>
</body>