<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.coachMenu.model.*" %>
<%@ page import="com.video.model.*" %>

<%
	Integer userID = new Integer(request.getParameter("userID"));
	pageContext.setAttribute("userID", userID);
	
	CoachMenuService coachmenuSvc = new CoachMenuService();
	List<CoachMenuVO> menulist = coachmenuSvc.getByUserID(userID);
	pageContext.setAttribute("menulist", menulist);
	
	VideoService videoSvc = new VideoService();
	List<VideoVO> videolist = videoSvc.getByUserID(userID);
	pageContext.setAttribute("videolist", videolist);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/coach_overview.css">
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                        class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path
                            d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                    </svg>
                </li>
            </ul>
        </div>
    </div>

    <div id="main">
        <div class="left">
<!--             <form action=""> -->
<!--                 <input type="submit" name="" id="" value="建立菜單"> -->
<!--             </form> -->
			<a href="<%=request.getContextPath()%>/html/buildMenu.jsp?userID=${userID}">建立菜單</a>
            <form action="">
                <input type="submit" name="" id="" value="影片上傳">
            </form>
        </div>
        <div class="right">
            <div class="my_menu">
                <h3>我的菜單</h3>
                <i class="bi bi-chevron-left"></i>
                <ul>
                	<c:forEach var="menu" items="${menulist}">
                	<li>
                        <p>${menu.menuName}</p>
                        <span>
                            <i class="fas fa-wrench"></i>
                        </span>
                    </li>
                	</c:forEach>
                </ul>
                <i class="bi bi-chevron-right"></i>
            </div>
            <div class="my_video">
                <h3>我的影片</h3>
                <i class="bi bi-chevron-left"></i>
                <ul>
                	<c:forEach var="video" items="${videolist }">
                	<li>
                        <video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${video.videoID}" width="200" height="133" controls controlsList="nodownload">
                        	<source src="http://techslides.com/demos/sample-videos/small.mp4" type="video/mp4">
  							<source src="http://techslides.com/demos/sample-videos/small.ogv" type="video/ogg">
                        </video>
                        <span>
                            <i class="fas fa-wrench"></i>
                        </span>
                    </li>
                	</c:forEach>
                </ul>
                <i class="bi bi-chevron-right"></i>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script>
    $(function () {
        var menu_seq = 0;
        var video_seq = 0;
        

        if (!$("div.my_menu li").eq(0).hasClass("-on")) {
            $("div.my_menu i.bi-chevron-left").addClass("-on");
            $("div.my_menu i.bi-chevron-right").removeClass("-on");
        }
        if ($("div.my_menu li").length <= 3) {
            $("div.my_menu i.bi-chevron-left").addClass("-on");
            $("div.my_menu i.bi-chevron-right").addClass("-on");
        }
        $("div.my_menu li").slice(menu_seq + 3).addClass("-on");
        $("div.my_menu i.bi-chevron-right").on("click", function () {
            $("div.my_menu li").eq(menu_seq).addClass("-on");
            $("div.my_menu li").eq(menu_seq + 3).removeClass("-on");
            menu_seq++;
            if (!$("div.my_menu li").eq(-1).hasClass("-on")) {
                $("div.my_menu i.bi-chevron-right").addClass("-on");
                $("div.my_menu i.bi-chevron-left").removeClass("-on");
            }
        });
        $("div.my_menu i.bi-chevron-left").on("click", function () {
            $("div.my_menu li").eq(menu_seq + 2).addClass("-on");
            $("div.my_menu li").eq(menu_seq - 1).removeClass("-on");
            menu_seq--;
            if (!$("div.my_menu li").eq(0).hasClass("-on")) {
                $("div.my_menu i.bi-chevron-left").addClass("-on");
                $("div.my_menu i.bi-chevron-right").removeClass("-on");
            }
        })
        /****************************************************************/
        console.log($("div.my_video li").length);

        if (!$("div.my_video li").eq(0).hasClass("-on")) {
            $("div.my_video i.bi-chevron-left").addClass("-on");
            $("div.my_video i.bi-chevron-right").removeClass("-on");
        }
        if ($("div.my_video li").length <= 3) {
            $("div.my_video i.bi-chevron-right").addClass("-on");
        }
        $("div.my_video li").slice(video_seq + 3).addClass("-on");
        $("div.my_video i.bi-chevron-right").on("click", function () {
            $("div.my_video li").eq(video_seq).addClass("-on");
            $("div.my_video li").eq(video_seq + 3).removeClass("-on");
            video_seq++;
            if($("div.my_video li").eq(video_seq-1).hasClass("-on")){
                $("div.my_video i.bi-chevron-left").removeClass("-on");
            }
            if (!$("div.my_video li").eq(-1).hasClass("-on")) {
                $("div.my_video i.bi-chevron-right").addClass("-on");
                $("div.my_video i.bi-chevron-left").removeClass("-on");
            }
        });
        $("div.my_video i.bi-chevron-left").on("click", function () {
            $("div.my_video li").eq(video_seq + 2).addClass("-on");
            $("div.my_video li").eq(video_seq - 1).removeClass("-on");
            video_seq--;
            if($("div.my_video li").eq(video_seq+3).hasClass("-on")){
                $("div.my_video i.bi-chevron-right").removeClass("-on");
            }
            if (!$("div.my_video li").eq(0).hasClass("-on")) {
                $("div.my_video i.bi-chevron-left").addClass("-on");
                $("div.my_video i.bi-chevron-right").removeClass("-on");
            }
        })
    })
    </script>
</body>
</html>