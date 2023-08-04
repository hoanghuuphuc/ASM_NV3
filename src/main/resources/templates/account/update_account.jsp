<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<title>Cập nhật tài khoản</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/DetailsProduct_UpdateAccount.css"
	type="text/css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<!-- Custom styles for this template -->
<link href="/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="/css/responsive.css" rel="stylesheet" />



</head>
<body class="sub_page">

	<div class="hero_area ">

		<!-- header section strats -->
		<%@include file="/WEB-INF/views/header/header.jsp"%>
		<!-- end header section -->
	</div>

	<!-- UPDATE section -->

	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: 30px;">
				<h1 class="text-center">Cập Nhật Thông Tin Tài Khoản</h1>
				<h5 class="text-center">(Cập nhật đầy đủ thông tin của bạn để
					tiếp tục mua hàng)</h5>
			</div>
			<form:form action="update" method="post" modelAttribute="kh">
				<div class="panel-body" style="margin-bottom: 30px;">
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label for="">Tên:</label> <form:input path="hotenkh" type="text"
									class="form-control" placeholder="Nhập tên"/>
							</div>
							<div class="form-group">
								<label for="">Email:</label> <form:input path="email"
									type="email" class="form-control" 
									placeholder="Nhập email"/>
							</div>
							<div class="form-group">
								<label for="">Số điện Thoại:</label> <form:input
									 type="text" class="form-control"
									path="sdt" placeholder="Nhập số điện thoại"/>
							</div>
							<div class="form-group">
								<label for="">Giới Tính:</label> <form:radiobuttons path="gioitinh" items="${list_gt}" />
							</div>
							

						</div>


						<div class="col-lg-6">
							<div class="form-group">
								<label for="select-input">Tỉnh: </label> <select
									class="form-control" id="select-input" name="tinhthanhpho">
									<option value="">-- Chọn Tỉnh --</option>
									<c:forEach var="item" items="${items}">
									
										<option value="${item.id}">${item.tentinhthanhpho}</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group">
								<label for="select-input">Huyện:</label> <select
									class="form-control" id="select-input">
									<option value="">-- Chọn Huyện --</option>
									<option value="option1">Option 1</option>
									<option value="option2">Option 2</option>
									<option value="option3">Option 3</option>
								</select>
							</div>
							<div class="form-group">
								<label for="select-input">Xã/Phường:</label> <select
									class="form-control" id="select-input">
									<option value="">-- Chọn --</option>
									<option value="option1">Option 1</option>
									<option value="option2">Option 2</option>
									<option value="option3">Option 3</option>
								</select>
							</div>
							<div class="form-group">
								<label for="text">Địa chỉ cụ thể:</label><br>
								<form:textarea path="diachi" cols="66" class="form-control" rows="2"
									placeholder="Nhập địa chỉ (ví dụ: số nhà,tên đường...)"/>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<h9>*Xác nhận đầy đủ thông tin chính xác rồi ấn cập nhật</h9>


							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<button class="btn btn-primary ">Cập Nhật</button>
							</div>
						</div>
					</div>
				</div>




			</form:form>

		</div>
	</div>

	<!-- end Update section -->

	<!-- footer section -->
	<%@include file="/WEB-INF/views/footer/footer.jsp"%>

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- owl slider -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
		
	</script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
	<!-- Google Map -->

	<!-- End Google Map -->
</body>
</html>