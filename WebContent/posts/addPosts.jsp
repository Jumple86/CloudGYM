<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.posts.model.*"%>

<%
	PostsVO postsVO = (PostsVO) request.getAttribute("postsVO");
%>

<html>
<head>
<title>addPosts</title>
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
			<td><h3>addPosts.jsp</h3></td>
			<td><h4><a href="selectPostsPage.jsp">�^����</a></h4></td>
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

	<FORM METHOD="post" ACTION="posts.do" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>�峹�s��:</td>
				<td><input type="TEXT" name="postsid" size="45"	value="<%=(postsVO == null) ? "" : postsVO.getPostsID()%>" /></td>
			</tr>
			<tr>
				<td>�|���s��:</td>
				<td><input type="TEXT" name="userid" size="45" value="<%=(postsVO == null) ? "" : postsVO.getUserID()%>" /></td>
			</tr>
			<tr>
				<td>�峹���D:</td>
				<td><input type="TEXT" name="poststitle" size="45" value="<%=(postsVO == null) ? "" : postsVO.getPostsTitle()%>" /></td>
			</tr>
			<tr>
				<td>�峹���e:</td>
				<td><input type="TEXT" name="postscontent" size="45" value="<%=(postsVO == null) ? "" : postsVO.getPostsContent()%>" /></td>
			</tr>
			<tr>
				<td>�峹�Ϥ�:</td>
				<td><input type="file" name="postsimg" size="45" value="<%=(postsVO == null) ? "" : postsVO.getPostsImg()%>" /></td>
			</tr>
			<tr>
				<td>�o����:</td>
				<td><input name="postspublishdate" id="f_date1" type="text"></td>
			</tr>

			<jsp:useBean id="tagSvc" scope="page" class="com.tag.model.TagService" />
			<tr>
				<td>����:<font color=red><b>*</b></font></td>
				<td><select size="1" name="tagid">
						<c:forEach var="tagVO" items="${tagSvc.all}">
							<option value="${tagVO.tagID}" ${(postsVO.tagID==tagVO.tagID)? 'selected':'' }> ${tagVO.tagName}
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<td>�O�_���:</td>
				<td><select size="1" name="postsshow">
				<option value="1" selected>�O</option>
    			<option value="0">�_</option>
				</select></td>
			</tr>

		</table>
		<br> 
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="�e�X�s�W">
	</FORM>

</body>
</html>