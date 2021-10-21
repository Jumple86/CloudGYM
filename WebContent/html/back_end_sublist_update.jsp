<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.subList.model.*"%>

<%
	SubListService sublistSvc = new SubListService();
	SubListVO sublistVO = sublistSvc.getBySubID(Integer.parseInt(request.getParameter("subID")));
	pageContext.setAttribute("sublistVO", sublistVO);	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�ק�q�\�޲z</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/back_end_index.css">
    <link rel="stylesheet" href="../css/back_end_sublist_page.css">
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
                <li class="option"><a class="logout" href="#">�n�X</a></li>
				<li class="option"><a class="login_ad"
					href="<%=request.getContextPath()%>/html/back_end_Admin.jsp">�޲z��</a></li>
            </ul>
        </div>
    </div>
    <div id="wrap">
        <div id="left"></div>

            <div id="right">
            <div class="main">
                <div class="main-out">
                    <div class="name">�q�\��׭ק�</div>               

                        <ul class="name-ul">
                            <li class="name-li">��צW�� <span>${sublistVO.subName}</span>
                            </li>
                            <li class="name-li"><span>��׮ɪ�</span>
                                <input type="text" name="duration" value="${sublistVO.duration}">
                            </li>
                            <li class="name-li"><span class="li-span">���</span>
                                <input type="text" name="price" value="${sublistVO.price}">
                            </li>                            
                            
                            <div>
                                <button class="confirm" type="submit" name="action" value="update">�T�{</button>
                                <a href="<%=request.getContextPath()%>/html/back_end_sublist.jsp">
                                <button class="cancel" type="button">����</button>
                            	</a>
                            </div>
                        </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>