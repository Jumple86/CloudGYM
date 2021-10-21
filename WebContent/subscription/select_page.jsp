<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>教練訂閱首頁</title>

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
			<td><h3>教練訂閱首頁</h3>
				<h4>( MVC )</h4></td>
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
		<li><a href='listAllSubscription.jsp'>資料列表</a> 所有教練訂閱資料
			<h4>(byDAO).</h4>
			<br>
		<br>
		<br></li>
		
	<li>
    <FORM METHOD="post" ACTION="subscription.do" >
        <b>輸入訂閱編號 (如:1):</b>
        <input type="text" name="subNo">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
    </li>
<jsp:useBean id="subscriptionSvc" scope="page" class="com.subscription.model.SubscriptionService" />

		<li>
			<FORM METHOD="post" ACTION="subscription.do">
				<b>選擇訂閱編號:</b> <select size="1" name="subNo">
					<c:forEach var="subscriptionVO" items="${subscriptionSvc.all}">
						<option value="${subscriptionVO.subNo}">${subscriptionVO.subNo}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>
	
<h3>資料管理</h3>
<ul>
  <li><a href='addSubscription.jsp'>Add</a> a new Emp.</li>
</ul>
</body>
</html>