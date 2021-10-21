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
<title>�Ҧ��нm���</title>

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
		 <h3>�Ҧ��нm��� - listAllCoach.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�нm�s��</th>
		<th>�нm�b��</th>
		<th>�нm�W�r</th>
		<th>�нm�K�X</th>
<!-- 		<th>�нm�Ӥ�</th>		 -->
		<th>�нm�q��</th>
		<th>�нm�ʧO</th>
		<th>�нm�ͤ�</th>
		<th>�нm�ۧڤ���</th>
		<th>�нm���U���</th>
		<th>�нm�ҷ�</th>
		<th>�Q���|����</th>
		<th>�ק�</th>
		<th>�R��</th>
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
			 <input type="submit" value="�ק�">
			 <input type="hidden" name="userID"  value="${coachVO.userID}">
			 <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
		</td>
		<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/coach/coach.do" style="margin-bottom: 0px;">
			 <input type="submit" value="�R��">
			 <input type="hidden" name="userID"  value="${coachVO.userID}">
			 <input type="hidden" name="action" value="delete"></FORM>
		</td>
	</tr>	
</c:forEach>

</table>
<%@ include file="page2.file" %>

</body>
</html>