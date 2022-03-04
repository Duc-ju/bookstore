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
    <title>Xem chi tiết đơn hàng</title>
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

    .text-price {
        color: #5680e9;
        font-weight: 500;
    }
</style>


<body>
<%@include file="Header.jsp" %>
    <div class="" style="background-color: #f1f1f1;margin-top: 58px;">
        <div class="pb-4 " style=" background-color: #f1f1f1;">
            <div class="container pt-3 pb-3 mb-0" style="background-color: #f1f1f1;">
                <p class="mt-0 mb-0">
                    Đơn hàng <i class="fas fa-chevron-right"></i> Chi tiết đơn hàng
                </p>
            </div>
            <div class="container ">

                <div class="card-deck mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title p-3 btn-blue">Địa chỉ nhận hàng</h5>
                            <p class="card-text">
                            <div class="row border ml-4 mr-4 p-2">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <i class="fas fa-file-signature"></i>Tên:
                                        </div>
                                        <div class="col-sm-8">
                                        	<c:if test = "${customer.getFullName().toString().length()>2}">
												<p>${customer.getFullName().toString() }</p>
											</c:if>
                                            <c:if test = "${customer.getFullName()==null||customer.getFullName().toString().length()<2}">
												<p>${customer.getAccount().getUsername()}</p>
											</c:if>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <i class="far fa-address-card"></i> Địa chỉ:
                                        </div>
                                        <div class="col-sm-8">
                                            <p>${order.getShipment().getAddress() }</p>
                                        </div>
                                    </div>         
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <i class="fa fa-truck"></i> Phương thức giao hàng:
                                        </div>
                                        <div class="col-sm-8">
                                            <p>${order.getShipment().getType() }</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Thông tin vận chuyển -->
                <div class="card-deck mb-4">
                    <div class="card ">
                        <div class="card-body ">
                            <h5 class="card-title p-3 btn-blue">Thông tin đơn hàng</h5>
                           
							
                            <c:forEach items="${order.getCart().getBookItems()}" var="item">
                            	<div style="padding: 20px;background-color: rgb(245, 245, 245); margin-bottom: 20px;">
                                <div class="row">
                                    <div class="col-6">
                                        <img src="https://cf.shopee.vn/file/6b1ffcde1ff12621088110f419a5283a"
                                            style="width: 20px; height: 20px;">
                                        <h7>Quán quen</h7>
                                    </div>
                                </div>
                                <div style=" width: 90%; display: block; margin: 0px auto; border-bottom: 1px solid
                                        #e1e1e1;padding-top:10px;">
                                </div>
                                <div class="row" style="padding-top: 10px;">
                                    <div class="col-1">
                                    	<a href="${pageContext.request.contextPath}/product?id=${item.getID()}">
                                        <img src="${item.getImages().get(0)}"
                                            style="width:80px; height: 80px;"></a>
                                    </div>
                                    <div class="col-9" style="padding-left: 30px;">
                                        <span>${item.getHeader()}</span>
                                    </div>
                                    <div class="col-2 text-right">
                                        <div class="text-de"><fmt:formatNumber
																value="${item.getPrices()}"
																minFractionDigits="0" maxFractionDigits="0" />đ</div>
                                        <span><fmt:formatNumber
																value="${item.getPrices()*(1-item.getDiscount())}"
																minFractionDigits="0" maxFractionDigits="0" />đ</span>

                                    </div>
                                </div>
                            </div>
								
							</c:forEach>
                            
                            <table class="table table-borderless text-right">
                                <tbody>
                                    <tr>
                                        <td>Tổng tiền hàng</td>
                                        <td><fmt:formatNumber
																value="${order.getCart().getTotalPrices() }"
																minFractionDigits="0" maxFractionDigits="0" />đ</td>
                                    </tr>
                                    <tr>
                                        <td>Phí vận chuyển</td>
                                        <td><fmt:formatNumber
																value="${order.getShipment().getCost() }"
																minFractionDigits="0" maxFractionDigits="0" />đ</td>
                                    </tr>
                                    <tr>
                                        <td>Voucher từ shop</td>
                                        <td><c:if test="${order.getVoucher()!=null }">(${order.getVoucher().getName()}) -<fmt:formatNumber
																value="${order.getCart().getTotalPrices()*order.getVoucher().getDiscountPercent()/100 }"
																minFractionDigits="0" maxFractionDigits="0" />đ</c:if></td>
                                    </tr>
                                    <tr>
                                        <td>Tổng tiền</td>
                                        <td><fmt:formatNumber
																value="${order.getTotalAmount() }"
																minFractionDigits="0" maxFractionDigits="0" />đ</td>
                                    </tr>
                                    <tr>
                                        <td>Phương thức vận chuyển</td>
                                        <td>${order.getShipment().getType() }</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="col-12 text-right">
                            	<c:if test = "${order.getStatus()=='process'}">
									<a href="${pageContext.request.contextPath}/cancelorder?id=${order.getID()}" type="button" class="btn btn-cancel">Hủy đơn hàng</a>
								</c:if>
                                
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
	<%@include file="Footer.jsp" %>
</body>

</html>