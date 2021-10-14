<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.posts.model.*"%>

<%
	PostsService postssvc = new PostsService();
	List<PostsVO> list = postssvc.getAll();
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="tagSvc" scope="page" class="com.tag.model.TagService" />

<html>
<head>
<title>AllPosts</title>

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
				<h3>listAllPosts.jsp</h3>
				<h4>
					<a href="selectPostsPage.jsp">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- ���~��C           ??????? --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>�峹�s��</th>
			<th>�|���s��</th>
			<th>�峹���D</th>
			<th>�峹���e</th>
			<th>�峹�Ϥ�</th>
			<th>�峹�إߤ��</th>
			<th>���ҽs��</th>
			<th>�峹���g��</th>
			<th>�峹���|����</th>
			<th>�峹���</th>
			<th>�ק�</th>
			<th>�R��</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="PostsVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${PostsVO.postsID}</td>
				<td>${PostsVO.userID}</td>
				<td>${PostsVO.postsTitle}</td>
				<td>${PostsVO.postsContent}</td>
				<td><img src="<%=request.getContextPath()%>/Reader?id=${PostsVO.postsID}"></td>
				<td>${PostsVO.postsPublishDate}</td>
				<td><c:forEach var="tagVO" items="${tagSvc.all}">
						<c:if test="${PostsVO.tagID == tagVO.tagID}">
	                    ${tagVO.tagName}
                    	</c:if>
					</c:forEach></td>
				<td>${PostsVO.postsLikes}</td>
				<td>${PostsVO.postsReportedTimes}</td>
				<td>${PostsVO.postsShow}</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/posts/posts.do" style="margin-bottom: 0px;">
						<input type="submit" value="�ק�">
						<input type="hidden" name="postsid" value="${PostsVO.postsID}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/posts/posts.do" style="margin-bottom: 0px;">
						<input type="submit" value="�R��">
						<input type="hidden" name="postsid" value="${PostsVO.postsID}">
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>