<%@ page language="java" contentType="text/html; " pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/home">Admin Management</a>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<br> <a class="nav-link" href="/addproduct">
							<div class="sb-nav-link-icon">
								<i class="bi bi-plus-lg"></i>
							</div> Add Product
						</a>
					</div>
					<div class="nav">
						<a class="nav-link" href="/admin">
							<div class="sb-nav-link-icon">
								<i class="bi bi-list-ol"></i>
							</div> List
						</a>
					</div>
					<div class="nav">
						<a class="nav-link" href="/home">
							<div class="sb-nav-link-icon">
								<i class="bi bi-house-door"></i>
							</div> Home
						</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main class="container border">
				<form:form action="/update-product" method="post"
					modelAttribute="product" enctype="multipart/form-data">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Tên sản
							phẩm</label>
						<form:input path="productName" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Mô tả</label>
						<form:input path="description" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Giá</label>
						<form:input path="price" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Số
							lượng</label>
						<form:input path="quantity" type="number" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Ảnh mặt
							trước</label> <input name="anhtruoc" type="file" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Ảnh mặt
							sau</label> <input name="anhsau" type="file" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<button class="btn btn-danger" type="submit">LƯU</button>

				</form:form>
				<br>
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