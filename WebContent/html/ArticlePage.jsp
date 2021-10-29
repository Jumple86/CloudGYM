<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.posts.model.*"%>
<%@ page import="com.comment.model.*"%>
<%@ page import="com.user.model.*"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.report.model.*" %>

<jsp:useBean id="userSvc" scope="page" class="com.user.model.UserService" />
<jsp:useBean id="coachSvc" scope="page" class="com.coach.model.CoachService" />

<%
	PostsService postsSvc = new PostsService();
	PostsVO postsVO = postsSvc.getByPostsID(new Integer(request.getParameter("postsID")));
	pageContext.setAttribute("postsVO", postsVO);

	CommentService commentSvc = new CommentService();
	List<CommentVO> list = commentSvc.getAll();
	pageContext.setAttribute("list", list);

	UserService userSvc１ = new UserService();
	UserVO userVO = userSvc１.findByUserId(postsVO.getUserID());

	CoachService coachSvc1 = new CoachService();
	CoachVO coachVO = coachSvc1.getByUserID(postsVO.getUserID());

	Integer userid = 1005;
	session.setAttribute("userID", userid);
	UserVO userVO1 = userSvc.findByUserId(userid);
	String username = userVO1.getUserName();
	
	ReportService reportSvc = new ReportService();
	List<ReportVO> reports = reportSvc.getByUser(userid);
	List<Integer> items = new ArrayList<Integer>();
	for(ReportVO reportVO : reports){
		items.add(reportVO.getItemID());
	}
	request.setAttribute("items", items);
%>

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
<link rel="stylesheet" href="../css/ArticlePage.css">
</head>

