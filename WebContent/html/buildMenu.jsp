<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.thePosition.model.*" %>
<%@ page import="com.coachMenu.model.*" %>

<%
	Integer userID = Integer.parseInt(request.getParameter("userID"));
	request.setAttribute("userID", userID);
	
	String location = request.getRequestURI();
	request.setAttribute("location", location);
	
	CoachMenuVO coachMenuVO = (CoachMenuVO) request.getAttribute("coachMenuVO");
	
	List<String> errorMsgs = (List<String>) request.getAttribute("errorMsgs");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>教練建立菜單</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/buildMenu.css">
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
                <li class="option">運動類型</li>
                <li class="option">教練</li>
                <li class="option">個人專區</li>
                <li class="option">討論區</li>
                <li class="option">註冊/登入</li>
                <li class="option">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                      </svg>
                </li>
            </ul>
        </div>
    </div>

    <div id="main">
        <div id="form">
            <div id="box1">
                <h3 id="form_title">建立新菜單</h3>
                <%if(errorMsgs != null){if(errorMsgs.contains("資料有誤，無法新增菜單")) {%>
                    <span style="color:red; margin-left:160px; font-size:10px">資料有誤，無法新增菜單</span>
                <%}} %>
            </div>
            <form action="<%=request.getContextPath()%>/coachMenu/coachMenu.do" method="post">
            <div id="box2">
                <ul>
                    <li id="menu_name">菜單名稱：
                    <input id="name_input" type="text" placeholder="輸入菜單名稱" aria-label="default input example" 
                    	name="menuName" value="<%=(coachMenuVO == null) ? "" : coachMenuVO.getMenuName()%>">
                    <%if(errorMsgs != null){if(errorMsgs.contains("請輸入菜單名稱")) {%>
                        <span style="color:red; margin-left:10px; font-size:10px">請輸入菜單名稱</span>
                    <%}} %>
                    </li>
<!--                 </ul> -->
<!--                 <br> -->
<!--                 <ul> -->
                    <li>價錢：
                    
                    <input id="price" type="number" placeholder="選擇價格" aria-label="default input example" 
                    	name="price" value="<%=(coachMenuVO == null) ? "" : coachMenuVO.getPrice()%>">
                    <%if(errorMsgs != null){if(errorMsgs.contains("請輸入菜單價格")) {%>
                        <span style="color:red; margin-left:10px; font-size:10px">請輸入菜單價格</span>
                    <%}} %>
                    </li>
<!--                 </ul> -->
<!--                 <br><br> -->
<!--                 <ul> -->
                	<li>部位選擇：
                        
                   	<!-- </li> -->
<!--                 </ul> -->
<!--                 <br> -->
<!--                 <ul> -->
                	<!-- <li> -->
                	<jsp:useBean id="positionSvc" scope="page" class="com.thePosition.model.ThePositionService"/>
	                    <select name="positionNo">
	                        <option selected disabled>
                                                        <% if(coachMenuVO == null){ %> 請選擇部位 <% }
	                        							 else if(coachMenuVO.getPositionNo() == null){ %> 請選擇部位 <%}
	                        							 else{positionSvc.getOnePosition(coachMenuVO.getPositionNo()).getPostionName();}%>
                                                        </option>
	                        <c:forEach var="positionVO" items="${positionSvc.all}">
	                        <option value="${positionVO.positionNo}">${positionVO.postionName}</option>
	                        </c:forEach>
	                    </select>
	                    <%if(errorMsgs != null){if(errorMsgs.contains("請選擇部位")) {%>
                        <span style="color:red; margin-left:10px; font-size:10px">請選擇部位</span>
                   		 <%}} %>
                    </li>
                </ul>
                <br><br>
                
                    
            </div>
            <div id="post_box">
            <jsp:useBean id="videoSvc" scope="page" class="com.video.model.VideoService"/>
            	<ul>
            		<li class="post_name">
                        <p>參考影片:</p>
                        <select name="refVideo1">
                            <c:forEach var="videoVO" items="${videoSvc.getByUserID(userID)}">
                            <option value="${videoVO.videoID}">${videoVO.title}</option>
                            </c:forEach>
                        </select>
<!--                     	<input id="post_input" type="text" placeholder="輸入參考影片" aria-label="default input example"> -->
                    </li>
                    <li class="post_name">
                        <p>參考影片:</p>
                        <select name="refVideo2">
                            <c:forEach var="videoVO" items="${videoSvc.getByUserID(userID)}">
                            <option value="${videoVO.videoID}">${videoVO.title}</option>
                            </c:forEach>
                        </select>
<!--                         <input id="post_input" type="text" placeholder="輸入動作名稱" aria-label="default input example"><input id="set" type="number" placeholder="幾組" aria-label="default input example"> -->
                    </li>
                    <li class="post_name">
                        <p>參考影片:</p>
                        <select name="refVideo3">
                            <c:forEach var="videoVO" items="${videoSvc.getByUserID(userID)}">
                            <option value="${videoVO.videoID}">${videoVO.title}</option>
                            </c:forEach>
                        </select>
<!--                         <input id="post_input" type="text" placeholder="輸入動作名稱" aria-label="default input example"><input id="set" type="number" placeholder="幾組" aria-label="default input example"> -->
                    </li>
            	</ul>
                        
            </div>
            <div id="button_area">
                <button type="submit" id="button" class="btn btn-primary btn-lg">確認</button>
                <button type="button" id="button" class="btn btn-primary btn-lg">取消</button>
            </div>
            <input type="hidden" name="action" value="addmenu">
            <input type="hidden" name="userID" value="${userID}">
            </form>
        </div>
    </div>
</body>
</html>