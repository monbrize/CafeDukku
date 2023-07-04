<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<h2>${text} 결과...</h2>

	<div id="searchList" class="mb-3">
		<ul class="list-group">
		<c:forEach var="c" items="${cafe}">
			<li class="list-group-item">
				<img src="../../logo_img/<c:out value="${c.img_name }"/>" class="rounded-circle mr-2" alt="logo" width="50px"> 
				<a href="/viewCafe?cafeid=${c.cafeid }"><c:out value="${c.cafename}"/>(<c:out value="${c.cafename2}"/>)</a>
				<span class="badge"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i>
					4.1</span>
				<span class="badge"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>
					100</span>
			</li>
		</c:forEach>
			<li class="list-group-item">
				<img src="../../logo_img/logo_init.jpg" class="rounded-circle mr-2" alt="logo" width="50px">Second item
				<span class="badge"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i>
					4.1</span>
				<span class="badge"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>12</span>
			</li>
			<li class="list-group-item">
				<img src="../../logo_img/logo_init.jpg" class="rounded-circle mr-2" alt="logo"  width="50px">Third item
				<span class="badge"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i>
					4.1</span>
				<span class="badge"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>12</span>
			</li>
		</ul>
	</div>
</div>