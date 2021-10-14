<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.posts.model.*"%>
<%@ page import="com.user.model.*"%>

<%
// 	PostsVO postsVO = (PostsVO) request.getAttribute("postsVO");
	PostsService postsSvc = new PostsService();
	PostsVO postsVO = postsSvc.getByPostsID(Integer.parseInt(request.getParameter("postsID")));
%>

<%
	UserService userSvc = new UserService();
	UserVO userVO = userSvc.findByUserId(postsVO.getUserID());
 	pageContext.setAttribute("postsVO", postsVO);
%>

<!DOCTYPE html>
<html lang="ZH-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CloudGYM討論區</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="./css/ArticlePage.css">
</head>

<body>
    <!-- header -->
    <div id="bar"></div>



    <!-- main -->
    <div class="container mt-5">
        <div class="row">

            <div class="col-8">
                <article>
                    <header class="mb-4">
                        <h1 class="fw-bolder mb-1" style="color: rgb(132, 145, 145)"><%=postsVO.getPostsTitle()%></h1>
                        <div class="text-muted mb-2">作者：<%=userVO.getUserName()%></div>
                    </header>
                    <figure class="mb-4">
                    <img class="img-fluid rounded"
                            src="<%=request.getContextPath()%>/Reader?id=<%=postsVO.getPostsID()%>" alt="..." />
                    </figure>
                    <section class="mb-5">
                        <p class="fs-5 mb-4"><%=postsVO.getPostsContent()%></p>
                    </section>
                    <p class="text-muted"  style="text-align:right">發表時間：<%=postsVO.getPostsPublishDate()%></p>
                </article>
                <hr>
                <div class="icon">
                <i class="far fa-thumbs-up"></i>
                <i class="far fa-bookmark"></i>
                <i class="fas fa-share-alt"></i>
                <button type="button" class="btn btn-outline-dark">檢舉</button>
            </div>
                <hr>


<!--                 Comments section -->
                <section class="mb-5">
                    <div class="card bg-light">
                        <div class="card-body">
<!--                             Comment form -->
                            <form class="mb-4"><textarea class="form-control" rows="3"
                                    placeholder="Join the discussion and leave a comment!"></textarea></form>


<!--                             Comment with nested comments -->
                            <div class="d-flex mb-1">
<!--                                 Parent comment -->
                                <div class="ms-3">
                                    <div class="fw-bold">Commenter Name</div>
                                    If you're going to lead a space frontier, it has to be government; it'll never be
                                    private enterprise. Because the space frontier is dangerous, and it's expensive, and
                                    it has unquantified risks.
                                    <br>
                                    <span style="font-size: 10px; color: rgb(155, 151, 151);">發表時間:2021-02-21 13:30</span>
                                </div>
                            </div>
                            <hr>
                            
<!--                             Single comment -->
                            <div class="d-flex mb-1">
<!--                                 Parent comment -->
                                <div class="ms-3">
                                    <div class="fw-bold">Commenter Name</div>
                                    If you're going to lead a space frontier, it has to be government; it'll never be
                                    private enterprise. Because the space frontier is dangerous, and it's expensive, and
                                    it has unquantified risks.
                                    <br>
                                    <span style="font-size: 10px; color: rgb(155, 151, 151);">發表時間:2021-02-21 13:30</span>
                                </div>
                            </div>
                            <hr>



                        </div>
                    </div>
                </section>
            </div>



<!--             right -->
            <div class="col-4">

<!--                 Search widget -->
                <div class="card mb-4">
                    <div class="card-header"><i class="fas fa-search me-2"></i>搜尋文章</div>
                    <div class="card-body">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="請輸入關鍵字"
                                aria-describedby="button-search" />
                            <button class="btn btn-outline-dark" id="button-search" type="button">搜尋</button>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header"><i class="fab fa-hotjar me-2"></i>文章分類</div>
                    <div class="feed">
                        <a href="#"><button type="button" class="btn btn-outline-secondary">健身知識</button></a>
                        <a href="#"><button type="button" class="btn btn-outline-secondary">健康飲食</button></a>
                        <a href="#"><button type="button" class="btn btn-outline-secondary">成果分享</button></a>
                        <a href="#"><button type="button" class="btn btn-outline-secondary">商品推薦</button></a>
                        <a href="#"><button type="button" class="btn btn-outline-secondary">綜合閒聊</button></a>
                    </div>
                </div>




            </div>
<!--             right -->






        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

</body>

</html>