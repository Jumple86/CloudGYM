<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>protected_test_user.jsp</title>
</head>
<body>

	<br>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			 <td>   
			       <h3> �O�@������ - protected_test_user.jsp      </h3> 
				     <h3> �w��:<font color=red> ${account} </font>�z�n </h3>
				     <h3> �w��:<font color=red> ${name} </font>�z�n </h3>
				     <h3> �w��:<font color=red> ${id} </font>�z�n </h3>
			 </td>
		</tr>
	</table>
	<b> <br>
	<br>                �H�U�d��....
	
	
<!-- 	<form action='LogoutHandler'  method="post"> -->
<!-- 		<input name="button" type="submit" id="button" value="Logout"> -->
<!-- 	</form> -->
	<%@include file="../logout_test.file"%>
	
	
</body>
</html>