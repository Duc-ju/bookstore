<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Font Icon -->
	<link rel="stylesheet" href="assets/project/login/assets/fonts/material-icon/css/material-design-iconic-font.min.css">

	<!-- Main css -->
	<link rel="stylesheet" href="assets/project/login/assets/css/style.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<title>Đăng nhập</title>
</head>

<body>
	<div class="main">
		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure><img src="assets/project/login/assets/images/signin-image.jpg" alt="sing up image">
						</figure>

					</div>

					<div class="signin-form">
						<h2 class="form-title">Đăng nhập</h2>

						<c:if test = "${errorLogin==1}">
         					<div style="color: red; font-weight: 600; margin-bottom: 15px; padding: 10px 4px; background-color: rgba(255,0,0,0.3)">Tên tài khoản mặc mật khẩu không chính xác!</div>
      					</c:if>  

						<form method="POST" class="register-form" id="login-form"
							action="${pageContext.request.contextPath}/login">
							<div class="form-group">
								<label for="your_name"><i
										class="zmdi zmdi-account material-icons-name"></i></label>
								<input type="text" name="username" id="your_name"
									required placeholder="Tên tài khoản" />
							</div>
							<div class="form-group">
								<label for="your_pass"><i
										class="zmdi zmdi-lock"></i></label>
								<input type="password" name="password" id="your_pass"
									required placeholder="Mật khẩu" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="rememberme"
									id="remember-me" checked class="agree-term" />
								<label for="remember-me"
									class="label-agree-term"><span><span></span></span>Ghi nhớ đăng nhập</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Đăng nhập" />
							</div>
						</form>
					</div>
				</div>
				<a href="Register.jsp" class="signup-link">Tạo tài khoản</a>
			</div>
		</section>
	</div>
	<script src="assets/project/login/assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/project/login/assets/js/main.js"></script>
</body>

</html>