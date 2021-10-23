<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>protected_test_coach.jsp</title>
</head>
<body>

	<br>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='yellow' align='center' valign='middle' height='20'>
			 <td>   
			       <h3> 保護的頁面 - protected_test_coach.jsp      </h3> 
				     <h3> coachAccount:<font color=red> ${coachAccount} </font>您好 </h3>
				     <h3> coachName:<font color=red> ${coachName} </font>您好 </h3>
				     <h3> coachID:<font color=red> ${coachID} </font>您好 </h3>
			 </td>
		</tr>
	</table>
	<b> <br>
	<br>                以下留空....
	</b>
	
	<form action='CoachLogoutHandler'  method="post">
		<input name="button" type="submit" id="button" value="Logout">
	</form>
	
</body>
</html>
