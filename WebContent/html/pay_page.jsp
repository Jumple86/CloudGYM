<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coachMenu.model.*"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.subscription.model.*"%>
<%@ page import="com.subList.model.*"%>
<%@ page import="redis.clients.jedis.Jedis" %>
<%@ page import="com.video.model.*" %>

<%
	String username = (String) session.getAttribute("username");
	
	int price = 0;
	Jedis jedis = new Jedis("localhost", 6379);
	pageContext.setAttribute("jedis", jedis);
	Set<String> vset = new HashSet<>();
	Set<String> mset = new HashSet<>();
	Set<String> sset = new HashSet<>();
	try{
		Set<String> keys = jedis.hkeys(username);
		for(String key : keys){
			if(key.charAt(0) == '3'){
				vset.add(key);
			}
			if(key.charAt(0) == '6'){
				mset.add(key);
			}
			if(key.charAt(0) == '2'){
				sset.add(key);
			}
		}
		
		CoachMenuService menuSvc = new CoachMenuService();
		List<CoachMenuVO> menulist = new ArrayList<>();
		for(String menuID : mset){
			CoachMenuVO coachMenuVO = menuSvc.getByMenuID(Integer.parseInt(menuID));
			price += coachMenuVO.getPrice();
			menulist.add(coachMenuVO);
		}
		
		VideoService videoSvc = new VideoService();
		List<VideoVO> videolist = new ArrayList<>();
		for(String videoID : vset){
			VideoVO videoVO = videoSvc.findByPrimaryKey(Integer.parseInt(videoID));
			price += videoVO.getPrice();
			videolist.add(videoVO);
		}
		
// 		SubscriptionService subscriptionSvc = new SubscriptionService();
// 		SubListService subListSvc = new SubListService();
// 		List<SubListVO> sublist = new ArrayList<>();
// 		for(String userID : sset){
// 			SubListVO subListVO = subListSvc.getBySubID(Integer.parseInt(jedis.hget(username, userID)));
// 			price += subListVO.getPrice();
// 			sublist.add(subListVO);
// 		}
		
		
		pageContext.setAttribute("menulist", menulist);
// 		pageContext.setAttribute("sublist", sublist);
		pageContext.setAttribute("sset", sset);
		pageContext.setAttribute("videolist", videolist);
		
		long cartCount = jedis.hlen(username);
		pageContext.setAttribute("cartCount", cartCount);
		
		pageContext.setAttribute("price", price);
	}catch(Exception e){
		String error = "請先登入才能看購物車裡的內容喔";
		pageContext.setAttribute("error", error);
		pageContext.setAttribute("cartCount", 0);
		pageContext.setAttribute("price", 0);
		pageContext.setAttribute("menulist", null);
		pageContext.setAttribute("sublist", null);
		pageContext.setAttribute("videolist", null);
	}
	
	
	jedis.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/pay_page.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
	<div id="bar">
        <div id="title">
            <ul>
                <li class="bar_li">
                    <img src="../img/logo.png" alt="">
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
                    <a href="<%= request.getContextPath()%>/html/pay_page.jsp">
	                    <i class="bi bi-cart-fill">
	                    <c:if test="${hlen != 0}"><span>${hlen}</span></c:if>
	                    <c:if test="${hlen == 0}"><span>${cartCount}</span></c:if>
	                        <span>${cartCount}</span>
	                    </i>
                	</a>
                </li>
            </ul>
        </div>
    </div>
    
    <div id="wrap">
        <div id="top">
            <div id="head">
                <span>購買明細</span>
            </div>
            <div id="info">
                <ul>
                	<c:if test="${not empty error}"><li style="background-color:#EDE9F2">${error}</li></c:if>
                	<c:if test="${not empty menulist}">
                    <c:forEach var="menus" items="${menulist}">
                    <li>
                        <img src="../img/work_out_2.jpg" alt="">
                        <div id="wrapper">
                            <h3>${menus.menuName}</h3>
                            <p>商品內容商品內容商品內容商品內容商品內容商品內容商品內容商品內容</p>
                        </div>
                        
                        <div class="price">$ <span>${menus.price}</span></div>
                        <form id="delete_from_cart" method="post">
                        	<input type="hidden" name="action" value="deleteProduct"/>
                        	<input type="hidden" name="menuID" value="${menus.menuID}"/>
	                        <button class="del" type="button">
	                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
	                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
	                              </svg>
	                        </button>
                        </form>
                    </li>
                    </c:forEach>
                    </c:if>
                    <c:if test="${not empty sset}">
                    <c:forEach var="userID" items="${sset}">
                    <li>
                    	<img src="../img/work_out_2.jpg" alt="">
                    	<div id="wrapper">
                    		<h3>訂閱方案</h3>
                    		<jsp:useBean id="sublist" scope="page" class="com.subList.model.SubListService"/>
                    		<jsp:useBean id="coach" scope="page" class="com.coach.model.CoachService"/>
                    		<p>${coach.getByUserID(Integer.parseInt(userID)).getCoachName()} - ${sublist.getBySubID(Integer.parseInt(jedis.hget(username, userID))).duration}</p>
