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
	<link rel="stylesheet" href="assets/project/homepage/style.css">
	<link rel="stylesheet" href="assets/css/respondsive.css">
	<link rel="stylesheet" href="assets/project/homepage/respondsive.css">
	<link rel="stylesheet" href="assets/project/productpage/style.css">
	<link rel="stylesheet" href="assets/project/productpage/respondsive.css">
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
		<!-- slider section -->
		<div id="slider">
			<div class="slider-left">
				<div class="slider">
					<div class="slider-item"><a href="#"><img
								src="https://cf.shopee.sg/file/a2823736441b417cfd60feb4885742ff_xxhdpi"
								alt="" class=""></a></div>
					<div class="slider-item"><a href="#"><img
								src="https://cf.shopee.sg/file/8bf6b1155f5e55adde0a13c17d2a14a5_xxhdpi"
								alt="" class=""></a></div>
					<div class="slider-item"><a href="#"><img
								src="https://cf.shopee.sg/file/9c182845b494735d19f901b0e943bc71_xxhdpi"
								alt="" class=""></a></div>
				</div>
			</div>
			<div class="panels-right">
				<div class="panel">
					<a href="#"><img src="https://cf.shopee.sg/file/9113223251f483640dc9d5c3d43c47a8_xhdpi"
							alt="" class="slider-item-img"></a>
				</div>
				<div class="panel">
					<a href="#"><img src="https://cf.shopee.sg/file/2fe53d83a055b6b2a28e1543aad0b000_xhdpi"
							alt="" class="slider-item-img"></a>
				</div>
			</div>
		</div>
		
		<section id="content">
			<div id="sub-nav">
				<div class="sub-nav-section">
					<h3><i class="fas fa-list"></i>  Danh mục</h3>
					
					<c:forEach items="${categories}" var="category">
						<div class="check-item <c:if test = "${categoryRecent.getID()==category.getID()}">active</c:if>">
							<input type="radio" id="category${category.getID() }" onchange = "filterBookItem(this)" name="category" value="${category.getID() }" <c:if test = "${categoryRecent.getID()==category.getID()}">checked</c:if>>
						  <label for="category${category.getID() }"> ${category.getName() }</label><br>
						</div>
					</c:forEach>
					
					
				</div>
				<div class="sub-nav-section">
					
					<h3><i class="fas fa-list"></i>   Nhà phát hàng</h3>
					<c:forEach items="${publishers}" var="publisher">
						<div class="check-item <c:if test = "${publisherRecent.getID()==publisher.getID()}">active</c:if>">
							<input type="radio" id="publisher${publisher.getID() }" onchange = "filterBookItem(this)" name="publisher" value="${publisher.getID() }" <c:if test = "${publisherRecent.getID()==publisher.getID()}">checked</c:if>>
						  <label for="publisher${publisher.getID() }"> ${publisher.getName() }</label><br>
						</div>
					</c:forEach>
				</div>
				<div class="sub-nav-section">
					<h3><i class="fas fa-list"></i>   Tác giả</h3>
					<c:forEach items="${authors}" var="author">
						<div class="check-item <c:if test = "${authorRecent.getID()==author.getID()}">active</c:if>">
							<input type="radio" id="author${author.getID() }" onchange = "filterBookItem(this)" name="author" value="${author.getID() }" <c:if test = "${authorRecent.getID()==author.getID()}">checked</c:if>>
						  <label for="author${author.getID() }"> ${author.getName() }</label><br>
						</div>
					</c:forEach>
				</div>
				<form method="get" action="#" class="sub-nav-section">
					<h3><i class="fas fa-funnel-dollar"></i>   Khoảng giá</h3>
					<div class="row">
						<input class="col-6" type="text" name="" id="from-price" placeholder="Từ">
						<input class="col-6" type="text" name="" id="to-price" placeholder="Đến">
					</div>
					<input class="button mt-16" type="submit" value="Áp dụng">
				</form>
			</div>
			<div id="product">
				<div class="product-container">
					<c:if test="${items.size()>0 }">
					<div class="sort-section">

						<div class="sort-direction">
							<div class="sort-container">
								<h3>Sắp xếp theo</h3>
								<a href="#" class="active">Phổ biến</a> <a href="#">Mới nhất</a>
								<a href="#">Giảm giá tốt nhất</a> <a href="#">Giá tăng dần</a> <a
									href="#">Giá giảm dần</a>
							</div>
							<c:if test="${items.size()>4 }">
							<div class="pagination-plus">
								<a href="#" class="disable"><i class="fas fa-angle-left"></i></a>
								<a href="#" class=""><i class="fas fa-angle-right"></i></a>
							</div>
							</c:if>
						</div>
					</div>
					</c:if>
					<c:if test="${searchString!=null&&items.size()>0}">
						<div class="mark-section">
							<h2><i class="fas fa-bullhorn"></i>   Hiển thị kết quả cho từ khoá "${searchString }"</h2>
						</div>
					</c:if>
					<c:if test="${searchString!=null&&items.size()==0}">
						<div class="mark-section">
							<h2><i class="fas fa-bullhorn"></i>   Không có sách phù hợp với từ khoá "${searchString }"</h2>
						</div>
					</c:if>
					<c:if test="${searchString==null&&items.size()==0}">
						<div class="mark-section">
							<h2><i class="fas fa-bullhorn"></i>   Danh sách sản phẩm trống</h2>
						</div>
					</c:if>
					<!-- Render dữ liệu -->
					<div class="section-content">
						<c:forEach items="${items}" var="item_row">
							<div class="row-item">
								<c:forEach items="${item_row}" var="item">
									<div class="item item-col-2-4">
										<div class="item-container">
											<a href='${pageContext.request.contextPath}/product?id=${item.getID()}' class="item-image">
												<img
													src="${item.getImages().get(0)}"
													alt="" class="item-img">
											</a>
											<div class="item-content">
												<h2 class="item-name">
													<c:choose>
														<c:when test="${item.getHeader().length()>40}">
																${item.getHeader().substring(0, 40)}...
														</c:when>
														<c:when test="${false}">

														</c:when>
														<c:otherwise>
																${item.getHeader()}
														</c:otherwise>
													</c:choose>
												</h2>
												<c:choose>
													<c:when test="${item.getDiscount()*100>=1}">
														<div class="item-old-price">
															<fmt:formatNumber
																value="${item.getPrices()}"
																minFractionDigits="0" maxFractionDigits="0" />đ
														</div>
													</c:when>
													<c:when test="${false}">

													</c:when>
													<c:otherwise>
														<div class="item-old-price" style='color:white'>&nbsp;</div>
													</c:otherwise>
												</c:choose>

												<div class="item-info">
													<c:if test="${item.getDiscount()*100>=1}">
														<div class="item-discount">
															<fmt:formatNumber value="${item.getDiscount()*100}"
																minFractionDigits="0" maxFractionDigits="0" />% Giảm
														</div>
													</c:if>
													<div class="item-content-section">
														<div class="item-price">
															<fmt:formatNumber value="${item.getPrices()-item.getPrices()*item.getDiscount()}"
																minFractionDigits="0" maxFractionDigits="0" />đ
														</div>
														<a href='${pageContext.request.contextPath}/add-to-cart?id=${item.getID()}' class="item-add-button">Thêm vào giỏ</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</div>
				<c:if test="${items.size()>4 }">
				<div class="pagination">
					<div class="pagination-container">
						<ul>
							<li><a href="#"><i class="fas fa-angle-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a>. . .</a></li>
							<li><a href="#"><i class="fas fa-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
				</c:if>
		</section>
	<%@include file="Footer.jsp" %>
	<!-- script -->

	<script src="assets/js/script.js"></script>
	<script src="assets/project/homepage/script.js"></script>
	<script>
		let search = '${searchString}';
		filterBookItem = (element)=>{
			let inputs = [...document.querySelectorAll('input[type="radio"]')]
			let href = location.origin+location.pathname+"?";
			inputs.forEach((input)=>{
				if(input.checked){
					href+=input.name+"="+input.value+"&"
				}
			})
			if(search!="") href+="search="+search;
			window.location = href;
		}
	</script>
</body>

</html>