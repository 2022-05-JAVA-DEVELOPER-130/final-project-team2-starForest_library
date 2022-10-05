<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="css/style.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<title>나의도서 - 별숲도서관</title>
<style>
.img-fluid {
	height: 250px;
	width: 244px;

}
.table td{
	border:1px solid ffffff;
}
.container table tr td {
    text-align: left;
    vertical-align: middle;
    word-break: keep-all;
    padding-right: 3em;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="js/MyLibraryHtmlContents.js"></script>
<script type="text/javascript">
	
	
</script>

</head>

<body>
	<!-- navigation start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- navigation end-->

	<!-- PAGE HEADER -->
	<header id="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-6 m-auto text-center">
					<h1>나의도서</h1>
				</div>
			</div>
		</div>
	</header>

	<!-- MAIN SECTION -->
	<!-- 사이드바 -->
	<section id="contact" class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-3 noto-serif">
					<div class="sidebar">
						<div class="side-head">
							<h4 class="text-light">나의도서</h4>
						</div>
						<ul class="list-group list-group-flush mb-5">
							<li class="list-group-item">
								<a href="#" id="mypage">마이페이지</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_rental_list">나의도서정보</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_rental_status">대출현황</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_res_status">예약현황</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_club_list">동아리신청내역</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_request_list">희망도서신청내역</a>
							</li>
							<li class="list-group-item active">
								<a href="#" id="user_favorite">내서재</a>
							</li>
							<li class="list-group-item">
								<a href=# " id="user_qr">나의QR</a>
							</li>
						</ul>

					</div>
				</div>

				<!-- 메인내용 -->
				<div class="col-md-9" id="content">

					<div class="col-6">
					<div class="row"><br></div>
						<div class="row">
						<br> 
						<select multiple="multiple" style="width: 170px;margin-bottom: 50px;border:2px solid #dee2e6">
							<option value="s">ssssss
							<option value="s">ssssss
							<option value="s">ssssss
							<option value="s">ssssss
							<option value="s">ssssss
							<option value="s">ssssss
						</select>
						
						<!-- 나의도서정보(대여리스트) -->
						

							<div class="rentalTable">
								<table class="table" style="width: 855px">
									<thead style="border: 1px solid #dee2e6">
										<tr>
											<th colspan="1" align="right">책마중</th>
											<th colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
											<th colspan="1">조회 89</th>
										</tr>
									</thead>
									<tbody>
										<tr id="rental_item_"
											style="border: 1px solid #dee2e6; height: 250px;">

											<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">자바dfd:fdfdfd:sadas<br>dsada<br>sdsadas
											</td>
											<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px">한예지 sda:<br>sdasdasd<br>as<br>da&nbp;
											</td>
											<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px"><button>자세히</button>
												<br>
											<button>자세히</button></td>


										</tr>
										<tr id="rental_item_"></tr>
									</tbody>



								</table>
							</div>
							<!---->
						</div>

					</div>








				</div>
		</div>


	</section>
	<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->



	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"
		src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

</body>

</html>