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
    
</head>
<body>
<%@include file="../bar.file"%>

    
    <div id="top">
        <img src="../img/EVO-2021-PP-Feb-Banner_10-1200x675.jpg" alt="" id="main_img">
    </div>
    
	<div id="center">
		<div id="center2">
			<div id="text1">
				<ul>
					<li id="hot_video">熱門影片</li>
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