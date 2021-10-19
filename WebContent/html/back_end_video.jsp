<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.video.model.*"%>

<jsp:useBean id="coachSvc" scope="page"
	class="com.coach.model.CoachService" />
<%
	VideoService videoSvc = new VideoService();
	List<VideoVO> list = videoSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>�v���޲z</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/back_end_index.css">
<link rel="stylesheet" href="../css/back_end_video.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
				<li class="option"><a class="logout" href="#">�n�X</a></li>
				<li class="option"><a class="login_ad"
					href="<%=request.getContextPath()%>/html/back_end_Admin.jsp">�޲z��</a></li>
			</ul>
		</div>
	</div>
	<div id="wrap">
		<div id="left">
			<ul id="btn_fa">
				<li>
                    <a href="<%=request.getContextPath()%>/html/back_end_video.jsp">
                        <span class="li_btn">�v���޲z</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_order.jsp">
                        <span class="li_btn">�q����Ӻ޲z</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_post.jsp">
                        <span class="li_btn">�峹�޲z</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_user.jsp">
                        <span class="li_btn">�|���޲z</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_coach.jsp">
                        <span class="li_btn">�нm�޲z</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/html/back_end_sublist.jsp">
                        <span class="li_btn">�q�\�޲z</span>
                    </a>
                </li>
			</ul>
		</div>
		<p>�v���޲z</p>
		<div id="right">
			<div class="main">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">�s��</th>
							<th scope="col">�v��ID</th>
							<th scope="col">�v�����D</th>
							<th scope="col">�W�Ǫ�</th>
							<th scope="col">�W�Ǯɶ�</th>
							<th scope="col">�Q���|����</th>
							<th scope="col">�v��</th>
							<th scope="col">���A</th>
							<th scope="col">�ק�</th>
						</tr>
					</thead>
					<tbody>
						<%--<%@ include file="/pages/page1.file" %> --%>

						<%
							int rowsPerPage = 10; //�C��������    
							int rowNumber = 0; //�`����
							int pageNumber = 0; //�`����      
							int whichPage = 1; //�ĴX��
							int pageIndexArray[] = null;
							int pageIndex = 0;
						%>

						<%
							rowNumber = list.size();
							if (rowNumber % rowsPerPage != 0)
								pageNumber = rowNumber / rowsPerPage + 1;
							else
								pageNumber = rowNumber / rowsPerPage;

							pageIndexArray = new int[pageNumber];
							for (int i = 1; i <= pageIndexArray.length; i++)
								pageIndexArray[i - 1] = i * rowsPerPage - rowsPerPage;
						%>

						<%
							try {
								whichPage = Integer.parseInt(request.getParameter("whichPage"));
								pageIndex = pageIndexArray[whichPage - 1];
							} catch (NumberFormatException e) { //�Ĥ@�����檺�ɭ�
								whichPage = 1;
								pageIndex = 0;
							} catch (ArrayIndexOutOfBoundsException e) { //�`���Ƥ��~�����~����
								if (pageNumber > 0) {
									whichPage = pageNumber;
									pageIndex = pageIndexArray[pageNumber - 1];
								}
							}
						%>
						<%
							int number = pageIndex + 1;
						%>
						<c:forEach var="videoVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<tr>
								<th scope="row"><%=number++%></th>
								<td>${videoVO.videoID}</td>
								<td>${videoVO.title}</td>
								<td>${videoVO.userID}-
									${coachSvc.getByUserID(videoVO.userID).coachName}</td>
								<td>${videoVO.publishTime}</td>
								<td>${videoVO.reportedTimes}</td>
								<td><a
									href="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}">
										<i class="bi bi-camera-reels-fill"></i>
								</a> <!--                         <video controls class="td_video_src"> -->
									<%--                             <source src="<%=request.getContextPath()%>/html/VideoOutput?videoID=${videoVO.videoID}" type="video/mp4"> --%>
									<!--                            <source src="https://giant.gfycat.com/VerifiableTerrificHind.webm" type="video/webm">  -->
									<!--                         </video> --></td>
								<td><input type="radio" name="videoshow" value="open"
									${videoVO.listed == true ? "checked='true'" : ""}>���} <input
									type="radio" name="videoshow" value="close"
									${videoVO.listed == false ? "checked='true'" : ""}>�����}
								</td>
								<td>
									<form method="post" action="xxx">
										<button type="submit">
											<i class="bi bi-check-all"></i>
										</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="page">
					<%
						for (int i = 0; i < pageIndexArray.length; i++) {
					%>
					<a href="<%request.getRequestURI();%>?whichPage=<%=i + 1%>"><%=i + 1%></a>
					<%
						}
					%>
				</div>
			</div>
		</div>

		<script src="../vendors/jquery/jquery-3.6.0.min.js"></script>
		<script src="../js/back_end_video.js"></script>
</body>
</html>