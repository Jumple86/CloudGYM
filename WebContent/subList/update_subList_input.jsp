<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.subList.model.*"%>

<%SubListVO subListVO = (SubListVO) request.getAttribute("subListVO");%>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<title>�q�\��ק�s</title>
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
		 <h3>��׸�ƭק� - update_subList_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="subList.do" name="form1">
<table>
	<tr>
		<td>��׽s��:<font color=red><b>*</b></font></td>
		<td><%=subListVO.getSubID()%></td>
	</tr>
	<tr>
		<td>��׮ɪ�:</td>
		<td><input type="TEXT" name="duration" size="45" value="<%=subListVO.getDuration()%>" /></td>
	</tr>
	<tr>
		<td>��צW��:</td>
		<td><input type="TEXT" name="subName" size="45"	value="<%=subListVO.getSubName()%>" /></td>
	</tr>
	<tr>
		<td>����:</td>
		<td><input type="TEXT" name="price" size="45"	value="<%=subListVO.getPrice()%>" /></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="subID" value="<%=subListVO.getSubID()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>
</html>