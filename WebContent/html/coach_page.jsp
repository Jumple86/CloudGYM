<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coachMenu.model.*"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="redis.clients.jedis.Jedis"%>
<%@ page import="com.subscription.model.*"%>
<%@ page import="com.video.model.*"%>
<%@ page import="com.orders.model.*"%>
<%@ page import="com.orderList.model.*"%>


<%
	Integer coachID = null;
	CoachVO coachVO = null;
	try {
		coachVO = (CoachVO) request.getAttribute("coachVO");
		coachID = coachVO.getUserID();
		request.setAttribute("userID", coachID);
	} catch (Exception e) {
		coachVO = new CoachService().getByUserID(2004);
		pageContext.setAttribute("coachVO", coachVO);
		coachID = 2004;
	}

	CoachMenuService svc = new CoachMenuService();
	List<CoachMenuVO> menuList = svc.getByUserID(coachID);
	pageContext.setAttribute("menuList", menuList);

	SubscriptionService subscriSvc = new SubscriptionService();
	List<SubscriptionVO> subList = subscriSvc.getByUserID(coachID);
	pageContext.setAttribute("subList", subList);

	VideoService videoSvc = new VideoService();
	List<VideoVO> videoList = videoSvc.getByUserID(coachID);
	pageContext.setAttribute("videoList", videoList);

	String uri = request.getRequestURI();
	session.setAttribute("uri", uri);
	
// 	String username = "peter";
// 	session.setAttribute("username", username);
// 	Integer userID = 1003;
// 	session.setAttribute("userID", userID);
	Integer userID = (Integer)session.getAttribute("userID");
	List<Integer> itemIDs = null;
	if(userID != null){
		List<OrdersVO> orders = new OrdersService().getOrdersByUserID(userID);
		OrderListService orderlistSvc = new OrderListService();
		itemIDs = new ArrayList<>();
		for(OrdersVO ordersVO : orders){
			List<OrderListVO> orderlists = orderlistSvc.getOrderListByOrderNo(ordersVO.getOrderNo());
			for(OrderListVO orderListVO : orderlists){
				Integer itemID = orderListVO.getItemID();
				itemIDs.add(itemID);
			}
		}
	}

	pageContext.setAttribute("itemIDs", itemIDs);

	long cartCount = 0;
	Jedis jedis = new Jedis("localhost", 6379);
	try {
		cartCount = jedis.hlen(userID.toString());
		pageContext.setAttribute("cartCount", cartCount);
	} catch (Exception e) {
		cartCount = 0;
		pageContext.setAttribute("cartCount", cartCount);
	}
	jedis.close();

	response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>教練個人頁面</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/coach_page.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style type="text/css">
