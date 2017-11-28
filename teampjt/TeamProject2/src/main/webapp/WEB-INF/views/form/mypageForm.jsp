<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<div class="wrap">
	<div class="my_aside">
		<a href="#section2">나의게시글</a>
	</div>
	<div class="mem_edit" id="section1">
		<h2>회원정보수정</h2>
		<table class="tb1">
			<tr>
				<th><label>아이디</label></th>
				<td><span id="edit_id">aaaadddd</span></td>
			</tr>
			<tr>
				<th><label>이메일</label></th>
				<td><span>${email}</span><button type="button" class="emailbtn">이메일변경</button>
					<div class="e_wrap"><input type="text" name="edit_email" id="edit_email"/>@<select id="emdit_email2"><option>naver.com</option>
					<option>daum.net</option><option>nate.com</option><option>gmail.com</option></select></div></td>
			</tr>
			<tr>
				<th><label>현재비밀번호</label></th>
				<td><input type="password" name="edit_pw" id="edit_pw"><span class="mungu">* 비밀번호를 입력해주세요</span></td>
			</tr>
			<tr>
				<th><label>신규비밀번호</label></th>
				<td><input type="password" name="nwpw" id="nwpw"></td>
			</tr>
			<tr>
				<th><label>비밀번호 확인</label></th>
				<td><input type="password" name="pwok" id="pwok"></td>
			</tr>
		</table> 
		<div class="btn">
			<button type="button" id="editBtn">수 정</button><button type="button" id="cancle">취 소</button>
		</div>
	</div>
	<div class="myboard" id="section2">
		<h2>나의게시글</h2>
		<table class="tb1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody class="sec2_tbody">
				<tr>
					<td>번호</td>
					<td><a href="#">제목</a></td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
	$('.emailbtn').click(function(){
		$('.e_wrap').toggleClass('active');
		$('#edit_email').val("");
	});
	
	//password chk
	$("#edit_pw").keyup(function(){
		var edit_pw = $(this).val();
		var edit_id = $('#edit_id').text();
		$.ajax({
			url:'./mypage/editpw',
			type:'post',
			data: {edit_pw : edit_pw, edit_id : edit_id},
			success:function(data){
				if($('#edit_pw').val()==""){$('.mungu').text("*비밀번호를 입력해주세요");}
				else{
					if($.trim(data) == 0){$('.mungu').text("*현재 비밀번호가 틀립니다!!");}
	                else{
	                	$('.mungu').text("*비밀번호가 일치합니다.");
	                	$('#nwpw').focus();
		                $('#pwok').keyup(function(){
		                	if($('#pwok').val() == ""|| $('#nwpw').val() == ""){$('.mungu').text("*신규 비밀번호를 입력해주세요");}		           
		                	else if($('#pwok').val() == $('#nwpw').val()){$('.mungu').text("*패스워드 확인 완료!");}
		            		else{$('.mungu').text("*비밀번호가 일치하지 않습니다.")}
	            		})
	            		$('#nwpw').keyup(function(){
	            			if($('#nwpw').val()== $('#pwok').val()){$('.mungu').text("*패스워드 확인 완료!");}
	            			else{$('.mungu').text("*비밀번호가 일치하지 않습니다.");}
	            		})
	                } 
				}
				
			},
			error:function(request, status, error){}
		});
	})	
	
	//Btn
	$('#cancle').click(function(){
		$('input').val("");
	})
	
	$('#editBtn').click(function(){
		var nwpw = $('#nwpw').val();
		var edit_id = $('#edit_id').text();
		var edit_email =$('#edit_email').val();
		var edit_email2 = '@'+$('#edit_email2, option:selected').val();
		if($('.mungu').text()=="*패스워드 확인 완료!"){
			$.ajax({
				url:'./mypage/editProc',
				type:'post',
				data: {edit_email : edit_email, edit_email2 : edit_email2, edit_id : edit_id, nwpw : nwpw},
				success:function(data){
					$('input').val("");
					alert(data);
				}
			});
		}
		else if($('#edit_pw').val()==""||$('#nwpw').val()==""||$('#pwok').val()==""){alert("빈칸을 입력해주세요.");}
		else if($('#nwpw').val()!=$('#pwok').val()){alert("비밀번호를 확인해주세요");}
		else{alert("현재 비밀번호가 틀립니다!!");}
	})
	
</script>