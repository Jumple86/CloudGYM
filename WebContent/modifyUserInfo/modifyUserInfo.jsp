<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.user.model.*"%>

<%
	UserVO userVO = (UserVO) request.getAttribute("userVO");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>個人資料修改</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<style>
* {
	margin: 0;
}

li {
	list-style-type: none;
}

body {
	background-color: #31105E !important;
}

#bar {
	height: 40px;
	background-color: #5C37A1;
	overflow: hidden;
	position: fixed;
	width: 100%;
	z-index: 10;
}

#title {
	float: left;
	margin-left: 20px;
	overflow: hidden;
}

img {
	width: 35px;
	margin-top: 3px;
}

.bar_li {
	float: left;
}

a {
	color: #fff;
	text-decoration: none;
	line-height: 40px;
	margin-left: 10px;
}

#option {
	float: right;
	overflow: hidden;
}

.option {
	float: left;
	color: white;
	line-height: 40px;
	margin: 0 10px;
	font-size: 14px;
}

.content {
	padding: 30px 30px 60px;
	width: 70%;
	background-color: #DED0F3;
	border-radius: 1%;
	display: inline-block;
}

.page {
	padding-top: 100px;
	text-align: center;
	padding-bottom: 100px;
}

.btn {
	margin-top: 10%;
	width: 20%;
	height: 20%;
	border-radius: 5%;
	border-style: none;
	background-color: #31105E;
	color: white;
}
</style>
</head>

<body>
	<div id="bar">
		<div id="title">
			<ul>
				<li class="bar_li"><img src="./img/logo.png" alt=""
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

	<div class="container page">
		<form class="row g-3 content">
			<h3 style="text-align: center; margin-bottom: 6%;">個人資料修改</h3>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<form>
				<div class="row mb-3">
					<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-8">
						<input type="hidden" name="userAccount"
							value="<%=userVO.getUserAccount()%>">
						<p><%=userVO.getUserAccount()%></p>
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputName" class="col-sm-2 col-form-label">名字</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputName"
							name="userName" value="<%=userVO.getUserName()%>">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword3" class="col-sm-2 col-form-label">密碼</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="inputPassword"
							name="userPassword" value="<%=userVO.getUserPassword()%>">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword3" class="col-sm-2 col-form-label">確認密碼</label>
					<div class="col-sm-8">
						<input type="password" class="form-control"
							id="inputPasswordConfirm" name="passwordConfirm"
							value="<%=userVO.getUserPassword()%>"></input>
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPhone" class="col-sm-2 col-form-label">電話</label>
					<div class="col-sm-8">
						<input type="tel" pattern="[0-9]{4}[0-9]{3}[0-9]{3}"
							class="form-control" id="inputPhone" name="userMobile"
							value="<%=userVO.getUserMobile()%>">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword3" class="col-sm-2 col-form-label">性別</label>
					<div class="col-sm-8" style="text-align:left;">
						<%-- <input type="text" class="form-control" name="userSex"
							value="<%=userVO.getUserSex()%>"></input> --%>
						<input type="radio" name="userSex" value="男"
							<%String male = userVO.getUserSex();
			if (male.equals("男"))
				out.println("checked");%> />
						<label for="radio">男</label> <input type="radio" name="userSex"
							value="女"
							<%String userSex = userVO.getUserSex();
			if (userSex.equals("女"))
				out.println("checked");%> />
						<label for="radio">女</label>
					</div>
				</div>

				<div class="row mb-3">
					<label for="inputDate" class="col-sm-2 col-form-label">生日</label>
					<div class="col-sm-8">
						<input id="bday" type="text" class="form-control"
							name="userBirthday">
					</div>
				</div>
				<div>
					<input type="hidden" name="action" value="update"> <input
						type="hidden" name="userID" value="<%=userVO.getUserID()%>">
					<input class="btn" type="submit" value="確認修改">
				</div>
			</form>
		</form>
	</div>
</body>

<%
	java.sql.Date userBirthday = null;
	try {
		userBirthday = userVO.getUserBirthday();
	} catch (Exception e) {
		userBirthday = new java.sql.Date(System.currentTimeMillis());
	}
%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#bday').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=userBirthday%>'  // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
</script>

</html>