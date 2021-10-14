<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.posts.model.*"%>
<%@ page import="com.tag.model.*"%>

<%
	PostsVO postsVO = (PostsVO) request.getAttribute("postsVO");
%>

<%
	TagService tagSvc = new TagService();
	TagVO tagVO = tagSvc.getByTagID(postsVO.getTagID());
%>


<html>
<head>
<title>listOnePosts.jsp</title>
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
				<h3>ListOnePosts.jsp</h3>
				<h4>
					<a href="selectPostsPage.jsp">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�峹�s��</th>
			<th>�|���s��</th>
			<th>�峹���D</th>
			<th>�峹���e</th>
			<th>�峹�Ϥ�</th>
			<th>�峹�إߤ��</th>
			<th>����</th>
			<th>�峹���g��</th>
			<th>�峹���|����</th>
			<th>�峹���</th>
		</tr>
		<tr>
			<td><%=postsVO.getPostsID()%></td>
			<td><%=postsVO.getUserID()%></td>
			<td><%=postsVO.getPostsTitle()%></td>
			<td><%=postsVO.getPostsContent()%></td>
			<td><img src="<%=request.getContextPath()%>/DBGifReader2?id=<%=postsVO.getPostsID()%>"></td>
			<td><%=postsVO.getPostsPublishDate()%></td>
			<td><%=tagVO.getTagName()%></td>
			<td><%=postsVO.getPostsLikes()%></td>
			<td><%=postsVO.getPostsReportedTimes()%></td>
			<td><%=postsVO.isPostsShow()%></td>
		</tr>
	</table>

</body>
</html>