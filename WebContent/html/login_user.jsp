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
<title>login_user</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/login_user.css">
</head>
<body>

	<div id="login">
		<form method="post" action="loginhandler">
			<h2>會員登入</h2>
			<input type="text" name="account" placeholder="請輸入帳號" id="email"
			value="<%=(userVO == null) ? "1001@cloudgym.com" : userVO.getUserAccount()%>"> 
			<br> 
			<input type="password" name="password" placeholder="請輸入密碼" id="password"
			value="<%=(userVO == null) ? "123456" : userVO.getUserPassword()%>"> 
			<br> 
			
			<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<c:forEach var="message" items="${errorMsgs}">
						<a id="errormsg">${message}</a>
					</c:forEach>
				</c:if>
			
			<a id="forget" href="./forget_password.jsp">忘記密碼了?笑你</a>
			
			
			
			 
			<input type="hidden" name="action" value="login">
			<button type="submit">Login</button>
			<br> 
			<a href="./sign_up_page.jsp" id="sign_up">新來的?註冊帳號</a>
		</form>
	</div>



</body>
</html>