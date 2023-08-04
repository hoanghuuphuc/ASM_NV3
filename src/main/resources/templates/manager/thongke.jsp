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

				<div>
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="pills-home-tab"
								data-toggle="pill" data-target="#pills-home" type="button"
								role="tab" aria-controls="pills-home" aria-selected="true">Thống
								kê theo thời gian</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="pills-profile-tab"
								data-toggle="pill" data-target="#pills-profile" type="button "
								role="tab" aria-controls="pills-profile" aria-selected="false">Thống
								kế theo hãng</button>
						</li>

					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<form action="/quanly/thongkethoigian">
								<div class="row">
									<div class="col-6">
										Ngày bắt đầu: <input type="date" class="form-control"
											name="startDate">
									</div>
									<div class="col-6">
										Ngày kết thúc: <input type="date" class="form-control"
											name="endDate">
									</div>
								</div>
								<button type="submit" class="btn btn-primary mt-3 mb-3">Xem
									thống kê</button>
							</form>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Ngày Đặt Hàng</th>
										<th scope="col">Tên Khách Hàng</th>
										<th scope="col">Số Lượng</th>
										<th scope="col">Tổng Giá</th>

									</tr>
								</thead>
								<tbody>
									<c:set var="totalTongGia" value="0" />
									<c:forEach var="items" items="${listkthoigian}" varStatus="status">
										<tr>
											<td >${status.count}</td>
											<td>${items.ngayDat}</td>
											<td>${items.tenKhachHang}</td>
											<td>${items.soLuong}</td>
											<td><fmt:formatNumber value="${items.tongGia}"
													pattern="#,### đ" /></td>

										</tr>
										<c:set var="totalTongGia"
											value="${totalTongGia + items.tongGia}" />
									</c:forEach>


								</tbody>
							</table>
							<div class="form-group">
								<label for="tongtien">Tổng tiền:</label> <strong><fmt:formatNumber
										value="${totalTongGia}" pattern="#,### đ" /></strong>
							</div>
						</div>

						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<div class="input-group">
								<form action="/quanly/thongkehang" method="post" id="myForm">






									<select class="custom-select" name="mahang"
										onchange="submitForm()">
										<option value="">-- Chọn Hãng --</option>
										<c:forEach var="item" items="${itemhang}">
											<option value="${item.mahang}">${item.tenhang}</option>
										</c:forEach>
									</select>
									<!-- <button type="button" onclick="submitForm()" class="btn btn-primary mt-3 mb-3">Xem
										thống kê</button> -->
								</form>

							</div>
							<table class="table table-bordered mt-3 mb-3">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Ngày Đặt Hàng</th>
										<th scope="col">Tên Sản phẩm</th>
										<th scope="col">Hãng Sản Xuất</th>
										<th scope="col">Số Lượng</th>
										<th scope="col">Tổng giá</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="totalTongGiaHang" value="0" />
									<c:set var="tongslsp" value="0" />
									<c:forEach var="items" items="${thongKeList}" varStatus="status">
										<tr>
											<th scope="row">${status.count}</th>
											<td>${items.ngayTao}</td>
											<td>${items.tenSp}</td>
											<td>${items.tenHang}</td>
											<td>${items.soLuong}</td>
											<td><fmt:formatNumber value="${items.tongGia}"
													pattern="#,### đ" /></td>
										</tr>
										<c:set var="totalTongGiaHang"
											value="${totalTongGiaHang + items.tongGia}" />
										<c:set var="tongslsp" value="${tongslsp + items.soLuong}" />
									</c:forEach>

								</tbody>
							</table>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<h4>
											Tổng tiền bán của hãng là: <strong><fmt:formatNumber
													value="${totalTongGiaHang}" pattern="#,### đ" /></strong>
										</h4>
									</div>
									<div class="col-md-6 text-right">
										<h5>
											Số lượng bán được: <strong>${tongslsp}</strong>
										</h5>
									</div>
								</div>

							</div>




						</div>

					</div>



				</div>



			</div>
		</div>

	</div>



	<!-- footer section -->
	<%@include file="/WEB-INF/views/footer/footer.jsp"%>


	<script>
		function submitForm() {
			document.getElementById("myForm").submit();
		}
	</script>




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
	
	<!-- End Google Map -->
</body>

</html>