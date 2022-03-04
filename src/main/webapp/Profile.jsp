<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin cá nhân</title>
    <link rel="shortcut icon" type="image/jpg" href="assets/photo/shortcut.png" />
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/font/themify-icons/themify-icons.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
        integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
        crossorigin="anonymous" />
</head>
<style type="text/css">
    body {
        font-family: "Azeret Mono", monospace;
        font-family: "Roboto Slab", serif;
    }

    .btn-blue {
        background-color: #5680e9;
        color: white;
    }

    .btn-blue:hover {
        background-color: #5ab9ea;
    }
</style>

<body>

    <!-- Start Profile -->
	<%@include file="Header.jsp" %>
    <div class="container-fluid" style="background-color: beige;padding-top:20px;">
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-2" style="padding-top: 20px;">
                <div class="text-center">
                    <img src="${customer.getAvatar() }"
                        class="rounded-circle" alt="Cinque Terre" style="width: 100%">
                    <span>${customer.getFullName().toString()}</span>
                </div>

                <!-- Gạch nối -->
                <div
                    style="width: 50%; display: block; margin: 0px auto; border-bottom: 1px solid #e1e1e1; padding-top: 10px;">
                </div>

                <ul class="navbar-nav" style="padding-top: 20px; padding-left: 20px;">
                    <li class="nav-item" style="padding-bottom: 10px;">
                        <a class="nav-link" href="${pageContext.request.contextPath}/profile">
                            <img src="https://cf.shopee.vn/file/ba61750a46794d8847c3f463c5e71cc4"
                                style="width: 20px; height: 20px;">
                            Hồ sơ cá nhân</a>
                    </li>
                    <li class="nav-item" style="padding-bottom: 10px;">
                        <a class="nav-link" href="${pageContext.request.contextPath}/listorder">
                            <img src="https://cf.shopee.vn/file/f0049e9df4e536bc3e7f140d071e9078"
                                style="width: 20px; height: 20px;">
                            Đơn mua</a>
                    </li>
                </ul>
                <hr class="d-sm-none">
            </div>
            <div class="col-sm-8" style="background-color:white; padding-top: 20px;">
                <h3>Hồ Sơ Của Tôi</h3>
                <h6>Quản lý thông tin hồ sơ để bảo mật tài khoản</h6>

                <!-- Gạch nối -->
                <div style=" width: 100%; display: block; margin: 0px auto; border-bottom: 1px solid
                #e1e1e1;padding-top:10px;">
                </div>
                <div class="row" style="padding-bottom: 20px;">
                    <div class="col-8">
                        <form action="${pageContext.request.contextPath}/profile" method="post" class="row g-3">
                            <!-- Họ và tên -->
                            <div class="col-md-4">
                                <label for="fistname" class="form-label">Họ</label>
                                <input type="text" name="fistname" class="form-control" id="fistname" value="${customer.getFullName().getFirstName() }">
                            </div>
                            <div class="col-md-4">
                                <label for="midname" class="form-label">Tên đệm</label>
                                <input type="text" name="midname" class="form-control" id="midname" value="${customer.getFullName().getMidName() }">
                            </div>
                            <div class="col-md-4">
                                <label for="lastname" class="form-label">Tên</label>
                                <input type="text" name="lastname" class="form-control" id="lastname" value="${customer.getFullName().getLastName() }">
                            </div>
                            <!-- Username -->
                            <div class="col-md-6">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" name="username" class="form-control" id="username" value="${customer.getAccount().getUsername() }" readonly>
                            </div>
                            <!-- Password -->
                            <div class="col-md-6">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" id="password" value="${customer.getAccount().getPassword() }">
                            </div>
                            <!-- Email -->
                            <div class="col-12">
                                <label for="mail" class="form-label">Email</label>
                                <input type="email" name="mail" class="form-control" id="mail" value="${customer.getEmail()}">
                            </div>
                            <!-- Phone number -->
                            <div class="col-12">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <input type="number" name="phone" class="form-control" id="phone" value="${customer.getPhoneNumber()}">
                            </div>
                            <!-- Avatar -->
                            <div class="col-12">
                                <label for="image" class="form-label">Hình đại diện</label>
                                <input type="text" name="image" class="form-control" id="image" value="${customer.getAvatar()}">
                            </div>
                            <!-- Sex -->
                            <div class="col-12">
                                <label for="sex" class="form-label">Giới tính</label>
                                <select class="form-control" id="sex" name="sex">
								    <option value="male" <c:if test="${customer.getGender()=='male'}">selected</c:if>>Nam</option>
								    <option value="female" <c:if test="${customer.getGender()=='female'}">selected</c:if>>Nữ</option>
								  </select>
                            </div>
                            <!-- Address -->
                            

                            <div class="col-12">
                                <label for="province" class="form-label">Tỉnh/Thành</label>
                                <input type="text" name="province" class="form-control" id="province" value="${customer.getAddress().getCity() }">
                            </div>

                            <div class="col-12">
                                <label for="district" class="form-label">Quận/Huyện</label>
                                <input type="text" name="district" class="form-control" id="district" value="${customer.getAddress().getDistrict()}">
                            </div>

                            <div class="col-12">
                                <label for="street" class="form-label">Đường</label>
                                <input type="text" name="street" class="form-control" id="street" value="${customer.getAddress().getStreet()}">
                            </div>
							<div class="col-12">
                                <label for="numberhouse" class="form-label">Số nhà</label>
                                <input type="text" name="numberhouse" class="form-control" id="numberhouse" value="${customer.getAddress().getDetail() }">
                            </div>

                            <div class="col-12" style="padding-top: 20px;">
                                <button type="submit" class="btn btn-blue">Cập nhật</button>
                            </div>
                        </form>
                    </div>
                    <!-- Gạch nối -->
                    <div style="border-left: 1px solid
                #e1e1e1; padding-top:10px; ">
                    </div>

                    <div class="col text-center" style="padding: 40px;">
                        <div class="col" style="width: 100%;height: 100px; border: 2px dashed 
                                 #e1e1e1;">
                            <i class="fa fa-image text-center" aria-hidden="true"></i>
                        </div>

                        <button style="margin-top: 20px;" type="button" class="btn btn-blue">Chọn hình
                            ảnh</button>
                    </div>
                </div>

            </div>
            <!-- End Profile -->

            <!-- Gạch nối -->
            <div
                style="width: 100%; display: block; margin: 0px auto; border-bottom: 1px solid #e1e1e1; padding-top: 10px;">
            </div>
         </div>
         </div>
	<%@include file="Footer.jsp" %>

</body>

</html>