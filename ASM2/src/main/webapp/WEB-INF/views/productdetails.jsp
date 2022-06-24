<%@ page language="java" contentType="text/html; " pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
	href="https://res.yame.vn/5/Content/theme1/fonts/icomoon/style.css"
	rel="stylesheet" />
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
footer {
	height: 200px;
}

.size {
	position: relative;
	bottom: 5px;
}

.thongtin {
	position: relative;
	top: 150px;
	font-family: Fantasy;
}

.kt {
	font-family: Calibri;
}

.bt {
	font-family: Optima;
}

.bt:hover {
	background-color: #CD5C5C;
}

.button {
	position: relative;
	float: right;
	bottom: 45px;
	right: 230px;
}

.cmt {
	position: relative;
	left: 150px;
}

.nd {
	position: relative;
	right: 300px;
	font-size: 20px;
}

.anh {
	width: 60px;
	height: 60px;
}

h4 {
	position: relative;
	right: 300px;
}

.noidung {
	position: relative;
	top: 100px;
}

.usercmt {
	position: relative;
	right: 50px;
}

.kt {
	position: relative;
	right : 50px;
}

.kth {
	position: relative;
	right: 5px;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
	<div class="container">
		<div class="row">
			<c:forEach var="item" items="${list}">
				<div class="col-5 mt-5">
					<img
						src="${pageContext.request.contextPath}/images/${item.previousImg }"
						alt="anh" class="w-100">
				</div>
				<div class="col-7">
					<div class="thongtin">
						<h2>${item.productName }</h2>
						<h3>${item.price }.000đ</h3>
						<br> <br>
						<!-- <h4 class="kth">Kích thước</h4> -->
						<p>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio1" value="option1">
							<label class="form-check-label size" for="inlineRadio1">S</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="option2">
							<label class="form-check-label size" for="inlineRadio2">M</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="option2">
							<label class="form-check-label size" for="inlineRadio2">L</label>
						</div>
						</p>
						<hr>
						<a class="none" id="themVaoGio" href="/add?id=${item.productId }"></a>
						<a class="btn btn-dark bt text-light " onclick="thanhCong()">Thêm
							vào giỏ hàng</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<div>
			<hr>
			<form class="cmt">
				<div class="mb-3">
					<input type="text" class="form-control w-75"
						id="exampleInputEmail1" aria-describedby="emailHelp">
					<button class="btn btn-dark button ">Đăng</button>
				</div>
			</form>
		</div>
		<br>

		<div class="row">
			<div class="col-4">
				<!-- <img class="anh rounded-circle" src="https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-9/124885480_1006375823177683_4977332452983330537_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=BukgPy3_q9sAX_Z02fQ&tn=1rlJ1gpVxMo1JQ00&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT-YtMccxP-kSbczX9RUElRfj22DzmUTlSnXktI47u5SOw&oe=62B02B56"
                    alt="" srcset=""> -->
			</div>
			<div class="col-8">
				<!-- <h4>Đăng Trường</h4>
                <p class="nd">Sản phẩm khá đẹp, giao hàng nhanh</p> -->
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="col-4">
				<img class="anh rounded-circle"
					src="https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-9/124885480_1006375823177683_4977332452983330537_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=BukgPy3_q9sAX_Z02fQ&tn=1rlJ1gpVxMo1JQ00&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT-YtMccxP-kSbczX9RUElRfj22DzmUTlSnXktI47u5SOw&oe=62B02B56"
					alt="" srcset="">
			</div>
			<div class="col-8 usercmt">
				<h4>Đăng Trường</h4>
				<p class="nd">Sản phẩm khá đẹp, giao hàng nhanh</p>
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="col-4">
				<img class="anh rounded-circle"
					src="https://i.ytimg.com/vi/Z1M-F17aico/maxresdefault.jpg" alt=""
					srcset="">
			</div>
			<div class="col-8 usercmt">
				<h4>Con mèo</h4>
				<p class="nd">Hàng chát lượng tốt vãi, vải khá là xịn luôn á mọi
					người TvT</p>
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="col-4">
				<img class="anh rounded-circle"
					src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUVFxcXGBYYGBcXFxgXFRcXFxcXGBcaHSggGB0lHRcVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OFxAQFy0dHR0rLS0tKy0tLS0tKysrLS0tLS0rLSsrLS4tLS0tKy0rLSsrLTcrKy0tLS0rLS0tLSstN//AABEIAMIBAwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAACAwABBAUGB//EADcQAAIBAgMGBAQFBAIDAAAAAAABAgMREiFRBAUxQWFxE4GR8AahscEiYtHh8RQyQlIjskNygv/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAIBEBAQACAgIDAQEAAAAAAAAAAAECESExA1ESIkEyYf/aAAwDAQACEQMRAD8A9Fj6kFeIglMyGWI7C3JEUgGpEjTAVQJVQCwEwsJVehcZvQBTiVbqaUiO2hRnVJ6kULZDsS0Ya7AI8MrwupobWgM6q0IEuLKwMcproFjRQnBqivBWg2UynUCA8H3cNUOgSqL3YZGV8rgKdKPP7gSqRXIfKnFgyor3cDPHaOnmR1ZajHTSKVJaAKdV9H5IVKXuxplGKFzUen0Cs7YLkaU108xnif8AqBhTDjUfDM1qeqXyKjL8oCFbg4J//KGQ2aDf9lu119GHs8IxVlZLN2tzbux8lb2wEPY4aP1l+pBmJEIESgLd+QwtIBLkysJqwgum+QCSY+4TjrcjigLVQLxBbiTCUH4gSmwFAJWScm8kS3QOnKXBIbKH+0kvM4O37+tlHJHA27fMpSylmccvN6dsfF7e5n+Wa9SoQb4s8DS3lPVo2x31OPMzPNf2NXwz29jOXUVLueYofEjxJNXTPSU5KUVJcHmdsM5k5Z4XEyMrcw1VEtlpm2Gh1FoFGqlwYh07lKmwNDqe+JUZCnBlYmA51WBi1+ovGwZRbA0KktQZUU9fsZ02g1N6gNVBaE/o49QVNhOT6gR7GkuYvwuv3G4nr9RVswIqJdWyyX1yREuq9f3BSXK3mASoJ54n78yAeItCAaMaLVb3kJ8VahxkmQHKqglXy42FYCvCQDXO/EBtAypIJwAFxFOL0v5D4RaLwsBUVI5G+dqf9vJHamsKbt9Txm9q75PicfNlrUdvFjsnZNge0VcF2opYpNcbXtZdcz1uy7vhTWGnFRXz83zPKfDlWVGU5STeJJLlzuenp71h1V+drjx3HS+THLf+NcqSfGwl7HSbu6cX5I27Lhkrxnft90McPzfI7alceYwLcdBtSVNJ9DY6NuQ6HkGmWSRLbWRUuhcqduQ/F5Ayhcozqp0L8QQ69N1HSU4+IrXhfPNX88nyG+CyGhKoVKZGU4+gA36FXLnHIy7TWjBXb/X0JbrtZNtal0I0jLRxNXatfguaXXqMbYiGNAPoS/UG9wI5N+2HCD1z09oFxGUL6edyg1s71SL/AKfsOUI2zQNlyIF/0y92LLUOiIBLBWKwt8kWsWiIq4pFpojuSzALD1QpvVEuwJOWjKhjgU2kLu1xaKk/dwB2pvA+V1b14HGp7LHja71Zp3nVzjHlx4gRnY4Z813w4gJ000Ya9FpXXLkbKtQpM510lcunVlfmrc1k/U6+x74lBpT/ABLX/Lz1EzoJ8P0MtWGXYTO4rcZl29bQ2qNRXg/Lg13Q7DK/J97ng47RKLum79L3OxsPxDZWqLF1XHzXM7Y+aXtxy8NnT0DlLS3oFGTb4Ctn26lNXjOK75P0Znr74oRaTk272/Cr5nX5T25fG+nkfjnZZ0q/jJZTS8pRSXHk8k/MPc/xZNRXiPFDhd/3J6N8zrfEaW0QUVdYXe9+OTR5HZt12eF3tKSur5K3PzRwtm7qu8l1Nx7yG0XSavmFjZnpVFa90l74AuaecWmr8Tny3w0bXWw05SzvFN5dDibrxVquJq0YK9vzPhfrzOvVrQtZSV7ZoZ8N7AqcJN/5u9vU6Yz5XlzyupwfFNFuobXGOgLgtDu4McmD4luZu/p0wJbEgMviEjPqNlsrQvwwKbbAzGNdX8inJ8wIpPUhWJEA3qDQ2C92Dsy7AVZFPsXJgSbAjiA0tffmFi6EaARUpaWfnYV/TPm/I0sJSegHmN6Z1L6cPLIB1CbbxfcRiyPLe3pnRsWSRnjVDdQypkJEqvLMTKoBNtma1GLaJW4eplUmuB0K0VzEbLsjnUSXN+i5sxzt1l4a9h2bDBzfk7cew/dOyXTqN5yvbog98tK0I/2rJLsa93SvBRXJHSdudvGydokknbQy7vje7fJtfQftcbZnK2Xb8MmtdS655Yt44M37uvxErSktLPLPVfcLdMZwhgbvbK+p0th2pSi152Mu99qhTUc7N8Oup0+NvEZmUnbDs2671/FqNtp5aLTue+2fKMVbgl9DzW5Nsp1XC2eF/i7pNo9TGz4I64Sztyzu+leItCvFRdloF4SfI2wXGSfAYktQYUIXvbzuw8C98QFTSfMB0h/hICckiKV4T7Cp0jVF34fKzLnC/LLuBzvA6kNbor/V+r/QgGiStxbIr9+9xfiW/wAfmGql8kn3uVDKa6FS6DIpFSyARmW5e7D0DhRQld2WxuFAygB5PeEbTkupjxHS3vD/AJGcuS4nky7ejHouXEZHgcV7TbE23xOhuralNPPNGdNNcI6gyY9yyM1VEqwus8jTuWSUm+aRjqlbDUak+xn9a/Dtuq3qLzH7DtOFsyyp/iuOdPK5d87S9aOq1cSb1+Wp5nalhm78Gd7xMN/Xuc7eey4mu5usQ7dk2li0yMe+6Uq7UY98x2zScE081xH7LKU5LCrJ5GscrEyjqfA253TjPE1xya5u3XyPVwhbh9fsBu3Z/DpqPPi+4zJO9/5PRHCran5di3U6F4lfj6DPUqFxl18vfAuVuYE6N3e79QPCzu5Pt+xFPTvwui403azd+4icc8r9v4LhBp3xWWnMAatGKycX3V/oSMmsk/VWt+o6c7dSmk+N/L+QgVKesfUhHTXOT+ZAEqLbt9f1G0cuIFn/AARhWtVkGqi1Rz3HqU76lR0G17YLqoxq4TWoGnxu5fiGVKT0S14v0/kfGmtb939iDzu95/8AK9HmjHCN7nT+KaVsEsucfo19zlU52i2efKfbTvj/AC8zvym0nhWX3fL0E7iqNNJ8V6Nfqe33rutLYVlmrVG+d52v6JpeR47ZqFn2NXjgl3HfjL5lSY2FFqiqsmsLko2vndtJZdXkZ6uXG5i46WULiSFIDFcfs9XOzM6a2J8V0HxjkZ27SNVPkJC0ipSM84Xd3xOlWzMk4mmWCrRvlnmd/wCFt3xxXeair+ZzZTgrZo9VuKKwYtX8l7Z0wk2xlbp1ZJAKmuTLsupcWd3JWDXiKqp3HStqVO5AiFtH34/Ipx5X8gpUuvyCwMKXkrZ/r8gXNWyV/eozwUC6NuFiAaaeb9cs7C6nZ36Ow6cX7sDFPRIBCcuX/b9iGjwn7/ggB4AJxCVy35AJsU10GsqwCrsKIWEiQRceoyNuot+YMpvV+YGP4gipUud1Jfdfc4FCk2lHVperO1vqp/xpatWXbiYtzRvWhfld+idvmcrzm6z+Xa39JLZ6i1SS82jwew0XN4VxbsuvI9f8TV8o09fxPssvucr4UpJ1r/6py8+H3NZTdTG6j1mzbFGFOMLJ4Ulw5836g1910p/3QXdZP6mhSBdZL9DpqOe3A274X50p+Uv1R5qVOX4rxf4ZSg3Z2xQbi7PnmmfRITuVUirO6yepi4RuZ14LFifVce46NSwddKM6rsksbt2WSMivNuMeLyXdnm6rv3Cdp2tu9n5mantbbzZt2/YnQahJKUrJvPhf+BNNSk1FJXk7JLjdl1UljRsG6nXqJ8Ix4v8AfU9rStFKKVklZITsWxqnTjG/Di9XzYzwj0YY6jjllsc53B8Rp5fUBJalWWptk6Ve5Uar1E4dC5LoQNjXazxMN1b8370uZ8L93BaA1U6+vLrf+CPaOnmrP1MhTb5PMDZTqvjZdc7P62HXb5W7nKVSXcfGrJcHYDW5S0XqQyePPVEINbzIBiLdQovCUogxmHjAFxBYbqA3KgbFFsqwHM+IKX4FNf8Ajd7aqVk/nZ+Rl3A34t/yv7HU3nC9KpH8r+WZz91RtO/5fujnZ93SX6n/ABHC8MXOOV+j4/RGT4Yupyf5bfNHR3jBypyXS/pmI3WsN+qXyNa5Z3w7FSsKUxbmLszTLdTmuIUqyZz5N+7lKrYDzu+Jq8u5p+D9kbi6rT4tRfbi/ejMu8Y3v1Z6DYcNOjFcEo3f1f3PPhjvLbvndY6eb35Uc683xtZei/W5u+G9hbbqvllH7v7epgw4m2+MnfzZ63ZIKEIxX+Kt58/nc3jN3bFuomFlNMdF3X6guB1YJBbGun1JGkQJRJRGuBWEBTbCjSduIcpLmwXVSArwuoFSk3wQ2MlyaGJdV6kGWlTkuXzyHL3+xckxUvmAzD1RDJ4stX6EA61iqbvy+ZdkWo9SiSBxItxKbAiaKlIlisIRalqDORMLBkgoKssn2Zz9id7NaG2rE4FTZ60IxjGLlZr8ScVlfmnxyyM5dyrOnaqzyfYx7Lt9PCpNu2VrcHfJZ9xVBVZSeKCjC2X4k5N9lyEVdwxaSU5wSd7RatxvpqXk4dhVU8wlUOfsG7/CcnjnLFb+5ppW0yNrZqJTHWBlPIWxVapk7C9Ec6bTyN+8Ktqby45Zcv0/cxRpJNdX9B+211GEm+CWfY5eOcV0z7jHu1Yqiuso5+fI7viaHG3VxbWh0fENYdM5dtSrsYtoRhxETNMtjqdcynUerEQmMi87gM8RhYtQL3JIAKkFLl6Ay2ZW4/LmHkFhRFJhSSvm/sNjUBsSSsEM8XuKlJvmDjd+SAlVa5Im1H4fRkL8TqvQg2adJsEKJaZpkDkikw7Iu4C2wXLLIawJAKxsFz6DYxKcOgUjEVYcC4gJzKY6xUkAm3yKYVinEBckKm75WHTgzLtCaTaV2uQDtogkr27eZz9qqfhlZXdnZcnlkHU2zxJuCksMVdvrp9HfuXTSlwz4eRjG/jWU/XC2bekqabzi7cGs734fXM7ez7yhOSineTV3b78kO/p+g2ls6WdrP0LJouW0bsCqr0GOknYvBZ2KhlOPPIZFoQpWJGfOwRqjUXDP0CEKYeIAsQSvqBGQ2L8gBwsF9xtnqLqZdSKXNi10/Qt1dRlO37ACl0+ZAniIBvZbkA2Vc0hjKsBiKlMA2Awk1z99yrgVcqUyMmEAFIvMLCRwfQASsPQYo2yKSQCnHsU4jZRBsApxBcB7iVbzAx1Ngpy4wjn0WfRl0NkhDKMUlorLM0pX6BOAClSKkkhuALw0Bicepbj29OJodMuMP5IM/g3zLjGw+MCeGAjCXh0HKC5FWKFIYiRRUpIgNZi5ysB48f8AZBqcdURS5QuSMPfIZkUiCnNkGKPUhdjUuBUSENIGoBHiQhUGiIshBGXyIQqriEuZCBEmUiEIAXEuRCBQstlkAEOfDyKIAHMOZCAAuJTeaIQgtMN8CEKAqIUQhBnr8H2MMneTvn/BCEU5IkuHmQhBqpouSIQKWpPUshAj/9k="
					alt="" srcset="">
			</div>
			<div class="col-8 usercmt">
				<h4>Con Chó</h4>
				<p class="nd">Hàng oke mà ship hơi đắt nha shop ơi</p>
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="col-4">
				<img class="anh rounded-circle"
					src="https://i-vnexpress.vnecdn.net/2019/08/01/conbo-1564648229-9318-1564649213_680x0.jpg"
					alt="" srcset="">
			</div>
			<div class="col-8 usercmt">
				<h4>Con Bò</h4>
				<p class="nd">Đặt lộn size có đổi trả được không a</p>
			</div>
			<hr>
		</div>
		<br>
	</div>
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
			
			setTimeout(function(){
				document.getElementById("themVaoGio").click();
			}, 1500);
		}
		function check(){
			document.getElementById("themVaoGio").click();
		}
	</script>
	<!-- <footer class="bg-dark ">

    </footer> -->
</body>
</html>