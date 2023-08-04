<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quên mật khẩu</title>
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/sign-up.css">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<style type="text/css">
.mgs_errors {
	color: red;
	font-style: italic;
}
</style>
</head>

<body>
	<section class="signup">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Quên mật khẩu</h2>
					<form method="post" action="/account/guimailxn"
						class="register-form" id="register-form">
						<div class="form-group">
							<label for="name"><i class="fa fa-user"></i></label>
							<%--  <input
								type="text" name="name" id="name" placeholder="Tên đăng nhập"
								value="${username }" /> --%>
							<input type="text" name="name" id="name"
								placeholder="Tên đăng nhập" value="${username}"
								onblur="saveValue(this)" onfocus="restoreValue(this)" /> <span
								id="nameerror" class="mgs_errors"></span>

						</div>


						<div class="input-group">
							<label for="email"><i class="fa fa-envelope-o"></i></label> <input
								type="email" name="email" id="email"
								placeholder="Email xác nhận" value="${email}" required /> <span
								id="emailError" class="mgs_errors"></span>
							<button class="gui btn btn-primary" type="button"
								style="position: absolute; right: 10px;"
								onclick="validateForm()">Gửi</button>
						</div>

					</form>

					<div class="form-group mt-3">
						<label for="maxn"><i class="fa fa-key"></i></label> <input
							type="text" name="maxn" id="maxn" placeholder="Mã xác nhận" />

					</div>

					<input type="hidden" value="${maxnrd}" id="maxnrd"> <span
						id="" class="mgs_errors">${message}</span>
					<div class="form-group form-button">
						<!-- Small modal -->
						<!-- Button để kiểm tra mã xác nhận -->
						<!-- Button để kiểm tra mã xác nhận -->
						<button type="button" class="btn btn-primary"
							onclick="kiemTraMaXacNhan()">Kiểm tra</button>

						<!-- Modal hiển thị nếu mã xác nhận trùng -->
						<div id="myModal" class="modal fade">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Đổi mật khẩu</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="/account/doimk" id="changePasswordForm"
											method="post">
											<div class="form-group">
												<label for="pass"><i class="fa fa-key"></i></label> <input
													type="password" name="pass" id="pass"
													placeholder="Mật khẩu" />
											</div>
											<div class="form-group">
												<label for="re-pass"><i class="fa fa-unlock-alt"></i></label>
												<input type="password" name="repass" id="re_pass"
													placeholder="Xác nhận mật khẩu" />
											</div>

											<div class="modal-footer">
												<button type="button" onclick="validatePassword()"
													class="btn btn-primary">Đổi mật khẩu</button>


												<input type="hidden" class="btn btn-primary"
													name="submitted" value="false" />

												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Đóng</button>
											</div>

										</form>




									</div>

								</div>
							</div>
						</div>


						<a href="/account/login" class="btn btn-primary "
							style="color: white; text-decoration: none;"> Quay lại</a>



					</div>

				</div>
				<div class="signup-image">
					<figure>
						<img src="/images/bg-sign-up.jpg" alt="sing up image">
					</figure>

				</div>
			</div>
		</div>
	</section>

	<script>
		

		function validateForm() {
			var nameInput = document.getElementById("name");
			var emailInput = document.getElementById("email");
			var emailError = document.getElementById("emailError");
			var nameError = document.getElementById("nameerror");
			var email = emailInput.value;
			var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			if (nameInput.value === "" || emailInput.value ==="") {
				alert("Vui lòng nhập đầy đủ thông tin.");
				return false; // Ngăn chặn việc submit form
			}
			if (!emailPattern.test(email)) {
				 emailError.textContent = "Email không hợp lệ. Vui lòng nhập lại.";
				emailInput.focus();
				return false;
			}

			

			// Tiếp tục submit form nếu thông tin hợp lệ
			document.getElementById("register-form").submit();
		}

		function kiemTraMaXacNhan() {
			var maXacNhan = document.getElementById("maxn").value;
			console.log(maXacNhan);
			var maxnrdElement = document.getElementById("maxnrd");
			var maxnrdValue = maxnrdElement.value;
			console.log(maxnrdValue); // Giả sử mã xác nhận ngẫu nhiên là "123456"

			if (maXacNhan === maxnrdValue) {
				// Mã xác nhận trùng, hiển thị modal
				$("#myModal").modal("show");
			} else {
				alert("Mã xác nhận không đúng!!");
				// Mã xác nhận không trùng, thực hiện hành động khác (nếu cần)
			}
		}

		function validatePassword() {
			var password = document.getElementById("pass").value;
			var confirmPassword = document.getElementById("re_pass").value;

			if (password !== confirmPassword) {
				alert("Mật khẩu xác nhận không trùng khớp.");
				return false;
			} else {
				alert("Cập nhật mật khẩu thành công");
				var changePasswordButton = document
						.querySelector("button[type='button']");
				changePasswordButton.setAttribute("type", "submit");

				var submittedInput = document
						.querySelector("input[name='submitted']");
				submittedInput.value = "true";

				// Tiến hành submit form
				document.getElementById("changePasswordForm").submit();

			}
			// Tiếp tục thực hiện các xử lý khác khi mật khẩu trùng khớp
			// ...

			// Submit form hoặc thực hiện hành động khác
			// document.getElementById("passwordForm").submit();
		}
	</script>






	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>

</html>