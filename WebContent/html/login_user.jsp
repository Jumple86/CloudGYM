<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.user.model.*"%>

<%
  UserVO userVO = (UserVO) request.getAttribute("userVO");
%>

<html>
<head>
<meta charset="BIG5">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login_user</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/login_user.css">
</head>
<body>

	<div id="login">
		<form method="post" action="loginhandler">
			<h2>�|���n�J</h2>
			<input type="text" name="account" placeholder="�п�J�b��" id="email"
			value="<%=(userVO == null) ? "1001@cloudgym.com" : userVO.getUserAccount()%>"> 
			<br> 
			<input type="password" name="password" placeholder="�п�J�K�X" id="password"
			value="<%=(userVO == null) ? "123456" : userVO.getUserPassword()%>"> 
			<br> 
			
			<%-- ���~���C --%>
				<c:if test="${not empty errorMsgs}">
					<c:forEach var="message" items="${errorMsgs}">
						<a id="errormsg">${message}</a>
					</c:forEach>
				</c:if>
			
			<a id="forget" href="./forget_password.jsp">�ѰO�K�X�F?���A</a>
			
			
			
			 
			<input type="hidden" name="action" value="login">
			<button type="submit">Login</button>
			<br> 
			<a href="./sign_up_page.jsp" id="sign_up">�s�Ӫ�?���U�b��</a>
		</form>
	</div>



</body>
</html>