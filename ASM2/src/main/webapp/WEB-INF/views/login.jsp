<%@ page language="java" contentType="text/html; " pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link href="https://res.yame.vn/5/Content/CssFramework.css"
	rel="stylesheet" />
<link href="https://res.yame.vn/5/Content/theme1.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet"
	href="https://www.gstatic.com/firebasejs/ui/4.4.0/firebase-ui-auth.css" />
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">

<style>
body {
	background: #282828;
}

.card-img-left {
	width: 45%;
	/* Link to your background image using in the property below! */
	background: scroll center
		url('https://cdn.pixabay.com/photo/2014/10/18/22/01/remote-login-mast-493769_960_720.jpg');
	background-size: cover;
}

.btn-login {
	font-size: 0.9rem;
	letter-spacing: 0.05rem;
	padding: 0.75rem 1rem;
}

.btn-google {
	color: white !important;
	background-color: #ea4335;
}

.btn-facebook {
	color: white !important;
	background-color: #3b5998;
}

.container {
	position: relative;
	top: 100px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div
					class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
					<div class="card-img-left d-none d-md-flex">
						<!-- Background image for card set in CSS! -->
					</div>
					<div class="card-body p-4 p-sm-5">
						<h3 class="card-title text-center">Login</h3>
						<form action="login" method="post">
							<div class=" form-floating mb-3 ">
								<input type="text" class="form-control" name="username" value="${username }"
									id="floatingInputUsername" placeholder="myusername " required
									autofocus> <label for="floatingInputUsername ">Username</label>
							</div>
							<div class="form-floating mb-3 ">
								<input type="password" class="form-control " name="password" value="${password }"
									id="floatingPassword " placeholder="Password "> <label
									for="floatingPassword ">Password</label>
							</div>
							<div class="form-floating mb-3 ">
								<input type="checkbox" class="checkbox" name="remember">
								Remember?
							</div>
							<a class="d-block text-right mt-2 small text-decoration-none"
								href="signup">Create account?</a>
							<div class="d-grid mb-2 ">
								<button
									class="btn btn-lg btn-danger btn-login fw-bold text-uppercase "
									type="submit">Submit</button>
							</div>
							<hr class="my-4 ">
							<a class="d-block text-center mt-2 small text-decoration-none"
								href="/forgot">Forgot Password</a>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>