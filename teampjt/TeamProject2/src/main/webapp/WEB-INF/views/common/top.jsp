<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>생활정보</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="${home}resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${home}resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${home}resources/css/mypage.css?ver=1.1">
	<link rel="stylesheet" type="text/css" href="${home}resources/css/qna.css?ver=1.1">
	<link rel="stylesheet" type="text/css" href="${home}resources/css/write.css">
 	<link rel="stylesheet" type="text/css" href="${home}resources/css/board.css" >
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="http://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
</head>
<body>
	<div class="main_container">
		<header>
			<div class="main_head">
				<a href="${home}home">이미지</a>
				<h1>생활정보</h1>
			</div>
			<div class="log">
				<a href="${home}Login">로그인</a>
				<a href="${home}join">회원가입</a>
			</div>
			<nav>
				<ul id="nav">
					<li><a href="${home}home">HOME</a></li>
					<li><a href="#">NOTICE</a></li>
					<li><a href="${home}boardForm">BOARD</a>
						<ul>
							<li><a href="${home}boardForm">영화</a></li>
							<li><a href="board2">패션</a></li>
							<li><a href="board3">취업</a></li>
							<li><a href="board4">여행</a></li>
						</ul>
					</li>
					<li><a href="${home}mypage/mypageForm">MYPAGE</a></li>
					<li><a href="${home}qna/qnaForm">Q&A</a></li>
				</ul>	
			</nav>
		</header>