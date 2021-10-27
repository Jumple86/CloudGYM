<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.video.model.*"%>

<%
	VideoService videoSvc = new VideoService();
	List<VideoVO> list1 = videoSvc.getByPositionNo(1);
	List<VideoVO> list2 = videoSvc.getByPositionNo(2);
	List<VideoVO> list3 = videoSvc.getByPositionNo(3);
	List<VideoVO> list4 = videoSvc.getByPositionNo(4);
	List<VideoVO> list5 = videoSvc.getByPositionNo(5);
	
	request.setAttribute("list1", list1);
	request.setAttribute("list2", list2);
	request.setAttribute("list3", list3);
	request.setAttribute("list4", list4);
	request.setAttribute("list5", list5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/reset.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/all_video_page.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
</head>
<body>
	<div id="bar">
		<div id="title">
			<ul>
				<li class="bar_li"><img src="../img/logo.png" alt=""
					for="#CloudGYM"></li>
				<li class="bar_li"><a href="#" id="CloudGYM">CloudGYM</a></li>
			</ul>
		</div>
		<div id="option">
			<ul>
				<li class="option">運動類型</li>
				<li class="option">教練</li>
				<li class="option">個人專區</li>
				<li class="option">討論區</li>
				<li class="option">註冊/登入</li>
				<li class="option"><svg xmlns="http://www.w3.org/2000/svg"
						width="25" height="25" fill="currentColor" class="bi bi-cart-fill"
						viewBox="0 0 16 16">
                        <path
							d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                    </svg></li>
			</ul>
		</div>
	</div>
	<div id="wrap">
		<div id="left">
			<div id="strenth_div">
				<p class="left_p">強度</p>
				<input type="checkbox"><span class="strenth">弱</span><br>
				<input type="checkbox"><span class="strenth">中</span><br>
				<input type="checkbox"><span class="strenth">強</span><br>
			</div>
			<div id="price_range_div">
				<p class="left_p">價格區間</p>
				<input type="text" class="price">
				<div id="line"></div>
				<input type="text" class="price">
				<button type="button">套用</button>
			</div>
			<div id="star_block_div">
				<p class="left_p">評價</p>
				<span class="star" data-star="1"><i class="fas fa-star"></i></span>
				<span class="star" data-star="2"><i class="fas fa-star"></i></span>
				<span class="star" data-star="3"><i class="fas fa-star"></i></span>
				<span class="star" data-star="4"><i class="fas fa-star"></i></span>
				<span class="star" data-star="5"><i class="fas fa-star"></i></span>
			</div>
		</div>
		<div id="right">
		<jsp:useBean id="coachSvc" scope="page" class="com.coach.model.CoachService"/>
			<div class="video_box box1">
				<p class="video_type">練練手</p>
				<i class="bi bi-chevron-left"></i>
				<ul>
					<c:forEach var="videoVO" items="${list1}">
					<li class="video_list">
						<a href="<%=request.getContextPath()%>/html/one_video_page.jsp?videoID=${videoVO.videoID}">
							<video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}" alt="" width="250"></video>
						</a>
						
						<p class="video_name">
							${videoVO.title}<span class="coach_name">${ coachSvc.getByUserID(videoVO.userID).coachName }</span>
						</p>
					</li>
					</c:forEach>
				</ul>
				<i class="bi bi-chevron-right"></i>
				<!-- <i class="bi bi-chevron-right"></i> -->
			</div>
			<div class="video_box box2">
				<p class="video_type">練練腿</p>
				<i class="bi bi-chevron-left"></i>
				<ul>
					<c:forEach var="videoVO" items="${list2}">
					<li class="video_list">
						<a>
							<video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}" alt="" width="250"></video>
						</a>
						<p class="video_name">
							${videoVO.title}<span class="coach_name">${ coachSvc.getByUserID(videoVO.userID).coachName }</span>
						</p>
					</li>
					</c:forEach>
				</ul>
				<i class="bi bi-chevron-right"></i>
			</div>
			<div class="video_box box3">
				<p class="video_type">練練核心</p>
				<i class="bi bi-chevron-left"></i>
				<ul>
					<c:forEach var="videoVO" items="${list3}">
					<li class="video_list">
						<a>
							<video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}" alt="" width="250"></video>
						</a>
						<p class="video_name">
							${videoVO.title}<span class="coach_name">${ coachSvc.getByUserID(videoVO.userID).coachName }</span>
						</p>
					</li>
					</c:forEach>
				</ul>
				<i class="bi bi-chevron-right"></i>
			</div>
			<div class="video_box box4">
				<p class="video_type">練練背</p>
				<i class="bi bi-chevron-left"></i>
				<ul>
					<c:forEach var="videoVO" items="${list4}">
					<li class="video_list">
						<a>
						<video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}" alt="" width="250"></video>
						</a>
						<p class="video_name">
							${videoVO.title}<span class="coach_name">${ coachSvc.getByUserID(videoVO.userID).coachName }</span>
						</p>
					</li>
					</c:forEach>
				</ul>
				<i class="bi bi-chevron-right"></i>
			</div>
			<div class="video_box box5">
				<p class="video_type">練練全身</p>
				<i class="bi bi-chevron-left"></i>
				<ul>
					<c:forEach var="videoVO" items="${list5}">
					<li class="video_list">
						<a>
							<video src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}" alt="" width="250"></video>
						</a>
						<p class="video_name">
							${videoVO.title}<span class="coach_name">${ coachSvc.getByUserID(videoVO.userID).coachName }</span>
						</p>
					</li>
					</c:forEach>
				</ul>
				<i class="bi bi-chevron-right"></i>
			</div>
		</div>
	</div>

	<!-- 載入 Font Awesome -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			var box1_seq = 0;

			if (!$("div.box1 li").eq(0).hasClass("-on")) {
				$("div.box1 i.bi-chevron-left").addClass("-on");
				$("div.box1 i.bi-chevron-right").removeClass("-on");
			}
			if ($("div.box1 li").length <= 3) {
				$("div.box1 i.bi-chevron-left").addClass("-on");
				$("div.box1 i.bi-chevron-right").addClass("-on");
			}
			$("div.box1 li").slice(box1_seq + 3).addClass("-on");
			$("div.box1 i.bi-chevron-right").on("click", function() {
				$("div.box1 li").eq(box1_seq).addClass("-on");
				$("div.box1 li").eq(box1_seq + 3).removeClass("-on");
				$("div.box1 li").eq(box1_seq + 2).removeClass("last");
				$("div.box1 li").eq(box1_seq + 3).addClass("last");
				box1_seq++;
				if (!$("div.box1 li").eq(-1).hasClass("-on")) {
					$("div.box1 i.bi-chevron-right").addClass("-on");
					$("div.box1 i.bi-chevron-left").removeClass("-on");
				}
				if ($("div.box1 li").eq(0).hasClass("-on")) {
					$("div.box1 i.bi-chevron-left").removeClass("-on");
				}
			});
			$("div.box1 i.bi-chevron-left").on("click", function() {
				$("div.box1 li").eq(box1_seq + 2).addClass("-on");
				$("div.box1 li").eq(box1_seq + 2).removeClass("last");
				$("div.box1 li").eq(box1_seq - 1).removeClass("-on");
				$("div.box1 li").eq(box1_seq + 1).addClass("last");
				box1_seq--;
				if (!$("div.box1 li").eq(0).hasClass("-on")) {
					$("div.box1 i.bi-chevron-left").addClass("-on");
					$("div.box1 i.bi-chevron-right").removeClass("-on");
				}
				if ($("div.box1 li").eq(-1).hasClass("-on")) {
					$("div.box1 i.bi-chevron-right").removeClass("-on");
				}
			})
			/****************************************************************/
			var box2_seq = 0;

			if (!$("div.box2 li").eq(0).hasClass("-on")) {
				$("div.box2 i.bi-chevron-left").addClass("-on");
				$("div.box2 i.bi-chevron-right").removeClass("-on");
			}
			if ($("div.box2 li").length <= 3) {
				$("div.box2 i.bi-chevron-left").addClass("-on");
				$("div.box2 i.bi-chevron-right").addClass("-on");
			}
			$("div.box2 li").slice(box2_seq + 3).addClass("-on");
			$("div.box2 i.bi-chevron-right").on("click", function() {
				$("div.box2 li").eq(box2_seq).addClass("-on");
				$("div.box2 li").eq(box2_seq + 3).removeClass("-on");
				$("div.box2 li").eq(box2_seq + 2).removeClass("last");
				$("div.box2 li").eq(box2_seq + 3).addClass("last");
				box2_seq++;
				if (!$("div.box2 li").eq(-1).hasClass("-on")) {
					$("div.box2 i.bi-chevron-right").addClass("-on");
					$("div.box2 i.bi-chevron-left").removeClass("-on");
				}
				if ($("div.box2 li").eq(0).hasClass("-on")) {
					$("div.box2 i.bi-chevron-left").removeClass("-on");
				}
			});
			$("div.box2 i.bi-chevron-left").on("click", function() {
				$("div.box2 li").eq(box2_seq + 2).addClass("-on");
				$("div.box2 li").eq(box2_seq + 2).removeClass("last");
				$("div.box2 li").eq(box2_seq - 1).removeClass("-on");
				$("div.box2 li").eq(box2_seq + 1).addClass("last");
				box2_seq--;
				if (!$("div.box2 li").eq(0).hasClass("-on")) {
					$("div.box2 i.bi-chevron-left").addClass("-on");
					$("div.box2 i.bi-chevron-right").removeClass("-on");
				}
				if ($("div.box2 li").eq(-1).hasClass("-on")) {
					$("div.box2 i.bi-chevron-right").removeClass("-on");
				}
			})
			/****************************************************************/
			var box3_seq = 0;

			if (!$("div.box3 li").eq(0).hasClass("-on")) {
				$("div.box3 i.bi-chevron-left").addClass("-on");
				$("div.box3 i.bi-chevron-right").removeClass("-on");
			}
			if ($("div.box3 li").length <= 3) {
				$("div.box3 i.bi-chevron-left").addClass("-on");
				$("div.box3 i.bi-chevron-right").addClass("-on");
			}
			$("div.box3 li").slice(box3_seq + 3).addClass("-on");
			$("div.box3 i.bi-chevron-right").on("click", function() {
				$("div.box3 li").eq(box3_seq).addClass("-on");
				$("div.box3 li").eq(box3_seq + 3).removeClass("-on");
				$("div.box3 li").eq(box3_seq + 2).removeClass("last");
				$("div.box3 li").eq(box3_seq + 3).addClass("last");
				box3_seq++;
				if (!$("div.box3 li").eq(-1).hasClass("-on")) {
					$("div.box3 i.bi-chevron-right").addClass("-on");
					$("div.box3 i.bi-chevron-left").removeClass("-on");
				}
				if ($("div.box3 li").eq(0).hasClass("-on")) {
					$("div.box3 i.bi-chevron-left").removeClass("-on");
				}
			});
			$("div.box3 i.bi-chevron-left").on("click", function() {
				$("div.box3 li").eq(box3_seq + 2).addClass("-on");
				$("div.box3 li").eq(box3_seq + 2).removeClass("last");
				$("div.box3 li").eq(box3_seq - 1).removeClass("-on");
				$("div.box3 li").eq(box3_seq + 1).addClass("last");
				box3_seq--;
				if (!$("div.box3 li").eq(0).hasClass("-on")) {
					$("div.box3 i.bi-chevron-left").addClass("-on");
					$("div.box3 i.bi-chevron-right").removeClass("-on");
				}
				if ($("div.box3 li").eq(-1).hasClass("-on")) {
					$("div.box3 i.bi-chevron-right").removeClass("-on");
				}
			})
			/****************************************************************/
			var box4_seq = 0;

			if (!$("div.box4 li").eq(0).hasClass("-on")) {
				$("div.box4 i.bi-chevron-left").addClass("-on");
				$("div.box4 i.bi-chevron-right").removeClass("-on");
			}
			if ($("div.box4 li").length <= 3) {
				$("div.box4 i.bi-chevron-left").addClass("-on");
				$("div.box4 i.bi-chevron-right").addClass("-on");
			}
			$("div.box4 li").slice(box4_seq + 3).addClass("-on");
			$("div.box4 i.bi-chevron-right").on("click", function() {
				$("div.box4 li").eq(box4_seq).addClass("-on");
				$("div.box4 li").eq(box4_seq + 3).removeClass("-on");
				$("div.box4 li").eq(box4_seq + 2).removeClass("last");
				$("div.box4 li").eq(box4_seq + 3).addClass("last");
				box4_seq++;
				if (!$("div.box4 li").eq(-1).hasClass("-on")) {
					$("div.box4 i.bi-chevron-right").addClass("-on");
					$("div.box4 i.bi-chevron-left").removeClass("-on");
				}
				if ($("div.box4 li").eq(0).hasClass("-on")) {
					$("div.box4 i.bi-chevron-left").removeClass("-on");
				}
			});
			$("div.box4 i.bi-chevron-left").on("click", function() {
				$("div.box4 li").eq(box4_seq + 2).addClass("-on");
				$("div.box4 li").eq(box4_seq + 2).removeClass("last");
				$("div.box4 li").eq(box4_seq - 1).removeClass("-on");
				$("div.box4 li").eq(box4_seq + 1).addClass("last");
				box4_seq--;
				if (!$("div.box4 li").eq(0).hasClass("-on")) {
					$("div.box4 i.bi-chevron-left").addClass("-on");
					$("div.box4 i.bi-chevron-right").removeClass("-on");
				}
				if ($("div.box4 li").eq(-1).hasClass("-on")) {
					$("div.box4 i.bi-chevron-right").removeClass("-on");
				}
			})
			/****************************************************************/
			var box5_seq = 0;

			if (!$("div.box5 li").eq(0).hasClass("-on")) {
				$("div.box5 i.bi-chevron-left").addClass("-on");
				$("div.box5 i.bi-chevron-right").removeClass("-on");
			}
			if ($("div.box5 li").length <= 3) {
				$("div.box5 i.bi-chevron-left").addClass("-on");
				$("div.box5 i.bi-chevron-right").addClass("-on");
			}
			$("div.box5 li").slice(box5_seq + 3).addClass("-on");
			$("div.box5 i.bi-chevron-right").on("click", function() {
				$("div.box5 li").eq(box5_seq).addClass("-on");
				$("div.box5 li").eq(box5_seq + 3).removeClass("-on");
				$("div.box5 li").eq(box5_seq + 2).removeClass("last");
				$("div.box5 li").eq(box5_seq + 3).addClass("last");
				box5_seq++;
				if (!$("div.box5 li").eq(-1).hasClass("-on")) {
					$("div.box5 i.bi-chevron-right").addClass("-on");
					$("div.box5 i.bi-chevron-left").removeClass("-on");
				}
				if ($("div.box5 li").eq(0).hasClass("-on")) {
					$("div.box5 i.bi-chevron-left").removeClass("-on");
				}
			});
			$("div.box5 i.bi-chevron-left").on("click", function() {
				$("div.box5 li").eq(box5_seq + 2).addClass("-on");
				$("div.box5 li").eq(box5_seq + 2).removeClass("last");
				$("div.box5 li").eq(box5_seq - 1).removeClass("-on");
				$("div.box5 li").eq(box5_seq + 1).addClass("last");
				box5_seq--;
				if (!$("div.box5 li").eq(0).hasClass("-on")) {
					$("div.box5 i.bi-chevron-left").addClass("-on");
					$("div.box5 i.bi-chevron-right").removeClass("-on");
				}
				if ($("div.box5 li").eq(-1).hasClass("-on")) {
					$("div.box5 i.bi-chevron-right").removeClass("-on");
				}
			})

		})
	</script>
</body>
</html>