<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coachMenu.model.*"%>
<%@ page import="redis.clients.jedis.Jedis" %>
<%@ page import="com.subscription.model.*" %>
<%@ page import="com.video.model.*" %>

<%
	CoachMenuService svc = new CoachMenuService();
	List<CoachMenuVO> menuList = svc.getByUserID(2005);
	pageContext.setAttribute("menuList", menuList);
	
	SubscriptionService subscriSvc = new SubscriptionService();
	List<SubscriptionVO> subList = subscriSvc.getByUserID(2005);
	pageContext.setAttribute("subList", subList);
	
	VideoService videoSvc = new VideoService();
	List<VideoVO> videoList = videoSvc.getByUserID(2005);
	pageContext.setAttribute("videoList", videoList);
	
	String uri = request.getRequestURI();
	session.setAttribute("uri", uri);
	
// 	String username = "peter";
// 	session.setAttribute("username", username);
	String userID = "1003";
	session.setAttribute("userID", userID);
	
	long cartCount = 0;
	Jedis jedis = new Jedis("localhost", 6379);
	try{
		cartCount = jedis.hlen(userID);
		pageContext.setAttribute("cartCount", cartCount);
	}catch(Exception e){
		cartCount = 0;
		pageContext.setAttribute("cartCount", cartCount);
	}
	jedis.close();
	
	response.setHeader("Cache-Control","no-store"); //HTTP 1.1
	response.setHeader("Pragma","no-cache");        //HTTP 1.0
	response.setDateHeader ("Expires", 0);
%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/coach_page.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style type="text/css">
div.menu input:disabled{
    background-color: rgb(143, 143, 143);
}
</style>
</head>
<body>
	 <div id="bar">
        <div id="title">
            <ul>
                <li class="bar_li">
                    <img src="../img/logo.png" alt="">
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
                <a href="<%= request.getContextPath()%>/html/pay_page.jsp">
                    <i class="bi bi-cart-fill">
                        <span>${cartCount}</span>
                    </i>
                </a>
                </li>
            </ul>
        </div>
    </div>

    <div id="main">
        <div class="coach_info">
            <div class="photo">
                <img src="../img/15Jc8sgK7ftvc2ToeQEraW.jpeg" alt="">
            </div>
            <div class="info">
                <h3 class="name">王大壯</h3>
                <span>自我介紹:</span>
                <div class="intro">內容內容內容內容內容內容內容內容內容</div>
                <p class="licnese">證照一</p>
                <p class="license">證照二</p>
            </div>
        </div>
        <div class="video">
        	<i class="bi bi-chevron-compact-left left"></i>
            <ul>
            <c:forEach var="video" items="${videoList}">
            	<li>
                    <img src="../img/man-weight-lifting-training-workout-gym.jpg" alt="">
                    <h4 class="video_name">${video.title}</h4>
                    <form id="add_cart" method="post">
<!-- 	                        <input type="submit" value="加入購物車"> -->
							<c:if test="${video.price == 0}"><button type="button" value="加入購物車" disabled>加入購物車</button></c:if>
							<c:if test="${video.price != 0}"><button type="button" value="加入購物車">加入購物車</button></c:if>
	                        <input type="hidden" name="videoID" value="${video.videoID}">
	                        <input type="hidden" name="videoPrice" value="${video.price}">
	                        <input type="hidden" name="action" value="addCart">
	                    </form>
                </li>
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
	                    <p class="menu_info">菜單介紹</p>
	                    <img src="../img/menu_pic.png" alt="">
	                    <div class="times">
	
	                        <p>20下/組</p>
	                        <p>20下/組</p>
	                        <p>20下/組</p>
	                        <p>20下/組</p>
	                    </div>
	                    <form id="add_cart" method="post">
<!-- 	                        <input type="submit" value="加入購物車"> -->
							<c:if test="${coachMenu.price == 0}"><button type="button" value="加入購物車" disabled>加入購物車</button></c:if>
							<c:if test="${coachMenu.price != 0}"><button type="button" value="加入購物車">加入購物車</button></c:if>
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
            <jsp:useBean id="sub" scope="page" class="com.subList.model.SubListService"/>
            	<li>
                    <h3 class="plan">訂閱方案</h3>
                    <p>時間： ${sub.getBySubID(subscription.subID).duration }</p>
                    <form>
	                    <button class="btn_sub" type="button">訂閱</button>
	                    <input type="hidden" name="action" value="addCart">
	                    <input type="hidden" name="subID" value="${subscription.subID}">
	                    <input type="hidden" name="coachID" value="${subscription.userID}">
                    </form>
                </li>
            </c:forEach>
                
            </ul>
        </div>
        <div class="comment">
            <ul>
                <li>
                    <h4>學員名字</h4>
                    <span class="star" data-star="1"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="2"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="3"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="4"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="5"><i class="fas fa-star"></i></span>
                    <p>我覺得教練很不錯</p>
                    <img src="../img/image3-2-535x400.jpg" alt="">
                </li>
                <li>
                    <h4>學員名字</h4>
                    <span class="star" data-star="1"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="2"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="3"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="4"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="5"><i class="fas fa-star"></i></span>
                    <p>我覺得教練很不錯</p>
                    <img src="../img/image3-2-535x400.jpg" alt="">
                </li>
                <li>
                    <h4>學員名字</h4>
                    <span class="star" data-star="1"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="2"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="3"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="4"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="5"><i class="fas fa-star"></i></span>
                    <p>我覺得教練很不錯</p>
                    <img src="../img/image3-2-535x400.jpg" alt="">
                </li>
                <li>
                    <h4>學員名字</h4>
                    <span class="star" data-star="1"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="2"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="3"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="4"><i class="fas fa-star"></i></span>
                    <span class="star" data-star="5"><i class="fas fa-star"></i></span>
                    <p>我覺得教練很不錯</p>
                    <img src="../img/image3-2-535x400.jpg" alt="">
                </li>
            </ul>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
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
    				url: "<%= request.getContextPath()%>/orders/orders.do",
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
    				url: "<%= request.getContextPath()%>/orders/orders.do",
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
    				url: "<%= request.getContextPath()%>/orders/orders.do",
    				type: "post",
    				data:$(this).closest("form").serialize(),
    				dataType:"json",
    				success: function(data){
    					console.log("success~");
    					console.log(data);
    					console.log(data[0]);
    					$("div#option span").html(data[0]).attr("style", "");
    					$("div#option span").attr("style", "display:flex");
    				},
    				error: function(xhr){
    					console.log("fail~");
    				}
    			})
    		});
    		
    		if(cartCount == 0){
    			$("i.bi-cart-fill span").addClass("-on");
    			$("i.bi-cart-fill span").css("display", "none");
    		}else{
    			$("i.bi-cart-fill span").removeClass("-on");
    			$("i.bi-cart-fill span").attr("style", "");
    		}
    		
    	})
		
    </script>
     <script src="../js/coach_page.js"></script>
</body>
</html>