<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.user.model.*"%>
<%
  response.setHeader("Cache-Control","no-store"); //HTTP 1.1
  response.setHeader("Pragma","no-cache");        //HTTP 1.0
  response.setDateHeader ("Expires", 0);
%>

<%
  UserVO userVO = (UserVO) request.getAttribute("userVO");
%>

<html>
<head>
<meta charset="BIG5">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login_admin</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login_admin.css">
</head>
<body>

	<div id="login">
		<form method="post" action="<%=request.getContextPath()%>/AdminLoginHandler">
			<h2>�޲z�̵n�J</h2>
			<input type="text" name="adminNo" placeholder="�п�J�޲z�̱b��" id="adminNo"
			value="9001"> 
			<br> 
			<input type="password" name="password" placeholder="�п�J�K�X" id="password"
			value="123"> 
			<br> 
			
			<%-- ���~���C --%>
				<c:if test="${not empty errorMsgs}">
					<c:forEach var="message" items="${errorMsgs}">
						<a id="errormsg">${message}</a>
					</c:forEach>
				</c:if>
			
			<input type="hidden" name="action" value="login">
			<button type="submit">Login</button>
			<br> 
		</form>
	</div>



</body>
</html>