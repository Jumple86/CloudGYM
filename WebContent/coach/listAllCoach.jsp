<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coach.model.*"%>

<%
    CoachService coachSvc = new CoachService();
    List<CoachVO> list = coachSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
<html>

<head>
<title>所有教練資料</title>

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
	<tr><td>
		 <h3>所有教練資料 - listAllCoach.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>教練編號</th>
		<th>教練帳號</th>
		<th>教練名字</th>
		<th>教練密碼</th>
<!-- 		<th>教練照片</th>		 -->
		<th>教練電話</th>
		<th>教練性別</th>
		<th>教練生日</th>
		<th>教練自我介紹</th>
		<th>教練註冊日期</th>
		<th>教練證照</th>
		<th>被檢舉次數</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
<%@ include file="page1.file" %>
<c:forEach var="coachVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<tr>
		<td>${coachVO.userID}</td>
		<td>${coachVO.coachAccount}</td>
		<td>${coachVO.coachName}</td>
		<td>${coachVO.coachPassword}</td>
<%-- 		<td><img src="<%=request.getContextPath()%>/Reader?id=${CoachVO.coachImg}"></td> --%>
		<td>${coachVO.userMobile}</td>
		<td>${coachVO.coachSex}</td>
		<td><fmt:formatDate value="${coachVO.coachBirthday}" pattern="yyyy-MM-dd"/></td>
		<td>${coachVO.coachDescription}</td>
		<td><fmt:formatDate value="${coachVO.coachRegisteredDate}" pattern="yyyy-MM-dd"/></td>
		<td>${coachVO.coachCertificate}</td>
		<td>${coachVO.reportedTimes}</td>
		<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/coach/coach.do" style="margin-bottom: 0px;">
			 <input type="submit" value="修改">
			 <input type="hidden" name="userID"  value="${coachVO.userID}">
			 <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
		</td>
		<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/coach/coach.do" style="margin-bottom: 0px;">
			 <input type="submit" value="刪除">
			 <input type="hidden" name="userID"  value="${coachVO.userID}">
			 <input type="hidden" name="action" value="delete"></FORM>
		</td>
	</tr>	
</c:forEach>

</table>
<%@ include file="page2.file" %>

</body>
</html>