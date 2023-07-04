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
	<h2>Favorites ...</h2>
	<div id="favList" class="mb-3">
		<ul class="list-group">
		<c:forEach var="f" items="${fav}">
			<li class="list-group-item">
				<img src="../../logo_img/<c:out value="${f.img_name }"/>" class="rounded-circle mr-2" alt="logo" width="50px"> 
				<a href="/viewCafe?cafeid=${f.cafeid }"><c:out value="${f.cafename}"/>(<c:out value="${f.cafename2}"/>)</a>
				<span class="badge"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i>
					4.1</span>
				<span class="badge"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>
					<c:out value="${f.eachFavTotal }"/></span>
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