<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.user.model.*"%>

<%
	UserVO userVO = (UserVO) request.getAttribute("userVO");
%>

<html>
<head>
    <meta charset="BIG5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sign_up_page</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sign_up_page.css">
</head>
<body>
	
	<div id="back">
        <img src="../img/sign_up.jpg" alt="">
        <form method="post" ACTION="user.do" name="form1">
            <div id="signup">
                <h2>Sign Up</h2>
                <p>���U�H�c
                    <input type="text" placeholder="�п�J�H�c" id="email" name="userAccount" 
                    value="<%=(userVO == null) ? "1021@cloudgym.com" : userVO.getUserAccount()%>">
                </p>
                <hr>
                <p>�K�X�@�@
                    <input type="password" placeholder="�п�J�K�X" id="password" name="userPassword"
                    value="<%=(userVO == null) ? "654321" : userVO.getUserPassword()%>"></p>
                <hr>
                <p>�T�{�K�X
                    <input type="password" placeholder="�T�{�K�X" id="password" name="passwordConfirm"
                    value="<%=(userVO == null) ? "654321" : userVO.getUserPassword()%>"></p>
                <hr>
                
				<div id="errormsg" >
				<%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">�Эץ��H�U���~:</font>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</c:if>
				</div>
				
                <input type="hidden" name="action" value="insert">
                <button type="submit">�إ߱b��</button>
                <br>
            </div>
        </form>
    </div>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<%
	java.sql.Date userBirthday = null;
	try {
		userBirthday = userVO.getUserBirthday();
	} catch (Exception e) {
		userBirthday = new java.sql.Date(System.currentTimeMillis());
	}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=userBirthday%>',
	    // value:   new Date(),
		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		//startDate:	            '2017/07/10',  // �_�l��
		//minDate:               '-1970-01-01', // �h������(���t)���e
		maxDate : '+1970-01-01' // �h������(���t)����
	});

	// ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

	//      1.�H�U���Y�@�Ѥ��e������L�k���
	//      var somedate1 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      2.�H�U���Y�@�Ѥ��᪺����L�k���
	//      var somedate2 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
	//      var somedate1 = new Date('2017-06-15');
	//      var somedate2 = new Date('2017-06-25');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//		             ||
	//		            date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});
</script>
</html>