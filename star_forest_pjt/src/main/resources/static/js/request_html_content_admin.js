
function request_item_content(requestBoard){
	return `<tr id="table2">
		<td width=5% align=center class=t1><font size=2 color=#000000>${requestBoard.board_no}</td>
		<td width="300" bgcolor="ffffff" style="padding-left: 10">
				<a href="#" class="request_item_a" board_no="${requestBoard.board_no}" ${(requestBoard.board_status=='공지사항')?'style="color:red; font-weight=bold;"':'style="color:black;"'}>
				
				${
								function(){
									var html='';
									
									if(requestBoard.board_status=='공지사항'){
										html=`<img src="img/img_cart.png" width=40px;>`;
									}
									
									for(var i=0; i<requestBoard.board_depth;i++){
										html+=`&nbsp;&nbsp;&nbsp`;
									}
									if(requestBoard.board_depth>0){
									html+=`<img src="img/re.gif">`;
									}
									return html;
									 }()
	              }
	               ${requestBoard.board_title}
	               </a>
		<td width=15% align=center class=t1><font size=2 color=#000000>${requestBoard.user_id}</font></td>
		<td width=10% align=center class=t1><font size=2 color=#000000>${requestBoard.board_status}</font></td>
		<td width=10% align=center class=t1><font size=2 color=#000000>${requestBoard.board_date.substring(0,10)}</font></td>
		<td width=5% align=center class=t1><font size=2 color=#000000>${requestBoard.board_readcount}</font></td>
		</tr>`;
}

function request_list_content(requestArray,pageArray) {
	return `<table>
	
		<thead>
		<tr id="table1" align=center style="background-color:pink;">
		<td width=5% align=center class=t1><font size=2 color=#000000>번호</td>
		<td width=30% align=center class=t1><font size=2 color=#000000>제목</td>
		<td width=15% align=center class=t1><font size=2 color=#000000>작성자</td>
		<td width=10% align=center class=t1><font size=2 color=#000000>진행상태</td>
		<td width=10% align=center class=t1><font size=2 color=#000000>날짜</td>
		<td width=5% align=center class=t1><font size=2 color=#000000>조회수</td>
		</tr>
		</thead>
		
		<tbody>
			<!--requestBoard start-->
				${
					requestArray.map(request_item_content).join('')
				}
			<!--requestBoard end-->
		</tbody>
		
		</table>
		<div>
		<input type="button" id="btn_write_notice" value="공지사항쓰기" onClick="location.href='requestBoard_write_form_admin'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
		
		<div class="search_wrap">
	        <div class="search_area">
	            <input type="text" name="keyword" value="${pageArray.cri.keyword}" style="margin-left:60px;">
	            <button>Search</button>
	        </div>
  	  	</div>    
  	  	
  	  	
		<div class="page_area">
		<form id="page_form" method="get">
		<input type="hidden" name="pageNum" value="${pageArray.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageArray.cri.amount }">    
        <input type="hidden" name="keyword" value="${pageArray.cri.keyword }">	
					<ul id="page">
				 		
				 		
				 		<!-- 이전페이지 버튼 -->
				 		${
							function(){
								var prev = pageArray.prev;
								var html='';
								if(prev){
									html=`<li class="pageInfo_btn previous"><a href="requestBoard?pageNum=${pageArray.startPage-1}">Previous</a></li>`
								}
								return html;
							}()
						}
                    	${
							function(){
								var html='';	
							 	for(var i=pageArray.startPage;i <= pageArray.endPage;i++){
							 		html+=`<li class="page_btn ${pageArray.cri.pageNum == i ? 'active':'' }"><a href="requestBoard?pageNum=${i}">${i}</a></li>`;
								}							
								return html;
							}()
	                    }
	                    
	                     <!-- 다음페이지 버튼 -->${
							function(){
								var next = pageArray.next;
								var html='';
								if(next){
									html=`<li class="pageInfo_btn next"><a href="requestBoard?pageNum=${pageArray.endPage + 1 }">Next</a></li>`
								}
								return html;
							}()
						}
	                    
	                    
               		</ul>
               		</form>
		</div>
			
			
			
		`;
}


