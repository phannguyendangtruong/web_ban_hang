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
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<style>
footer {
	height: 200px;
	position: relative;
	top: 400px;
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
						class="badge bg-dark text-white ms-1 rounded-pill">${soLuong }</span>
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
						class="badge bg-dark text-white ms-1 rounded-pill">${soLuong }</span>
					</a>
				</div>
			</div>
		</div>
	</c:if>


	<!-- sidebar -->

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
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active" id="nav-home-tab"
					data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
					role="tab" aria-controls="nav-home" aria-selected="true">Quản
					lý đơn hàng</button>
				<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
					data-bs-target="#nav-profile" type="button" role="tab"
					aria-controls="nav-profile" aria-selected="false">Kiểm tra
					đơn giao hàng</button>
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab">
				<form action="update-bill" method="post">
					<table class="table border">
						<thead>
							<tr>
								<th scope="col">Id người đặt hàng</th>
								<th scope="col">Tên người nhận</th>
								<th scope="col">Địa chỉ nhận hàng</th>
								<th scope="col">Tổng tiền</th>
								<th scope="col">Xem chi tiết đơn hàng</th>
								<th scope="col">Duyệt đơn</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${listBill }">
								<tr>
									<td>${item.customer.username }</td>
									<td>${item.fullname }</td>
									<td>${item.address }</td>
									<td>${item.totalPrice }</td>
									<td><a href="/order-details?id=${item.billid }"
										class="text-decoration-none">Xem chi tiết</a></td>
									<td><a class="btn btn-danger"
										href="update-bill?id=${item.billid }"> <i
											class="bi bi-pencil-square"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
			<div class="tab-pane fade" id="nav-profile" role="tabpanel"
				aria-labelledby="nav-profile-tab">
				<form action="update-bill-confirm" method="post">
					<table class="table border">
						<thead>
							<tr>
								<th scope="col">Tên người nhận</th>
								<th scope="col">Địa chỉ nhận hàng</th>
								<th scope="col">Tổng tiền</th>
								<th scope="col">Tình trạng</th>
								<th scope="col">Xem chi tiết</th>
								<th scope="col">Duyệt đơn</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list }">
								<tr>
									<td>${item.fullname }</td>
									<td>${item.address }</td>
									<td>${item.totalPrice }</td>
									<td>Đang giao</td>
									<td><a href="/order-details?id=${item.billid }"
										class="text-decoration-none">Xem chi tiết</a></td>
									<td><a class="btn btn-danger"
										href="update-bill-confirm?id=${item.billid }"> <i
											class="bi bi-pencil-square"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>

		<br>

	</div>
	<br>
	<br>
	<footer class="bg-dark "> </footer>
</body>
</html>