<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

$(document).ready(function () {

    //이미지 추가 버튼 
    $('#addImg').click(function () {
        $('#imgArea ').append('<div class="row"><span class="col-10"><input type="file" name="img" class="form-control">'
            +'</span><span class="col-2"><input type="checkbox" name="imgChk" class="form-check-input-inline" value="">메뉴</span></div>');
    });
    //태그 추가 이벤트
    $('#moodBox option').dblclick(function(){
        let mood=$('option:selected').val();
        $('#moodArea').append('<span class="moodList">'+mood+'<button type="button" class="removeMood">X</button></span>');
    })
    $('#moodText').on('keyup', function(key){
        let mood=$('#moodText').val();
        if(key.keyCode==13){
            $('#moodArea').append('<span class="moodList">'+mood+'<button type="button" class="removeMood">X</button></span>');
            $('#moodText').val('');
        }
    })
    $(document).on("click",".removeMood",function(e){
        let aaa=$(e.target).parent('span').remove();
    });
   
});


</script>
<div class="container col-10">
	<form name="initForm" action="inputCafe" method="post">
		<table class="table table-striped " width="">
			<colgroup>
				<col width=20%>
				<col width=50%>
			</colgroup>
			<tr>
				<td><label class="form-label">매장명*</label></td>
				<td><input type="text" name="kname" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 매장명(서브) </label></td>
				<td><input type="text" name="ename" class="form-control">
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<label for="logoImg" class="form-label mt-4"> 로고이미지 </label>
				</td>
				<td><input type="file" name="logo" class="form-control" id="logoImg">
					</div></td>
			</tr>
			<tr>
				<td><label class="form-label"> 비밀번호* </label></td>
				<td><input type="password" name="pwd" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 비밀번호 확인* </label></td>
				<td><input type="password" name="repwd" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 공지사항 </label></td>
				<td><input type="text" name="notice" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 소개 </label></td>
				<td><input type="text" name="kname" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 인스타URL </label></td>
				<td><input type="text" name="sns_url" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 전화번호 </label></td>
				<td><input type="text" name="phone" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 우편번호 </label></td>
				<td><input type="text" name="postcode" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 주소 1 </label></td>
				<td><input type="text" name="addr1" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 주소 2 </label></td>
				<td><input type="text" name="addr2" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 매장이미지 </label></td>
				<td><input type="file" name="img" class="form-control">
					<input type="file" name="img" class="form-control"> <input
					type="file" name="img" class="form-control"></td>
			</tr>
			<tr>
				<td><label class="form-label"> 태그 </label></td>
				<td><label for="exampleSelect2" class="form-label mt-4">MOOD</label>
					<select multiple="" class="form-control" id="exampleSelect2">
						<option>minimal</option>
						<option>cozy</option>
						<option>modern</option>
						<option>lovely</option>
						<option>enthic</option>
				</select> 직접입력 : <input type="text" class="form-control"> <label
					for="exampleSelect2" class="form-label mt-4">CLASSIFY</label> <select
					multiple="multiple" class="form-control" id="exampleSelect2">
						<option>espressobar</option>
						<option>bakery</option>
						<option>roastery</option>
						<option>desert</option>
						<option>alcohol</option>
						<option>tea</option>
						<option>brunch</option>
				</select> 직접입력 : <input type="text" class="form-control"> <label
					for="exampleSelect2" class="form-label mt-4">PRIDE</label> <select
					multiple="multiple" class="form-control" id="exampleSelect2">
						<option>comfortableSeats</option>
						<option>roofTop</option>
						<option>plate</option>
						<option>niceView</option>
						<option>sunshine</option>
						<option>photo zone</option>
						<option>outdooSeats</option>
				</select> 직접입력 : <input type="text" class="form-control"> <label
					for="exampleSelect1" class="form-label mt-4">PAYMENT</label> <select
					multiple="multiple" class="form-control" id="exampleSelect1">
						<option>cash</option>
						<option>creditCard</option>
						<option>applyPay</option>
						<option>samsungPay</option>
						<option>accountTransfer</option>
				</select> 직접입력 : <input type="text" class="form-control"></td>
			</tr>

		</table>
		<button type="button" class="btn btn-primary">done</button>
		<button type="reset" class="btn btn-warning">reset</button>
	</form>
</div>