<body>
	<!-- header -->
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
				<li class="option"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart-fill"
						viewBox="0 0 16 16">
                        <path
							d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                      </svg></li>
			</ul>
		</div>
	</div>
	<!-- header_end -->

	<!-- main -->
	<div id="updatearticle">
		<div class="container">
			<div class="row">
				<form class="row" METHOD="post" ACTION="Article.do" name="form1">
					<div class="col">
						<input type="hidden" name="page" value="APG">
						<input type="hidden" name="postsid" value="<%=postsVO.getPostsID()%>">
						<button type="submit" class="btn btn-outline-light me-4" name="action" value="getOne_For_Update">
							<i class="far fa-edit me-2"></i>編輯文章
						</button>
						<button type="submit" class="btn btn-outline-light" name="action" value="delete">
							<i class="fas fa-trash-alt me-2"></i>刪除文章
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container mt-4">
		<div class="row">

			<div class="col-8">
				<article>
					<header class="mb-4">
						<h1 class="fw-bolder mb-1" style="color: rgb(132, 145, 145)"><%=postsVO.getPostsTitle()%></h1>
						<div class="text-muted mb-2">作者：
							${coachSvc.getByUserID(postsVO.userID).coachName}
							${userSvc.findByUserId(postsVO.userID).userName}
						</div>
					</header>
					<figure class="mb-4">
						<img class="img-fluid rounded" src="<%=request.getContextPath()%>/Reader?id=<%=postsVO.getPostsID()%>" alt="..." />
					</figure>
					<section class="mb-5">
						<p class="fs-5 mb-4"><%=postsVO.getPostsContent()%></p>
					</section>
					<p class="text-muted" style="text-align: right">
						發表時間：
						<fmt:formatDate value="<%=postsVO.getPostsPublishDate()%>" pattern="yyyy-MM-dd HH:mm" />
					</p>
				</article>
				<hr>
				<div class="icon">
					<!-- 按讚按鈕 -->
					<form id="addlikes"> <!--<form METHOD="post" action="likes.do">-->
						<input type="hidden" name="postsid" value="<%=postsVO.getPostsID()%>">
	<!-- ===========================================================更改使用者=========================================================== -->
						<input type="hidden" name="userid" value="1005"> 
						<input type="hidden" value="insert" name="action">
						<button id="aa" class="far fa-thumbs-up" type="button"></button>
					</form>
					
					<!-- 收藏按鈕 -->
					<form id="addcollection">
	<!-- ===========================================================更改使用者=========================================================== -->
						<input type="hidden" name="userid" value="1006">
						<input type="hidden" name="itemid" value="<%=postsVO.getPostsID()%>">
						<input type="hidden" name="action" value="insert">
						<button id="bb" class="far fa-bookmark" type="button"></button>
					</form>
					
					<!-- 分享按鈕 -->
						<button id="cc" class="fas fa-share-alt" data-clipboard-text="http://localhost:8081<%=request.getContextPath()%>/html/ArticlePage.jsp?postsID=<%=postsVO.getPostsID()%>"></button>
					<!-- 檢舉按鈕 -->
						
					<form>
						<%if(!items.contains(postsVO.getPostsID())){%>
							<button id="dd" type="button" class="btn btn-outline-dark" style="">檢舉</button>
							<input class="postsAction" type="hidden" name="action" value="addreport">
						<%}else{%>
							<button id="dd" type="button" class="btn btn-outline-dark" style="background-color:gray; color:white; border:none;">已檢舉</button>
							<input class="postsAction" type="hidden" name="action" value="deleteReport">
						<%} %>
						<input type="hidden" name="postsID" value="<%=postsVO.getPostsID()%>"> 
						
					</form>
				</div>
				<hr>
				
				<!-- 留言區塊 -->
				<section class="mb-5">
					<div class="card bg-light">
						<div id="com" class="card-body">
							<!-- 發文表單 -->
							<form id="add"><!-- <form class="mb-2" METHOD="post" action="comment.do"> -->
								<input type="hidden" name="postsid" value="<%=postsVO.getPostsID()%>"> 
									<input type="hidden" name="userid" value="${userID }"> 
									<input type="hidden" value="insert" name="action">
								<textarea class="form-control" name="commentcontent" rows="2" placeholder="撰寫公開留言..."></textarea>
								<button id="newcomment" type="button" class="btn btn-secondary">新增留言</button>
							</form>
							<hr>
							<!-- 留言內容 -->
							<c:forEach var="commentVO" items="${list}">
								<c:if test="${commentVO.postsID == postsVO.postsID}">
									<div class="d-flex mb-1">
										<div class="ms-3">
											<div class="fw-bold">
											${coachSvc.getByUserID(commentVO.userID).coachName}
											${userSvc.findByUserId(commentVO.userID).userName}
											<form>
											<c:if test="${!items.contains(commentVO.commentID) }">
												<button id="ff" type="button" class="btn btn-outline-danger" style="font-size: 10px; margin-left: 675px;">檢舉</button>
												<input class="commentAction" type="hidden" name="action" value="addreport">
											</c:if>
											<c:if test="${items.contains(commentVO.commentID) }">
												<button id="ff" type="button" class="btn btn-outline-danger" style="font-size: 10px; margin-left: 675px; background-color:red; color:white;">已檢舉</button>
												<input class="commentAction" type="hidden" name="action" value="deleteReport">
											</c:if>
												
												<input type="hidden" name="commentID" value="${commentVO.commentID}">
												
											</form>
											</div>					
											${commentVO.commentContent}
											<br> <!-- <form class="mb-2" METHOD="post" action="comment.do"> -->
											<form METHOD="post" action="comment.do">
												<span style="font-size: 10px; color: rgb(155, 151, 151);">
													<fmt:formatDate value="${commentVO.commentPublishDate}" pattern="yyyy-MM-dd HH:mm:ss" />
												</span>
