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


	<h3>��Ƭd��:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
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
				<b>��J�峹�s��:</b> 
				<input type="text" name="postsid"> 
				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="�e�X">
			</FORM>
		</li>

		<jsp:useBean id="postsSvc" scope="page"	class="com.posts.model.PostsService" />

		<li>
			<FORM METHOD="post" ACTION="posts.do">
				<b>��ܤ峹�s��:</b> 
				<select size="1" name="postsid">
					<c:forEach var="postsVO" items="${postsSvc.all}">
						<option value="${postsVO.postsID}">${postsVO.postsID}
					</c:forEach>
				</select> 
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>


		<li>
			<FORM METHOD="post" ACTION="posts.do">
				<b>��ܤ峹���D:</b> 
				<select size="1" name="postsid">
					<c:forEach var="postsVO" items="${postsSvc.all}">
						<option value="${postsVO.postsID}">${postsVO.postsTitle}
					</c:forEach>
				</select> 
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>
	</ul>

	<h3>�峹�޲z</h3>

	<ul>
		<li><a href='addPosts.jsp'>Add</a> a new Posts.</li>
	</ul>
</body>
</html>