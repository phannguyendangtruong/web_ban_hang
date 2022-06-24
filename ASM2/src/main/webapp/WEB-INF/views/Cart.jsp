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
	position: relative;
	top: 200px;
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

.gg {
	position: relative;
	left: 850px;
	top: 70px;
}

.dt input{
	margin-left : 100px;
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
		<br>
		<table class="dt">
			<c:forEach var="item" items="${cartItems }">
				<form action="update/${item.productId }" method="post">
				<tr>
					<td>${no+1}</td>
					<td><img
						src="${pageContext.request.contextPath}/images/${item.previousImg}"
						width="50px" /></td>
					<td><p class="name">${item.productName }</p></td>
					<td><input type="hidden" name="id" value="${item.productId }">
						<input type="number" name="quantity" value="${item.quantity }"
						onblur="this.form.submit()" class="w-25 num" /></td>
					<td><p class="price">${item.price }</p></td>
					<td><a href="/remove/${item.productId}" class="icon"><i
							class="bi bi-trash "></i></a></td>
				</tr>
				<c:set var="no" value="${no + 1}"></c:set>
				</form>
			</c:forEach>
		</table>
		<form action="add-bills" method="post">
			<br> <br> <input name="totalprice" value=" ${totalprice}"
				class="border-0 d-none" /> <input name="address" class="border-1 "
				placeholder="Địa chỉ người nhận" /> <input name="fullname"
				class="border-1 " placeholder="Họ tên người nhận" /><br> <br>
			<button class="btn btn-danger" type="submit">Thanh toán</button>
			<Br>
		</form>
	</div>


	<br>
	<div class="container">
		<form action="code" method="post">
			<div class="gg">
				<h4>Tổng tiền : ${sessionScope.totalPrice}</h4>
				<input name="total" value=" ${sessionScope.totalPrice}"
					class="border-0 d-none" /> <input
					class="form-control w-25 ${none }" type="text"
					placeholder=" Mã giảm giá" name="code"><br>
				<button class="btn btn-dark ${none }">Áp dụng mã giảm</button>
				<p class="text-danger">${sessionScope.error }</p>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
	<footer class="bg-dark "> </footer>
	<script>
		function update() {
			document.getElementById("clickUpdate").click();
		}
	</script>
</body>
</html>