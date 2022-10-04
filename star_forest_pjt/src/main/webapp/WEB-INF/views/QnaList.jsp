<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
   <!-- 구글폰트 전체 기본적용 -->
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
   <!-- 구글폰트 전체 기본적용 END -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/post.css">
   <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
     <!-- 미로그인시 글쓰기 버튼 누르면 로그인페이지로 이동 -->
     $(function(){
        $(".mypage").click(function(event){
           if(${cust_no == null}){
              event.preventDefault();
              const loginOk = confirm("로그인 후 사용 가능합니다. 로그인하시겠습니까?");
              console.log(loginOk);
              if(loginOk){
                 console.log("로그인하러갑니다.");
                 window.location.href = "LoginPage.do";
              }
           }else{
              window.location.href="Home.do";
           }
        });
     });
     </script>
  <title>커뮤니티 - 딜리브러리</title>
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
  
   <!-- 도서관소개 PAGE HEADER -->
   <header id="page-header" class="noto-serif">
      <div class="page-header-overlay">
         <div class="container pt-5">
           <div class="row">
            <div class="col-md-6 m-auto text-center">
              <h2>묻고답하기</h2>
            </div>
           </div>
         </div>
      </div>
   </header>
   
   <!-- MAIN SECTION -->
   <section id="contact" class="py-3">
      <!-- 사이드바 -->
      <div class="container">
        <div class="row">
         <div class="col-md-3 noto-serif">
           <div class="sidebar">
               <div class="side-head">
                  <h4 class="text-light">도서관소개</h4>
               </div>
               <ul class="list-group list-group-flush mb-5">
                        <li class="list-group-item"><a href="howtoInfo.do">대출/반납/연장</a></li>
                        <li id="post10" class="list-group-item"><a href="postList.do?option=p_title&search=&group=10">공지사항</a></li>
                        <li class="list-group-item"><a href="faqViewpage.do">자주묻는질문</a></li>
                        <li class="list-group-item active"><a href="QnaList.do?option=p_title&search=">묻고답하기</a></li>
                        <li class="list-group-item"><a href="addrViewpageAPI.do">오시는길</a></li>
                     </ul>
           </div>
         </div>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->   
         <!-- 메인내용 -->
         <div class="col-md-9">
            <div class="row py-4">
            <div class="col noto-serif">
              <button class="btn btn-outline-success" onclick="QnaInsert()" href="QnaInsert.do?cust_no=${cust_no}">글쓰기</button>
              <!-- 비로그인시 글쓰기누르면 로그인페이지로 이동하기위함.cust_no를 0으로 설정 -->
              <c:if test="${empty cust_no }">
                 <c:set var="cust_no" value="0"></c:set>
              </c:if>
         </div>
               <div class="text-right mb-2">
                  <form action="QnaList.do" method="get" class="form-inline search">
                  <div>
                     <p class="mr-2 mb-0 noto-serif">총 ${totalCount}건</p>
                  </div>
                  <div class="form-group noto-sans">
                     <select name="option" size="1" class="form-control">
                        <option value="p_title">제목</option>
                        <option value="p_writer">작성자</option>
                        <option value="p_content">내용</option>
                     </select>
                     <input type="search" name="search" class="form-control"> <!-- 검색단어input태그 -->
                  </div>
                          <div class="form-group px-2">
                                <button class="btn btn-outline-secondary"><i class="fas fa-search"></i></button><!-- 검색버튼 -->
                         </div>
                      </form>
               </div>
            </div>
               <table class="table table-hover">
                  <thead class="bg-light text-center noto-serif">
                      <tr>
                          <th>&nbsp;</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>작성일</th>
                          <th>조회</th>
                      </tr>
                  </thead>
                  <tbody class="tbody text-center">
                  <c:if test="${totalCount==0 }">
                     <td colspan="5" style="text-align: center;">검색 결과가 없습니다.</td>
                     </c:if>
               <c:forEach var="p" items="${list }">
                  <tr>
                     <td scope="row" width="5%">${p.p_no%10000 }</td>
                     <td class="text-left" width="40%">
                        <a href="QnaDetail.do?p_id=${p.p_id}">${p.p_title }</a>
                     </td>
                     <td>${p.p_writer }</td>
                     <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${p.p_regdate }" /></td>
                     <td width="10%">${p.p_hit }</td>
                  </tr>
               </c:forEach>
                   </tbody>
              </table>
            
                 <!-- 페이징처리 -->
                 <div class="container mt-5">
              <ul class="pagination justify-content-center">
              <c:if test="${startPage > 1}">
                <li class="page-item"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${startPage-1 }">&laquo;</a></li>
              </c:if>
              <c:if test="${startPage == 1}">
                <li class="page-item disabled"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${startPage-1 }">&laquo;</a></li>
              </c:if>
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                 <li class="page-item" id="page${i }"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${i }">${i }</a></li>
                 </c:forEach>
              <c:if test="${endPage < totalPage}">              
                 <li class="page-item"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${endPage+1 }">&raquo;</a></li>
              </c:if>
              <c:if test="${endPage == totalPage}">
                  <li class="page-item disabled"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${endPage+1 }">&raquo;</a></li>
              </c:if>
              </ul>
            </div>
         </div>
        </div>
      </div>
   </section>
</div>
<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
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
   <!-- 비로그인시 글쓰기 버튼 누르면 로그인페이지로 이동 -->
   function QnaInsert(){
         if(${cust_no}==0){
            alert("로그인 후 사용하세요.")
            window.location="LoginPage.do";
         }else{
            window.location="QnaInsert.do?cust_no="+${cust_no};
         }
   }

   if(${pageNUM}){
        document.getElementById(`page${pageNUM}`).classList.add('active');
   } 
  </script>
</body>

</html>
<!-- 확인 -->