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
					<a href="selectPostsPage.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>文章編號</th>
			<th>會員編號</th>
			<th>文章標題</th>
			<th>文章內容</th>
			<th>文章圖片</th>
			<th>文章建立日期</th>
			<th>標籤</th>
			<th>文章按讚數</th>
			<th>文章檢舉次數</th>
			<th>文章顯示</th>
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