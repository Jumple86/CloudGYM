<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coach.model.*"%>


<%
	CoachService coachSvc = new CoachService();
	CoachVO coachVO = coachSvc.getByUserID(Integer.parseInt(request.getParameter("userID")));
	pageContext.setAttribute("coachVO", coachVO);
%>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<jsp:useBean id="CoachSvc" scope="page"
	class="com.coach.model.CoachService" />

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>教練列表</title>
<link rel="stylesheet" href="../css/reset.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet" href="../css/changeCoachInfo_page.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>

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

	<div class="container">
		<h1>更改資料</h1>
		<hr>

            <%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
		<form class="row" METHOD="post" ACTION="coach.do" name="form1"
			enctype="multipart/form-data">

			<div class="col">

				<div class="mb-3">
					<label class="form-label">教練名字</label> <input type="text"
						class="form-control" name="coachName"
						value="<%=coachVO.getCoachName()%>" />
					<div class="form-text">名字請勿空白</div>

				</div>

				<div class="mb-3">
					<label class="form-label">個人圖片</label> <input type="file"
						class="form-control" name="coachImg" onchange="openFile(event)">
					<div class="form-text">禁止上傳違禁圖片</div>
				</div>

				<div class="mb-3">
					<label class="form-label">自我介紹</label> <input type="TEXT"
						class="form-control" name="coachDescription"
						value="<%=coachVO.getCoachDescription()%>" />
					<div class="form-text">可盡量填寫</div>
				</div>

				<div class="mb-3">
					<label class="form-label">證照</label> <input type="TEXT"
						class="form-control" name="coachCertificate"
						value="<%=coachVO.getCoachCertificate()%>" />
					<div class="form-text">可填可不填</div>
				</div>
			</div>


			<div class="sub">
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="userID" value="<%=coachVO.getUserID()%>">
				<button type="submit" class="btn btn-outline-primary">確認</button>
				<button id="cancel" type="button" class="btn btn-outline-danger">取消</button>
			</div>

		</form>

	</div>

	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script>
		function openFile(event) {
			var input = event.target; //取得上傳檔案
			var reader = new FileReader(); //建立FileReader物件

			reader.readAsDataURL(input.files[0]); //以.readAsDataURL將上傳檔案轉換為base64字串

			reader.onload = function() { //FileReader取得上傳檔案後執行以下內容
				var dataURL = reader.result; //設定變數dataURL為上傳圖檔的base64字串
				$('#output').attr('src', dataURL).show(); //將img的src設定為dataURL並顯示
			};
		}

		$("#cancel").click(function() {
			console.log("cancel");

			var yes = confirm('你確定要取消嗎?');
			if (yes) {
				console.log("yse");
				alert(history.back());
			} else {
				console.log("no");
			}
		});
	</script>

</body>
</html>