div.menu input:disabled {
	background-color: rgb(143, 143, 143);
}
</style>
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
		<div class="coach_info">
			<div class="photo">
				<img
					src="<%=request.getContextPath()%>/coachImg/coachImg.do?userID=${coachVO.userID}"
					alt="">
			</div>
			<div class="info">
				<h3 class="name">${coachVO.coachName }</h3>
				<span>自我介紹:</span>
				<div class="intro">${coachVO.coachDescription }</div>
				<p class="licnese">證照:</p>
				<div>${coachVO.coachCertificate }</div>
				<ul>
					<li><a
						href="<%=request.getContextPath()%>/html/changeCoachInfo_page.jsp?userID=${coachVO.userID}">修改個人資料</a></li>
					<li><a
						href="<%=request.getContextPath()%>/html/coach_overview.jsp?userID=${coachVO.userID}">影片/菜單管理</a></li>
				</ul>
			</div>
		</div>
		<div class="video">
			<i class="bi bi-chevron-compact-left left"></i>
			<ul>
				<c:forEach var="video" items="${videoList}">
					<li><img
						src="../img/man-weight-lifting-training-workout-gym.jpg" alt="">
						<h4 class="video_name">${video.title}</h4>
						<form id="add_cart" method="post">
							<!-- 	                        <input type="submit" value="加入購物車"> -->
							<c:if test="${video.price == 0}">
								<button type="button" value="加入購物車" disabled>加入購物車</button>
							</c:if>
							<c:if test="${video.price != 0}">
								<button type="button" value="加入購物車">加入購物車</button>
							</c:if>
							<c:if test="${itemIDs.contains(video.videoID) }">
								<button type="button" value="加入購物車" disabled>已購買</button>
							</c:if>
							<input type="hidden" name="videoID" value="${video.videoID}">
							<input type="hidden" name="videoPrice" value="${video.price}">
							<input type="hidden" name="action" value="addCart">
						</form></li>
				</c:forEach>
			</ul>
			<i class="bi bi-chevron-compact-right right"></i>
		</div>
		<div class="menu">
			<i class="bi bi-chevron-compact-left left"></i>
			<ul>
				<c:forEach var="coachMenu" items="${menuList}">
					<li>
						<h4 class="menu_name">${coachMenu.menuName}</h4>
						<p class="menu_info">菜單介紹</p> <img src="../img/menu_pic.png"
						alt="">
						<div class="times">

							<p>20下/組</p>
							<p>20下/組</p>
							<p>20下/組</p>
							<p>20下/組</p>
						</div>
						<form id="add_cart" method="post">
							<!-- 	                        <input type="submit" value="加入購物車"> -->
							<c:if test="${coachMenu.price == 0}">
								<button type="button" value="加入購物車" disabled>加入購物車</button>
							</c:if>
							<c:if test="${coachMenu.price != 0}">
								<button type="button" value="加入購物車">加入購物車</button>
							</c:if>
							<c:if test="${itemIDs.contains(coachMenu.menuID) }">
								<button type="button" value="加入購物車" disabled>已購買</button>
							</c:if>
							<input type="hidden" name="menuID" value="${coachMenu.menuID}">
							<input type="hidden" name="menuPrice" value="${coachMenu.price}">
							<input type="hidden" name="action" value="addCart">
						</form>
					</li>
				</c:forEach>

			</ul>
			<i class="bi bi-chevron-compact-right right"></i>
		</div>
		<div class="sub">
			<ul>
				<c:forEach var="subscription" items="${subList}">
					<jsp:useBean id="sub" scope="page"
						class="com.subList.model.SubListService" />
					<li>
						<h3 class="plan">訂閱方案</h3>
						<p>時間： ${sub.getBySubID(subscription.subID).duration }</p>
						<form>
							<button class="btn_sub" type="button">訂閱</button>
							<input type="hidden" name="action" value="addCart"> <input
								type="hidden" name="subID" value="${subscription.subID}">
							<input type="hidden" name="coachID"
								value="${subscription.userID}">
						</form>
					</li>
				</c:forEach>

			</ul>
		</div>
		<div class="comment">
			<ul>
				<li>
					<h4>學員名字</h4> <span class="star" data-star="1"><i
						class="fas fa-star"></i></span> <span class="star" data-star="2"><i
						class="fas fa-star"></i></span> <span class="star" data-star="3"><i
						class="fas fa-star"></i></span> <span class="star" data-star="4"><i
						class="fas fa-star"></i></span> <span class="star" data-star="5"><i
						class="fas fa-star"></i></span>
					<p>我覺得教練很不錯</p> <img src="../img/image3-2-535x400.jpg" alt="">
				</li>
				<li>
					<h4>學員名字</h4> <span class="star" data-star="1"><i
						class="fas fa-star"></i></span> <span class="star" data-star="2"><i
						class="fas fa-star"></i></span> <span class="star" data-star="3"><i
						class="fas fa-star"></i></span> <span class="star" data-star="4"><i
						class="fas fa-star"></i></span> <span class="star" data-star="5"><i
						class="fas fa-star"></i></span>
					<p>我覺得教練很不錯</p> <img src="../img/image3-2-535x400.jpg" alt="">
				</li>
				<li>
					<h4>學員名字</h4> <span class="star" data-star="1"><i
						class="fas fa-star"></i></span> <span class="star" data-star="2"><i
						class="fas fa-star"></i></span> <span class="star" data-star="3"><i
						class="fas fa-star"></i></span> <span class="star" data-star="4"><i
						class="fas fa-star"></i></span> <span class="star" data-star="5"><i
						class="fas fa-star"></i></span>
					<p>我覺得教練很不錯</p> <img src="../img/image3-2-535x400.jpg" alt="">
				</li>
				<li>
					<h4>學員名字</h4> <span class="star" data-star="1"><i
						class="fas fa-star"></i></span> <span class="star" data-star="2"><i
						class="fas fa-star"></i></span> <span class="star" data-star="3"><i
						class="fas fa-star"></i></span> <span class="star" data-star="4"><i
						class="fas fa-star"></i></span> <span class="star" data-star="5"><i
						class="fas fa-star"></i></span>
					<p>我覺得教練很不錯</p> <img src="../img/image3-2-535x400.jpg" alt="">
				</li>
			</ul>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
	<script src="../js/jquery-3.6.0.min.js"></script>

	<script>
    	$(function(){
    		var cartCount = ${cartCount};
    		let menu_length = $("div.menu").find("li").length;
    	    console.log(menu_length);
    	    if(menu_length < 4){
    	    	$("div.menu i.right").addClass("-on");
    	    }
    		
    		$("div.video button").on("click", function(){
    			$.ajax({
    				url: "<%=request.getContextPath()%>/orders/orders.do",
    				type: "post",
    				data:$(this).closest("form").serialize(),
    				dataType:"json",
    				success: function(data){
    					console.log("success");
    					console.log(data[0]);
    					$("div#option span").html(data[0]).attr("style", "");
    					$("div#option span").attr("style", "display:flex");
    				},
    				error: function(xhr){
    					console.log("fail");
    				}
    			});
    		});
    		
    		
    		$("div.menu button").on("click", function(){
    			$.ajax({
    				url: "<%=request.getContextPath()%>/orders/orders.do",
    				type: "post",
    				data:$(this).closest("form").serialize(),
    				dataType:"json",
    				success: function(data){
    					console.log("success!");
    					console.log(data[0]);
    					$("div#option span").html(data[0]).attr("style", "");
    					$("div#option span").attr("style", "display:flex");
    				},
    				error: function(xhr){
    					console.log("fail!");
    				}
    			})
    		});
    		
    		
    		$("div.sub button").on("click", function(){
    			$.ajax({
    				url: "<%=request.getContextPath()%>
		/orders/orders.do",
					type : "post",
					data : $(this).closest("form").serialize(),
					dataType : "json",
					success : function(data) {
						console.log("success~");
						console.log(data);
						console.log(data[0]);
						$("div#option span").html(data[0]).attr("style", "");
						$("div#option span").attr("style", "display:flex");
					},
					error : function(xhr) {
						console.log("fail~");
					}
				})
			});

			if (cartCount == 0) {
				$("i.bi-cart-fill span").addClass("-on");
				$("i.bi-cart-fill span").css("display", "none");
			} else {
				$("i.bi-cart-fill span").removeClass("-on");
				$("i.bi-cart-fill span").attr("style", "");
			}

		})
	</script>
	<script src="../js/coach_page.js"></script>
</body>
</html>