/*
function request_write_form_content() {
	return `<table width="0" border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td>
						<!--contents--> <br>
						<table style="padding-left: 10px" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리 -
											방명록 쓰기</b></td>
								</tr>
							</tbody>
						</table> <!-- guest write Form  -->
						<form id="guest_write_form" name="f" method="post">
							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tbody>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">이름</td>
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
										<td width="100" align="center" bgcolor="E6ECDE" height="22">홈페이지</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_homepage"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">타이틀</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 240" name="guest_title"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">내용</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><textarea wrap="soft"
												style="width: 240px" rows="10" name="guest_content"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form> <br>
						<table width="590" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="center"><input type="button" value="방명록쓰기" id="btn_guest_write_action"> &nbsp; 
									<input type="button" id="btn_guest_list" value="방명록목록"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>`;
}
*/
function request_view_admin(requestBoard){
	return `
	<form name="f" method="post">
								<input type="hidden" name="board_groupno" value="${requestBoard.board_groupno}">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tbody><tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">번호</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_no}</td>
									</tr>
									<tr>
										<td width="200" align="center" bgcolor="E6ECDE" height="22">작성자</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.user_id}</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">날짜</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_date.substring(0,10)}</td>
									</tr><tr>
										<td width="150" align="center" bgcolor="E6ECDE" height="22">조회수</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_readcount}</td>
									</tr>
									<tr>
										<td width="150" align="center" bgcolor="E6ECDE" height="22">진행상태</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_status}</td>
									</tr>
									<tr>
										<td width="150" align="center" bgcolor="E6ECDE" height="22">카테고리</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.category_name}</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="110">제목</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_title}</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="110">내용</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px" id="td_content"><pre style="font-size:12pt;">${requestBoard.board_content}</pre></td>
									</tr>
								</tbody></table>
							</form>
							<div class="btn_mrl">
										<input type="button" value="답글쓰기" id="btn_request_reply_form" board_no="${requestBoard.board_no}"> &nbsp; 
										<input type="button" value="수정" id="btn_request_modify_admin_form" board_no="${requestBoard.board_no}"> &nbsp; 
										<input type="button" value="삭제" id="btn_request_remove_admin_action" board_no="${requestBoard.board_no}"> &nbsp; 
										<input type="button" value="목록" id="btn_request_list">
							</div>
	
	`
}

function request_reply_form(requestBoard){
	return `
	<table width="800">
			<tbody>
					<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리 -
											답글 쓰기</b></td>
				    </tr>
			</tbody>
			</table> 
			<!-- request reply Form  -->
						<form id="request_reply_form" name="f" method="post">
						
						<input type="hidden" name="board_no" value="${requestBoard.board_no}">
						<input type="hidden" name="category_name" value="${requestBoard.category_name}">
						
						

							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tbody>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">작성자</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px" name="user_id">admin</td>
									</tr>
								
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">진행상태</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select name="board_status">
												<option value="신청검토중">신청검토중</option>
												<option value="신청완료">신청완료</option>
												<option value="신청반려">신청반려</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width="150" align="center" bgcolor="E6ECDE" height="22">카테고리</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px" name="category_name">${requestBoard.category_name}</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">제목</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 350px" name="board_title" value="re)&nbsp;&nbsp;${requestBoard.board_title}"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">내용</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<textarea wrap="soft"
												style="width: 500px" rows="10" name="board_content">
												${requestBoard.board_content}
												</textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form> <br>
						<input type="button" value="확인" id="btn_request_reply_action"> &nbsp; 
						<input type="button" id="btn_request_list" value="목록">
	
	`
}

function request_modify_form_admin(requestBoard){
	return `
	<table width="800">
			<tbody>
					<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리 -
											방명록 수정</b></td>
				    </tr>
			</tbody>
			</table> 
			<!-- request modify Form  -->
						<form id="request_modify_form_admin" name="f" method="post">
							<input type="hidden" name="board_no" value="${requestBoard.board_no}">
							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tbody>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">작성자</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">${requestBoard.user_id}</td>
									</tr>
								
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">진행상태</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select name="board_status">
												<option value="신청접수" ${(requestBoard.board_status=='신청접수')?'selected':''}>신청접수</option>
												<option value="신청검토중" ${(requestBoard.board_status=='신청검토중')?'selected':''}>신청검토중</option>
												<option value="신청완료" ${(requestBoard.board_status=='신청완료')?'selected':''}>신청완료</option>
												<option value="신청반려" ${(requestBoard.board_status=='신청반려')?'selected':''}>신청반려</option>
												
											</select>
										</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">제목</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 350px" name="board_title" value="${requestBoard.board_title}"></td>
									</tr>
									
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">신청도서 카테고리</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select name="category_name">
											<option value="건강/취미/레저" ${(requestBoard.category_name=='건강/취미/레저')?'selected':''}>건강/취미/레저</option>
											<option value="경제경영" ${(requestBoard.category_name=='경제경영')?'selected':''}>경제경영</option>
											<option value="고전" ${(requestBoard.category_name=='고전')?'selected':''}>고전</option>
											<option value="과학" ${(requestBoard.category_name=='과학')?'selected':''}>과학</option>
											<option value="만화" ${(requestBoard.category_name=='만화')?'selected':''}>만화</option>
											<option value="사회과학" ${(requestBoard.category_name=='사회과학')?'selected':''}>사회과학</option>
											<option value="소설/시/희곡" ${(requestBoard.category_name=='소설/시/희곡')?'selected':''}>소설/시/희곡</option>
											<option value="기타" ${(requestBoard.category_name=='기타')?'selected':''}>기타</option>	
											</select>
											</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">내용</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
				
											<textarea wrap="soft"
												style="width: 500px" rows="10" name="board_content">
${requestBoard.board_content}
												</textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form> <br>
						<input type="button" value="확인" id="btn_request_modify_admin_action"> &nbsp; 
						<input type="button" id="btn_request_list" value="목록">
	
	`
}