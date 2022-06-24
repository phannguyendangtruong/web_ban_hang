<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Product Details</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="style.css" rel="stylesheet" />
<link href="theme.css" rel="stylesheet" />
<link href="https://res.yame.vn/5/Content/theme1.css" rel="stylesheet" />

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

<style type="text/css">
.kt {
	position: relative;
	right : 50px;
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

.none {
	display: none;
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
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<c:forEach var="item" items="${list}">
					<div class="col-md-6">
						<div class="owl-carousel owl-theme dsHinhSanPham ">
							<a href="productdetails?id=${item.productId }"> <img
								loading="lazy "
								src="${pageContext.request.contextPath}/images/${item.previousImg }"
								alt="anh" class="img-fluid d-block w-100 " />
							</a> <a href="productdetails?id=${item.productId }"> <img
								loading="lazy "
								src="${pageContext.request.contextPath}/images/${item.backSidePhoto}"
								alt="Đen " class="img-fluid d-block w-100 " />
							</a>
						</div>
					</div>
					<div class="col-md-6">
						<h1 class="display-5 fw-bolder">${item.productName }</h1>
						<div class="fs-5 mb-5">
							<span>${item.price }.000 VNĐ</span>
						</div>
						<p class="lead">${item.description }</p>
						<div class="d-flex">
							<form action ="/add?id=${item.productId }" method="post">
								<input class="form-control text-center me-3" type="number"
									name="quantity" value="1" minlength="8" style="max-width: 4rem" />
								<br>
								<button  type="submit" class="none" id="themVaoGio"></button>
								<button class="btn btn-outline-dark flex-shrink-0" type="button"
									onclick="thanhCong()">
									<i class="bi-cart-fill me-1"></i> Add to cart
								</button>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Related items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4 text-uppercase">RELATED PRODUCTS
				${brand }</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="item" items="${listproduct}">

					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<div class="owl-carousel owl-theme dsHinhSanPham ">
								<a href="productdetails?id=${item.productId }"> <img
									loading="lazy "
									src="${pageContext.request.contextPath}/images/${item.previousImg }"
									alt="anh" class="img-fluid d-block w-100 " />
								</a> <a href="productdetails?id=${item.productId }"> <img
									loading="lazy "
									src="${pageContext.request.contextPath}/images/${item.backSidePhoto}"
									alt="Đen " class="img-fluid d-block w-100 " />
								</a>
							</div>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${item.productName }</h5>
									<!-- Product price-->
									${item.price }.000 VNĐ
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="productdetails?id=${item.productId }">View options</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
	<!-- Button trigger modal -->
	<button type="button" id="datHang" class="btn btn-primary none"
		data-bs-toggle="modal" data-bs-target="#thanhcong">Launch
		demo modal</button>

	<!-- Modal -->
	<div class="modal fade" id="thanhcong" tabindex="-1"
		aria-labelledby="thanhcong" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Đăng Trường
						Store thông báo</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-danger text-center">Bạn đã thêm
					vào giỏ hàng thành công</div>
			</div>
		</div>
	</div>
	<script>
		function thanhCong() {
			document.getElementById("datHang").click();

			setTimeout(function() {
				document.getElementById("themVaoGio").click();
			}, 1500);
		}
		function check() {
			document.getElementById("themVaoGio").click();
		}
	</script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/sp.js"></script>
	<script src="js/sp2.js "></script>
	<script src="js/sp3.js "></script>
</body>
</html>