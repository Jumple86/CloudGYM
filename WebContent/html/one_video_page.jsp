<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.video.model.*" %>
<%@ page import="com.report.model.*" %>
<%@ page import="com.reportRecord.model.*" %>
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
	
	ReportService reportSvc = new ReportService();
	List<ReportVO> reports = reportSvc.getByUser(userID);
	List<Integer> items = new ArrayList<Integer>();
	for(ReportVO reportVO : reports){
		items.add(reportVO.getItemID());
	}
	request.setAttribute("items", items);
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
            	<div class="comment" style="display: none; z-index:10;">
                    <h3>你覺得這支影片讚嗎</h3>
                    <form>
	                    <span class="star" data-star="1"><i class="fas fa-star"></i></span>
	                    <span class="star" data-star="2"><i class="fas fa-star"></i></span>
	                    <span class="star" data-star="3"><i class="fas fa-star"></i></span>
	                    <span class="star" data-star="4"><i class="fas fa-star"></i></span>
	                    <span class="star" data-star="5"><i class="fas fa-star"></i></span>
<!--                     <h4>對辛苦的教練說一點話吧</h4> -->
                    	<input type="hidden" name="stars" value="0" class="stars">
                    	<input type="hidden" name="action" value="addReview">
                    	<input type="hidden" name="videoID" value="${videoID}">
<!--                         <input type="text"> -->
                    </form>
                </div>
<!--                 <img src="../img/work_out_1.jpg" alt="" id="video_img"> -->
                <video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoID}" width="700" controls preload="metadata">
                	<source src="http://techslides.com/demos/sample-videos/small.mp4" type="video/mp4">
  					<source src="http://techslides.com/demos/sample-videos/small.ogv" type="video/ogg">
                </video>
                <div id="video_info">
                	<form style="display:inline-block;">
                		<button>
                			<i class="bi bi-heart-fill"></i>
                    		<span>收藏</span>
                		</button>
                	</form>
                	<form style="display:inline-block;">
                		<button>
                			 <i class="bi bi-plus-circle"></i>
		                     <span>加入菜單</span>
                		</button>
                	</form>
                	<form style="display:inline-block;">
                	<i class="bi bi-exclamation-circle-fill"></i>
                	<%if(!items.contains(videoID)){%>
                		<button type="button" class="report_btn" style="padding-left:0;">
<!--                 			<i class="bi bi-exclamation-circle-fill"></i> -->
	                        <span>檢舉</span>
                		</button>
                		<input class="videoAction" type="hidden" name="action" value="addreport">
                	<%}%>
                	<%if(items.contains(videoID)){%>
                		<button type="button" class="report_btn" style="padding-left:0;">
<!--                 			<i class="bi bi-exclamation-circle-fill"></i> -->
	                        <span>已檢舉</span>
                		</button>
                		<input class="videoAction" type="hidden" name="action" value="deleteReport">
                	<%}%>
                		<input type="hidden" name="videoID" value="${videoID}">
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
    					if(data[0] == "cancelSuccess"){
    						alert("已取消檢舉");
    						$("button.report_btn").html("檢舉");
    						$("button.report_btn").attr("style", "color:white; padding-left:0;");
    						$("input.videoAction").val("addreport");
    					}
    					if(data[0] == "reportSuccess"){
    						alert("檢舉成功");
    						$("button.report_btn").html("已檢舉");
    						$("button.report_btn").attr("style", "color:white; padding-left:0;");
    						$("input.videoAction").val("deleteReport");
    					}
    					
    				},
    				error: function(xhr){
    					console.log("fail");
    				}
    			})
    		});
    		
    		$("video").on("ended", function(){
    			$("div.comment").attr("style", "z-index:9;");
    		});
    		
    		$("span.star").on("click", function(){
    			console.log($(this).attr("data-star"));
    			let stars = $(this).attr("data-star");
    			$("div.comment input.stars").val(stars);
    			$.ajax({
    				url:"<%=request.getContextPath()%>/review/review.do",
    				type: "post",
    				data: $(this).closest("form").serialize(),
    				dataType: "json",
    				success: function(data){
    					console.log("success");
    					$("div.comment").html('<h3 style="font-size:32px; font-weight:bold; margin-top:200px;">感謝您的回饋</h3>');
    				},
    				error : function(XMLHttpResponse, textStatus, errorThrown) {
						console.log("1 非同步呼叫返回失敗,XMLHttpResponse.readyState:"	+ XMLHttpResponse.readyState);
						console.log("2 非同步呼叫返回失敗,XMLHttpResponse.status:"	+ XMLHttpResponse.status);
						console.log("3 非同步呼叫返回失敗,textStatus:"	+ textStatus);
						console.log("4 非同步呼叫返回失敗,errorThrown:" + errorThrown);
					}
    			})
    		})
    	})
    </script>
</body>
</html>