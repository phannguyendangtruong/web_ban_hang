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

<body class="sb-nav-fixed" onload="load()">
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
						<a class="nav-link" href="/admin">
							<div class="sb-nav-link-icon">
								<i class="bi bi-list-ol"></i>
							</div> List
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

					<div class="row">
						<div class="col-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1"></i> Thống kê số tiền bán được trong tháng ${month }
								</div>
								<div class="card-body">
									<canvas id="myBarChart" width="100%" height="50"></canvas>
								</div>
								<div class="card-footer small text-muted">Tổng số tiền bán được : ${totalPriceMonth }</div>
							</div>
						</div>
						<div class="col-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1"></i> Thống kê số lượng sản phẩm bán được trong tháng ${month }
								</div>
								<div class="card-body">
									<canvas id="cac" width="100%" height="50"></canvas>
								</div>
								<div class="card-footer small text-muted">Tổng sản phẩm bán được : ${totalQuantity }</div>
							</div>
						</div>
					</div>

				</div>
			</main>

		</div>
	</div>
	<script>
		function load() {
			var ctx = document.getElementById("myBarChart");
			var myLineChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ "SWE", "DEGREY", "HADES" ],
					datasets : [ {
						label : "Revenue",
						backgroundColor : "rgb(199, 80, 82)",
						borderColor : "rgb(199, 80, 82)",
						data : [ ${swe}, ${degrey}, ${hades} ],
					} ],
				},
				options : {
					scales : {
						xAxes : [ {
							time : {
								unit : 'month'
							},
							gridLines : {
								display : false
							},
							ticks : {
								maxTicksLimit : 6
							}
						} ],
						yAxes : [ {
							ticks : {
								min : 0,
								max : 20000,
								maxTicksLimit : 15
							},
							gridLines : {
								display : true
							}
						} ],
					},
					legend : {
						display : false
					}
				}
			});
			var ctx = document.getElementById("cac");
			var myLineChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ "SWE", "DEGREY", "HADES" ],
					datasets : [ {
						label : "Revenue",
						backgroundColor : "dark",
						borderColor : "dark",
						data : [ ${sweQuantity}, ${degreyQuantity}, ${hadesQuantity} ],
					} ],
				},
				options : {
					scales : {
						xAxes : [ {
							time : {
								unit : 'month'
							},
							gridLines : {
								display : false
							},
							ticks : {
								maxTicksLimit : 6
							}
						} ],
						yAxes : [ {
							ticks : {
								min : 0,
								max : 100,
								maxTicksLimit : 10
							},
							gridLines : {
								display : true
							}
						} ],
					},
					legend : {
						display : false
					}
				}
			});
		}
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>