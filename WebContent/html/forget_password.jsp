<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.user.model.*"%>

<%
	UserVO userVO = (UserVO) request.getAttribute("userVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�ѰO�K�X</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/forget_password.css">
</head>
<body>
	<form method="post" action="ResetPassword">
		<div id="forget">
			<p>�п�J�l��</p>
			    <input type="text" placeholder="�п�J�l��" id="email"
					name="userAccount" value="<%=(userVO == null) ? "angel59272624@gmail.com" : userVO.getUserAccount()%>">
			<hr>

			<%-- ���~��C --%>
			<c:if test="${not empty errorMsgs}">
				<c:forEach var="message" items="${errorMsgs}">
					<a id="errormsg">${message}</a>
				</c:forEach>
			</c:if>

			<input type="hidden" name="action" value="userForget">
			<button type="submit">�o�e�l��</button>

		</div>



	</form>
</body>
</html>