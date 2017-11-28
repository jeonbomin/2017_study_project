<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<!DOCTYPE html>
<html>
<head>
<title>Membership</title>
<link rel="stylesheet" href="${home}resources/css/lo_mem_Back.css">
<link rel="stylesheet" href="${home}resources/css/lo_mem_style.css">
</head>
<body>
	<div id="mem_main_div">
		<header id="mem_header">
			<h1>Create Account</h1>
			<h3>Enter Your Information</h3>
		</header>
		<section id="mem_section">
			<article id="mem_article">
				<form action="../Login/Login.html" method="post">
					<input type="text" name="mem_id" required="required" placeholder="Username" class="mem_input_info" maxlength="10">
					<input type="password" name="mem_pw" required="required" placeholder="Password" class="mem_input_info" maxlength="10">
					<input type="password" name="mem_pwChk" required="required" placeholder="Confirm Password" class="mem_input_info" maxlength="10">
					<input type="email" name="mem_email" required="required" placeholder="Email" class="mem_input_info">
					<input type="submit" value="Create Account" class="create_btn">
					<input type="reset" value="reset" class="reset_btn">
				</form>
			</article>
		</section>		
	</div>
</body>
</html>