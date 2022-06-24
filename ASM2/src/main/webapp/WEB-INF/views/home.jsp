<%@ page language="java" contentType="text/html; " pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-site-verification"
	content="xFnIbRiqlbUWt2-5yqv6TejVhQ1oYB1hZiZ1jRXLzHw" />
<!-- <link rel="icon" type="image/png" href="https://res.yame.vn/Content/images/yame-fav.png"> -->

<title>Home</title>
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

<style>

.cart-product {
	position: relative;
	top: 25px;
}

.mnu {
	background-color: dark;
}

.kt {
	position: relative;
	right : 50px;
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
			<form action="change-pass">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title text-danger" id="exampleModalLabel">
							${error }</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Password
								cũ</label> <input type="password" class="form-control" name="password"
								id="exampleInputPassword1">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Password
								mới</label> <input type="password" class="form-control" name="newpass"
								id="exampleInputPassword1">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Xác
								nhận</label> <input type="password" class="form-control" name="confirm"
								id="exampleInputPassword1">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-danger">Save changes</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- end modal -->
	<br>
	<br>
	<!-- slide -->
	<div id="carouselExampleSlidesOnly" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://theme.hstatic.net/1000351433/1000808186/14/slideshow_1.jpg?v=121"
					class="d-block w-100">
			</div>
		</div>
	</div>
	<!-- end slide -->
	<div class="container">
		<!-- Top 10 sản phẩm -->
		<!-- <div class="row" id="top10">
			<div class="col-sm-12 text-center">
				<hr>
				<p style="font-size: 24px; padding-top: 20px;" class="mb-1">Top
					10 sản phẩm bán chạy nhất</p>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1" data-aos="fade-up">
				<div class=" pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/intlpink_b523d4132530456fa58a4f8a59787f58.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/intlpink1_91c154bb8a6f4314a1e1fb835d556d94.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">INTL TEE - PINK </span><br>375k
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/8254_5551716b7b144c20a851800510643333.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails "> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/8256_4e3f91e398d5403bbeef2bc321a506f8.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">INTL TEE - BLACK </span><br>325k
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/blk-smoked-tee-1_5731df470e1e44a29b10069b6209b014.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/blk-smoked-tee-2_c046a10971fd4a5387d2754fd452f03e.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">CUBE SMOKE TEE - BLACK </span><br>355k
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/3_5bbdfccb147f4669b3431d6ad1b2e5f5.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/3__2__c41c976584844f198a05a2fa7abea347.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">CUBE COACH JACKET - BLACK </span><br>300k
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/1-te9100-tx01-1_65b7a4a59b4541d7b4ce570715009e63.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/1-te9100-tx01-2_4a8f29f5541749dabca66c3bbfd5fa39.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">CUBE SMOKE TEE - WHITE </span><br>355k
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/thunder-f_6ffc496d3a9540d7a789fb41422a2f58.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/thunder-b_5f674ccd8fda4714b3a23a723688ec31.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">THUNDER TEE - BLACK </span><br>355k
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/61_96c7ba2cd1c542cfa8e0b64a66ae8d5b.png "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/2749_8a470e9a2aab48b2bcdcc873854ec35c.png "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">90'S TEE - BLACK </span><br>340K
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/25-te9512-tx01-1_22297e8d68d446a99118eb2674841a8a.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/25-te9512-tx01-1_22297e8d68d446a99118eb2674841a8a.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">SMOKE JACKET </span><br>560K
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/blk-smoked-tee-1_5731df470e1e44a29b10069b6209b014.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/blk-smoked-tee-2_c046a10971fd4a5387d2754fd452f03e.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">CUBE SMOKE TEE - BLACK </span><br>355k
					</div>
				</div>
			</div>
			<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
				<div class="pitem mb-3 ">
					<div class="owl-carousel owl-theme dsHinhSanPham ">
						<a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/3_5bbdfccb147f4669b3431d6ad1b2e5f5.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a> <a href="productdetails"> <img loading="lazy "
							src="https://product.hstatic.net/1000344185/product/3__2__c41c976584844f198a05a2fa7abea347.jpg "
							alt="Đen " class="img-fluid d-block w-100 " />
						</a>
					</div>
					<div class="price text-center ">
						<span class="mb-1 ">CUBE COACH JACKET - BLACK </span><br>300k
					</div>
				</div>
			</div>
		</div>
		 -->
		<!-- kết thúc top 10 sản phẩm -->
		<!-- sản phẩm -->
		
		<!-- kết thúc sản phẩm -->
	</div>

	<script src="js/sp.js"></script>
	<script src="js/sp2.js "></script>
	<script src="js/sp3.js "></script>
	<footer class="bg-dark "> </footer>
</body>
</html>