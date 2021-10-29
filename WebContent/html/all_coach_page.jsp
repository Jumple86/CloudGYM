<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coach.model.*"%>

<%
	CoachService coachSvc = new CoachService();
	List<CoachVO> coach = coachSvc.getAll();
	pageContext.setAttribute("coach", coach);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>教練總覽</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/all_coach_page.css">
</head>
<body>
<!-- bar公版 begining -->
    <div id="bar">
        <div id="title">
            <ul>
                <li class="bar_li">
                    <img src="../img/logo.png" alt="" for="#CloudGYM">
                </li>
                <li class="bar_li">
                    <a href="${pageContext.request.contextPath}/html/main_page.jsp" id="CloudGYM">CloudGYM</a>
                </li>
            </ul>
        </div>
        <div id="option">
            <ul>
                <li class="option"><a href="#">運動類型</a></li>
                <li class="option"><a href="${pageContext.request.contextPath}/html/all_coach_page.jsp">教練</a></li>
                <li class="option"><a href="${pageContext.request.contextPath}/userMainPage/userMainPage.jsp">個人專區</a></li>
                <li class="option"><a href="${pageContext.request.contextPath}/html/ArticleList.jsp">討論區</a></li>
                
                <c:if test="${empty name}">
					<li class="option"><a href="${pageContext.request.contextPath}/html/login_ask_page.html" target="_blank">註冊/登入</a></li>
				</c:if>
				<c:if test="${not empty name}">
					<li class="option"><a href="<%=request.getContextPath()%>/LogoutHandler">${name} 登出</a></li>
				</c:if>
                
                <li class="option">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                      </svg>
                </li>
            </ul>
        </div>
    </div>
<!-- bar公版 end -->

	<div id="main">
		<div class="find">
			<form method="post" action="coach.do">
				<input type="text" name="coachName" id="coachName" placeholder="點我找教練"> <i class="fas fa-paper-plane"></i>
			</form>
		</div>
		<div class="coach_list">
			<ul>
				<c:forEach var="coachVO" items="${coach}">
					<form action="<%=request.getContextPath()%>/html/coach.do?">
						<input type="submit" id="${coachVO.userID }" style="display:none;">
						<input type="hidden" name="action" value="getOne_For_Display"> <input
							type="hidden" name="userID" value="${coachVO.userID }"> 
						<label for="${coachVO.userID }">
							<li class="coach"><img
								src="<%=request.getContextPath()%>/coachImg/coachImg.do?userID=${coachVO.userID}"
								alt=""> <span class="info">
									<h3>${coachVO.coachName }</h3>
									<p class="descirption">${coachVO.coachDescription }</p>
							</span></li>
						</label>
					</form>

				</c:forEach>
			</ul>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(function() {
			$("li.coach img").filter(":odd").css("float", "right");
			$("li.coach span").filter(":odd").css("float", "left");
			$("li.coach").filter(":odd").css("border-top-left-radius", "20px");
			$("li.coach").filter(":odd").css("border-bottom-left-radius",
					"20px");
			$("li.coach").filter(":odd").css("border-top-right-radius", "0");
			$("li.coach").filter(":odd").css("border-bottom-right-radius", "0");

		});
	</script>
</body>
</html>