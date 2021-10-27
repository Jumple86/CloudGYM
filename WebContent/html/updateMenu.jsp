<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.thePosition.model.*" %>
<%@ page import="com.coachMenu.model.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>教練編輯菜單</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/updateMenu.css">
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