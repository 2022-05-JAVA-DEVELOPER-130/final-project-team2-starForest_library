<%@page import="com.itwill.domain.RequestBoard" %>
<%@page import="com.itwill.domain.BookCategory" %>
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

<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="static/css/ddoyoon.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/favicon-16x16.png">
<title>도서정보 - 별숲</title>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/star_forest/request_html_content.js"></script>
<script type="text/javascript">
	$(function() {
	
		
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
							<h2>도서신청게시판</h2>
						</div>
					</div>
				</div>
			</div>
		</header>

		<!-- MAIN SECTION -->
		&nbsp;&nbsp;&nbsp;
		<div id="requestBoard_write_wrap" style="width:800px;">
			<table width="800">
			<tbody>
					<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리 -
											방명록 쓰기</b></td>
				    </tr>
			</tbody>
			</table> 
			<!-- request write Form  -->
						<form id="request_write_form" name="f" method="post">
							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tbody>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">작성자</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_name"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">이메일</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_email"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">진행상태</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select>
												<option selected>신청접수</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">제목</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 240" name="guest_title"></td>
									</tr>
									
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">신청도서 카테고리</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select>
											<c:forEach items="${categoryList}" var="category">
												<option>${category.category_name}</option>	
											</c:forEach>
												<option>기타</option>	
											</select>
											</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">내용</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
				
											<textarea wrap="soft"
												style="width: 500px" rows="10" name="request_content">
******************************				
신청 양식
******************************
책 제목 :
저자    :
사유    :
												</textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form> <br>
						<input type="button" value="확인" id="btn_guest_write_action"> &nbsp; 
						<input type="button" id="btn_guest_list" value="목록">
								
		
		</div>
	</div>
			<!-- pageContent끝 -->
		<!-- .footer-navigation -->
	<!-- footer start-->
	&nbsp;
	&nbsp;
	&nbsp;
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