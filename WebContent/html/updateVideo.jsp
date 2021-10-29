<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�нm�s��v��</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/buildVideo.css">
</head>
<body>
<!-- bar���� begining -->
    <div id="bar">
        <div id="title">
            <ul>
                <li class="bar_li">
                    <img src="../img/logo.png" alt="" for="#CloudGYM">
                </li>
                <li class="bar_li">
                    <a href="${pageContext.request.contextPath}/html/main_page.jsp" id="CloudGYM">CloudGYM</a>
                </li>
            </ul>
        </div>
        <div id="option">
            <ul>
                <li class="option"><a href="#">�B������</a></li>
                <li class="option"><a href="${pageContext.request.contextPath}/html/all_coach_page.jsp">�нm</a></li>
                <li class="option"><a href="${pageContext.request.contextPath}/userMainPage/userMainPage.jsp">�ӤH�M��</a></li>
                <li class="option"><a href="${pageContext.request.contextPath}/html/ArticleList.jsp">�Q�װ�</a></li>
                
                <c:if test="${empty name}">
					<li class="option"><a href="${pageContext.request.contextPath}/html/login_ask_page.html" target="_blank">���U/�n�J</a></li>
				</c:if>
				<c:if test="${not empty name}">
					<li class="option"><a href="<%=request.getContextPath()%>/LogoutHandler">${name} �n�X</a></li>
				</c:if>
                
                <li class="option">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                      </svg>
                </li>
            </ul>
        </div>
    </div>
<!-- bar���� end -->
    <div id="main">
        <div id="form">
            <div id="box1">
                <ul>
                    <h3 id="form_title">�s��нm�v��</h3>
                </ul>
            </div>
            <div id="box2">
                <ul>
                    <li id="video_name">�v���W��:<input id="name_input" type="text" placeholder="��J�v���W��" aria-label="default input example"></li><br>
                    
                    <li id="video_intro">�v��²��:</li><br>
                    <textarea id="intro_input" rows="3"></textarea>
                    <div id="post_box">
                        <li id="post_name">�ʧ@�W��:<br><br>
                            <input id="post_input" type="text" placeholder="��J�ʧ@�W��" aria-label="default input example"><input id="set" type="number" placeholder="�X��" aria-label="default input example">
                        </li>
                        <li id="post_name">�ʧ@�W��:<br><br>
                            <input id="post_input" type="text" placeholder="��J�ʧ@�W��" aria-label="default input example"><input id="set" type="number" placeholder="�X��" aria-label="default input example">
                        </li>
                        <li id="post_name">�ʧ@�W��:<br><br>
                            <input id="post_input" type="text" placeholder="��J�ʧ@�W��" aria-label="default input example"><input id="set" type="number" placeholder="�X��" aria-label="default input example">
                        </li>
                        <div id="button_area">
                            <button type="button" id="button" class="btn btn-primary btn-lg">�T�{</button>
                            <button type="button" id="button" class="btn btn-primary btn-lg">����</button>
                            <button type="button" id="button" class="btn btn-primary btn-lg">�R���v��</button>
                        </div>
                    </div>
                </ul>
            </div>
            <div id="box3">
                <img src="../img/work_out_2.jpg" alt="" class="video_pic">
                <div id="public_box">
                    <input type="radio" id="userGender_01" name="userGender" value="0" checked="checked" />���}  
                    <input type="radio" id="userGender_02" name="userGender" value="1" />�����}
                    <br><br><br>
                    <h3>����:<input id="price" type="number" placeholder="��ܻ���" aria-label="default input example"></h3>
                    <br><br>
                    <h3><input type="file" id="file-uploader"></h3>
                </div>
            </div>
        </div>
    </div>
</body>
</html>