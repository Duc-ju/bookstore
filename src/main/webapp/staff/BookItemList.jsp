<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Sách trên web</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;1,300;1,400&display=swap"
        rel="stylesheet">
</head>
<style type="text/css">
    .btn-blue {
        background-color: #5680e9;
        color: white;
    }

    .btn-blue:hover {
        background-color: #5ab9ea;
    }

    body,
    h2,
    h3,
    h5,
    h6 {
        font-family: "Open Sans", sans-serif;
        color: #555;
        font-family: "Open Sans", sans-serif;
        font-size: 14px;
    }

    .m-heading-1.m-bordered {
        border-right: 1px solid #10161c;
        border-top: 1px solid #10161c;
        border-bottom: 1px solid #10161c;
        padding: 15px;
    }

    .m-heading-1 {
        margin: 0 0 20px;
        background: #fff;
        padding-left: 15px;
        border-left: 8px solid #88909a;
    }

</style>

<body>
	

    <div class="container-fluid" style="margin-top: 16px">

        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked">
                <li class="category">
                    <a class="nav-link bg-primary" href="${pageContext.request.contextPath}/staff/listbookitem">Quản lý sách trên web</a>
                </li>
                <li><a class="" href="${pageContext.request.contextPath}/staff/listbookpush">Thêm sách lên web</a></li>
                <li><a href="${pageContext.request.contextPath}/staff/logout">Đăng xuất</a></li>
            </ul><br>
        </div>


        <div class="col-md-9">
			<h1 class="text-center">DANH SÁCH SÁCH TRÊN WEB</h1>
		<div class="">
			<a href="${pageContext.request.contextPath}/staff/listbookpush" class="btn btn-light mr-0">Đẩy sách mới lên web</a>
		</div>
		
		<table class="table table-striped">
			<thead>
			  <tr>
			    <th scope="col">ID</th>
			    <th scope="col">BookID</th>
			    <th scope="col">Barcode</th>
			    <th scope="col">Giá</th>
			    <th scope="col">Chi tiết</th>
			    <th scope="col">Tiêu đề</th>
			    <th scope="col">Giảm giá</th>
			    <th scope="col">Thao tác</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach items="${bookItems}" var="bookItem">
				  <tr>
				    <th scope="row">${bookItem.getID()}</th>
				    <td>${bookItem.getBook().getID()}</td>
				    <td>${bookItem.getBarcode()}</td>
				    <td>${bookItem.getPrices()}</td>
				    <td>${bookItem.getDescription()}</td>
				    <td>${bookItem.getHeader()}</td>
				    <td>${bookItem.getDiscount()}</td>
				    <td>
					    <a href="${pageContext.request.contextPath}/staff/updatebookitem?id=${bookItem.getID() }" class="btn btn-primary">Cập nhật</a>
					    <a href="${pageContext.request.contextPath}/staff/deletebookitem?id=${bookItem.getID() }" class="btn btn-light">Xóa</a>
				    </td>
				  </tr>
			 </c:forEach>
			</tbody>
		      </table>
           
        </div>
    </div>

</body>

</html>