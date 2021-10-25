<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.posts.model.*"%>

<%
	PostsVO postsVO = (PostsVO) request.getAttribute("postsVO");

	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<jsp:useBean id="tagSvc" scope="page" class="com.tag.model.TagService" />

<!DOCTYPE html>
<html lang="ZH-TW">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CloudGYM討論區</title>
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
<link rel="stylesheet" href="../css/AddArticle.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
</head>

<body>

	<!-- header -->
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                      </svg>
                </li>
            </ul>
        </div>
    </div>
    <!-- header_end -->

	<!-- main -->
	<div class="container">
		<h1>編輯文章</h1>
		<hr>

		<form class="row" METHOD="post" ACTION="Article.do" name="form1" enctype="multipart/form-data">

			<div class="col">

				<div class="mb-3">
					<label class="form-label">文章標題</label> 
					<input type="text" class="form-control" name="poststitle" value="<%=postsVO.getPostsTitle()%>" />
					<div class="form-text">文章標題請勿空白，字數限50字以內。</div>
				</div>

				<div class="mb-3">
					<label class="form-label">文章圖片</label> 
					<input type="file" class="form-control" name="postsimg" onchange="openFile(event)">
					<div class="form-text">XXXXXX</div>
					<img id="output" height="300" style="display: none">
				</div>

				<div class="mb-3">
					<label class="form-label">文章內容</label>
					<input type="TEXT" class="form-control" name="postscontent" value="<%=postsVO.getPostsContent()%>" />
					<div class="form-text">XXXXX</div>
				</div>

				<div class="mb-3">
					<label class="form-label">文章類型</label> <br> <select
						class="form-select" aria-label="Default select example" name="tagid">
						<c:forEach var="tagVO" items="${tagSvc.all}">
							<option value="${tagVO.tagID}"
								${(postsVO.tagID==tagVO.tagID)? 'selected':'' }>
								${tagVO.tagName}
						</c:forEach>
					</select>
				</div>

			</div>

			<div class="sub">
				<input type="hidden" name="postsid" value="<%=postsVO.getPostsID()%>">	
				<button type="submit" class="btn btn-outline-primary" name="action" value="update">確認</button>
				<button id="cancel" type="button" class="btn btn-outline-danger">取消</button>
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
		
        $("#cancel").click(function(){
            var yes = confirm('你確定要取消編輯文章嗎?');
            if (yes) {
                history.back();
            } else {
            	console.log("no");
            }
        });
		
	</script>

</body>

</html>