<%--                     		<p>${sublist.getBySubID(Integer.parseInt(jedis.hget(username, userID))).duration}</p> --%>
                    	</div>
                    	<div class="price">$ <span>${sublist.getBySubID(Integer.parseInt(jedis.hget(username, userID))).price}</span></div>
                    	<span style="display: none">${price = price +  sublist.getBySubID(Integer.parseInt(jedis.hget(username, userID))).price}</span> 
                    	<form id="delete_from_cart" method="post">
                        	<input type="hidden" name="action" value="deleteProduct"/>
                        	<input type="hidden" name="userID" value="${userID}"/>
	                        <button class="del" type="button">
	                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
	                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
	                              </svg>
	                        </button>
                        </form>
                    </li>
                    </c:forEach>
                    </c:if>
                    <c:if test="${not empty videolist}">
                    <c:forEach var="videos" items="${videolist}">
                    <li>
                        <img src="../img/work_out_2.jpg" alt="">
                        <div id="wrapper">
                            <h3>${videos.title}</h3>
                            <p>商品內容商品內容商品內容商品內容商品內容商品內容商品內容商品內容</p>
                        </div>
                        
                        <div class="price">$ <span>${videos.price}</span></div>
                        <form id="delete_from_cart" method="post">
                        	<input type="hidden" name="action" value="deleteProduct"/>
                        	<input type="hidden" name="videoID" value="${videos.videoID}"/>
	                        <button class="del" type="button">
	                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
	                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
	                              </svg>
	                        </button>
                        </form>
                    </li>
                    </c:forEach>
                    </c:if>
                </ul>
            </div>
            <div id="foot">
                <p>總金額：$ <span>${price}</span></p>
            </div>
        </div>
        <div id="bottom">
            <div id="head2">
                <p>付款資訊</p>
            </div>
            <div id="card_info">
                <h3>Credit Card Info</h3>
                <form action="">
                    <div class="col2">
                        <label>Card Number</label>
                        <input class="number" type="text" maxlength="19"
                        onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> 
                        <label>Cardholder name</label>
                        <input class="inputname" type="text" placeholder="" />
                        <label>Expiry date</label>
                        <input class="expire" type="text" placeholder="MM / YYYY" />
                        <label>Security Number</label>
                        <input class="ccv" type="text" placeholder="CVC" maxlength="3"
                            onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
                    </div>
                    <div id="button">
                        <button type="button" onclick="javascript:location.href='./thanks_page.html'">確定</button>
                        <button type="button" onclick="javascript:location.href='./all_video_page.html'">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


	<script src="../js/jquery-3.6.0.min.js"></script>
    <script>
    	$(function(){
    		
    		var cartCount = ${cartCount};
    		if(cartCount == 0){
    			$("i.bi-cart-fill span").addClass("-on");
    			$("i.bi-cart-fill span").attr("style", "display:none");
    		}else{
    			$("i.bi-cart-fill span").removeClass("-on");
    			$("i.bi-cart-fill span").attr("style", "");
    		}
    		
    		$("button.del").on("click", function(){
    			
    			var that = $(this);
    			$.ajax({
        			url:"<%=request.getContextPath()%>/orders/orders.do",
        			type:"post",
        			data:$(this).closest("form").serialize(),
        			dataType:"json",
        			success: function(data){
        				console.log(that);
        				that.closest("li").fadeOut(1000, function(){
        					console.log(this);
        					$(this).remove();
//        			            console.log($("#info ul").children("li").length);
        		            if($("#info ul").children("li").length == 0){
        		                $("#info ul").html("<p style='font-size: 16px; margin-bottom: 20px; margin-top: 0;'>購物車裡還沒有商品喲~</p>");
        		            }
        		        });
        				console.log(data);
        				console.log("success");
        				$("div#option span").html(data[1]);
        				
        				let newPrice = $("div#foot span").html() - data[0];
        				$("div#foot span").html(newPrice);
        				console.log($("div#option span").html());
        				
        				if($("div#option span").html() == 0){
        					$("i.bi-cart-fill span").addClass("-on");
        					$("i.bi-cart-fill span").attr("style", "display:none");
        				}else{
        					$("i.bi-cart-fill span").removeClass("-on");
        					$("i.bi-cart-fill span").attr("style", "");
        				}
        			},
        			error: function(xhr){
        				console.log("fail");
        			}
        		})	
    		});
    		
    		
    		
    		
    		
    		
    		$(".number").on("keyup", function(e){
    	        if(e.which == 229){
    	            $(this).val("");
    	        }
    	        // console.log($(this).val());
    	        // if(e.key >= 0 && e.key <= 9){
    	        //     if($(this).val().length === 4 || $(this).val().length === 9 || $(this).val().length === 14){
    	        //       $(this).val($(this).val() +  " ");
    	        //     }
    	        // }
    	        if($(this).val().length == 4){
    	            $(this).val($(this).val() +  " ");
    	        }
    	        if($(this).val().length == 9){
    	            $(this).val($(this).val() +  " ");
    	        }
    	        if($(this).val().length == 14){
    	            $(this).val($(this).val() +  " ");
    	        }
    	        
    	    })

    	    $(".number").on("keydown", function(e){
    	        if($(this).val().length == 5 && e.which == 8){
    	            let val = $(this).val().trim();
    	            $(this).val(val);
    	        }
    	        if($(this).val().length == 10 && e.which == 8){
    	            let val = $(this).val().trim();
    	            $(this).val(val);
    	        }
    	        if($(this).val().length == 15 && e.which == 8){
    	            let val = $(this).val().trim();
    	            $(this).val(val);
    	        }
    	    })

    	    //Date expire input
    	    $(".expire").keypress(function(event){
    	        if(event.charCode >= 48 && event.charCode <= 57){
    	          if($(this).val().length === 1){
    	              $(this).val($(this).val() + event.key + " / ");
    	          }else if($(this).val().length === 0){
    	            if(event.key == 1 || event.key == 0){
    	              month = event.key;
    	              return event.charCode;
    	            }else{
    	              $(this).val(0 + event.key + " / ");
    	            }
    	          }else if($(this).val().length > 2 && $(this).val().length < 9){
    	            return event.charCode;
    	          }
    	        }
    	        return false;
    	    });

    	    $(".expire").on("keyup", function(e){
    	        if(e.which == 229){
    	            $(this).val("");
    	        }
    	    })

    	    $(".ccv").on("keyup", function(e){
    	        if(e.which == 229){
    	            $(this).val("");
    	        }
    	    });
    		
    		
    	})
    </script>
</body>
</html>