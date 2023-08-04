<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Timups</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- font awesome style -->
<link href="/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="/css/responsive.css" rel="stylesheet" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function removeSuccessParamFromURL() {
    if (window.history && window.history.replaceState) {
        var url = window.location.href;
        var urlParams = new URLSearchParams(window.location.search);
        urlParams.delete('success');
        var newURL = url.split('?')[0] + '?' + urlParams.toString();
        window.history.replaceState({}, '', newURL);
    }
}
	// Kiểm tra query parameter và hiển thị thông báo thành công
	window.onload = function() {
		var urlParams = new URLSearchParams(window.location.search);
		var successParam = urlParams.get('success');
		if (successParam === 'true') {
			showSuccessMessage("Thêm sản phẩm thành công");
			removeSuccessParamFromURL();
		}
		if (successParam === 'update') {
			showSuccessMessage("cập nhật sản phẩm thành công");
			removeSuccessParamFromURL();
		}
		if (successParam === 'delete') {
			showSuccessMessage("Xóa sản phẩm thành công");
			removeSuccessParamFromURL();
		}
	}

	function showSuccessMessage(message) {
		swal("Thông báo", message, "success");
	}
</script>

<style>
.form-frame {
	margin-bottom: 5px;
	margin-top: 5px;
	border: 1px solid #ccc;
	padding: 130px;
	border-radius: 1px;
}

.mgs_errors {
	color: red;
	font-style: italic;
}
</style>

</head>

<body>
	<div class="hero_area">

		<%@include file="/WEB-INF/views/header/headerad.jsp"%>


		<div class="container ">
			<!-- <div class="row">
				 <div class="col-3">
					<br>
					<div
						class="card-body text-center border border-dark mr-bottom  mb-3">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
							alt="avatar" class="rounded-circle img-fluid"
							style="width: 150px;">
						<h5 class="my-3">ADMIN</h5>
						<div class="d-flex justify-content-center mb-2">
							<button class="btn btn-outline-danger  " type="submit">Đăng
								xuất</button>
						</div>
					</div>

				</div> -->

			<br>

			<form:form action="/quanly/hangsx" modelAttribute="hsx">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="product-name">Mã hãng</label>
							<form:input path="mahang" class="form-control" id="mahang"
								placeholder="Nhập mã sản phẩm" />
							<form:errors path="mahang" cssClass="mgs_errors"></form:errors>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="description">Tên hãng</label>
							<form:input path="tenhang" class="form-control"
								placeholder="Nhập hãng" />
							<form:errors path="tenhang" cssClass="mgs_errors" />
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="product-name">Địa chỉ</label>
							<form:input path="diachi" class="form-control" id="diachi"
								placeholder="Nhập địa chỉ" />
							<form:errors path="diachi" cssClass="mgs_errors" />
						</div>
					</div>
					<div class="col-md-12">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="list-home"
								role="tabpanel" aria-labelledby="list-home-list">
								<nav class="navbar navbar-primary bg-primary ">
									<form class="form-inline">
										<input class="form-control mr-sm-2" type="text"
											placeholder="Tìm kiếm hãng" aria-label="Tìm kiếm sản phẩm"
											name="keywords2" style="width: 400px">
										<button class="btn btn-light my-2 my-sm-0" type="submit"
											style="margin-left: -390px;">
											<i class="fa fa-search" aria-hidden="true"></i>
										</button>
									</form>
									<div class="text-right">
										<button formaction="/quanly/create" class="btn btn-danger">Thêm
										</button>
										<button formaction="/quanly/hangsx" class="btn btn-success">Làm
											mới</button>
										<button formaction="/quanly/update" class="btn btn-warning">Cập
											nhật</button>
									</div>
								</nav>
							</div>
						</div>
					</div>

				</div>

			</form:form>



			<table class="table table-hover mt-2">
				<thead>
					<tr>
						<th scope="col">Mã sản phẩm</th>
						<th scope="col">Hãng sản phẩm</th>
						<th scope="col">Địa chỉ</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${page.content}">
						<tr>
							<th>${item.mahang}</th>
							<td>${item.tenhang}</td>
							<td>${item.diachi}</td>
							<td><a href="/quanly/hangsx/edit/${item.mahang}"><i
									class="fa fa-pencil" aria-hidden="true"></i></a> <a
								href="/quanly/hangsx/delete/${item.mahang}"><i
									class="fa fa-trash" aria-hidden="true"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<nav aria-label="Page navigation example" class="mt-3"
				style="margin-left: 400px">
				<ul class="pagination">
					<li class="page-item  ${page.number == 0 ? 'disabled' : ''}"><a class="page-link"
						href="/quanly/hangsx?p=${page.number-1}"
						tabindex="-1">Previous</a></li>
						
						
						
					<c:forEach begin="1" end="${page.totalPages}" step="1" var="number">
						<li class="page-item"><a class="page-link"
							href="/quanly/hangsx?p=${number-1}">${number}</a>
						</li>
					</c:forEach>
					<li class="page-item"><a class="page-link"
						href="/quanly/hangsx?p=${page.number+1}">Next</a>
					</li>
				</ul>
			</nav>

		</div>
	</div>
	</div>



	

	<!-- footer section -->

	<!-- jQery -->
	<script src="/js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
	<!-- bootstrap js -->
	<script src="/js/bootstrap.js"></script>
	<!-- owl slider -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
		
	</script>
	<!-- custom js -->
	<script src="/js/custom.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
	<!-- End Google Map -->
</body>

</html>