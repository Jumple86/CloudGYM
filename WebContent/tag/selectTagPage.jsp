<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>TagHome</title>
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
		<li><a href='listAllTag.jsp'>List</a> all Tags. <br> <br></li>


		<li>
			<FORM METHOD="post" ACTION="tag.do">
				<b>輸入標籤編號:</b> <input type="text" name="tagid"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="tagSvc" scope="page" class="com.tag.model.TagService" />

		<li>
			<FORM METHOD="post" ACTION="tag.do">
				<b>選擇標籤編號:</b>
				<select size="1" name="tagid">
					<c:forEach var="tagVO" items="${tagSvc.all}">
						<option value="${tagVO.tagID}">${tagVO.tagID}
					</c:forEach>
				</select> 
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>


		<li>
			<FORM METHOD="post" ACTION="tag.do">
				<b>選擇標籤名稱:</b> 
				<select size="1" name="tagid">
					<c:forEach var="tagVO" items="${tagSvc.all}">
						<option value="${tagVO.tagID}">${tagVO.tagName}
					</c:forEach>
				</select> 
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>


	<!-- 			<h3>員工管理</h3> -->

	<!-- 			<ul> -->
	<!-- 				<li><a href='addEmp.jsp'>Add</a> a new Emp.</li> -->
	</ul>

</body>
</html>
