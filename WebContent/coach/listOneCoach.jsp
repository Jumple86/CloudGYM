<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.coach.model.*"%>

<%
CoachVO coachVO = (CoachVO) request.getAttribute("coachVO");
%>

<html>
<head>
<title>教練資料</title>

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
	<tr><td>
		 <h3>教練資料-listOneCoach</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>教練編號</th>
		<th>教練帳號</th>
		<th>教練名字</th>
		<th>教練密碼</th>
		<th>教練圖片</th>
		<th>教練電話</th>
		<th>教練性別</th>
		<th>教練生日</th>
		<th>教練自我介紹</th>
		<th>教練註冊日期</th>
		<th>教練證照</th>
		<th>被檢舉次數</th>
	</tr>
	
	<tr>
		<td><%=coachVO.getUserID() %></td>
		<td><%=coachVO.getCoachAccount() %></td>
		<td><%=coachVO.getCoachName() %></td>
		<td><%=coachVO.getCoachPassword() %></td>
		<td><%=coachVO.getCoachImg() %></td>
		<td><%=coachVO.getUserMobile() %></td>
		<td><%=coachVO.getCoachSex() %></td>
		<td><%=coachVO.getCoachBirthday() %></td>
		<td><%=coachVO.getCoachDescription() %></td>
		<td><%=coachVO.getCoachRegisteredDate() %></td>
		<td><%=coachVO.getCoachCertificate() %></td>
		<td><%=coachVO.getReportedTimes() %></td>
	</tr>
</table>

</body>
</html>