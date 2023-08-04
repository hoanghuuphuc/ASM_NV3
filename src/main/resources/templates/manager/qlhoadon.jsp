<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
</style>
</head>

<body>
	<div class="hero_area">
		<%@include file="/WEB-INF/views/header/headerad.jsp"%>

		<div class="container ">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list">
					<nav class="navbar navbar-primary bg-primary ">

						<form action="/quanly/hoadon" method="post" id="myForm">

							<select class="custom-select" name="trangthai"
								onchange="submitForm()">
								<option value="">-- Trạng thái đơn hàng --</option>
								<option value="false">Đã xác nhận</option>
								<option value="true">Đang xử lý</option>
							</select>
							<!-- <button type="button" onclick="submitForm()" class="btn btn-primary mt-3 mb-3">Xem
										thống kê</button> -->
						</form>
						<a href=""><i class="fa fa-sign-out text-light"
							aria-hidden="true"></i></a>
					</nav>
				</div>
			</div>


			<table class="table table-hover mt-2">
				<thead>
					<tr>
						<th scope="col">Mã hóa đơn</th>
						<th scope="col">Tên khách hàng</th>
						<th scope="col">Địa chỉ giao</th>
						<th scope="col">SĐT</th>
						<th>Số lượng</th>
						<th>Tổng giá</th>
						<th>Trạng thái</th>
						<th>Ngày đặt</th>
						<th></th>
					</tr>
				</thead>
				<tbody>



					<c:forEach var="item" items="${itemhd}">
						<tr>
							<td>${item.mahd }</td>

							<td>${item.khachhang.hotenkh}</td>
							<td>${item.diachigiao}</td>
							<td>${item.dienthoai }</td>
							<td>${item.soluong}</td>
							<td><fmt:formatNumber value="${item.tonggia}"
									pattern="#,### đ" /></td>
							<td>${item.trangthai?'Đang xử lý':'Đã xác nhận'}</td>
							<td>${item.ngaytao}</td>

							<td><c:choose>
									<c:when test="${item.trangthai == 'Đã xác nhận'}">
										<!-- Hiển thị thông báo không cho phép hủy đơn hàng -->
										<td><a href="capnhathoadon/${item.mahd}"> <i
												class="fa fa-wrench fa-2x" aria-hidden="true"></i></a></td>
									</c:when>

									<c:otherwise>
										<!-- Hiển thị nút Hủy đơn hàng -->
										<td><a href="capnhathoadon/${item.mahd}"> <i
												class="fa fa-wrench fa-2x" aria-hidden="true"></i></a></td>
										<td><a href="xoadonhang/${item.mahd}"> <i
												class=" fa fa-trash fa-2x text-danger" aria-hidden="true"></i></a></td>
									</c:otherwise>

								</c:choose></td>


						</tr>

					</c:forEach>
				</tbody>

			</table>

		</div>
	</div>

	<!-- footer section -->
	<%@include file="/WEB-INF/views/footer/footer.jsp"%>
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
		function submitForm() {
			document.getElementById("myForm").submit();
		}
	</script>
	
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
					showSuccessMessage("Xóa đơn hàng thành công");
					removeSuccessParamFromURL();
				}
				if (successParam === 'editTT') {
					showSuccessMessage("Sửa trạng thái đơn hàng thành công");
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