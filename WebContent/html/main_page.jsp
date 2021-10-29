<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.video.model.*"%>


<jsp:useBean id="coachSvc1" scope="page" class="com.coach.model.CoachService" />

<%
  response.setHeader("Cache-Control","no-store"); //HTTP 1.1
  response.setHeader("Pragma","no-cache");        //HTTP 1.0
  response.setDateHeader ("Expires", 0);
%>

<%
	CoachService coachSvc = new CoachService();
	List<CoachVO> list = coachSvc.getAll();
	pageContext.setAttribute("list", list);
	
	VideoService videoSvc = new VideoService();
	List<VideoVO> list1 = videoSvc.getAll2();
	pageContext.setAttribute("list1", list1);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="BIG5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CloudGYM</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/main_page.css">
    <link rel="stylesheet" href="../css/bar.css">
    
    <!-- Mutislider CSS -->
    <link href="../css/main_coach.css" rel="stylesheet">
<!--     <link href="../css/main_video.css" rel="stylesheet"> -->

    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    
</head>
<body>
<%-- <%@include file="../bar.file"%> --%>

<!-------------------------------- bar begining -------------------------------->
	<!------- jQuery of Drop-down menu ------->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

	<!------- the bar content ------->
	<div id="bar">
		<div id="title">
			<ul>
				<li class="bar_li"><img src="../img/logo.png" alt=""
					for="#CloudGYM"></li>
				<li class="bar_li"><a
					href="${pageContext.request.contextPath}/html/main_page.jsp"
					id="CloudGYM">CloudGYM</a></li>
			</ul>
		</div>


		<div id="menu">
			<!-- 第一組清單   -->
			<div class="item">
				<div class="main">
					<a calss="url" href="${pageContext.request.contextPath}/html/all_video_page.jsp">運動類型</a>
				</div>
				<div class="sub"></div>
			</div>
			<!-- 第二組清單   -->
			<div class="item">
				<div class="main">
					<a calss="url" href="${pageContext.request.contextPath}/html/all_coach_page.jsp">教練</a>
				</div>
				<div class="sub"></div>
			</div>
			<!-- 第三組清單   -->
			<c:if test="${not empty userVO}">
				<div class="item">
					<div class="main">
						<a calss="url" href="${pageContext.request.contextPath}/userMainPage/userMainPage.jsp">個人專區</a>
					</div>
					<div class="sub"></div>
				</div>
			</c:if>
			<!-- 第四組清單   -->
			<c:if test="${not empty coachVO}">
				<div class="item">
					<div class="main">
						<a calss="url" href="${pageContext.request.contextPath}/html/coach_page.jsp">我是教練</a>
					</div>
					<div class="sub"></div>
				</div>
			</c:if>
			<!-- 第五組清單   -->
			<div class="item">
				<div class="main">
					<a calss="url" href="${pageContext.request.contextPath}/html/ArticleList.jsp">討論區</a>
				</div>
				<div class="sub"></div>
			</div>
			<!-- 第六組清單   -->
			<c:if test="${empty userID}">
				<div class="item">
					<div class="main" >註冊/登入</div>
					<div class="sub">
						<ul>
							<li><a href="${pageContext.request.contextPath}/html/sign_up_page.jsp">會員註冊</a></li>
							<li><a href="${pageContext.request.contextPath}/html/login_user.jsp">會員登入</a></li>
							<li><a href="${pageContext.request.contextPath}/html/login_coach.jsp">教練登入</a></li>
							<li><a href="${pageContext.request.contextPath}/html/login_admin.jsp" target="_blank">後台管理員</a></li>
						</ul>
					</div>
				</div>
			</c:if>
			<!-- 第七組清單   -->
			<c:if test="${not empty userID}">
				<div class="item">
					<div class="main" id="logout"><a href="javascript:if (confirm('確認登出?')) location.href='<%=request.getContextPath()%>/LogoutHandler'">${name} 登出</a></div>
					<div class="sub"></div>
				</div>
			</c:if>

			<li class="option">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
            		<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg>
            </li>
		</div>
	</div>
<!-------------------------------- bar end -------------------------------->
    
    <div id="top">
        <img src="../img/EVO-2021-PP-Feb-Banner_10-1200x675.jpg" alt="" id="main_img">
    </div>
    
	<div id="center">
		<div id="center2">
			<div id="text1">
				<ul>
					<li id="hot_video">熱門影片</li>
					<li id="all_videos"><a href="<%=request.getContextPath()%>/html/all_video_page.jsp">顯示更多</a></li>
				</ul>
			</div>

			<div id="video_pic_div">
				<iframe src="main_video.jsp" width="100%;" height="400" frameborder="0" scrolling="no"></iframe>
			</div>


			<div id="coach_rank">教練金榜</div>
			<div id="coach_pic_div">

<!-- 				<iframe position="absolute" top="0" left="0" width="100%" height="100%" transform="scale(0.55)" -webkit-transform="scale(0.8)" frameborder="0" scrolling="no" src="main_coach.jsp" ></iframe> -->

				<div id="exampleSlider">
			       <div class="MS-content">
						<c:forEach var="coachVO" items="${list}" begin="0"
 							end="${list.size()}"> 
			
			
							<div class="item">
								<div class="img_block">
									<form action="<%=request.getContextPath()%>/html/coach.do?">
										<input type="submit" id="${coachVO.userID }" style="display: none;"> 
										<input type="hidden" name="action" value="getOne_For_Display"> 
										<input type="hidden"name="userID" value="${coachVO.userID }"> 
										<label for="${coachVO.userID }"> 
										    <img src="<%=request.getContextPath()%>/coachImg/coachImg.do?userID=${coachVO.userID}" alt="" class="pic">
											<p class="coach_list">${coachVO.coachName}</p>
										</label>
									</form>
								</div>
							</div>
			
			
						</c:forEach>
					</div>
			       
			       <div class="MS-controls">
			           <button class="MS-left"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
			           <button class="MS-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
			       </div>
			   </div>
			</div>
		</div>
	</div>


	<div id="bottom">
        <p id="about">關於我們</p>
        <p id="contact">聯絡我們</p>
        <p id="address">台灣台北市信義區信義路五段7號</p>
        <p>029484184</p>
    </div>
    
    <!-- Include jQuery -->
    <script src="../vendors/jquery/jquery-3.4.1.min.js"></script>

    <!-- Include Multislider -->
    <script src="../js/multislider.min.js"></script>

    <!-- Initialize element with Multislider -->
    <script>
    $('#exampleSlider').multislider({
        interval: 0,
        slideAll: false,
        duration: 1500
    });
    </script>
    
</body>
</html>