<%@page import="com.itwill.domain.SeatReservation" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap"
	rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="static/css/style.css">
<link rel="stylesheet" href="static/css/ddoyoon.css">
<link rel="stylesheet" href="static/css/BookCart.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/favicon-16x16.png">
<title>도서정보 - 딜리브러리</title>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$(document).on('click','.btn_seat_reservation',function(e){
			var param = 'seat_no='+$(e.target).attr('seat_no');
			console.log(param);
			$.ajax({
				url:'seat_reservation_action_json',
				method:'POST',
				data:param,
				dataType:'json',
				success:function(jsonResult){
					if(jsonResult.code==1){
						$('#menu_seatReservation').trigger('click');
						alert(jsonResult.msg);
						location.href='seatReservation';
					}else if(jsonResult.code==2){
						alert(jsonResult.msg);
					}else if(jsonResult.code==0){
						alert(jsonResult.msg);
					}
				}
				
			});
		});
		
		$(document).on('click','.btn_seat_return',function(e){
			var param = 'seat_no='+$(e.target).attr('seat_no');
			console.log(param);
			$.ajax({
				url:'seat_return_action_json',
				method:'POST',
				data:param,
				dataType:'json',
				success:function(jsonResult){
					if(jsonResult.code==1){
						alert('반납이 완료됐습니다.')
						/*
						삭제 성공시 새로고침
						*/
						location.href='seatReservation';
					}else if(jsonResult.code==2){
						alert(jsonResult.msg);
					}
				}
				
			});
		});
	});
</script>

</head>
<body class="d-flex flex-column">
	<div id="page-content">

			<!-- navigation start-->
			<div id="navigation">
				<!-- include_common_left.jsp start-->
				<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
				<!-- include_common_left.jsp end-->
			</div>
			<!-- navigation end-->

		<!-- PAGE HEADER -->
		<header id="page-header" class="noto-serif">
			<div class="page-header-overlay">
				<div class="container pt-5">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<h2>열람실예약</h2>
						</div>
					</div>
				</div>
			</div>
		</header>

		<!-- MAIN SECTION -->
			<div class="seat_wrap" style="text-align:center;">
				<div id="A_room">
						<c:forEach items="${seatList}" var="seat" begin="0" end="9">
						<div class="a-deck">
		          		 <p class="card-text">${seat.seat_no}</p>
		                 <p class="card-text">시작시간 : ${seat.seat_start_time}</p>
		                 <p class="card-text">종료시간 : ${seat.seat_end_time}</p>
						 <c:choose>
						 <c:when test="${seat.seat_status == 1}">
		                 <p class="card_text"><b>사용중</b></p>
		                 </c:when>
		                 <c:when test="${seat.seat_status == 0 }">
		                 <input type="button" class="btn_seat_reservation" value="예약" seat_no="${seat.seat_no }">
		                 </c:when>
		                 </c:choose>
	            		 </div>
		                 </c:forEach>
	            </div>
	            	
	            	
            	<div id="B_room">
						<c:forEach items="${seatList}" var="seat" begin="10" end="19">
						<div class="b-deck">
		          		 <p class="card-text">${seat.seat_no}</p>
		                 <p class="card-text">시작시간 : ${seat.seat_start_time}</p>
		                 <p class="card-text">종료시간 : ${seat.seat_end_time}</p>
						 <c:choose>
						 <c:when test="${seat.seat_status == 1}">
		                 <p class="card_text"><b>사용중</b></p>
		                 </c:when>
		                 <c:when test="${seat.seat_status == 0 }">
		                 <input type="button" class="btn_seat_reservation" value="예약" seat_no="${seat.seat_no }">
		                 </c:when>
		                 </c:choose>
	            		 </div>
		                 </c:forEach>
	            </div>
            
            <div id="C_room">
						<c:forEach items="${seatList}" var="seat" begin="20" end="29">
						<div class="c-deck">
		          		 <p class="card-text">${seat.seat_no}</p>
		                 <p class="card-text">시작시간 : ${seat.seat_start_time}</p>
		                 <p class="card-text">종료시간 : ${seat.seat_end_time}</p>
						 <c:choose>
						 <c:when test="${seat.seat_status == 1}">
		                 <p class="card_text"><b>사용중</b></p>
		                 </c:when>
		                 <c:when test="${seat.seat_status == 0 }">
		                 <input type="button" class="btn_seat_reservation" value="예약" seat_no="${seat.seat_no }">
		                 </c:when>
		                 </c:choose>
	            		 </div>
		                 </c:forEach>
	            </div>
	            
	            
             <div id="D_room">
						<c:forEach items="${seatList}" var="seat" begin="30" end="39">
						<div class="d-deck">
		          		 <p class="card-text">${seat.seat_no}</p>
		                 <p class="card-text">시작시간 : ${seat.seat_start_time}</p>
		                 <p class="card-text">종료시간 : ${seat.seat_end_time}</p>
						 <c:choose>
						 <c:when test="${seat.seat_status == 1}">
		                 <p class="card_text"><b>사용중</b></p>
		                 </c:when>
		                 <c:when test="${seat.seat_status == 0 }">
		                 <input type="button" class="btn_seat_reservation" value="예약" seat_no="${seat.seat_no }">
		                 </c:when>
		                 </c:choose>
	            		 </div>
		                 </c:forEach>
	            </div>
            	
		</div>
		</div>
	<!-- pageContent끝 -->
		<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->


  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

   <script>
      // Get the current year for the copyright
      $('#year').text(new Date().getFullYear());
   
      window.onload=function(){
         //푸터 명언
         const footer_display = document.getElementById('footer-display');
         const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
         const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
         footer_display.textContent =footer_quotes[footer_getQuote];
      }
	</script>
</body>
</html>