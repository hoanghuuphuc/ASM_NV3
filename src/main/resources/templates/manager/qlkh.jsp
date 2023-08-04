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
<link rel="stylesheet" type="/text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- font awesome style -->
<link href="/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="/css/responsive.css" rel="stylesheet" />
</head>

<body>
	<%@include file="/WEB-INF/views/header/headerad.jsp"%>
	<div class="container ">
		<div class="row">
			<div class="col-12">
				<nav class="navbar navbar-primary bg-primary ">
					<form class="form-inline" method="post">
						<input class="form-control mr-sm-2" name="keywords4"
							type="Tìm kiếm thông tin khách hàng"
							placeholder="Tìm kiếm thông tin khách hàng"
							aria-label="Tìm kiếm thông tin khách hàng">
						<button class="btn btn-light my-2 my-sm-0" type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</nav>
				<table class="table table-striped">
					<thead>
						<tr>
							
							<th>Họ Tên</th>
							<th>Địa chỉ</th>
							<th>SĐT</th>
							<th>Email</th>
							<th>Giới Tính</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${itemkh}">
							<tr>
								
								<td>${item.hotenkh }</td>
								<td>${item.diachi }</td>
								<td>${item.sdt }</td>
								<td>${item.email }</td>
								<td>${item.gioitinh?'Nam':'Nữ'}</td>
								<td>${item.trangthaikh?'Đang hoạt động':'Ngưng hoạt động'}</td>
								<td><a href="capnhatkh/${item.makh }"> <i class="fa fa-wrench fa-2x" aria-hidden="true"></i></a></td>
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
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