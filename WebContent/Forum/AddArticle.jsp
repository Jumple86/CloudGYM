<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.posts.model.*"%>

<%
	PostsVO postsVO = (PostsVO) request.getAttribute("postsVO");

	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="ZH-TW">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CloudGYM討論區</title>
<link rel="stylesheet" href="./css/reset.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet" href="./css/AddArticle.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
</head>

<body>


	<!-- Navbar -->
	<div id="bar"></div>

	<!-- main -->
	<div class="container">
		<h1>新增文章</h1>
		<hr>

		<form class="row" METHOD="post" ACTION="Article.do" name="form1"
			enctype="multipart/form-data">

			<div class="col">
				<tr>
					<td>會員編號:</td>
					<td><input type="text" name="userid" size="45"
						value="<%=(postsVO == null) ? "" : postsVO.getUserID()%>" /></td>
				</tr>


				<div class="mb-3">
					<label class="form-label">文章標題</label>
					<input type="text" class="form-control" name="poststitle" value="<%=(postsVO == null) ? "" : postsVO.getPostsTitle()%>" />
					<div class="form-text">文章標題請勿空白，字數限50字以內。</div>
				</div>

				<div class="mb-3">
					<label class="form-label">文章圖片</label> <input type="file"
						class="form-control" name="postsimg" onchange="openFile(event)">
					<div class="form-text">XXXXXX</div>
					<img id="output" height="300" style="display: none">
				</div>


				<div class="mb-3">
					<label class="form-label">文章內容</label> <input type="TEXT"
						class="form-control" name="postscontent"
						value="<%=(postsVO == null) ? "" : postsVO.getPostsContent()%>" />
					<div class="form-text">XXXXX</div>
				</div>

				<!-- 			    <div class="mb-3"> -->
				<!-- 					<label class="form-label">文章內容</label> -->
				<!-- 					<textarea id="editor" class="form-control" name="postscontent" -->
				<%-- 						value="<%=(postsVO == null) ? "" : postsVO.getPostsContent()%>" --%>
				<!-- 						rows="40" /></textarea> -->
				<!-- 					<div class="form-text">Your password must be 8-20 characters -->
				<!-- 						long, contain letters and numbers, and must not contain spaces, -->
				<!-- 						special characters, or emoji.</div> -->
				<!-- 				</div> -->


				<jsp:useBean id="tagSvc" scope="page" class="com.tag.model.TagService" />

				<div class="mb-3">
					<label class="form-label">文章類型</label> <br> 
					<select class="form-select" aria-label="Default select example" name="tagid">
						<c:forEach var="tagVO" items="${tagSvc.all}">
							<option value="${tagVO.tagID}"
								${(postsVO.tagID==tagVO.tagID)? 'selected':'' }>
								${tagVO.tagName}
						</c:forEach>
					</select>
				</div>

				<div class="mb-3">
					<label class="form-label">文章狀態</label> <br> 
					<select class="form-select" aria-label="Default select example">
						<option value="1" selected>公開</option>
						<option value="0">隱藏</option>
					</select>
				</div>

			</div>
			

			<div class="sub">
				<button type="submit" class="btn btn-outline-primary" name="action" value="insert">確認</button>
				<button type="button" class="btn btn-outline-danger">取消編輯</button>
			</div>

		</form>

	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script>
		//         ClassicEditor
		//             .create(document.querySelector('#editor'))
		//             .catch(error => {
		//                 console.error(error);
		//             });

		function openFile(event) {
			var input = event.target; //取得上傳檔案
			var reader = new FileReader(); //建立FileReader物件

			reader.readAsDataURL(input.files[0]); //以.readAsDataURL將上傳檔案轉換為base64字串

			reader.onload = function() { //FileReader取得上傳檔案後執行以下內容
				var dataURL = reader.result; //設定變數dataURL為上傳圖檔的base64字串
				$('#output').attr('src', dataURL).show(); //將img的src設定為dataURL並顯示
			};
		}
	</script>


</body>

</html>