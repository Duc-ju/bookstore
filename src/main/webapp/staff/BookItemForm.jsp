<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title><c:if test="${bookItem!=null}">Cập nhật thông tin sách trên web</c:if><c:if test="${bookItem==null}">Đẩy sách lên web</c:if></title>
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
                    <a class="nav-link <c:if test="${bookItem!=null}">bg-primary</c:if>" href="${pageContext.request.contextPath}/staff/listbookitem">Quản lý sách trên web</a>
                </li>
                <li><a class="<c:if test="${bookItem==null}">bg-primary</c:if>" href="${pageContext.request.contextPath}/staff/listbookpush">Thêm sách lên web</a></li>
                <li><a href="${pageContext.request.contextPath}/staff/logout">Đăng xuất</a></li>
            </ul><br>
        </div>


        <div class="col-md-9">
			<h1 class="text-center"><c:if test="${bookItem==null}">ĐƯA SÁCH LÊN WEB</c:if><c:if test="${bookItem!=null}">CẬP NHẬT THÔNG TIN SÁCH TRÊN WEB</c:if></h1>

			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">ISBN</th>
						<th scope="col">Tiêu đề</th>
						<th scope="col">Ngôn ngữ</th>
						<th scope="col">Ngày phát hàng</th>
						<th scope="col">Số trang</th>
						<th scope="col">Danh mục</th>
						<th scope="col">Tác giả</th>
						<th scope="col">Nhà phát hành</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row"><c:if test="${bookItem==null}">${book.getID()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getID() }</c:if></th>
						<td><c:if test="${bookItem==null}">${book.getISBN()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getISBN() }</c:if></td>
						<td><c:if test="${bookItem==null}">${book.getTitle()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getTitle() }</c:if></td>
						<td><c:if test="${bookItem==null}">${book.getLanguage()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getLanguage() }</c:if></td>
						<td><c:if test="${bookItem==null}">${book.getPublicationDate()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getPublicationDate() }</c:if></td>
						<td><c:if test="${bookItem==null}">${book.getNumberOfPage()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getNumberOfPage() }</c:if></td>
						<td><c:if test="${bookItem==null}">${book.getCategory().getName()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getCategory().getName() }</c:if></td>
						<td><c:if test="${bookItem==null}">${book.getAuthor().getName()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getAuthor().getName() }</c:if></td>
						<td><c:if test="${bookItem==null}">${book.getPublisher().getName()}</c:if><c:if test="${bookItem!=null}">${bookItem.getBook().getPublisher().getName() }</c:if></td>
				</tbody>
			</table>
			<!-- Book Start -->
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="m-heading-1 border-grey-mint m-bordered">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-12 text-center">
                                        <h4 style="font-size: 18px;font-weight: 700; padding-bottom: 20px;">
                                            THÔNG TIN SÁCH TRÊN WEB
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <form action="<c:if test="${bookItem==null}">?id=${book.getID() }</c:if><c:if test="${bookItem!=null}">${pageContext.request.contextPath}/staff/updatebookitem?id=${bookItem.getID() }</c:if>" method="post">
                            
							 <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Barcode
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="barcode" placeholder="Barcode" required <c:if test="${bookItem!=null}">value="${bookItem.getBarcode() }"</c:if>>
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
                                    <label class="col-md-3 control-label">Giá
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="number" class="form-control" name="prices" placeholder="Giá" required <c:if test="${bookItem!=null}">value="${bookItem.getPrices() }"</c:if>>
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
                                    <label class="col-md-3 control-label">Ảnh
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Ảnh"id="image">
                                            <span class="input-group-btn">
                                                <a class="btn btn-default tooltips" onclick="addImage()">
                                                    Thêm
                                                </a>
                                            </span>
                                        </div>
                                        
                                       <div class="checkbox text-left" id="imageList">
                                       		<c:if test="${bookItem!=null }">
                                       			<c:forEach items="${bookItem.getImages()}" var="image">
                                       				<div>
                                       					<label><input type="checkbox" value="${image}" name="image" checked>${image }</label>
                                       				</div>
                                       			</c:forEach>
                                       		</c:if>
										  
										</div>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Chi tiết
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
		                                        <div class="input-group">
		                                            <textarea class="form-control" rows="5"
		                                                placeholder="Chi tiết"
		                                                style="width: 605px;" name="description" ><c:if test="${bookItem!=null}">${bookItem.getDescription() }</c:if></textarea>
		                                        </div>
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
                                            <input type="text" class="form-control" name="header"
                                                placeholder="Tiêu đề" required <c:if test="${bookItem!=null}">value="${bookItem.getHeader() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-paragraph"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                                 <br>

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Giảm giá
                                        <span style="color: #e02222">[*]</span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="discount"
                                                placeholder="Giảm giá" required <c:if test="${bookItem!=null}">value="${bookItem.getDiscount() }"</c:if>>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default tooltips">
                                                    <i class="fa fa-calendar"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <div class="row text-center" style="padding-top: 30px;">
                            <button type="submit" class="btn btn-blue"><c:if test="${bookItem!=null}">Cập nhật</c:if><c:if test="${bookItem==null}">Thêm</c:if></button>
                        </div>
                        </form>
                      
                    </div>
                </div>
            </div>
            <!-- Book End -->

		</div>
    </div>
	<script>
		addImage = ()=>{
			let image = document.getElementById('image').value;
			if(image==='') return
            let div = document.createElement('div');
            let newCheckBox= document.createElement('input');
            let newLabel = document.createElement('label');
            let note = document.createTextNode(image);
            newCheckBox.type="checkbox";
            newCheckBox.name="image"
            newCheckBox.checked = true;
            newCheckBox.value = image;
            newLabel.appendChild(newCheckBox);
            newLabel.appendChild(note)
            div.appendChild(newLabel);
            document.getElementById('imageList').appendChild(div);
            document.getElementById('image').value = ''
		}
	</script>
</body>

</html>