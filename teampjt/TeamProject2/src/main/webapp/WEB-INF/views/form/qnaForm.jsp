<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<h1 class="title">Q&A</h1>
<div class="qna_wrap">
	<h2><strong>Q&A</strong> List</h2>
	<c:forEach items="${list}" var="row">
	<ul class="qna_list">	
		<li>
			<div class="q_wrap">
				<span class="q_user">${row.id}</span>
				<span class="q_date">${row.dateTime}</span>
				<p class="q_cont"><pre>${row.contents}</pre></p>
				<input type="hidden" class="reply_cnt" id="reply_cnt" value="${row.reply_cnt}">
				<input type="hidden" name="idx" id="idx" value="${row.idx}">
			</div>
			<div class="a_wrap">
				<div class="reply_frm">
					<textarea name="reply_content" id="reply_content" class="reply_content">${row.reply_content}</textarea>
					<button type="button" id="replybtn" class="replybtn">등록</button>
				</div>
			</div>
			<div class="a_wrap_view">
				<span class="a_date">${row.reply_date}</span>
				<p class="a_cont">
					<pre>${row.reply_content}</pre>
				</p>
				<a class="a_edit">수정</a>
			</div>
		</li>
	</ul>
	</c:forEach>
	<div class="qna_pager">
		${navi}
		<!-- <a href="" class="prev1">이전페이지</a>
		<a href="#">1</a>
		<a href="#">2</a>
		<a href="#">3</a>
		<a href="#">4</a>
		<a href="#">5</a>
		<a href="" class="next1">다음페이지</a> -->
	</div>
	<form class="frm2" name="search_frm" id="search_frm">
		<input type="text" id="keyword" name="keyword" placeholder="Search..">
		<button type="button" id="searchBtn">검색</button>
	</form>
	<div class="qna_write">
		<h2><strong>Q&A</strong>작성하기</h2>
		<form class="qna_form" name="qna_frm" id="qna_frm" method="post">
			<input type="hidden" name="id" id="id" value="admin">
			<textarea name="contents" id="contents"></textarea>
			<button type="button" id="qnainsert">등록</button>  
		</form>
		<p class="qna_notice">답변 등록 시 회원님의 메일주소로 메일이 발송됩니다.</p>
	</div>
</div>

<script type="text/javascript">
	//리스트 누르면 답글다는것.
	$('.q_wrap').on('click', function(){
		if($('#id').val()=="admin"){
		if($(this).children('#reply_cnt').val()==1){$(this).siblings('.a_wrap_view').toggleClass('active');}
		else{$(this).siblings('.a_wrap').toggleClass('active');}//지금 안먹히는데 나중에 0으로 바꾸기 수정 눌렀을때
		
		$('.a_edit').on('click', function(){
			$(this).parents().removeClass("active");
			$(this).parents().siblings('.a_wrap').addClass("active");
			$(this).parents().siblings('.q_wrap').children('#reply_cnt').val(0);
		})
		}else{
			if($(this).children('#reply_cnt').val()==1){$(this).siblings('.a_wrap_view').toggleClass('active');
				$('.a_edit').hide();
			}else{}
		}
	})
	//질문하기
	$('#qnainsert').on('click', function(){
		var re = $('#contents').val().replace(/\n/g, '<br/>');
		$('#contents').attr("value", re);
		$('#qna_frm').attr("action","${home}qna/qnainsert");
		$('#qna_frm').submit();
	}) 
	
	//답글달기
	$('.replybtn').on('click', function(){
		var idx = $(this).parents().siblings('.q_wrap').children('#idx').val(); 
		var reply_content = $(this).siblings('.reply_content').val().replace(/\n/g, "<br/>");
		var reply_cnt = $(this).parents().siblings('.q_wrap').children('.reply_cnt');
		var a_wrap = $(this).parents();
		var a_wrap_view = $(this).parents().siblings('.a_wrap_view');
		var d = new Date();
		var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate() + " " + d.getHours() 
		+ ":" + d.getMinutes() + ":" + d.getSeconds();
		
		if($('.reply_content').val()==""){ alert("내용을 입력해주세요");}
		else{
			$.ajax({
				url:'../qna/awrapProc',
				type:'post',
				data: {idx : idx, reply_content : reply_content},
				success:function(data){
					if($.trim(data) == 0){alert("에러");}
	                else{
	                	a_wrap_view.children('.a_cont').text(reply_content);
	                	a_wrap_view.children('.a_date').text(strDate);
	                	a_wrap.removeClass("active");
	                	reply_cnt.attr("value",1);
	                	a_wrap_view.addClass("active");
	                	
	                }           
				},
				error:function(request, status, error){}
			});
		}	
	})
	//검색
	$('#searchBtn').on('click', function(){
		$('#search_frm').attr("action","${home}qna/qnaForm")
		$('#search_frm').submit();
	}) 	
	
</script>