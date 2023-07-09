<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
const memberChk=function(){
	let email=$('#email').val();
	if(!isEmail(email)){
		alert('이메일을 형식에 맞게 입력하세요 ');
		mf.email.focus();
	}
	mf.submit();
}
function isEmail(input){
	let pattern=/^[\w-]+(\.[\w]+)*@([a-zA-Z]+\.)+[a-z]{2,3}$/;
	let b=pattern.test(input);
	//alert('email : '+b);
	return b;
}
</script>
<c:forEach var="ck" items="${pageContext.request.cookies }">
	<%-- ${ck.name}=>${ck.value } --%>
	<c:if test="${ck.name eq 'uid'}">
		<c:set var="uid" value="${ck.value}"/>
	</c:if>
</c:forEach>
<div class="container">
<div class="setTitle mb-3">
	<h3>로그인 하세요! </h3>
</div>

	<form name="mf" action="login" method="post" >
	<table class="table">
	<tr style="display:none;"><td width="30%"></td><td width="70%"></td></tr>
		<tr><td>이메일(ID)
		</td>
		<td><input type="text" class="form-control" name="email" id="email" value="${uid}"  placeholder="아이디를 입력하세요" required></td>
		</tr>
		<tr><td>비밀번호</td>
		<td><input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요" required></td>
		</tr>
		<tr>
		<td colspan="2" class="text-center"><input type="checkbox" name="saveId"<c:if test="${uid ne null and not empty uid}">checked</c:if>>아이디 저장 </td>
		</tr>
		<tr>
		<td colspan="2" class="text-center">
			<button type="button" class="btn btn-info" onclick="memberChk()">로그인</button>
			<button type="reset" class="btn btn-outline-primary">다시쓰기</button>
		</td>
		</tr>
		
	</table>
		<div class="btnGroup">
			
		</div>
	</form>
</div>