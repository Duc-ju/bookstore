<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title><c:if test="${staff!=null}">Cập nhật thông tin nhân viên</c:if><c:if test="${staff==null}">Thêm nhân viên</c:if> ${type1 }</title>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/staff/liststaff">Quản lý nhân viên</a>
                </li>
                <li><a class="bg-primary">Thêm nhân viên ${type1}</a></li>
                <li><a href="${pageContext.request.contextPath}/staff/logout">Đăng xuất</a></li>
            </ul><br>
        </div>


        <div class="col-md-9">
			<!-- Staff Start -->
            <div class="row"  >
                <div class="col-md-12">
                    <div class="m-heading-1 border-grey-mint m-bordered " style="padding: 32px">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-12 text-center">
                                        <h4 style="font-size: 18px;font-weight: 700; padding-bottom: 20px;">
                                            THÊM NHÂN VIÊN
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <form action="<c:if test="${staffUpdate==null }">${pageContext.request.contextPath}/staff/addstaff?type=${type1}</c:if><c:if test="${staffUpdate!=null }">${pageContext.request.contextPath}/staff/updatestaff?type=${type1}&id=${staffUpdate.getID() }</c:if>" method="post" class="row g-3">
                            <!-- Họ và tên -->
                            <div class="row form-group">
	                            <div class="col-md-4">
	                                <label for="fistname" class="form-label">Họ</label>
	                                <input type="text" name="fistname" class="form-control" id="fistname" value="${staffUpdate.getFullName().getFirstName()}">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="midname" class="form-label">Tên đệm</label>
	                                <input type="text" name="midname" class="form-control" id="midname" value="${staffUpdate.getFullName().getMidName()}">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="lastname" class="form-label">Tên</label>
	                                <input type="text" name="lastname" class="form-control" id="lastname" value="${staffUpdate.getFullName().getLastName()}">
	                            </div>
                            </div>
                            <!-- Username -->
                            <div class="row form-group">
	                            <div class="col-md-6">
	                                <label for="username" class="form-label">Username</label>
	                                <input type="text" name="username" class="form-control" id="username" value="${staffUpdate.getAccount().getUsername()}">
	                            </div>
	                            <!-- Password -->
	                            <div class="col-md-6">
	                                <label for="password" class="form-label">Password</label>
	                                <input type="password" name="password" class="form-control" id="password" value="${staffUpdate.getAccount().getPassword()}">
	                            </div>
                            </div>
                            <!-- Salary -->
                            <div class="form-group">
                                <label for="salary" class="form-label">Lương</label>
                                <input type="number" name="salary" class="form-control" id="salary" value="${staffUpdate.getSalary()}">
                            </div>
                            <!-- Age -->
                            <div class="form-group">
                                <label for="age" class="form-label">Tuổi</label>
                                <input type="number" name="age" class="form-control" id="age" value="${staffUpdate.getAge()}">
                            </div>

                            <!-- Gender -->
                            <div class="form-group">
                                <label for="sex" class="form-label">Giới tính</label>
                                <select class="form-control" id="sex" name="sex">
								    <option value="male" <c:if test="${staffUpdate.getGender()=='male' }">selected</c:if>>Nam</option>
								    <option value="female" <c:if test="${staffUpdate.getGender()=='female' }">selected</c:if>>Nữ</option>
								  </select>
                            </div>
                            
                              <!-- Exp Year -->
                            <div class="form-group">
                                <label for="expYear" class="form-label">Số năm kinh nghiệm</label>
                                <input type="number" name="expYear" class="form-control" id="expYear" value="${staffUpdate.getExpYear()}">
                            </div>

                            <c:if test="${type1=='admin' }">
                             <!-- Certificate -->
                            <div class="form-group">
                                <label for="certificate" class="form-label">Chứng chỉ</label>
                                <input type="text" name="certificate" class="form-control" id="certificate" value="${staffUpdate.getCertificate()}">
                            </div>
                            </c:if>
                            
                            <c:if test="${type1=='warehouse' }">
                             <!-- StorageNum	 -->
                            <div class="form-group">
                                <label for="storageNum" class="form-label">Số kho</label>
                                <input type="number" name="storageNum" class="form-control" id="storageNum" value="${staffUpdate.getStorageNum()}">
                            </div>
                            </c:if>
                            
                            <c:if test="${type1=='website' }">
                             <!-- SeoExp	 -->
                            <div class="form-group">
                                <label for="seoExp" class="form-label">Kinh nghiệm SEO</label>
                                <input type="text" name="seoExp" class="form-control" id="seoExp" value="${staffUpdate.getSeoExp()}">
                            </div>
                            </c:if>
                            
							<!-- Address -->
                            <div class="form-group">
                                <label for="province" class="form-label">Tỉnh/Thành</label>
                                <input type="text" name="province" class="form-control" id="province" value="${staffUpdate.getAddress().getCity() }">
                            </div>

                            <div class="form-group">
                                <label for="district" class="form-label">Quận/Huyện</label>
                                <input type="text" name="district" class="form-control" id="district" value="${staffUpdate.getAddress().getDistrict()}">
                            </div>

                            <div class="form-group">
                                <label for="street" class="form-label">Đường</label>
                                <input type="text" name="street" class="form-control" id="street" value="${staffUpdate.getAddress().getStreet()}">
                            </div>
							<div class="form-group">
                                <label for="numberhouse" class="form-label">Số nhà</label>
                                <input type="text" name="numberhouse" class="form-control" id="numberhouse" value="${staffUpdate.getAddress().getDetail() }">
                            </div>

                            <div class="form-group" style="padding-top: 20px;">
                            	<c:if test="${staffUpdate==null }">
                            	<button type="submit" class="btn btn-blue">Thêm</button>
                            	</c:if>
                                <c:if test="${staffUpdate!=null }">
                            	<button type="submit" class="btn btn-blue">Cập nhật</button>
                            	</c:if>
                            </div>
                        </form>
                      
                    </div>
                </div>
            </div>
            <!-- Staff End -->

		</div>
    </div>

</body>

</html>