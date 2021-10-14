<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.admin.model.*" %>

<%
	AdminService adminSvc = new AdminService();
	Integer adminNo = (Integer) session.getAttribute("adminNo");
	AdminVO adminVO = adminSvc.getOneAdmin(adminNo);
	pageContext.setAttribute("adminVO", adminVO);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�s��޲z�����</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/back_end_index.css">
    <link rel="stylesheet" href="../css/back_end_Admin_page.css">
</head>
<body>
    <div id="bar">
        <div id="title">
            <ul>
                <li class="bar_li">
                    <img src="../img/logo.png" alt="" for="#CloudGYM">
                </li>
                <li class="bar_li">
                    <a href="#" id="CloudGYM">CloudGYM</a>
                </li>
            </ul>
        </div>
        <div id="option">
            <ul>
                <li class="option"><a class="logout" href="#">�n�X</a></li>
                <li class="option"><a class="login_ad" href="#">�޲z��</a></li>
            </ul>
        </div>
    </div>
    <div id="wrap">
        <div id="left"></div>

            <div id="right">
            <div class="main">           
            <%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color:red">�Эץ��H�U���~:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
      
                <div class="main-out">
                    <div class="name">�޲z����ƭק�</div>               
                    <form method="post" action="admin.do" name="form1">
                        <ul class="name-ul">
                            <li class="name-li">adminID: <span>${adminNo}</span></li>
                            <li class="name-li">�m�W
                                <input type="text" name="name" value="${adminVO.adminName}">
                            </li>
                            <li class="name-li">�K�X
                                <input type="text" name="pws">
                            </li>
                            <li class="name-li">�T�{�K�X
                                <input type="password" name="confpws">
                            </li>
                            <div>
                                    <input type="hidden" name="id" value="${adminNo}">
                                    <button class="confirm" type="submit" name="action" value="update">�T�{</button>
                                    <a href="<%=request.getContextPath()%>/html/back_end_Admin.jsp">
                                    	<button class="cancel" type="button">����</button>
                                    </a>
                            </div>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>