<!-- 												<button type="submit" class="btn btn-secondary" style="font-size: 10px; margin-left: 560px;" value="">修改</button> -->
												<input type="hidden" name="page" value="APG">
												<input type="hidden" name="commentid" value="${commentVO.commentID}">
												<button type="submit" class="btn btn-secondary" style="font-size: 10px; margin-left: 628px;" value="delete" name="action">刪除</button>
											</form>
										</div>
									</div>
									<hr>
								</c:if>
							</c:forEach>
							<!-- 留言內容end -->
						</div>
					</div>
				</section>
				<!-- 留言區塊end -->
			</div>

			<!-- 右側區塊 -->
			<div class="col-4">
				<!--搜尋 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-search me-2"></i>搜尋文章
					</div>
					<form METHOD="post" ACTION="Article.do">
						<div class="card-body">
							<div class="input-group">
								<input class="form-control" type="text" placeholder="請輸入關鍵字" aria-describedby="button-search" name="str" />
								<button class="btn btn-outline-dark" id="button-search" type="submit" name="action" value="search">搜尋</button>
							</div>
						</div>
					</form>
				</div>
				<!--分類 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fab fa-hotjar me-2"></i>文章分類
					</div>
					<div class="feed">
						<a href="ArticleList_A.jsp"><button type="button" class="btn btn-outline-secondary">健身知識</button></a> 
						<a href="ArticleList_B.jsp"><button type="button" class="btn btn-outline-secondary">健康飲食</button></a> 
						<a href="ArticleList_C.jsp"><button type="button" class="btn btn-outline-secondary">成果分享</button></a> 
						<a href="ArticleList_D.jsp"><button type="button" class="btn btn-outline-secondary">商品推薦</button></a> 
						<a href="ArticleList_E.jsp"><button type="button" class="btn btn-outline-secondary">綜合閒聊</button></a>
					</div>
				</div>
			</div>
			<!-- 右側區塊end -->
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/clipboard@2.0.8/dist/clipboard.min.js"></script>

	<script>
	
	//留言AJAX
	$(function(){
		$("#newcomment").on("click",function(){
	 		console.log($(this).closest("from"));
			$.ajax({
				url : "<%=request.getContextPath()%>/html/comment.do",
				type : "post",
				data: $("form#add").serialize(),
				dataType : "json",
					success : function(data) {
						console.log(data);
						let userid = data[0];
						let content = data[1];
						let timestamp = data[2];
						let commentID = data[3];
						let list_html = "";
						list_html += '<div class="d-flex mb-1">';
						list_html += '<div class="ms-3">';
						list_html += '<div class="fw-bold"><%=username%>';
						list_html += '<form>';
						list_html += '<button id="ff" type="button" class="btn btn-outline-danger" style="font-size: 10px; margin-left: 675px;">檢舉</button>';
						list_html += '<input class="commentAction" type="hidden" name="action" value="addreport">';
						list_html += '<input type="hidden" name="commentID" value="' + commentID + '">';
						list_html += '</form>';
						list_html += '</div>';
						list_html += content + '<br> <span style="font-size: 10px; color: rgb(155, 151, 151);">';
						list_html += '<span>' + timestamp + '</span>';
						list_html += '<button type="submit" class="btn btn-secondary" style="font-size: 10px; margin-left: 560px;" value="">修改</button>';
						list_html += '<button type="submit" class="btn btn-secondary" style="font-size: 10px; margin-left: 10px;" value="">刪除</button>';
						list_html += '</div>';
						list_html += '</div>';
						list_html += '<hr>';
						$("#com").append(list_html);
						$("textarea.form-control").val("");
					},
					error : function(XMLHttpResponse, textStatus, errorThrown) {
						console.log("1 非同步呼叫返回失敗,XMLHttpResponse.readyState:"	+ XMLHttpResponse.readyState);
						console.log("2 非同步呼叫返回失敗,XMLHttpResponse.status:"	+ XMLHttpResponse.status);
						console.log("3 非同步呼叫返回失敗,textStatus:"	+ textStatus);
						console.log("4 非同步呼叫返回失敗,errorThrown:" + errorThrown);
					}
			});
		});
		
		// 檢舉文章ajax
		$("button#dd").on("click", function(){
			console.log("here");
			$.ajax({
				url: "<%=request.getContextPath()%>/report/report.do",
				type: "post",
				data: $(this).closest("form").serialize(),
				dataType: "json",
				success: function(data){
					
					if(data[0] == "cancelSuccess"){
						alert("已取消檢舉");
						$("button#dd").attr("style", "");
						$("button#dd").html("檢舉");
						$("input.postsAction").val("addreport");
					}
					if(data[0] == "reportSuccess"){
						alert("檢舉成功");
						$("button#dd").attr("style", "background-color:gray; color:white; border:none;");
						$("button#dd").html("已檢舉");
						$("input.postsAction").val("deleteReport");
					}
				},
				error: function(xhr){
					console.log("fail");
				}
			})
		})
		
		// 檢舉留言ajax
		$("div#com").on("click", "button#ff", function(){
			console.log("here");
			var that = $(this);
			$.ajax({
				url: "<%=request.getContextPath()%>/report/report.do",
				type: "post",
				data: $(this).closest("form").serialize(),
				dataType: "json",
				success: function(data){
					console.log("success");
					
					if(data[0] == "cancelSuccess"){
						alert("已取消檢舉");
						$(that).attr("style", "font-size: 10px; margin-left: 675px;");
						$(that).html("檢舉");
						$(that).next().val("addreport");
					}
					if(data[0] == "reportSuccess"){
						alert("檢舉成功");
						$(that).attr("style", "font-size: 10px; margin-left: 675px; background-color:red; color:white;");
						$(that).html("已檢舉");
						$(that).next().val("deleteReport");
					}
				},
				error: function(xhr){
					console.log("fail");
				}
			})
		})
		
	});
	
	//按讚AJAX
	$("#aa").on("click",function(){
		$.ajax({
		  	url: "<%=request.getContextPath()%>/html/likes.do",
			type : "POST",
			data : $("form#addlikes").serialize(),
			dataType : "json",
			success : function(data) {
				console.log(data);
				$("#aa").removeClass("far fa-thumbs-up");
				$("#aa").addClass("fas fa-thumbs-up");
				$("#aa").attr("disabled", true);
				},
			error : function(XMLHttpResponse, textStatus, errorThrown) {
				console.log("1 非同步呼叫返回失敗,XMLHttpResponse.readyState:"	+ XMLHttpResponse.readyState);
				console.log("2 非同步呼叫返回失敗,XMLHttpResponse.status:"	+ XMLHttpResponse.status);
				console.log("3 非同步呼叫返回失敗,textStatus:"	+ textStatus);
				console.log("4 非同步呼叫返回失敗,errorThrown:" + errorThrown);		
				}
			});
		});
	
	//收藏AJAX
	$("#bb").on("click", function(){
		$.ajax({
		  	url: "<%=request.getContextPath()%>/html/collection.do",
			type : "POST",
			data : $("form#addcollection").serialize(),
			dataType : "json",
			success : function(data) {
				console.log(data);
				$("#bb").removeClass("far fa-bookmark");
				$("#bb").addClass("fas fa-bookmark");
				$("#bb").attr("disabled", true);
				},
			error : function(XMLHttpResponse, textStatus, errorThrown) {
				console.log("1 非同步呼叫返回失敗,XMLHttpResponse.readyState:"	+ XMLHttpResponse.readyState);
				console.log("2 非同步呼叫返回失敗,XMLHttpResponse.status:"	+ XMLHttpResponse.status);
				console.log("3 非同步呼叫返回失敗,textStatus:"	+ textStatus);
				console.log("4 非同步呼叫返回失敗,errorThrown:" + errorThrown);		
				}
			});
		});

	//複製連結
	$("#cc").click(function() {
		new ClipboardJS('#cc');
		alert("連結已複製");
	});
	
	</script>


</body>

</html>