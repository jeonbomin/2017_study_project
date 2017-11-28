<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="${home}resources/css/lo_mem_Back.css">
	<link rel="stylesheet" href="${home}resources/css/lo_mem_style.css">
</head>
<body>
	<div id="lo_main_div">
		<header id="login_header">
			<h1>Welcome</h1>
			<h2>Need Your Information</h2>
		</header>
		<section id="login_section">
			<article id="login_article">
				<form action="../Main/main.jsp" method="post">
					<input type="text" name="login_id" placeholder="Username" required="required" class="lo_input_info" autofocus="autofocus" maxlength="10">
					<input type="password" name="login_pw" placeholder="Password" required="required" class="lo_input_info" maxlength="10">
					<input type="submit" value="Go Into" class="login_btn">
				</form>
				<div id="p_div">
					<p>Don't have an account?</p><a href="${home}join">Sign up</a>
					<p>If you're not our member?</p><a href="${home}">Guest</a>
				</div>
			</article>
		</section>
	</div>
</body>
</html>
