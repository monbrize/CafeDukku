<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
const updateMember=function(){
	if(f.pwd.value!=f.repwd.value){
		alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요!');
		f.repwd.select();
		return;
	}
	f.submit();
}
const viewForm=function(){
		$('.pwdDiv').css('display','');
		//$('#repwdTr').css('display','');
		$('input[name=name]').removeAttr('readonly').removeAttr('placeholder');
		$('input[name=phone]').removeAttr('readonly').removeAttr('placeholder');
		$('#updateMemBtn').css('display','none');
		$('#updateBtn').css('display','');
	
}
</script>
<div class="container">
<div class="setTitle">
	<h2>My Page</h2>
</div>
	<div id="myInfo">
	<form id="f" action="updateMember" method="post">
	<input type="hidden" name="idx" value="<c:out value="${loginUser.idx }"/>">
	<table class="table">
	<tr style="display:none;"><td width="30%"></td><td width="70%"></td></tr>
		<tr>
			<td colspan="2"><h4>내 정보</h4> </td>
		</tr>
		<tr>
			<td>이메일(ID) </td>
			<td><input type="text" class="form-control" name="email" id="email" value="${loginUser.email }" readonly ></td>
		</tr>
		<tr class="pwdDiv" style="display:none;"><td>비밀번호*</td>
			<td><input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요" required="required"></td>
		</tr>
		<tr class="pwdDiv" style="display:none;"><td>비밀번호 확인*</td>
			<td><input type="password" class="form-control" name="repwd" placeholder="비밀번호를 다시 입력해주세요" required="required"></td>
		</tr>
		<tr><td>이름</td>
			<td><input type="text" class="form-control" name="name" value="${loginUser.name }" placeholder="이름을 등록하지 않았습니다" readonly= ></td>
		</tr>
		<tr><td>전화번호</td>
			<td><input type="text" class="form-control" name="phone" value="${loginUser.phone }" placeholder="전화번호를 등록하지 않았습니다" readonly></td>
		</tr>
		<tr id="updateMemBtn" class="text-center">
			<td colspan="2"><input type="button" class="btn btn-primary" value="수정하기" onclick="viewForm()"></td>
		</tr>
		<tr id="updateBtn" style="display:none;" class="text-center">
			<td colspan="2"><input type="button" class="btn btn-danger" value="수정완료" onclick="updateMember()"></td>
		</tr>
	</table>
	</form>
	</div>
	<br><br>
	<hr color="chocolate">
	<br><br>
	<div id="favList" class="mb-3">
		<ul class="list-group list-group-flush">
		<li class="list-group-item">
			<h2>내가 즐겨찾기 한 카페 목록 ...<span class="badge"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>
					<c:out value="${favCnt }"/></span></h2>
		
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
		<br><br>
	<hr color="chocolate">
		<br><br>
		<h2>내가 평가한 카페 목록 ...
				<span class="badge"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i>
					<c:out value="${evalCnt }"/>건</span></h2>
	<div id="evalList" class="mb-3">
		<ul class="list-group list-group-flush">
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