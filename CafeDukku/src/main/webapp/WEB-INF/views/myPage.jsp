<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<h2>My Page</h2>
	<div id="myInfo">
	<table class="table">
	<tr><td width="30%"></td><td width="70%"></td></tr>
		<tr><td>이메일(ID
		</td>
		<td><input type="text" class="form-control" name="email" id="email" value="${loginUser.email }" readonly ></td>
		</tr>
		<tr><td>이름</td>
		<td><input type="text" class="form-control" name="name" value="${loginUser.name }" readonly ></td>
		</tr>
		<tr><td>전화번호</td>
		<td><input type="text" class="form-control" name="phone" value="${loginUser.phone }" readonly ></td>
		</tr>
	</table>
	</div>
	<div id="favList" class="mb-3">
		<ul class="list-group list-group-flush">
		<li class="list-group-item">
		<h3>나의 즐겨찾기 카페 목록 ...<c:out value="${favCnt }"/>건 </h3>
		
		</li>
		<c:if test="${not empty fav }">
		<c:forEach var="f" items="${fav}">
			<li class="list-group-item">
				<img src="../../logo_img/<c:out value="${f.img_name }"/>" class="rounded-circle mr-2" alt="logo" width="50px"> 
				<a href="/viewCafe?cafeid=${f.cafeid }"><c:out value="${f.cafename}"/>
				<c:if test="${not empty f.cafename2 }">
				&nbsp;<span style="font-size:0.9em;"><c:out value="${f.cafename2}"/></span>
				</c:if>
				</a>
				<span class="badge"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i>
					<c:out value="${f.score }"/></span>
				<span class="badge"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>
					<c:out value="${f.fav_cnt }"/></span>
			</li>
		</c:forEach>
		</c:if>
		<c:if test="${empty fav }">
			<li class="list-group-item">
			찜한 카페가 아직 없네요~~
			</li>
		</c:if>
		</ul>
	</div>
	<h2>EVALUATION ... <c:out value="${evalCnt }"/>건 </h2>
	<div id="evalList" class="mb-3">
		<ul class="list-group">
		<c:if test="${not empty eval }">
		<c:forEach var="e" items="${eval}">
			<li class="list-group-item">
				<img src="../../logo_img/<c:out value="${e.img_name }"/>" class="rounded-circle mr-2" alt="logo" width="50px"> 
				<a href="/viewCafe?cafeid=${e.cafeid }"><c:out value="${e.cafename}"/>
				<c:if test="${not empty e.cafename2 }">
				&nbsp;<span style="font-size:0.9em;"><c:out value="${e.cafename2}"/></span>
				</c:if>
				</a>
				<span class="badge"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i>
					<c:out value="${e.score }"/></span>
				<span class="badge"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>
					<c:out value="${e.fav_cnt }"/></span>
			</li>
		</c:forEach>
		</c:if>
		<c:if test="${empty eval }">
			<li class="list-group-item">
			평가한 카페가 아직 없네요~~
			</li>
		</c:if>
		</ul>
	</div>
</div>