<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <style>
        #title{
            height : 12;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
    </style>
  </head>
  <body>
   <div id="container" align="center">
    <div class="box-header">게시글</div>
    <div class="col-md-12">
      <div class="col-md-8 box-body" align="left">
        <form align="left">
            제목 :</br>
            조회수 : <br/>
            작성시간 :<br/><br/>
        </form>
      </div>
      <div class="col-md-8 box-body">
        <div class="form-group">
          <label>내용</label>
          <textarea name="content" rows="5" readonly="readonly"
            class="form-control"></textarea>
        </div>
        <div class="col-md-4 box-body">
          <div class="form-group">
            <label>첨부파일</label> <label class="form-control"><a
              href=""></a></label>
          </div>
        </div>
      </div>
      <div class="col-md-2 box-body"></div>
    </div>
    <div class="box-footer">
        <input class="btn btn-primary" type="button" value="수정"
          onclick="">
        <input class="btn btn-danger" type="button" value="삭제"
          onclick="">
      <input class="btn btn-primary" type="button" value="목록"
        onclick="">
    </div>
  </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  </body>
</html>