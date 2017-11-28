<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
	
<div class="jb-container">
	<table class="board_tb">
      <thead>
	    <tr>
	      <th scope="col">글번호</th>
	      <th scope="col">아이디</th>
	      <th scope="col">제목</th>
	      <th scope="col">조회수</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <td scope="row">1</td>
	      <td>ㅋㅋ</td>
	      <td>Otto</td>
	      <td>1</td>
	    </tr>
	    <tr>
	      <td scope="row">2</td>
	      <td>Jacob</td>
	      <td>Thornton</td>
	      <td>2</td>
	    </tr>
	    <tr>
	      <td scope="row">3</td>
	      <td>Larry</td>
	      <td>the Bird</td>
	      <td>15</td>
	    </tr>
	  </tbody>
	</table>
	<div class="paging">
		<a href ="#" class="on">1</a> <!-- D : 활성화페이지일 경우 : on 처리 --> 
		<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
	</div>
	<div class="box">
		<div class="container-1">
			<span class="icon"><i class="fa fa-search"></i></span> <input
				type="search" id="search" placeholder="Search..." />
		</div>
	</div>
	<!-- 글쓰기 폼 -->
	<div class="write">
		<button class="writeformbtn">글쓰기</button>

		<div class="wr_wrap">
			<h2>글쓰기</h2>
			<ul class="write_top">
				<li>
					<h3>제목</h3>
					<input type="text" name="title">
				</li>
				<li><span>첨부</span> <input class="upload-name" value="파일선택"
					type="text" disabled="disabled"> <label class="label_f"
					for="file_f">업로드</label> <input type="file" class="file_f"
					id="file_f" /></li>
			</ul>
			<div class="write_middle">
				<textarea id="editor1" name="editor1"></textarea>
				<script>
		                CKEDITOR.replace('editor1');
		            </script>
			</div>
			<div class="writebtn">
				<button type="button">작성하기</button>
			</div>
		</div>
	</div>
</div>
<script>
	/*file tag input[text] carry*/
    $(document).ready(function(){
    var fileTarget = $('.file_f');
    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        $('.upload-name').attr('value',filename);
        });
    }); 

    $(document).ready(function(){
		$('.writeformbtn').click(function(){
			$('.write').toggleClass('active');
		})
		$('.writeformbtn').click(function(){
			$('.wr_wrap').toggleClass('active');
		})
	})
</script>
