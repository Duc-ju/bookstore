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
	<title>Giỏ hàng</title>
	<link rel="shortcut icon" type="image/jpg" href="assets/photo/shortcut.png"/>
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/project/cart/style.css">
	<link rel="stylesheet" href="assets/css/respondsive.css">
	<link rel="stylesheet" href="assets/project/cart/respondsive.css">
	<link rel="stylesheet" href="assets/project/order/style.css">
	<link rel="stylesheet" href="assets/font/themify-icons/themify-icons.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
		integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
		crossorigin="anonymous" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<div id="main">
		<%@include file="Header.jsp" %>
		<div id="content">
			<div class="empty-cart">
				<h2 class="empty-cart-notice">Giỏ hàng trống</h2>
				<a href="https://duc-ju.github.io/online-shop/" class="go-home-button">Về trang chủ</a>
			</div>
			<div class="cart-container">
				<div class="mark-section">
					<h2 class="content-title"><i class="fas fa-bullhorn"></i>  Đặt hàng</h2>
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
								href="${pageContext.request.contextPath}/delete-item-cart?ID=${item.getID()}">Xóa</a>
						</div>
					</div>
				</c:forEach>
				
				<div class="cart-control">
					<div class="cart-order">
						<div class="cart-total-price">Tổng đơn hàng
							(${cart.getQuantity()} sản phẩm): <span id="amount"><fmt:formatNumber value="${cart.getTotalPrices()}" minFractionDigits="0" maxFractionDigits="0" /></span>đ</div>
					</div>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/createorder" method="post">
			<div class="order-container">
				<div class="choose-address">
					<h3 class="payment-title">Nhập thông tin vân chuyển</h3>
					<div class="row">
						<div class="col-3">
							Nhập địa chỉ
						</div>
						<div class="col-9">
							<input type="text" name="address" id="" placeholder="Địa chỉ" class="bg-gray" required>
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							Chọn phương thức vận chuyển
						</div>
						<div class="col-9">
							<select name="shipmentType" id="shipmentType" class="bg-gray">
								<option value="fast">Vận chuyển siêu tốc</option>
								<option value="quick" selected>Vận chuyển nhanh</option>
								<option value="normal">Vận chuyển tiết kiệm</option>
							</select>
						</div>
					</div>
					<div class="cart-control mt-16">
						<div class="cart-order">
							<div class="cart-total-price" id="shipment">Phí vận chuyển: <span id="shipping-fee-1">30.000đ</span></div>
						</div>
					</div>
					
				</div>
				<div class="choose-payment-method">
					<h3 class="payment-title">Nhập thông tin thanh toán</h3>
					<div class="row">
						<div class="col-3">
							Chọn phương thức thanh toán
						</div>
						<div class="col-9">
							<select name="paymentMethod" id="paymentMethod" class="bg-gray">
								<option value="cash">Thanh toán khi nhận hàng</option>
								<option value="credit">Thanh toán bằng thẻ tín dụng</option>
								<option value="tranfer">Thanh toán chuyển khoản</option>
							</select>
						</div>
					</div>
				</div>
				<div class="choose-address" id="tranfer">
					<div class="row">
						<div class="col-3">
							Tên người thụ hưởng
						</div>
						<div class="col-9">
							<input type="text" name="nameTranfer" id="" placeholder="Tên người thụ hưởng" class="bg-gray">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							Mã ngân hàng
						</div>
						<div class="col-9">
							<input type="text" name="bankID" id="" placeholder="Mã ngân hàng" class="bg-gray">
						</div>
					</div>
					
				</div>
				
				<div class="choose-address" id="credit">
					<div class="row">
						<div class="col-3">
							Số thẻ
						</div>
						<div class="col-9">
							<input type="text" name="number" id="" placeholder="Số thẻ" class="bg-gray">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							Loại thẻ
						</div>
						<div class="col-9">
							<input type="text" name="typeCredit" id="" placeholder="Loại thẻ" class="bg-gray">
						</div>
					</div>
					
					<div class="row">
						<div class="col-3">
							Hạn sử dụng
						</div>
						<div class="col-9">
							<input type="date" name="expDate" id="" placeholder="Hạn sử dụng" class="bg-gray">
						</div>
					</div>
					
				</div>
				
				
					
				<div class="bg-white mt-16">
					<div class="row">
						<div class="col-6">

						</div>
						<div class="col-6">
							<div class="row">
								<div class="col-9" id="discountColumn" style="position:relative">
									<input type="text" name="discount" class="bg-gray" id="voucher" placeholder="Nhập mã giảm giá">
									<div id="deleteDiscount" onclick="cancelDiscount()" style="position: absolute; top: 13px; right:16px; padding: 2px 8px; border-radius: 4px; background-color: #ccc;cursor:pointer;display:none">x</div>
								</div>
								<div class="col-3"> 
									<a onclick="checkVoucher()" class="button pointer">Áp dụng</a>
								</div>
								
							</div>
							<div class="order-info">
								<div class="order-total-price">Tổng tiền hàng
							(${cart.getQuantity()} sản phẩm): <fmt:formatNumber value="${cart.getTotalPrices()}" minFractionDigits="0" maxFractionDigits="0" />đ</div>
								<div class="order-ship-fee small" id="totalShipment">Phí vận chuyển: <span id="shipping-fee-2">30,000đ</span></div>
								<div class="small" id="discount">Khuyến mại: 0đ</div>
								<div class="order-total-payment mt-32" id="totalAmount">Tổng thanh toán <span id="oldTotal" style="text-decoration: line-through;opacity:0.3;"></span>: <span id="total" style="color: var(--highlight_color); font-size:32px"></span></div>
								<button type="submit" class="order-button pointer clear">Xác nhận đặt hàng</button>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</form>

		</div>

		<%@include file="Footer.jsp" %>
	</div>
	<script src="assets/js/script.js"></script>
	<script src="assets/project/cart/script.js"></script>
	<script src="assets/project/order/script.js"></script>
	<script>
		let amount = ${cart.getTotalPrices()}
		let shipmentType = document.getElementById("shipmentType")
		let shipFee;
			let sum;
			let val = shipmentType.value
			switch(val){
				case "fast": shipFee = 50000; break;
				case "quick": shipFee = 40000; break;
				case "normal": shipFee = 30000; break;
			}
			document.getElementById("shipping-fee-1").innerText = String(shipFee).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ";
			document.getElementById("shipping-fee-2").innerText = String(shipFee).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ";
			sum = shipFee+amount;
			document.getElementById("total").innerText = String(sum).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ";
		shipmentType.onchange = () =>{
			let sum;
			let val = shipmentType.value
			switch(val){
				case "fast": shipFee = 50000; break;
				case "quick": shipFee = 40000; break;
				case "normal": shipFee = 30000; break;
			}
			document.getElementById("shipping-fee-1").innerText = String(shipFee).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ";
			document.getElementById("shipping-fee-2").innerText = String(shipFee).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ";
			sum = shipFee+amount;
			document.getElementById("total").innerText = String(sum).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ";
		}
		let discountPercent
		checkVoucher= () =>{
			$.post("${pageContext.request.contextPath}/voucher",
					{
						 voucher: $('#voucher').val(),
					},
					function(data, status){
						if(data=='empty'){
							alert("Mã giảm giá không hợp lệ!");
						}
						else{
							let discountPercent = Number.parseFloat(data)
							alert("Áp dụng mã giảm giá thành công");
							$('#voucher').attr('readonly','readonly')
							let discountAmount = String(amount*data/100).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ"
							$('#discount').html('Khuyến mại ('+discountPercent+'%): '+discountAmount)
							sum = shipFee+amount*(100-discountPercent)/100;
							let oldSum = shipFee+amount;
							$("#total").html(String(sum).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ");
							$("#oldTotal").html(String(oldSum).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ");
							deleteDiscount.style.display = "inline-block"
						}
				});
		}
		cancelDiscount = ()=>{
			$('#discount').html('Khuyến mại: 0đ')
			sum = shipFee+amount;
			document.getElementById("total").innerText = String(sum).replace(/(.)(?=(\d{3})+$)/g,'$1.')+"đ";
			document.getElementById("oldTotal").innerText = ''
			deleteDiscount.style.display = 'none'
			$('#voucher').val('')
			$('#voucher').removeAttr('readonly');
		}
		let paymentType = document.getElementById("paymentMethod")
		paymentType.onchange = () =>{
			switch($('#paymentMethod').val()){
			case 'cash':{
				$('#tranfer').css('display','none')
				$('#credit').css('display','none')
				break
			}
			case 'credit':{
				$('#tranfer').css('display','none')
				$('#credit').css('display','block')
				break
			}
			case 'tranfer':{
				$('#tranfer').css('display','block')
				$('#credit').css('display','none')
				break
			}
			}
		}
		
	
	</script>
</body>

</html>