<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.user.model.*" %>
<%
  response.setHeader("Cache-Control","no-store"); //HTTP 1.1
  response.setHeader("Pragma","no-cache");        //HTTP 1.0
  response.setDateHeader ("Expires", 0);
%>
<%
	UserService userSvc = new UserService();
	List<UserVO> list = userSvc.getAll();
	pageContext.setAttribute("list", list);		
%>
<jsp:useBean id="userAuthSvc" scope="page" class="com.userAuth.model.UserAuthService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員管理表單</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/back_end_index.css">
    <link rel="stylesheet" href="../css/back_end_user.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
                    <a href="#">
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
                    <a href="#">
                        <span class="li_btn">訂閱管理</span>
                    </a>
                </li>
                </ul>
            </div>
            <p>會員管理</p>
            <div id="right">
            <div class="main">
              <form method="post" action="UserAuth.do">
              	<input type="hidden" name="page" value="usermanager">
                <button id="bat_btn" class="ban_user" type="submit" name="AuthMgt" value="stopUser">停權/解除</button>
                <button id="bat_btn" class="ban_shopping" type="submit" name="AuthMgt" value="stopBuy">禁止購買/解除</button>
                <button id="bat_btn" class="ban_comm" type="submit" name="AuthMgt" value="stopComment">禁言/解除</button>
              
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col"></th>
                        <th scope="col">會員編號</th>
                        <th scope="col">姓名</th>
                        <th scope="col">帳號</th>
                        <th scope="col">手機</th>
                        <th scope="col">生日</th>
                        <th scope="col">性別</th>
                        <th scope="col">檢舉次數</th>
                        <th scope="col">權限管理</th>                        
                      </tr>
                    </thead>
                    <tbody>
                    <%@ include file="/pages/page1.file" %> 
                    <c:forEach var="userVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                      <tr>
                        <th scope="row">
                        <input class="getall" type="checkbox" name="userid" value="${userVO.userID}">
                        </th>
                        <td>${userVO.userID}</td>
                        <td>${userVO.userName}</td>
                        <td>${userVO.userAccount}</td>
                        <td>${userVO.userMobile}</td>
                        <td>${userVO.userBirthday}</td>
                        <td>${userVO.userSex}</td>
                        <td>${userVO.userReportedTimes}</td>
                        <td>
                          <span class="td_comm">
                            <i class="bi bi-chat-text-fill"  
                            ${userAuthSvc.getUserID(userVO.userID).banComment == 1 ? "style='color:red'" : ""}
                            ></i>
                          </span>
                            <span class="td_shopping">
                              <i class="bi bi-cart-x-fill"
                              ${userAuthSvc.getUserID(userVO.userID).banShopping == 1 ? "style='color:red'" : ""}
                              ></i>
                            </span>
                            <span class="td_user">
                              <i class="bi bi-person-x-fill"
                               ${userAuthSvc.getUserID(userVO.userID).banUsers == 1 ? "style='color:red'" : ""}
                              ></i>
                            </span>
                          </td>                        
                      </tr>                     
                    </c:forEach>
                    </tbody>
                  </table>
<%--                   <%@ include file="/pages/page2.file" %>                  --%>
                 <div class="page">
                  <%for(int i = 0; i < pageIndexArray.length; i++){%>
                  		<a href="<%request.getRequestURI();%>?whichPage=<%=i+1%>"><%=i+1%></a>
                  	<%}%>
                  </div>    
            	</form>
            </div>
        </div>
    </div>
</body>
</html>