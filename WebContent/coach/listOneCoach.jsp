<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.coach.model.*"%>

<%
CoachVO coachVO = (CoachVO) request.getAttribute("coachVO");
%>

<html>
<head>
<title>�нm���</title>

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
		 <h3>�нm���-listOneCoach</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�нm�s��</th>
		<th>�нm�b��</th>
		<th>�нm�W�r</th>
		<th>�нm�K�X</th>
		<th>�нm�Ϥ�</th>
		<th>�нm�q��</th>
		<th>�нm�ʧO</th>
		<th>�нm�ͤ�</th>
		<th>�нm�ۧڤ���</th>
		<th>�нm���U���</th>
		<th>�нm�ҷ�</th>
		<th>�Q���|����</th>
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