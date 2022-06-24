<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-site-verification"
	content="xFnIbRiqlbUWt2-5yqv6TejVhQ1oYB1hZiZ1jRXLzHw" />
<link rel="icon" type="image/png"
	href="https://banner2.cleanpng.com/20180616/trp/kisspng-airbnb-computer-icons-accommodation-airbnb-logo-5b259ec19f76a7.0265607215291921296532.jpg">

<title>Tình trạng đơn hàng</title>
<link href="https://res.yame.vn/5/Content/CssFramework.css"
	rel="stylesheet" />
<link href="style2.css" rel="stylesheet" />
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

.cart-product {
	position: relative;
	top: 25px;
}

.mnu {
	background-color: dark;
}


.mnu {
	background-color: dark;
}

.kt {
	position: relative;
	right : 50px;
}

.tb {
	height: 600px;
	position: relative;
	top: 180px;
}

.name {
	font-size: 15px;
	position: relative;
	top: 8px;
}

.price_sp {
	position: relative;
	right: 50px;
	top: 10px;
}

.icon {
	position: relative;
	right: 30px;
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
					<a href="cart" class="btn btn-outline-dark btn-light text-dark">
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
					<a href="cart" class="btn btn-outline-dark btn-light text-dark">
						<i class="bi-cart-fill me-1"></i> Cart <span
						class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.quantity }</span>
					</a>
				</div>
			</div>
		</div>
	</c:if>
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
	<div class="container tb">

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
					data-bs-target="#home" type="button" role="tab"
					aria-controls="home" aria-selected="true">Chờ xác nhận</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
					data-bs-target="#profile" type="button" role="tab"
					aria-controls="profile" aria-selected="false">Đang giao</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
					data-bs-target="#contact" type="button" role="tab"
					aria-controls="contact" aria-selected="false">Đơn hàng của
					bạn</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<table class="table border">
					<thead>
						<tr>
							<th scope="col">Mã đơn hàng</th>
							<th scope="col">Người nhận</th>
							<th scope="col">Tình trạng</th>
							<th scope="col">Xem chi tiết</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${listBill }">
							<tr>
								<td>${item.billid }</td>
								<td>${item.fullname }</td>
								<td>Đang chờ xác nhận</td>
								<td><a href="/order-details?id=${item.billid }" class="text-decoration-none">Xem chi
										tiết đơn hàng</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				<table class="table border">
					<thead>
						<tr>
							<th scope="col">Mã đơn hàng</th>
							<th scope="col">Người nhận</th>
							<th scope="col">Tình trạng</th>
							<th scope="col">Chi tiết đơn hàng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${listTransport }">
							<tr>
								<td>${item.billid }</td>
								<td>${item.fullname }</td>
								<td>Đang giao</td>
								<td><a href="/order-details?id=${item.billid }" class="text-decoration-none">Xem chi
										tiết đơn hàng</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">
				<table class="table border">
					<thead>
						<tr>
							<th scope="col">Mã đơn hàng</th>
							<th scope="col">Người nhận</th>
							<th scope="col">Tình trạng</th>
							<th scope="col">Xem chi tiết</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${listConfirm }">
							<tr>
								<td>${item.billid }</td>
								<td>${item.fullname }</td>
								<td>Đã giao</td>
								<td><a href="/order-details?id=${item.billid }" class="text-decoration-none">Xem chi
										tiết đơn hàng</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>




	<footer class="bg-dark "> </footer>
</body>
</html>