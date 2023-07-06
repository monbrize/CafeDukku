<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<h2>${text} 결과...</h2>

	<div id="searchList" class="mb-3">
		<ul class="list-group">
		<c:if test="${not empty cafe }">
		<c:forEach var="c" items="${cafe}">
			<li class="list-group-item">
				<img src="../../logo_img/<c:out value="${c.img_name }"/>" class="rounded-circle mr-2" alt="logo" width="50px"> 
				<a href="/viewCafe?cafeid=${c.cafeid }"><c:out value="${c.cafename}"/>
				<c:if test="${not empty c.cafename2 }">
				<span style="font-size:0.9em;"><c:out value="${c.cafename2}"/></span>
				</c:if>
				</a>
				<span class="badge"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i>
					<c:out value="${c.score }"/></span>
				<span class="badge"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>
					<c:out value="${c.fav_cnt }"/></span>
			</li>
		</c:forEach>
		</c:if>
		<c:if test="${empty cafe }">
			<li class="list-group-item">
			검색 결과 : 0;
			</li>
		</c:if>
		</ul>
	</div>
</div>