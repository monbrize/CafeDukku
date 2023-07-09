<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
const memberChk=function(){
	let email=$('#email').val();
	if(!isEmail(email)){
		alert('이메일을 형식에 맞게 입력하세요 ');
		mf.email.focus();
	}
	if(mf.pwd.value!=mf.repwd.value){
		alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요!');
		mf.repwd.select();
		return;
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

<div class="container">
<div class="setTitle mb-3">
	<h3>회원 가입 </h3>
</div>

	<form name="mf" action="join" method="post" >
	<table class="table">
	<tr style="display:none;"><td width="30%"></td><td width="70%"></td></tr>
		<tr><td>이메일(ID)*
		</td>
		<td><input type="text" class="form-control" name="email" id="email" placeholder="abc@ca.duk" required="required"></td>
		</tr>
		<tr><td>비밀번호*</td>
		<td><input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요" required="required"></td>
		</tr>
		<tr><td>비밀번호 확인*</td>
		<td><input type="password" class="form-control" name="repwd" placeholder="비밀번호를 다시 입력해주세요" required="required"></td>
		</tr>
		<tr><td>이름</td>
		<td><input type="text" class="form-control" name="name" placeholder="이름을 입력하세요(선택)" ></td>
		</tr>
		<tr><td>전화번호</td>
		<td><input type="text" class="form-control" name="phone" placeholder="전화번호를 입력하세요(선택)"></td>
		</tr>
		<tr>
		<td colspan="2" class="text-center">
			<button type="button" class="btn btn-info" onclick="memberChk()">완료</button>
			<button type="reset" class="btn btn-outline-primary">다시쓰기</button>
		</td>
		</tr>
		
	</table>
		<div class="btnGroup">
			
		</div>
	</form>
</div>