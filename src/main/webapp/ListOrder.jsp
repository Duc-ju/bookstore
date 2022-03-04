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
    <title>Quản lý đơn hàng</title>
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
	<link rel="stylesheet" href="assets/css/style.css">
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

    .btn-cancel {
        background-color: white;
        border-color: #e1e1e1;
    }

    .btn-cancel:hover {
        background-color: aliceblue;
    }

    .text-de {
        color: #5ab9ea;
        text-decoration: line-through;
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
            <div class="col-sm-8" style="background-color:white; padding: 0px;">
                <form style="background-color: darkgrey;">
                    <div class="input-group">
                        <input type="text" class="form-control"
                            placeholder="Tìm kiếm theo Tên Shop, ID đơn hàng hoặc Tên Sản phẩm">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </form>
				<c:forEach items="${orders}" var="order">
					<div style="padding: 20px;background-color: rgb(245, 245, 245); margin-bottom: 20px;">
	                    <div class="row">
	                        <div class="col-6">
	                            <img src="https://cf.shopee.vn/file/6b1ffcde1ff12621088110f419a5283a"
	                                style="width: 20px; height: 20px;">
	                            <h7>Quán quen</h7>
	                        </div>
	                        <div class="col-6 text-right">
	                        	
	                            <c:if test = "${order.getStatus()!='cancel'&&order.getStatus()!='complete'}">
									<span class="" style="color:var(--primary_color)" href="">
		                                <i class="fa fa-truck" aria-hidden="true"></i>
		                                <span>Đang giao hàng</span>
		                            </span>
								</c:if>
	                        	<c:if test = "${order.getStatus()=='process'}">
									<i class="fa fa-question-circle" aria-hidden="true"></i>
	                            	<span>CHỜ LẤY HÀNG</span>
								</c:if>
								<c:if test = "${order.getStatus()=='confirm'}">
									<i class="fa fa-question-circle" aria-hidden="true"></i>
	                            	<span>ĐÃ XÁC NHẬN</span>
								</c:if>
								<c:if test = "${order.getStatus()=='complete'}">
									<i class="fa fa-question-circle" aria-hidden="true"></i>
	                            	<span>ĐÃ HOÀN THÀNH</span>
								</c:if>
								<c:if test = "${order.getStatus()=='cancel'}">
									<i class="fa fa-question-circle" aria-hidden="true"></i>
	                            	<span>ĐÃ HỦY</span>
								</c:if>
	                        </div>
	                    </div>
	                    <div style=" width: 90%; display: block; margin: 0px auto; border-bottom: 1px solid
	                    #e1e1e1;padding-top:10px;">
	                    </div>
	                    <div class="row" style="padding-top: 10px;">
	                        <div class="col-1">
	                        	<a href="#"></a>
	                            <img src="${order.getHeaderItem().getImages().get(0)}"
	                                style="width:80px; height: 80px;">
	                        </div>
	                        <div class="col-9" style="padding-left: 30px;">
	                            <span>${order.getHeaderItem().getHeader()}</span>
	                        </div>
	                        <div class="col-2 text-right">
	                            <div class="text-de"><fmt:formatNumber
																value="${order.getHeaderItem().getPrices()+order.getHeaderItem().getPrices()*(order.getHeaderItem().getDiscount())}"
																minFractionDigits="0" maxFractionDigits="0" />₫</div>
	                            <span><fmt:formatNumber
																value="${order.getHeaderItem().getPrices()}"
																minFractionDigits="0" maxFractionDigits="0" />đ</span>
	
	                        </div>
	                    </div>
	                    <div class="col-12 text-right">
	                        <a href="${pageContext.request.contextPath}/orderdetail?id=${order.getID()}" class="btn btn-blue">Xem chi tiết</a>
	                        <c:if test = "${order.getStatus()=='process'}">
								<a href="${pageContext.request.contextPath}/cancelorder?id=${order.getID()}" class="btn btn-cancel">Hủy đơn hàng</a>
							</c:if>
	                    </div>
	                </div>
				</c:forEach>
                
                 

            </div>

        </div>
    </div>
    <%@include file="Footer.jsp" %>
    <!-- End Profile -->

    <!-- Gạch nối -->
    <div style="width: 100%; display: block; margin: 0px auto; border-bottom: 1px solid #e1e1e1; padding-top: 10px;">
    </div>

</body>

</html>