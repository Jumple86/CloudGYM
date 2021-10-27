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

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>忘記密碼</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/forget_password.css">
</head>
<body>
	<form method="post" action="ResetPassword">
		<div id="forget">
			<p>請輸入郵件</p>
			    <input type="text" placeholder="請輸入郵件" id="email"
					name="userAccount" value="<%=(userVO == null) ? "angel59272624@gmail.com" : userVO.getUserAccount()%>">
			<hr>

			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<c:forEach var="message" items="${errorMsgs}">
					<a id="errormsg">${message}</a>
				</c:forEach>
			</c:if>

			<input type="hidden" name="action" value="userForget">
			<button type="submit">發送郵件</button>

		</div>



	</form>
</body>
</html>