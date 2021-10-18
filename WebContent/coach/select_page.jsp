<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�нm��ƭ���</title>

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
   <tr><td><h3>�нm��ƭ���</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

<h3>��Ƭd��:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllCoach.jsp'>���</a> �Ҧ��нm�C��  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="coach.do" >
        <b>��J�нm�s�� (�p2001):</b>
        <input type="text" name="userID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="coachSvc" scope="page" class="com.coach.model.CoachService" />
   
  <li>
     <FORM METHOD="post" ACTION="coach.do" >
       <b>��ܱнm�s��:</b>
       <select size="1" name="userID">
         <c:forEach var="coachVO" items="${coachSvc.all}" > 
          <option value="${coachVO.userID}">${coachVO.userID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="coach.do" >
       <b>��ܱнm�m�W:</b>
       <select size="1" name="userID">
         <c:forEach var="coachVO" items="${coachSvc.all}" > 
          <option value="${coachVO.userID}">${coachVO.coachName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>

<h3>�s�W</h3>
<ul>
  <li><a href='addCoach.jsp'>�[�J</a> �s�нm</li>
</ul>
</body>
</html>