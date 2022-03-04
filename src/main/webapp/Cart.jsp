<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="wIDth=device-wIDth, initial-scale=1.0">
	<title>Giỏ hàng</title>
	<link rel="shortcut icon" type="image/jpg" href="assets/photo/shortcut.png"/>
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/project/cart/style.css">
	<link rel="stylesheet" href="assets/css/respondsive.css">
	<link rel="stylesheet" href="assets/project/cart/respondsive.css">
	<link rel="stylesheet" href="assets/font/themify-icons/themify-icons.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
		integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
		crossorigin="anonymous" />
</head>

<body>
	<div ID="main">
	<div ID="toast"></div>
		<!-- header section -->
		<%@include file="Header.jsp"%>
		<div ID="content">
			<div class="empty-cart">
				<h2 class="empty-cart-notice">Giỏ hàng trống</h2>
				<a href="${pageContext.request.contextPath}/home"
					class="go-home-button">Về trang chủ</a>
			</div>
			<div class="cart-container">
				<div class="mark-section">
					<h2 class="content-title">
						<i class="fas fa-bullhorn"></i> Giỏ hàng
					</h2>
				</div>
				<div class="sub-nav">
					<div class="sub-nav-title">
						<h2 class="content-title">Sản phẩm</h2>
					</div>
					<div class="sub-nav-price">Giá</div>
					<div class="sub-nav-action">Thao tác</div>
				</div>
				<c:forEach items="${cart.getBookItems()}" var="item">
					<div class="book-item">
						<a
							href="${pageContext.request.contextPath}/product?id=${item.getID()}"
							class="book-image"> <img src="${item.getImages().get(0) }"
							alt="Book-image" class="book-image-item">
						</a>
						<div class="book-properties">
							<div class="book-title">${item.getHeader()}</div>
							<div class="book-author">Tác giả:
								${item.getBook().getAuthor().getName() }</div>
						</div>
						<div class="book-price"><fmt:formatNumber value="${item.getPrices()*(1-item.getDiscount())}" minFractionDigits="0" maxFractionDigits="0" />đ</div>
						<div class="book-action">
							<a class="book-delete-button"
								href="${pageContext.request.contextPath}/delete-item-cart?type=bookitem&ID=${item.getID()}">Xóa</a>
						</div>
					</div>
				</c:forEach>


				<div class="cart-control">
					<div class="cart-order">
						<div class="cart-total-price">Tổng đơn hàng
							(${cart.getQuantity()} sản phẩm): <fmt:formatNumber value="${cart.getTotalPrices()}" minFractionDigits="0" maxFractionDigits="0" />đ</div>
						<a href="${pageContext.request.contextPath}/createorder" class="cart-order-button pointer">Đặt hàng</a>
					</div>
				</div>
			</div>



		</div>

		<%@include file="Footer.jsp"%>
	</div>
	<script src="assets/js/script.js"></script>
	<script src="assets/project/cart/script.js"></script>

	<c:if test="${addSuccess==1}">
		<script>
			showSuccessToast("Thêm sản phẩm thành công!");
		</script>
	</c:if>
	<c:if test="${deleteSuccess==1}">
		<script>
			showSuccessToast("Xóa sản phẩm thành công!");
		</script>
	</c:if>
	

</body>

</html>