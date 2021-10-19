<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.orderList.model.*" %>
<%@ page import="com.orders.model.*" %>
<%@ page import="com.user.model.*" %>

<jsp:useBean id="userSvc" scope="page" class="com.user.model.UserService" />
<jsp:useBean id="ordersSvc" scope="page" class="com.orders.model.OrdersService" />
<%
 OrderListService orderListSvc = new OrderListService();
 List<OrderListVO> list = orderListSvc.getAll();
 pageContext.setAttribute("list", list);
 
//  OrdersVO orderVO = new OrdersVO();
//  List<OrdersVO> list2 = ordersSvc.getAll();
//  for(OrdersVO VO : list2){
// 	 int userID = VO.getUserID();
//  pageContext.setAttribute("userID", userID);
//  };
%>
<!-- --------------------------------- -->
<%-- ${userSvc.findByUserId(ordersSvc.gerOrdersByOrderNo(90001).userID).userMobile } --%>
<!-- --------------------------------------- -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單明細管理</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/back_end_index.css">
    <link rel="stylesheet" href="../css/back_end_order.css">
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
              <li class="option"><a class="logout" href="#">登出</a></li>
              <li class="option"><a class="login_ad" href="<%=request.getContextPath()%>/html/back_end_Admin.jsp">管理員</a></li>
            </ul>
        </div>
    </div>
    <div id="wrap">
        <div id="left">
                <ul id="btn_fa">
                  <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_video.jsp">
                        <span class="li_btn">影片管理</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_order.jsp">
                        <span class="li_btn">訂單明細管理</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_post.jsp">
                        <span class="li_btn">文章管理</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_user.jsp">
                        <span class="li_btn">會員管理</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_coach.jsp">
                        <span class="li_btn">教練管理</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_sublist.jsp">
                        <span class="li_btn">訂閱管理</span>
                    </a>
                </li>
                </ul>
            </div>
            <p>訂單明細管理</p>
            <div id="right">
            <div class="main">
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">編號</th>
                        <th scope="col">訂單編號</th>
                        <th scope="col">購買人</th>
                        <th scope="col">品項</th>
                        <th scope="col">購買人手機</th>
                        <th scope="col">訂單建立時間</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%@ include file="/pages/page1.file" %>  
                        <%int number=pageIndex+1;%>
                        	
                    <c:forEach var="orderListVO" items="${list}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                      <tr>
                        <th scope="row"><%=number++%></th>
                        <td>${orderListVO.orderNo}</th>
                        <td>${ordersSvc.gerOrdersByOrderNo(orderListVO.orderNo).userID}-
                        	${userSvc.findByUserId(ordersSvc.gerOrdersByOrderNo(orderListVO.orderNo).userID).userName}</td>
                        <td>${orderListVO.itemID}-鍛鍊完美二頭肌</td>
                        <td>${userSvc.findByUserId(ordersSvc.gerOrdersByOrderNo(orderListVO.orderNo).userID).userMobile }</td>
                        <td>
                        ${ordersSvc.gerOrdersByOrderNo(orderListVO.orderNo).builtDate}
                        </td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
               <div class="page">
                  <%for(int i = 0; i < pageIndexArray.length; i++){%>
                  		<a href="<%request.getRequestURI();%>?whichPage=<%=i+1%>"><%=i+1%></a>
                  	<%}%>
                  </div> 
            </div>
        </div>
    </div>


</body>
</html>