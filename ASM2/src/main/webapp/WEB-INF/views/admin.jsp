<%@ page language="java" contentType="text/html; " pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
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
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="home">Admin Management</a>
	</nav>


	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<br> <a class="nav-link" href="addproduct">
							<div class="sb-nav-link-icon">
								<i class="bi bi-plus-lg"></i>
							</div> Add Product
						</a>
					</div>
					<div class="nav">
						<a class="nav-link" href="addstaff">
							<div class="sb-nav-link-icon">
								<i class="bi bi-person-plus"></i>
							</div> Add Staff
						</a>
					</div>
					<div class="nav">
						<a class="nav-link" href="/addcode">
							<div class="sb-nav-link-icon">
								<i class="bi bi-list-ol"></i>
							</div> Add Code
						</a>
					</div>
					<div class="nav">
						<a class="nav-link" href="/thongke">
							<div class="sb-nav-link-icon">
								<i class="bi bi-list-columns"></i>
							</div> Statistical
						</a>
					</div>

				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<br>
					<div class="card mb-4">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="home-tab"
									data-bs-toggle="tab" data-bs-target="#home" type="button"
									role="tab" aria-controls="home" aria-selected="true">Danh
									sách sản phẩm</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
									data-bs-target="#profile" type="button" role="tab"
									aria-controls="profile" aria-selected="false">Danh
									sách Khách hàng</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="user-tab" data-bs-toggle="tab"
									data-bs-target="#user" type="button" role="tab"
									aria-controls="user" aria-selected="false">Danh sách
									sản phẩm đã xóa</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="code-tab" data-bs-toggle="tab"
									data-bs-target="#code" type="button" role="tab"
									aria-controls="code" aria-selected="false">Danh sách
									mã khuyến mãi</button>
							</li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="card-body">
									<table class="table border">
										<thead>
											<tr>
												<th scope="col">Ảnh</th>
												<th scope="col">Tên sản phẩm</th>
												<th scope="col">Giá</th>
												<th scope="col">Số lượng</th>
												<th scope="col">Chỉnh sửa</th>
											</tr>
										</thead>
										<tbody>
										
											<c:forEach var="item" items="${listProduct }">
												<tr>
													<td><img
														src="${pageContext.request.contextPath}/images/${item.previousImg}"
														alt="" width="100px"></td>
													<td><br>${item.productName }</td>
													<td><br>${item.price }.000</td>
													<td><br>${item.quantity }</td>
													<td><br> <a class="btn btn-danger" type="button"
														href="update-product/${item.productId }"> <i
															class="bi bi-pencil-square"></i>
													</a> <a class="btn btn-danger" type="button"
														href="remove-product/${item.productId }"> <i class="bi bi-person-dash-fill"></i>
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="tab-pane fade" id="profile" role="tabpanel"
								aria-labelledby="profile-tab">
								<div class="card-body">
									<table class="table border">
										<thead>
											<tr>
												<th scope="col">Họ tên người dùng</th>
												<th scope="col">Tên đăng nhập</th>
												<th scope="col">Tổng sản phẩm đã mua</th>
												<th scope="col">Chỉnh sửa</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listCustomer }">
												<tr>
													<td>${item.customerName }</td>
													<td>${item.username }</td>
													<td></td>
													<td><button class="btn btn-danger"
															data-bs-toggle="modal" data-bs-target="#staticBackdrop">
															<i class="bi bi-pencil-square"></i>
														</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="tab-pane fade" id="user" role="tabpanel"
								aria-labelledby="user-tab">
								<div class="card-body">
								<table class="table border">
										<thead>
											<tr>
												<th scope="col">Ảnh</th>
												<th scope="col">Tên sản phẩm</th>
												<th scope="col">Giá</th>
												<th scope="col">Số lượng</th>
												<th scope="col">Phục hồi</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listProductToRemove }">
												<tr>
													<td><img
														src="${pageContext.request.contextPath}/images/${item.previousImg}"
														alt="" width="100px"></td>
													<td><br>${item.productName }</td>
													<td><br>${item.price }.000</td>
													<td><br>${item.quantity }</td>
													<td><br>  <a class="btn btn-danger" type="button"
														href="restore-product/${item.productId }"> <i class="bi bi-person-plus"></i>
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="tab-pane fade" id="code" role="tabpanel"
								aria-labelledby="code-tab">
								<div class="card-body">
									<table class="table border">
										<thead>
											<tr>
												<th scope="col">Mã</th>
												<th scope="col">Ngày hết hạn</th>
												<th scope="col">Giảm tối đa</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listCode }">
												<tr>
													<td><br>${item.code }</td>
													<td><br>${item.promotionalCodeDate }</td>
													<td><br>${item.percentageRedution }%</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>