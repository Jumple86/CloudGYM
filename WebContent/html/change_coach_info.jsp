<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coach.model.*"%>

<%
 CoachService coachSvc = new CoachService();
 List<CoachVO> list = coachSvc.getAll();
 pageContext.setAttribute("list", list);	
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>�нm�C�� </title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/change_coach_info.css">

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
				<li class="option">�B������</li>
				<li class="option">�нm</li>
				<li class="option">�ӤH�M��</li>
				<li class="option">�Q�װ�</li>
				<li class="option">���U/�n�J</li>
				<li class="option"><svg xmlns="http://www.w3.org/2000/svg"
						width="25" height="25" fill="currentColor" class="bi bi-cart-fill"
						viewBox="0 0 16 16">
                        <path
							d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                      </svg></li>
			</ul>
		</div>
	</div>

	<div id="main">
		<div id="form">
			<div id="title_box">�нm��ƭק�B</div>
			<br>
			<br>

			<div id="change_name">
				�m�W:<input id="name_input" type="text" placeholder="��J�W��"
					aria-label="default input example">
			</div>
			<br>
			<br>
			<br>

			<div id="photo_box">�ӱi�Ӥ�:</div>

			<div id="photo_button">
				<button type="button" id="button" class="btn btn-primary btn-lg">�W�ǷӤ�</button>
				<button type="button" id="button" class="btn btn-primary btn-lg">�R���Ӥ�</button>
			</div>

			<div id="change_info">
				²��:
				<textarea id="info_input" rows="3"></textarea>
			</div>

			<div id="cer">
				�ҷ�(���):<input id="cer_input" type="text" placeholder="��J�W��"
					aria-label="default input example">
			</div>
		</div>

	</div>


</body>
</html>