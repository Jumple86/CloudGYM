<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.thePosition.model.*" %>
<%@ page import="com.coachMenu.model.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
<style>
#menu {
	margin: auto;
	float: right;
}

.main {
	background-color:#5C37A1;
	color: white;
	font-size: 14px;
	cursor: pointer;
	text-align: center;
	height: 40px;
	line-height: 40px;
	width: 70px;
}

.main a {
	color: #fff;
	text-decoration: none;
	line-height: 40px;
	margin: auto;
}

#logout{
	width: 100%;
}

.url {
	margin: auto;
}

.main:hover {
	background-color: #4d4949;
}

.sub {
	position:fixed;
	cursor: pointer;
	background-color: #4d4949;
	color: white;
	font-size: 12px;
	font-family: 微軟正黑體;
	text-align: center;
	width: 70px;
}

.sub li {
	list-style-type: none;
	line-height: 40px;
}

.sub a {
	list-style-type: none;
	line-height: 40px;
	margin: auto;
}

.item {
	float: left;
}

#menu li {
	list-style-type: none;
}

/****************** bar css end ******************/
</style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>教練編輯菜單</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/updateMenu.css">
</head>
<body>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$("#menu").css("width", $(".main").length * 200)
		$(document).ready(function() {
			//  一進入畫面時收合選單
			$(".sub").slideUp(0);

			for (i = 0; i < $(".main").length; i++) {
				//  點選按扭時收合或展開選單
				$(".main:eq(" + i + ")").on("click", {
					id : i
				}, function(e) {
					n = e.data.id
					$(".sub:eq(" + n + ")").slideToggle()
					$(".sub:not(:eq(" + n + "))").slideUp()
				})
				$(".main:eq(" + i + ")").on("mouseleave", {
					id : i
				}, function(e) {
					n = e.data.id
					$(".sub").stop();
				})
			}
		})
	</script>

	<!-- bar begining -->
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
				<li class="option"><a
					href="<%=request.getContextPath()%>/html/video/all_video_page.jsp">運動類型</a></li>
				<li class="option"><a
					href="<%=request.getContextPath()%>/html/coach/all_coach_page.jsp">教練</a></li>
				<li class="option"><c:if test="${not empty userID}">
						<a
							href="<%=request.getContextPath()%>/html/user/protected_user/userMainPage.jsp?userID=${userID}">個人專區</a>
					</c:if> <c:if test="${ empty userID}">個人專區</c:if></li>
				<li class="option"><a
					href="<%=request.getContextPath()%>/html/article/ArticleList.jsp">討論區</a></li>
				<c:if test="${empty userID}">
					<div class="item">
						<div class="main">註冊/登入</div>
						<div class="sub">
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/html/login/sign_up_page.jsp">會員註冊</a></li>
								<li><a
									href="${pageContext.request.contextPath}/html/login/login_user.jsp">會員登入</a></li>
								<li><a
									href="${pageContext.request.contextPath}/html/login/login_coach.jsp">教練登入</a></li>
								<li><a
									href="${pageContext.request.contextPath}/html/login/login_admin.jsp"
									target="_blank">後台管理</a></li>
							</ul>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty userID}">
				<div class="item">
					<div class="main" id="logout"><a href="javascript:if (confirm('確認登出?')) location.href='<%=request.getContextPath()%>/LogoutHandler'">${name} 登出</a></div>
						<div class="sub"></div>
					</div>
				</c:if>
				<li class="option"><a
					href="<%=request.getContextPath()%>/html/order/pay_page.jsp">
						<i class="bi bi-cart-fill"> <c:if test="${hlen != 0}">
								<span>${hlen}</span>
							</c:if> <c:if test="${hlen == 0}">
								<span>${cartCount}</span>
							</c:if> <span>${cartCount}</span>
					</i>
				</a></li>
			</ul>
        </div>
    </div>
<!-- bar公版 end -->

    <div id="main">
        <div id="form">
            <div id="box1">
                <ul>
                    <h3 id="form_title">編輯菜單</h3>
                </ul>
            </div>
            <div id="box2">
                <ul>
                    <li id="menu_name">菜單名稱:<input id="name_input" type="text" placeholder="輸入菜單名稱" aria-label="default input example"></li><br>
                </ul>
                <br>
                <ul>
                    <li>價錢:<input id="price" type="number" placeholder="選擇價格" aria-label="default input example"></li>
                </ul>
                <br><br>
                <ul>部位選擇:</ul>
                <br>
                <ul>
                    <select>
                        <option>請選擇部位</option>
                        <option>部位1</option>
                        <option>部位2</option>
                        <option>部位3</option>
                        <option>部位4</option>
                        <option>部位5</option>
                        <option>部位6</option>
                    </select>
                </ul>
                <br><br>
                <ul>
                    <input type="radio" id="userGender_01" name="userGender" value="0" checked="checked" />公開  
                    <input type="radio" id="userGender_02" name="userGender" value="1" />不公開
                </ul>
            </div>
            <div id="post_box">
                        <li id="post_name">動作名稱:<br><br>
                            <input id="post_input" type="text" placeholder="輸入動作名稱" aria-label="default input example"><input id="set" type="number" placeholder="幾組" aria-label="default input example">
                        </li>
                        <li id="post_name">動作名稱:<br><br>
                            <input id="post_input" type="text" placeholder="輸入動作名稱" aria-label="default input example"><input id="set" type="number" placeholder="幾組" aria-label="default input example">
                        </li>
                        <li id="post_name">動作名稱:<br><br>
                            <input id="post_input" type="text" placeholder="輸入動作名稱" aria-label="default input example"><input id="set" type="number" placeholder="幾組" aria-label="default input example">
                        </li>
            </div>
            <div id="button_area">
                <button type="button" id="button" class="btn btn-primary btn-lg">確認</button>
                <button type="button" id="button" class="btn btn-primary btn-lg">取消</button>
                <button type="button" id="button" class="btn btn-primary btn-lg">刪除菜單</button>
            </div>
        </div>
    </div>
</body>
</html>