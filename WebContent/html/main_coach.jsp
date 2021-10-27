<%@ page contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coach.model.*"%>

<%
	CoachService coachSvc = new CoachService();
	List<CoachVO> list = coachSvc.getAll();
// 	pageContext.setAttribute("coach", coach);
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="BIG5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>main_coach</title>

    <!-- CSS -->
    <link href="../css/main_coach.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

  </head>
  <body>
      
    <div id="exampleSlider">
       <div class="MS-content">
			<c:forEach var="coachVO" items="${list}" begin="0"
				end="${list.size()}">


				<div class="item">
					<div class="img_block">
						<form action="<%=request.getContextPath()%>/coach/coach.do?">
							<input type="submit" id="${coachVO.userID }" style="display: none;"> 
							<input type="hidden" name="action" value="gotocoach"> 
							<input type="hidden"name="userID" value="${coachVO.userID }"> 
							<label for="${coachVO.userID }"> 
							    <img src="<%=request.getContextPath()%>/coachImg/coachImg.do?userID=${coachVO.userID}" alt="" class="pic">
								<p class="coach_list">${coachVO.coachName}</p>
							</label>
						</form>
					</div>
				</div>


			</c:forEach>
		</div>
       
       <div class="MS-controls">
           <button class="MS-left"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
           <button class="MS-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
       </div>
   </div>

    <!-- Include jQuery -->
    <script src="../vendors/jquery/jquery-3.4.1.min.js"></script>

    <!-- Include Multislider -->
    <script src="../js/multislider.min.js"></script>

    <!-- Initialize element with Multislider -->
    <script>
    $('#exampleSlider').multislider({
        interval: 0,
        slideAll: false,
        duration: 1500
    });
    </script>
  </body>
</html>