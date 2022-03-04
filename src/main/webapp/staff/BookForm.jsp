<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title><c:if test="${book!=null}">Cập nhật thông tin sách</c:if><c:if test="${book==null}">Thêm sách</c:if></title>
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
                    <a class="nav-link <c:if test="${book!=null}">bg-primary</c:if>" href="${pageContext.request.contextPath}/staff/listbook">Quản lý sách trong kho</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/staff/addbook" class="<c:if test="${book==null}">bg-primary</c:if>">Thêm sách vào kho</a></li>
                <li><a href="${pageContext.request.contextPath}/staff/logout">Đăng xuất</a></li>
            </ul><br>
        </div>


        <div class="col-md-9">
			
			<!-- Book Start -->
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="m-heading-1 border-grey-mint m-bordered">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-12 text-center">
                                        <h4 style="font-size: 18px;font-weight: 700; padding-bottom: 20px;">
                                            THÔNG TIN SÁCH
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <form action="<c:if test="${book==null}">?type=book</c:if><c:if test="${book!=null}">${pageContext.request.contextPath}/staff/updatebook?id=${book.getID() }&type=book</c:if>" method="post">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tác giả
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <select class="form-control" name="author" style="width: 605px;" required>
                                            	<c:forEach items="${authors}" var="author">
                                            		<option value="${author.getID()}" <c:if test="${book!=null&&book.getAuthor().getID()==author.getID()}">selected</c:if>>${author.getName() }</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Nhà phát hành
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <select class="form-control" name="publisher" style="width: 605px;" required>
                                                <c:forEach items="${publishers}" var="publisher">
                                            		<option value="${publisher.getID()}" <c:if test="${book!=null&&book.getPublisher().getID()==publisher.getID()}">selected</c:if>>${publisher.getName() }</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>
                            
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Danh mục
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <select class="form-control" name="category" style="width: 605px;" required>
                                                <c:forEach items="${categories}" var="category">
                                            		<option value="${category.getID()}" <c:if test="${book!=null&&book.getCategory().getID()==category.getID()}">selected</c:if>>${category.getName() }</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>
							 <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">ISBN
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="ISBN" placeholder="ISBN" required <c:if test="${book!=null}">value="${book.getISBN() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-align-center"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tiêu đề
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="title" placeholder="Tiêu đề" required <c:if test="${book!=null}">value="${book.getTitle() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-align-center"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Ngôn ngữ
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="language"
                                                placeholder="Ngôn ngữ" required <c:if test="${book!=null}">value="${book.getLanguage() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-globe"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Ngày phát hành
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="date" class="form-control" name="publicationDate"
                                                placeholder="Ngày phát hành yyyy-mm-dd" required <c:if test="${book!=null}">value="${book.getPublicationDate() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-calendar"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Số trang
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="numberOfPage"
                                                placeholder="Số trang" required <c:if test="${book!=null}">value="${book.getNumberOfPage() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-paragraph"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <div class="row text-center" style="padding-top: 30px;">
                            <button type="submit" class="btn btn-blue"><c:if test="${book!=null}">Cập nhật</c:if><c:if test="${book==null}">Thêm</c:if></button>
                        </div>
                        </form>
                      
                    </div>
                </div>
            </div>
            <!-- Book End -->
            <!-- Author Start -->
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="m-heading-1 border-grey-mint m-bordered">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-12 text-center">
                                        <h4 style="font-size: 18px;font-weight: 700; padding-bottom: 20px;">
                                            THÔNG TIN TÁC GIẢ
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <form action="<c:if test="${book==null}">?type=author</c:if><c:if test="${book!=null}">${pageContext.request.contextPath}/staff/updatebook?id=${book.getID() }&type=author</c:if>" method="post">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tên tác giả
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="name"
                                                placeholder="Tên tác giả" required <c:if test="${book!=null}">value="${book.getAuthor().getName() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-user-circle"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tiểu sử
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <textarea class="form-control" rows="5"
                                                placeholder="Tiểu sử (Không Bắt Buộc) | Nhập tối đa 120 ký tự"
                                                style="width: 605px;" name="biography" <c:if test="${book!=null}">value="${book.getAuthor().getBiography() }"</c:if>></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Email
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="mail" placeholder="Email" required <c:if test="${book!=null}">value="${book.getAuthor().getEmail() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-envelope"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Địa chỉ
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="address"
                                                placeholder="Địa chỉ" required <c:if test="${book!=null}">value="${book.getAuthor().getAddress() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-map-marker"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="row text-center" style="padding-top: 30px;">
                            <button type="submit" class="btn btn-blue"><c:if test="${book!=null}">Cập nhật</c:if><c:if test="${book==null}">Thêm</c:if></button>
                        </div>
                        </form>
                       
                    </div>
                </div>
            </div>
            <!-- Author End -->

            <!-- Publisher Start -->
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="m-heading-1 border-grey-mint m-bordered">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-12 text-center">
                                        <h4 style="font-size: 18px;font-weight: 700; padding-bottom: 20px;">
                                            THÔNG TIN NHÀ PHÁT HÀNH
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <form action="<c:if test="${book==null}">?type=publisher</c:if><c:if test="${book!=null}">${pageContext.request.contextPath}/staff/updatebook?id=${book.getID() }&type=publisher</c:if>" method="post">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tên nhà phát hành
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="name"
                                                placeholder="Tên nhà phát hành" required <c:if test="${book!=null}">value="${book.getPublisher().getName() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-building"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Địa chỉ
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="address" placeholder="Địa chỉ" required <c:if test="${book!=null}">value="${book.getPublisher().getAddress() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-map-marker"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row text-center" style="padding-top: 30px;">
                            <button type="submit" class="btn btn-blue"><c:if test="${book!=null}">Cập nhật</c:if><c:if test="${book==null}">Thêm</c:if></button>
                        </div>

                        </form>
                        
                    </div>
                </div>
            </div>
            <!-- Publisher End -->

            <!-- Catedory Start -->
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="m-heading-1 border-grey-mint m-bordered">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-12 text-center">
                                        <h4 style="font-size: 18px;font-weight: 700; padding-bottom: 20px;">
                                            DANH MỤC
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <form action="<c:if test="${book==null}">?type=category</c:if><c:if test="${book!=null}">${pageContext.request.contextPath}/staff/updatebook?id=${book.getID() }&type=category</c:if>" method="post">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tên danh mục
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="name"
                                                placeholder="Tên danh mục" required <c:if test="${book!=null}">value="${book.getCategory().getName() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-building"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row text-center" style="padding-top: 30px;">
                            <button type="submit" class="btn btn-blue"><c:if test="${book!=null}">Cập nhật</c:if><c:if test="${book==null}">Thêm</c:if></button>
                        </div>

                        </form>
                        
                    </div>
                </div>
            </div>
            <!-- Category End -->

            
        </div>
    </div>

</body>

</html>