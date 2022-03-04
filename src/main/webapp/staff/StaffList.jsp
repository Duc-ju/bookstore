<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Danh sách nhân viên</title>
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
                    <a class="nav-link bg-primary" href="${pageContext.request.contextPath}/staff/liststaff">Quản lý nhân viên</a>
                </li>
                <li><a >Thêm nhân viên</a></li>
                <li><a href="${pageContext.request.contextPath}/staff/logout">Đăng xuất</a></li>
            </ul><br>
        </div>


        <div class="col-md-9">
			<h1 class="text-center">DANH SÁCH NHÂN VIÊN</h1>
		<div class="">
			<a href="${pageContext.request.contextPath}/staff/addstaff?type=admin" class="btn btn-light mr-0">Thêm nhân viên admin</a>
			<a href="${pageContext.request.contextPath}/staff/addstaff?type=warehouse" class="btn btn-light mr-0">Thêm nhân viên kho</a>
			<a href="${pageContext.request.contextPath}/staff/addstaff?type=website" class="btn btn-light mr-0">Thêm nhân viên website</a>
		</div>
		
		<table class="table table-striped">
			<thead>
			  <tr>
			    <th scope="col">ID</th>
			    <th scope="col">Tên đầy đủ</th>
			    <th scope="col">Địa chỉ</th>
			    <th scope="col">Lương</th>
			    <th scope="col">Tuổi</th>
			    <th scope="col">Giới tính</th>
			    <th scope="col">Năm kinh nghiệm</th>
			    <th scope="col">Loại nhân viên</th>
			    <th scope="col">Thao tác</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach items="${staffs}" var="staff">
				  <tr>
				    <th scope="row">${staff.getID()}</th>
				    <td>${staff.getFullName().toString()}</td>
				    <td>${staff.getAddress().getCity()}</td>
				    <td>${staff.getSalary()}</td>
				    <td>${staff.getAge()}</td>
				    <td>${staff.getGender()}</td>
				    <td>${staff.getExpYear()}</td>
				    <td>
				    	<c:if test="${staff.getClass().getName()=='model.staff.AdminStaff'}">Nhân viên Admin</c:if>
				    	<c:if test="${staff.getClass().getName()=='model.staff.WarehouseManageStaff'}">Nhân viên kho</c:if>
				    	<c:if test="${staff.getClass().getName()=='model.staff.WebsiteManageStaff'}">Nhân viên website</c:if>
				    </td>
				    <td>
					    <a href="${pageContext.request.contextPath}/staff/updatestaff?id=${staff.getID() }" class="btn btn-primary">Cập nhật</a>
					    <a href="${pageContext.request.contextPath}/staff/deletestaff?id=${staff.getID() }" class="btn btn-light">Xóa</a>
				    </td>
				  </tr>
			 </c:forEach>
			</tbody>
		      </table>
           
        </div>
    </div>

</body>

</html>