<%@ page language="java" contentType="text/html; " pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="row " id="sanpham">
	<hr>
	<div class="col-sm-12 text-center ">
		<!-- <p style="font-size:24px; padding-top:20px; " class="mb-1 ">Top 10 sản phẩm bán chạy nhất</p> -->
		<br>
		<h3>${brand}</h3>
	</div>
	<c:forEach var="item" items="${page.content}">
		<div class="col-3 col-sm-3 col-md-3 px-1 " data-aos="fade-up ">
			<div class="pitem mb-3 ">
				<div class="owl-carousel owl-theme dsHinhSanPham ">
					<a href="productdetails?id=${item.productId }"> <img loading="lazy "
						src="${pageContext.request.contextPath}/images/${item.previousImg }"
						alt="Đen " class="img-fluid d-block w-100 " />
					</a> <a href="productdetails?id=${item.productId }"> <img loading="lazy "
						src="${pageContext.request.contextPath}/images/${item.backSidePhoto}"
						alt="Đen " class="img-fluid d-block w-100 " />
					</a>
				</div>
				<div class="price text-center ">
					<span class="mb-1 ">${item.productName }</span><br>${item.price }K
				</div>
			</div>
		</div>
	</c:forEach>
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="/brand-list?page=0">First</a></li>
		<li class="page-item"><a class="page-link" href="/brand-list?page=${page.number-1 }">Previous</a></li>
		<li class="page-item"><a class="page-link" href="/brand-list?page=${page.number +1 }">Next</a></li>
		<li class="page-item"><a class="page-link" href="/brand-list?page=${page.totalPages -1 }">Last</a></li>
	</ul>
	 
</div>