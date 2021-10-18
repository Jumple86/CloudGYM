<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.subscription.model.*"%>

<%SubscriptionVO subscriptionVO = (SubscriptionVO) request.getAttribute("subscriptionVO");%>

<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>訂閱資料更改</title>

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
</style>

<style>
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
	<tr><td>
		 <h3>訂閱資料修改 - update_emp_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="subscription.do" name="form1">
<table>
	<tr>
		<td>訂閱編號:<font color=red><b>*</b></font></td>
		<td><%=subscriptionVO.getSubNo()%></td>
	</tr>
	<tr>
		<td>方案編號:</td>
		<td><input type="TEXT" name="subID" size="45" value="<%=subscriptionVO.getSubID()%>" /></td>
	</tr>
	<tr>
		<td>教練編號:</td>
		<td><input type="TEXT" name="userID" size="45"	value="<%=subscriptionVO.getUserID()%>" /></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="subNo" value="<%=subscriptionVO.getSubNo()%>">
<input type="submit" value="送出修改"></FORM>
</body>
</html>