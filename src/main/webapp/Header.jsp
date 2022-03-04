<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header id="header">

			<div class="nav">
				<ul class="control">
					<c:if test = "${customer!=null}">
						<li class="control-item">
							<a href="${pageContext.request.contextPath}/profile" style="padding:0 16px; line-height:56px;display:flex; align-items:center;">
								<img src="${customer.getAvatar() }" style="width: 36px; height: 36px;display: inline-block; border-radius: 50%;">
								<span style="margin-left: 4px;">${customer.getAccount().getUsername()}</span>
							</a>
						</li>
					</c:if>
					
					<li class="control-item <c:if test = "${direction=='home'}">actived</c:if>"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
					<c:if test = "${customer==null}">
						<li class="control-item" id="logout"><a href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
						<li class="control-item" id="logout"><a href="${pageContext.request.contextPath}/register">Đăng kí</a></li>
					</c:if>
					<c:if test = "${customer!=null}">
						<li class="control-item" id="logout"><a href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
					</c:if>
					
					
				</ul>
			</div>

			<a href="${pageContext.request.contextPath}/home" class="brand-name">
				<div class="brand-logo"><img src="assets/photo/logo.png" alt="" class=""></div>
			</a>



	<form method="get" action="${pageContext.request.contextPath}/home"
		class="search">
		<input type="text" name="search" placeholder="Nhập tên sản phẩm"
			id="search-product-name"> <input type="submit"
			value="Tìm kiếm" id="submit-button">
	</form>

	<c:if test="${customer!=null&&cart==null}">
		<div
			onclick="window.open('${pageContext.request.contextPath}/cart','_self')"
			class="cart">
			<div class="quantity">${numberOfItems}</div>
			<i class="ti-shopping-cart cart-icon"></i>
		</div>
	</c:if>


</header>