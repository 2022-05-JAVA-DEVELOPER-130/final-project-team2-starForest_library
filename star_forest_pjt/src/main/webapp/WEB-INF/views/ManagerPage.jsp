<%@page import="com.itwill.domain.Rental"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>별숲도서관</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="stylesheet" href="css/style.css">

<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>

<!-- 외부 CSS, JS 파일 링크 -->
<link rel="stylesheet" href="css/HomeCSS.css">
<script type="text/javascript" src="/js/HomeJS.js"></script>


<style type="text/css">
	#tabs {
		text-align: center;
	}

	#manage-area {
		margin: 0 auto;
		padding: 0;
	}
	
	.manage-table {
		margin: 0 auto;
		font-size: medium;
		text-align: center;
	}
	
	.table-wrapper {
		height: 800px;
		overflow: scroll;
	}
	
	th {
		border-bottom: 3px black solid;
	}
	
	tr {
		border-bottom: 1px black solid;
	}
	
	.radios {
		display: none;
	}
	
	label {
		cursor: pointer;
	}	
</style>

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
	
  	<!-- MANAGERPAGE CONTENTS -->
	<div id="tabs" style="font-weight: bold;" class="py-3">
		<label for="cust">회원관리</label>&nbsp;&nbsp;&nbsp;
		<label for="book">도서관리</label>&nbsp;&nbsp;&nbsp;
		<label for="post">게시글관리</label>&nbsp;&nbsp;&nbsp;
		<label for="borrow">대여정보관리</label>&nbsp;&nbsp;&nbsp;
	
		<input type="radio" name="tab" class="radios" id="cust" checked="checked">
		<input type="radio" name="tab" class="radios" id="book">
		<input type="radio" name="tab" class="radios" id="post">
		<input type="radio" name="tab" class="radios" id="borrow">
	</div>

	<div class="manage-area text-center">
		회원번호 : <input type="text" class="update-input" name="cust_no">
		회원명 : <input type="text" class="update-input" name="name">
		관리자구분 : <input type="text" class="update-input" name="manager">
		<button class="update-ok">수정확인</button>
		<button class="delete-ok">삭제확인</button>
		<div class="table-wrapper">
			<table class="manage-table">
				<tr>
					<th>회원번호</th>
					<th>회원명</th>
					<th>관리자구분</th>
					<th>작업</th>
				</tr>
				<c:forEach items="${clist}" var="c">
					<tr>
						<td>${c.cust_no }</td>
						<td>${c.name }</td>
						<td>${c.manager }</td>
						<td>
							<button type="button" class="update-btn">수정</button>
							<button type="button" class="delete-btn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
		
	<div class="manage-area text-center">
		도서번호 : <input type="text" value="22" class="update-input" name="b_no" readonly="readonly">
		도서명 : <input type="text" value="22" class="update-input" name="b_title" readonly="readonly">
		재고 : <input type="text" value="22" class="update-input" name="b_count">
		카테고리 번호 : <input type="text" value="22" class="update-input" name="c_no">
		<button class="update-ok">수정확인</button>
		<button class="delete-ok">삭제확인</button>
		<div class="table-wrapper">
			<table class="manage-table">
				<tr>
					<th>도서번호</th>
					<th>도서명</th>
					<th>재고</th>
					<th>카테고리 번호</th>
					<th>작업</th>
				</tr>
				<c:forEach items="${blist}" var="b">
					<tr>
						<td>${b.b_no }</td>
						<td class="text-left">${b.b_title }</td>
						<td>${b.b_count }</td>
						<td>${b.c_no }</td>
						<td>
							<button type="button" class="update-btn">수정</button>
							<button type="button" class="delete-btn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
		
	<div class="manage-area text-center">
		게시글ID : <input type="text" value="33" class="update-input" name="p_id">
		게시글번호 : <input type="text" value="33" class="update-input" name="p_no">
		회원번호 : <input type="text" value="33" class="update-input" name="cust_no">
		<button class="update-ok">수정확인</button>
		<button class="delete-ok">삭제확인</button>
		<div class="table-wrapper">
			<table class="manage-table">
				<tr>
					<th>게시글ID</th>
					<th>게시글번호</th>
					<th>회원번호</th>
					<th>작업</th>
				</tr>
				<c:forEach items="${plist}" var="p">
					<tr>
						<td>${p.p_id }</td>
						<td>${p.p_no }</td>
						<td>${p.cust_no }</td>
						<td>
							<button type="button" class="update-btn">수정</button>
							<button type="button" class="delete-btn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
		
	<div class="manage-area text-center">
		대여번호 : <input type="text" class="update-input" name="bor_no">
		대여일 : <input type="date" class="update-input" name="bor_date">
		반납일 : <input type="date" class="update-input" name="return_date">
		반납여부 : <select style="width: 100px;" class="update-input" name="return_ok">
					<option value="Y">Y</option>
					<option value="N">N</option>
					<option value="P">P</option>
				</select>
		대여회원번호 : <input type="text" class="update-input" name="cust_no">
		회원명 : <input type="text" class="update-input" name="name" readonly="readonly">
		책번호 : <input type="text" class="update-input" name="b_no">
		<br><br>
		<button class="update-ok">수정확인</button>
		<button class="delete-ok">삭제확인</button>
		<br><br>
		<div class="table-wrapper">
			<table class="manage-table">
				<tr>
					<th>대여번호</th>
					<th>대여일</th>
					<th>반납일</th>
					<th>반납여부</th>
					<th>대여회원번호</th>
					<th>회원명</th>
					<th>책번호</th>
					<th>작업</th>
					<th>상태</th>
				</tr>
				<c:forEach items="${bo_list}" var="bo">
					<tr>
						<td>${bo.bor_no }</td>
						<td>${bo.bor_date }</td>
						<td>${bo.return_date }</td>
						<td>${bo.return_ok }</td>
						<td>${bo.cust_no }</td>
						<td>${bo.name }</td>
						<td>${bo.b_no }</td>
						<td>
							<button type="button" class="update-btn">수정</button>
							<button type="button" class="delete-btn">삭제</button>
						</td>
						<c:if test="${bo.return_ok=='Y' }">
							<td class="text-success" style="font-weight: bold;">반납 완료</td>
						</c:if>
						<c:if test="${bo.return_ok=='N' }">
							<td class="text-warning" style="font-weight: bold;">대여 중</td>
						</c:if>
						<c:if test="${bo.return_ok eq 'P' }">
							<td class="text-danger" style="font-weight: bold;">반납 대기</td>
						</c:if>
						<c:if test="${bo.return_ok != 'P' && bo.return_ok != 'Y' && bo.return_ok != 'N' }">
							<td class="text-danger" style="font-weight: bold;">&nbsp;</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>