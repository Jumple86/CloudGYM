<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.orderList.model.*" %>
<%@ page import="com.orders.model.*" %>
<%@ page import="com.video.model.*" %>
<%@ page import="com.coachMenu.model.*"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.subList.model.*"%>

<%
	Integer orderNo = (Integer) request.getAttribute("orderNo");
	OrderListService orderlistSvc = new OrderListService();
	List<OrderListVO> list = orderlistSvc.getOrderListByOrderNo(orderNo);
	List<String> itemName = new ArrayList<>();
	
	VideoService videoSvc = new VideoService();
	CoachMenuService coachMenuSvc = new CoachMenuService();
	for(OrderListVO orderlistVO : list){
		if(orderlistVO.getItemID().toString().charAt(0) == '3'){
			VideoVO videoVO = videoSvc.findByPrimaryKey(orderlistVO.getItemID());
			itemName.add(videoVO.getTitle());
		}else if(orderlistVO.getItemID().toString().charAt(0) == '6'){
			CoachMenuVO coachMenuVO = coachMenuSvc.getByMenuID(orderlistVO.getItemID());
			itemName.add(coachMenuVO.getMenuName());
		}
	}
	
	pageContext.setAttribute("itemName", itemName);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/thanks.css">
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
    <div id="wrap">
        <div id="main">
            <h2>感謝您的購買</h2>
			<div id="order_content">
				<p>
					訂單編號： <span>${orderNo}</span>
				</p>
				<p class="list">購買明細：</p>
				<div id="content">
					<c:if test="${not empty itemName}">
						<c:forEach var="name" items="${itemName}">
							<p>${name}</p>
						</c:forEach>
					</c:if>

					<%
                CoachService coachSvc = new CoachService();
                SubListService subListSvc = new SubListService();
                List<Integer> coachIDs = (ArrayList<Integer>) request.getAttribute("coachIDs");
                List<Integer> subIDs = (ArrayList<Integer>) request.getAttribute("subIDs");
                
                if(coachIDs != null && subIDs != null){
                	for(int i = 0; i < coachIDs.size(); i++){ %>
					<p><%=coachSvc.getByUserID(coachIDs.get(i)).getCoachName()%>
						-
						<%=subListSvc.getBySubID(subIDs.get(i)).getDuration()%></p>
					<%	}
                }
                %>
				</div>
				
				<%if(coachIDs != null && subIDs != null){%>
				<p class="sub">
					訂閱期間： 
					<%for(int i = 0; i < subIDs.size(); i++){ 
						OrdersService ordersSvc = new OrdersService();
						OrdersVO ordersVO = ordersSvc.gerOrdersByOrderNo(orderNo);
						Timestamp builtDate = ordersVO.getBuiltDate();
						Date startdate = new Date(builtDate.getTime());
						Date enddate = new Date();
						SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
						
						if(subListSvc.getBySubID(subIDs.get(i)).getDuration().startsWith("一")){
							Calendar c = Calendar.getInstance();
					        c.setTime(startdate);
					        c.add(Calendar.MONTH, 1);
					        enddate = c.getTime();
						}else if(subListSvc.getBySubID(subIDs.get(i)).getDuration().startsWith("三")){
							Calendar c = Calendar.getInstance();
					        c.setTime(startdate);
					        c.add(Calendar.MONTH, 3);
					        enddate = c.getTime();
						}else if(subListSvc.getBySubID(subIDs.get(i)).getDuration().startsWith("十")){
							Calendar c = Calendar.getInstance();
					        c.setTime(startdate);
					        c.add(Calendar.YEAR, 1);
					        enddate = c.getTime();
						}
						String startdateStr = sd.format(startdate);
						String enddateStr = sd.format(enddate);
					%>
					<span><%=startdateStr %> ~ <%=enddateStr %></span><br>
				<%	} %>
				</p>
				<%} %>
				
				<jsp:useBean id="orders" scope="page"
					class="com.orders.model.OrdersService" />
				<p class="price">
					總金額：$ <span>${orders.gerOrdersByOrderNo(orderNo).totalPrice}</span>
				</p>
			</div>

			<button type="button" onclick="javascript:location.href='./all_video_page.html'">返回首頁</button>
        </div>
    </div>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script>
        $("p.sub span").first().addClass("first");
        if($("p.sub span").hasClass("first")){
            $(".first").css("margin-left", "0");
        }

    </script>
</body>
</html>