<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>PostsHome</title>
<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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
</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>TagHome</h3></td>
		</tr>
	</table>


	<h3>資料查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>

		<li><a href='listAllPosts.jsp'>List</a> all Posts. <br> <br></li>

		<li>
			<FORM METHOD="post" ACTION="posts.do">
				<b>輸入文章編號:</b> 
				<input type="text" name="postsid"> 
				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="postsSvc" scope="page"	class="com.posts.model.PostsService" />

		<li>
			<FORM METHOD="post" ACTION="posts.do">
				<b>選擇文章編號:</b> 
				<select size="1" name="postsid">
					<c:forEach var="postsVO" items="${postsSvc.all}">
						<option value="${postsVO.postsID}">${postsVO.postsID}
					</c:forEach>
				</select> 
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>


		<li>
			<FORM METHOD="post" ACTION="posts.do">
				<b>選擇文章標題:</b> 
				<select size="1" name="postsid">
					<c:forEach var="postsVO" items="${postsSvc.all}">
						<option value="${postsVO.postsID}">${postsVO.postsTitle}
					</c:forEach>
				</select> 
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>

	<h3>文章管理</h3>

	<ul>
		<li><a href='addPosts.jsp'>Add</a> a new Posts.</li>
	</ul>
</body>
</html>