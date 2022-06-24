<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Account</title>
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
<link
	href="https://res.yame.vn/5/Content/theme1/fonts/icomoon/style.css"
	rel="stylesheet" />
<style>
footer {
	height: 200px;
}

.container {
	position: relative;
	top: 50px;
}

.mnu {
	background-color: dark;
	height: 80px;
}

.kt {
	position: relative;
	right : 50px;
	bottom: 50px;
}

.name {
	font-size: 15px;
	position: relative;
	top: 8px;
}

.price {
	position: relative;
	right: 80px;
	top: 10px;
}

.icon {
	position: relative;
	right: 30px;
}

.bt{
	position : relative;
	bottom : 50px;
}

.btcart{
	position : relative;
	bottom : 50px;
}

</style>
</head>

<body>
	<!-- menu -->
	<c:if test="${sessionScope.admin == 1 }">
		<div class="site-navbar py-2 stickyDiv mnu fixed-top">
			<div class="container">
				<div class="d-flex align-items-center justify-content-between">
					<div class="main-nav d-none d-lg-block ">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block kt">

								<li class="hover-menu"><a href="home">HOME</a></li>
								<li class="has-children"><a href="#">LIST</a>
									<ul class="dropdown">
										<li><a href="/brand?name=swe">SWE</a></li>
										<li><a href="/brand?name=degrey">DEGREY</a></li>
										<li><a href="/brand?name=hades">HADES</a></li>
									</ul></li>
								<li class="has-children"><a href="#">ACCOUNT</a>
									<ul class="dropdown">
										<li><a href="account">Account Management</a></li>
										<li><a type="button" data-bs-toggle="modal"
											data-bs-target="#exampleModal">Change Password</a></li>
										<hr class="text-light">
										<li><a href="logout">Log out</a></li>
									</ul></li>
								<li class="hover-menu"><a href="admin">ADMIN</a></li>
								<li class="hover-menu"><a href="order">ORDER</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.admin == 0 }">
		<div class="site-navbar py-2 stickyDiv mnu fixed-top">
			<div class="container">
				<div class="d-flex align-items-center justify-content-between">
					<div class="main-nav d-none d-lg-block ">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block kt">
								<li class="hover-menu"><a href="home">HOME</a></li>
								<li class="has-children"><a href="#">LIST</a>
									<ul class="dropdown">
										<li><a href="/brand?name=swe">SWE</a></li>
										<li><a href="/brand?name=degrey">DEGREY</a></li>
										<li><a href="/brand?name=hades">HADES</a></li>
									</ul></li>
								<li class="hover-menu"><a href="status">ORDER STATUS</a></li>
								<li class="has-children"><a href="#">ACCOUNT</a>
									<ul class="dropdown">
										<li><a href="accountCustomer">Account Management</a></li>
										<li><a type="button" data-bs-toggle="modal"
											data-bs-target="#exampleModal">Change Password</a></li>
										<hr class="text-light">
										<li><a href="logout">Log out</a></li>
									</ul></li>

							</ul>
						</nav>
					</div>
					<a href="cart" class="btn btn-outline-dark btn-light text-dark btcart">
						<i class="bi-cart-fill me-1"></i> Cart <span
						class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.quantity }</span>
					</a>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.admin != 1 && sessionScope.admin !=0 }">
		<div class="site-navbar py-2 stickyDiv mnu fixed-top">
			<div class="container">
				<div class="d-flex align-items-center justify-content-between">
					<div class="main-nav d-none d-lg-block ">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block kt">
								<li class="hover-menu"><a href="home">HOME</a></li>
								<li class="has-children"><a href="#">LIST</a>
									<ul class="dropdown">
										<li><a href="/brand?name=swe">SWE</a></li>
										<li><a href="/brand?name=degrey">DEGREY</a></li>
										<li><a href="/brand?name=hades">HADES</a></li>
									</ul></li>
								<li class="has-children"><a href="#">ACCOUNT</a>
									<ul class="dropdown">
										<li><a href="signin">Sign in</a></li>
										<li><a href="signup">Sign up</a></li>
									</ul></li>

							</ul>
						</nav>
					</div>
					<a href="cart" class="btn btn-outline-dark btn-light text-dark btcart">
						<i class="bi-cart-fill me-1"></i> Cart <span
						class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.quantity }</span>
					</a>
				</div>
			</div>
		</div>
	</c:if>

	<!-- sidebar -->
	<div class="offcanvas offcanvas-start" tabindex="-1"
		id="offcanvasWithBackdrop"
		aria-labelledby="offcanvasWithBackdropLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasWithBackdropLabel">
				<i class="bi bi-cart-check"></i> Cart Product
			</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<hr>
			<table>
				<c:forEach var="item" items="${cartItems }">
					<form action="update" method="post">
						<tr>
							<td>${no+1}</td>
							<td><img
								src="${pageContext.request.contextPath}/images/${item.previousImg}"
								width="50px" /></td>
							<td><p class="name">${item.productName }</p></td>
							<td><input type="hidden" name="id"
								value="${item.productId }"> <input type="number"
								name="quantity" value="${item.quantity }"
								onblur="this.form.submit()" class="w-25 num" /></td>
							<td><p class="price">${item.price }</p></td>
							<td><a href="/remove/${item.productId}" class="icon"><i
									class="bi bi-trash "></i></a></td>
						</tr>
					</form>
					<c:set var="no" value="${no + 1}"></c:set>
				</c:forEach>
			</table>
			<hr>
			<button class="btn btn-danger">Thanh toán</button>
		</div>
	</div>
	<!-- end sidebar -->
	<!-- ket thuc menu -->
	<!-- modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="bi bi-currency-exchange"></i> Change Password
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password
							cũ</label> <input type="password" class="form-control" value="123456"
							id="exampleInputPassword1">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password
							mới</label> <input type="password" class="form-control" value="123456"
							id="exampleInputPassword1">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Xác
							nhận</label> <input type="password" class="form-control" value="123456"
							id="exampleInputPassword1">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal -->
	<div class="container mt-5  border ">
		<br>

		<form:form action="change-account-customer" method="post"
			modelAttribute="customerAccount">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Họ tên</label>
				<form:input path="customerName" type="text" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp" />
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Tài khoản</label>
				<form:input path="username" type="text" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp" />
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Password</label>
				<form:input path="password" type="password" class="form-control"
					value="${item.password }" id="exampleInputPassword1" />
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Sinh nhật</label>
				<form:input path="birthday" type="date" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp" />
			</div>
			<!-- <div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Giới tính</label>
				<input type="radio" name="gender" checked value="true">Nam <input
					type="radio" name="gender" checked="${gender }" value="false">Nữ
			</div>
			 -->
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Điện
					thoại</label>
				<form:input path="phone" type="number" class="form-control"
					id="exampleInputEmail1" value="${item.phone }" />
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Email</label>
				<form:input path="email" type="email" name="email"
					class="form-control" value="${item.email }" />
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Địa chỉ</label>
				<form:input path="address" type="text" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp" />
			</div>
			<button type="submit" class="btn btn-danger">Cập nhật thông
				tin</button>
		</form:form>
	</div>
	<br>
	<br>
	<br>
	<footer class="bg-dark "> </footer>
</body>
</html>