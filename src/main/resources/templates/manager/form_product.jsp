<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- font awesome style -->
<link href="/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="/css/responsive.css" rel="stylesheet" />
<style>
.form-frame {
	margin-bottom: 5px;
	margin-top: 5px;
	border: 1px solid #ccc;
	padding: 125px;
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
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list"></div>
			</div>
			<form:form action="/quanly/product/create" modelAttribute="sp"
				enctype="multipart/form-data">
				<div class="row">

					<div class="col-4">

						<div class="form-frame " style="height: 400px">
							<label for="image"><img alt=""
								src="/images/${sp.hinhanh}"> </label>
						</div>
						<input type="file" class="form-control-file" name="photo_file"
							id="image" onchange="previewImage(event)">
						<div class="mgs_errors">${message_img}</div>

					</div>
					<div class="col-8">
						<div class="form-group">
							<label for="">Mã sản phẩm:</label>
							<form:input class="form-control" type="text" path="masp"
								disabled="true" />
						</div>

						<div class="form-group">
							<label for="">Tên sản phẩm:</label>
							<form:input class="form-control" path="tensp" />
							<form:errors path="tensp" cssClass="mgs_errors" />
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="gia">Giá sản phẩm:</label>
								<form:input class="form-control" path="gia" />
								<form:errors path="gia" cssClass="mgs_errors" />
							</div>

							<div class="form-group col-md-6">
								<label for="hangsx">Hãng sản xuất:</label>
								<form:select path="hangsanxuat.mahang" class="form-control">
									<form:option value="">Chọn hãng</form:option>
									<form:options values="${list_hangsanxuat}"
										items="${list_hangsanxuat}" />
								</form:select>

							</div>
						</div>

						<div class="form-group">
							<label for="mota">Mô tả:</label>
							<form:textarea class="form-control" path="mota" rows="4"></form:textarea>
							<form:errors path="mota" cssClass="mgs_errors" />
						</div>

						<div class="modal-footer">
							<button class="btn btn-primary"
								formaction="/quanly/product/create">Thêm sản phẩm mới</button>
							<button formaction="/quanly/product/updatesp"
								class="btn btn-primary">Cập nhật</button>
							<a href="/quanly/product" class="btn btn-secondary">Làm mới</a>
						</div>
					</div>
			</form:form>

		</div>

		<nav class="navbar navbar-primary ">

			<form class="form-inline" method="post">
				<input class="form-control mr-sm-2" type="Tìm kiếm sản phẩm"
					placeholder="Tìm kiếm sản phẩm" aria-label="Tìm kiếm sản phẩm"
					name="keywords">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>

			</form>

		</nav>
		<table class="table table-hover mt-2">
			<thead>
				<tr>
					<th scope="col">Mã sản phẩm <a
						href="/quanly/product?field=masp&sort=${param.field eq 'masp' and param.sort eq 'asc' ? 'desc' : 'asc'}">
							<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i>
					</a>
					</th>
					<th scope="col">Hãng sản phẩm <a
						href="/quanly/product?field=hangsanxuat.tenhang&sort=${param.field eq 'hangsanxuat.tenhang' and param.sort eq 'asc' ? 'desc' : 'asc'}">
							<i class="fa fa-sort-alpha-asc" aria-hidden="true"></i>
					</a>
					</th>
					<th scope="col">Tên sản phẩm <a
						href="/quanly/product?field=tensp&sort=${param.field eq 'tensp' and param.sort eq 'asc' ? 'desc' : 'asc'}">
							<i class="fa fa-sort-alpha-asc" aria-hidden="true"></i>
					</a>
					</th>
					<th scope="col">Giá <a
						href="/quanly/product?field=gia&sort=${param.field eq 'gia' and param.sort eq 'asc' ? 'desc' : 'asc'}">
							<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i>
					</a>
					</th>
					<th scope="col">Ảnh</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${page.content}">
					<tr>
						<td>${item.masp}</td>
						<td>${item.hangsanxuat.tenhang}</td>
						<td>${item.tensp}</td>
						<td><fmt:formatNumber value="${item.gia}" pattern="#,### đ" /></span></td>
						<td><img src="/images/${item.hinhanh}" width="60px"></td>
						<td><a href="/quanly/product/edit/${item.masp}"><i
								class="fa fa-pencil text-success" aria-hidden="true"></i></a></td>
						<td><a href="/quanly/product/delete/${item.masp}"><i
								class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<nav aria-label="Page navigation example" class="mt-3"
			style="margin-left: 400px">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="/quanly/product?p=${page.number-1}&field=${param.field}&sort=${param.sort}"
					tabindex="-1">Previous</a></li>
				<c:forEach begin="1" end="${page.totalPages}" step="1" var="number">
					<li class="page-item"><a class="page-link"
						href="/quanly/product?p=${number-1}&field=${param.field}&sort=${param.sort}">${number}</a>
					</li>
				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="/quanly/product?p=${page.number+1}&field=${param.field}&sort=${param.sort}">Next</a>
				</li>
			</ul>
		</nav>


	</div>

	<script type="text/javascript">
		function previewImage(event) {
			var input = event.target;
			var reader = new FileReader();

			reader.onload = function() {
				var img = document.createElement("img");
				img.src = reader.result;

				var formFrame = document.querySelector(".form-frame");
				formFrame.innerHTML = "";
				formFrame.appendChild(img);
			};

			reader.readAsDataURL(input.files[0]);
		}
	</script>


	<!-- footer section -->

	<!-- jQery -->
	<script src="/js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
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
			if (successParam === 'delete') {
				showSuccessMessage("Xoá sản phẩm thành công");
				removeSuccessParamFromURL();
			}
		}

		function showSuccessMessage(message) {
			swal("Thông báo", message, "success");
		}
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