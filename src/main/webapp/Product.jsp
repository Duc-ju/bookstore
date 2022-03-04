<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Quán Quen</title>
	<link rel="shortcut icon" type="image/jpg" href="assets/photo/shortcut.png" />
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/project/product/style.css">
	<link rel="stylesheet" href="assets/css/respondsive.css">
	<link rel="stylesheet" href="assets/project/product/respondsive.css">
	<link rel="stylesheet" href="assets/font/themify-icons/themify-icons.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
		integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
		crossorigin="anonymous" />
	<script>
		$(document).ready(function () {
			$('.slider').bxSlider({
				slideWidth: 450,
				slideHeight: 450,
				auto: true,
				pause: 6000
			});
		});
	</script>

</head>

<body>
	<div id="toast"></div>
	<div id="main">
		<!-- header section -->
		<%@include file="Header.jsp" %>
		<section id="breadcrumb">Quán quen <i class="fas fa-angle-right"></i> ${item.getHeader()}</section>
		<section id="content">
			<div class="content-section">
				<div class="product-image">
					<div class="image-container">
						<div class="slider">
							<c:forEach items="${item.getImages()}" var="image">
								<div class="slider-item">
								<img
									src="${image}"
									alt="" class="">
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="image-list">
						<div class="image-list-container">
							<c:forEach items="${item.getImages()}" var="image">
								<div class="list-item">
									<img
										src="${image}"
										alt="" class="">
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="product-info">
					<div class="info-container">
						<h2 class="product-header">${item.getHeader()}</h2>

							<div class="brand-name pointer">
								<div class="product-brand">
									Tác giả: <a href="#">${item.getBook().getAuthor().getName()}</a>
								</div>
							</div>

						<c:choose>
							<c:when test="${item.getDiscount()*100>=1}">
								<div class="old-price">
									<fmt:formatNumber
										value="${item.getPrices()}"
										minFractionDigits="0" maxFractionDigits="0" />đ
								</div>
							</c:when>
							<c:when test="${false}">

							</c:when>
							<c:otherwise>
								<div class="old-price" style='color: white'>&nbsp;</div>
							</c:otherwise>
						</c:choose>
						<div class="price">
							<fmt:formatNumber value="${item.getPrices()*(1-item.getDiscount())}"
								minFractionDigits="0" maxFractionDigits="0" />đ
						</div>
						<c:if test="${item.getDiscount()*100>=1}">
							<div class="discount-badge">
								<fmt:formatNumber value="${item.getDiscount()*100}"
									minFractionDigits="0" maxFractionDigits="0" />% Giảm
							</div>
						</c:if>

						<div class="button-group mt-32">
							<div class="add-to-cart">
								<a href="${pageContext.request.contextPath}/add-to-cart?type=${type}&id=${item.getID()}"><i class="fas fa-cart-plus"></i> Thêm vào giỏ
									hàng</a>
							</div>
							<div class="go-to-cart">
								<a
									href="${pageContext.request.contextPath}/add-to-cart?type=${type}&id=${item.getID()}"><i
									class="fas fa-cart-plus"></i> Mua ngay</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="content-section mt-16">
				<div class="product-description">
					<div class="description-container">
						<div class="description-section">
							<div class="description-header">
								<h2>CHI TIẾT SẢN PHẨM</h2>
							</div>
							<div class="description-row">
								<div class="description-col-2">Đường dẫn</div>
								<div class="description-col-10">
									Quán quen <i class="fas fa-angle-right"></i> ${item.getBook().getCategory().getName() }
								</div>
							</div>
							
								<div class="description-row">
									<div class="description-col-2">Tác giả</div>
									<div class="description-col-10"><a>${item.getBook().getAuthor().getName()}</a></div>
								</div>
								<div class="description-row">
									<div class="description-col-2">Ngôn ngữ</div>
									<div class="description-col-10">${item.getBook().getLanguage()}</div>
								</div>
								<div class="description-row">
									<div class="description-col-2">Số trang</div>
									<div class="description-col-10">${item.getBook().getNumberOfPage()}</div>
								</div>
								<div class="description-row">
									<div class="description-col-2">Danh Mục</div>
									<div class="description-col-10">${item.getBook().getCategory().getName()}</div>
								</div>
								<div class="description-row">
									<div class="description-col-2">Nhà phát hành</div>
									<div class="description-col-10">${item.getBook().getPublisher().getName()}</div>
								</div>

						</div>
						<div class="description-section">
							<div class="description-header">
								<h2>MÔ TẢ SẢN PHẨM</h2>
							</div>
							<div class="description-content">
								<span>${item.getDescription()}</span>
							</div>
						</div>
					</div>
				</div>
				<div class="recommended">
					<div class="recommended-header">
						<h2>TOP BÁN CHẠY</h2>
					</div>
					<div class="row-item">
						<a href="#" class="item item-col-12">
							<div class="item-container">
								<div class="item-image">
									<img src="https://cf.shopee.vn/file/17f31c8384d188c1d0bf8bb60d6ac2d2"
										alt="" class="item-img">
								</div>
								<div class="item-content">
									<h2 class="item-name">Áo thun nam chất
										lượng cao nhập khẩu chính
										hãng
									</h2>
									<div class="item-old-price">106.000đ
									</div>
									<div class="item-info">
										<div class="item-discount">50%
											giảm</div>
										<div class="item-content-section">
											<div class="item-price">
												58.000đ</div>
											<div class="item-add-button">
												Thêm vào giỏ
											</div>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="row-item">
						<a href="#" class="item item-col-12">
							<div class="item-container">
								<div class="item-image">
									<img src="https://cf.shopee.vn/file/17f31c8384d188c1d0bf8bb60d6ac2d2"
										alt="" class="item-img">
								</div>
								<div class="item-content">
									<h2 class="item-name">Áo thun nam chất
										lượng cao nhập khẩu chính
										hãng
									</h2>
									<div class="item-old-price">106.000đ
									</div>
									<div class="item-info">
										<div class="item-discount">50%
											giảm</div>
										<div class="item-content-section">
											<div class="item-price">
												58.000đ</div>
											<div class="item-add-button">
												Thêm vào giỏ
											</div>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="row-item">
						<a href="#" class="item item-col-12">
							<div class="item-container">
								<div class="item-image">
									<img src="https://cf.shopee.vn/file/17f31c8384d188c1d0bf8bb60d6ac2d2"
										alt="" class="item-img">
								</div>
								<div class="item-content">
									<h2 class="item-name">Áo thun nam chất
										lượng cao nhập khẩu chính
										hãng
									</h2>
									<div class="item-old-price">106.000đ
									</div>
									<div class="item-info">
										<div class="item-discount">50%
											giảm</div>
										<div class="item-content-section">
											<div class="item-price">
												58.000đ</div>
											<div class="item-add-button">
												Thêm vào giỏ
											</div>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="row-item">
						<a href="#" class="item item-col-12">
							<div class="item-container">
								<div class="item-image">
									<img src="https://cf.shopee.vn/file/17f31c8384d188c1d0bf8bb60d6ac2d2"
										alt="" class="item-img">
								</div>
								<div class="item-content">
									<h2 class="item-name">Áo thun nam chất
										lượng cao nhập khẩu chính
										hãng
									</h2>
									<div class="item-old-price">106.000đ
									</div>
									<div class="item-info">
										<div class="item-discount">50%
											giảm</div>
										<div class="item-content-section">
											<div class="item-price">
												58.000đ</div>
											<div class="item-add-button">
												Thêm vào giỏ
											</div>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="row-item">
						<a href="#" class="item item-col-12">
							<div class="item-container">
								<div class="item-image">
									<img src="https://cf.shopee.vn/file/17f31c8384d188c1d0bf8bb60d6ac2d2"
										alt="" class="item-img">
								</div>
								<div class="item-content">
									<h2 class="item-name">Áo thun nam chất
										lượng cao nhập khẩu chính
										hãng
									</h2>
									<div class="item-old-price">106.000đ
									</div>
									<div class="item-info">
										<div class="item-discount">50%
											giảm</div>
										<div class="item-content-section">
											<div class="item-price">
												58.000đ</div>
											<div class="item-add-button">
												Thêm vào giỏ
											</div>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</section>
		<h3 class="section-label mt-32">
			<div class="sale-label">SẢN PHẨM TƯƠNG TỰ</div>
			<a href="#" class="label-direction">Xem tất cả <i class="fas fa-angle-right"></i></a>
		</h3>
		<div class="content-section mb-32">
			<div class="row-item">
				<a href="#" class="item item-col-2">
					<div class="item-container">
						<div class="item-image">
							<img src="https://cf.shopee.vn/file/17f31c8384d188c1d0bf8bb60d6ac2d2"
								alt="" class="item-img">
						</div>
						<div class="item-content">
							<h2 class="item-name">Áo thun nam chất lượng cao nhập khẩu chính
								hãng
							</h2>
							<div class="item-old-price">106.000đ</div>
							<div class="item-info">
								<div class="item-discount">50% giảm</div>
								<div class="item-content-section">
									<div class="item-price">58.000đ</div>
									<div class="item-add-button">Thêm vào giỏ
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>
				<a href="#" class="item item-col-2">
					<div class="item-container">
						<div class="item-image">
							<img src="https://cf.shopee.vn/file/9443b8c9d25cd576615a9d499d6b131e"
								alt="" class="item-img">
						</div>
						<div class="item-content">
							<h2 class="item-name">Bộ Đồ Ngủ Nữ Mùa Hè Cao Cấp Loirechic
								BDN03 -1
							</h2>
							<div class="item-old-price">&nbsp</div>
							<div class="item-info">
								<div class="item-content-section">
									<div class="item-price">58.000đ</div>
									<div class="item-add-button">Thêm vào giỏ
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>
				<a href="#" class="item item-col-2">
					<div class="item-container">
						<div class="item-image">
							<img src="assets/photo/portfolio.png" alt="" class="item-img">
						</div>
						<div class="item-content">
							<h2 class="item-name">Áo thun nam chất lượng cao nhập khẩu chính
								hãng
							</h2>
							<div class="item-old-price">106.000đ</div>
							<div class="item-info">
								<div class="item-discount">50% giảm</div>
								<div class="item-content-section">
									<div class="item-price">58.000đ</div>
									<div class="item-add-button">Thêm vào giỏ
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>
				<a href="#" class="item item-col-2">
					<div class="item-container">
						<div class="item-image">
							<img src="assets/photo/portfolio.png" alt="" class="item-img">
						</div>
						<div class="item-content">
							<h2 class="item-name">Áo thun nam chất lượng cao nhập khẩu chính
								hãng
							</h2>
							<div class="item-old-price">106.000đ</div>
							<div class="item-info">
								<div class="item-discount">50% giảm</div>
								<div class="item-content-section">
									<div class="item-price">58.000đ</div>
									<div class="item-add-button">Thêm vào giỏ
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>
				<a href="#" class="item item-col-2">
					<div class="item-container">
						<div class="item-image">
							<img src="assets/photo/portfolio.png" alt="" class="item-img">
						</div>
						<div class="item-content">
							<h2 class="item-name">Áo thun nam chất lượng cao nhập khẩu chính
								hãng
							</h2>
							<div class="item-old-price">106.000đ</div>
							<div class="item-info">
								<div class="item-discount">50% giảm</div>
								<div class="item-content-section">
									<div class="item-price">58.000đ</div>
									<div class="item-add-button">Thêm vào giỏ
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>
				<a href="#" class="item item-col-2">
					<div class="item-container">
						<div class="item-image">
							<img src="assets/photo/portfolio.png" alt="" class="item-img">
						</div>
						<div class="item-content">
							<h2 class="item-name">Áo thun nam chất lượng cao nhập khẩu chính
								hãng
							</h2>
							<div class="item-old-price">106.000đ</div>
							<div class="item-info">
								<div class="item-discount">50% giảm</div>
								<div class="item-content-section">
									<div class="item-price">11.158.000đ</div>
									<div class="item-add-button">Thêm vào giỏ
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>







			</div>
		</div>


	</div>


	<div id="footer">
		<div class="ruler-line">&nbsp</div>
		<div class="footer-container">
			<div class="footer-section">
				<h2>CHĂM SÓC KHÁCH HÀNG</h2>
				<ul>
					<li><a href="#">Trung Tâm Trợ Giúp</a></li>
					<li><a href="#">Hướng Dẫn Mua Hàng</a></li>
					<li><a href="#">Thanh Toán</a></li>
					<li><a href="#">Vận Chuyển</a></li>
					<li><a href="#">Trả Hàng & Hoàn Tiền</a></li>
					<li><a href="#">Chăm Sóc Khách Hàng</a></li>
					<li><a href="#">Chính Sách Bảo Hành</a></li>
				</ul>
			</div>
			<div class="footer-section">
				<h2>VỀ QUÁN QUEN</h2>
				<ul>
					<li><a href="#">Giới Thiệu Về Quán Quen Việt Nam</a></li>
					<li><a href="#">Tuyển Dụng</a></li>
					<li><a href="#">Chính sách bảo mật</a></li>
					<li><a href="#">Chính hãng</a></li>
					<li><a href="#">Chương trình tiếp thị liên kết</a></li>
					<li><a href="#">Kênh quảng bá</a></li>
					<li><a href="#">Liên hệ với truyền thông</a></li>
				</ul>
			</div>

			<div class="footer-section">
				<h2>THANH TOÁN</h2>
				<ul>
					<li><a href="#">Visa</a></li>
					<li><a href="#">MasterCard</a></li>
					<li><a href="#">JCB</a></li>
					<li><a href="#">CODE</a></li>
					<li><a href="#">Trả Góp</a></li>
				</ul>
				<h2>ĐƠN VỊ VẬN CHUYỂN</h2>
				<ul>
					<li><a href="#">Giao Hàng Nhanh</a></li>
					<li><a href="#">Giao hàng tiết kiệm</a></li>
					<li><a href="#">Viettel Post</a></li>
					<li><a href="#">Ninja Van</a></li>
				</ul>
			</div>

			<div class="footer-section">
				<h2>THEO DÕI CHÚNG TÔI TRÊN</h2>
				<ul>
					<li><a href="#"><i class="fab fa-facebook-square"></i> Facebook</a></li>
					<li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
					<li><a href="#"><i class="fab fa-linkedin"></i> LinkedIn</a></li>
				</ul>
			</div>
		</div>
		<div class="ruler-line">&nbsp</div>
		<div id="footer-copyright">© 2021 Quán Quen. Tất cả các quyền được bảo lưu.</div>
	</div>



	<!-- script -->

	<script src="assets/js/script.js"></script>
	<script src="assets/project/product/script.js"></script>
</body>

</html>