<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.video.model.*" %>
<jsp:useBean id="videoSvc" scope="page" class="com.video.model.VideoService"/>
<%
	Integer videoID = Integer.parseInt(request.getParameter("videoID"));
	pageContext.setAttribute("videoID", videoID);
	
	VideoVO videoVO = videoSvc.findByPrimaryKey(videoID);
	Timestamp time =  videoVO.getPublishTime();
	Date date =new Date(time.getTime());
	SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
	String publishTime = sd.format(date);
	pageContext.setAttribute("publishTime", publishTime);
	
	List<VideoVO> list1 = videoSvc.getByPositionNo(3);
	request.setAttribute("list1", list1);
	List<VideoVO> list2 = videoSvc.getByPositionNo(4);
	request.setAttribute("list2", list2);
	
	Integer userID = 1003;
	session.setAttribute("userID", userID);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/one_video_page.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
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
        <div id="top">
            <h3>${videoSvc.findByPrimaryKey(videoID).title }</h3>
            <div id="left">
<!--                 <img src="../img/work_out_1.jpg" alt="" id="video_img"> -->
                <video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoID}" width="700" controls>
                	<source src="http://techslides.com/demos/sample-videos/small.mp4" type="video/mp4">
  					<source src="http://techslides.com/demos/sample-videos/small.ogv" type="video/ogg">
                </video>
                <div id="video_info">
                	<form action="" style="display:inline-block;">
                		<button>
                			<i class="bi bi-heart-fill"></i>
                    		<span>收藏</span>
                		</button>
                	</form>
                	<form action="" style="display:inline-block;">
                		<button>
                			 <i class="bi bi-plus-circle"></i>
		                     <span>加入菜單</span>
                		</button>
                	</form>
                	<form action="" style="display:inline-block;">
                		<button type="button" class="report_btn">
                			<i class="bi bi-exclamation-circle-fill"></i>
	                        <span>檢舉</span>
                		</button>
                		<input type="hidden" name="videoID" value="${videoID}">
                		<input type="hidden" name="action" value="addreport">
                	</form>
                    <span class="date">上傳於 ${publishTime}</span>
                </div>
                <p>${videoSvc.findByPrimaryKey(videoID).intro}</p>
            </div>

            <div id="right">
            <jsp:useBean id="coachSvc" scope="page" class="com.coach.model.CoachService"/>
                <p id="coach_name">${coachSvc.getByUserID(videoSvc.findByPrimaryKey(videoID).userID).coachName }</p>
                <img src="<%=request.getContextPath()%>/coachImg/coachImg.do?userID=${videoSvc.findByPrimaryKey(videoID).userID}"
                    alt="" id="coach_photo">
                <div id="line"></div>
                <p id="coach_info">${coachSvc.getByUserID(videoSvc.findByPrimaryKey(videoID).userID).coachDescription}</p>
            </div>
        </div>

        <div id="bottom">
            <p>相關影片</p>
            <ul>
            	<c:forEach var="videoVO" items="${list1}">
            	<li class="push">
<!--                     <img src="../img/work_out_2.jpg" alt="" class="video_pic"> -->
					<a href="<%=request.getContextPath()%>/html/one_video_page.jsp?videoID=${videoVO.videoID}">
						<video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}" width="200"></video>
					</a>
                    <p class="video_name">${videoVO.title}</p>
                </li>
            	</c:forEach>
            </ul>
            <ul>
            	<c:forEach var="videoVO" items="${list2}">
            	<li class="push">
<!--                     <img src="../img/work_out_2.jpg" alt="" class="video_pic"> -->
					<a href="<%=request.getContextPath()%>/html/one_video_page.jsp?videoID=${videoVO.videoID}">
						<video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}" width="200"></video>
					</a>
                    <p class="video_name">${videoVO.title}</p>
                </li>
            	</c:forEach>
            </ul>
        </div>

    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script>
    	$(function(){
    		$("button.report_btn").on("click", function(){
    			$.ajax({
    				url: "<%=request.getContextPath()%>/report/report.do",
    				type: "post",
    				data: $(this).closest("form").serialize(),
    				dataType: "json",
    				success: function(data){
    					console.log("success");
    					console.log(data);
    					alert("檢舉成功");
    				},
    				error: function(xhr){
    					console.log("fail");
    				}
    			})
    		});
    	})
    </script>
</body>
</html>