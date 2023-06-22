<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

$(document).ready(function () {

    $('.starRev span').click(function(){
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        //alert($(this).attr("value"));
        return false;
    });
   
});


</script>

<style>
/* 각 별들의 기본 설정 */
.starR{
  display: inline-block;
  width: 30px;
  height: 30px;
  color: transparent;
  text-shadow: 0 0 0 #f0f0f0;
  font-size: 1.8em;
  box-sizing: border-box;
  cursor: pointer;
}

/* 별 이모지에 마우스 오버 시 */
.starR:hover {
  text-shadow: 0 0 0 #ccc;
}

/* 별 이모지를 클릭 후 class="on"이 되었을 경우 */
.starR.on{
  text-shadow: 0 0 0 #ffbc00;
}
</style>
<h1>Evaluation</h1>
<div class="container col-10">
	<div class="row">
		<span class="col-2">
			<button type="button" id="scanBill" class="btn btn-info">스캔하기</button>
		</span> <span class="col-3"> 영수증 이미지 불러오기</span> <span class="col-6"><input
			type="file" id="fileBill" class="form-control"> </span>
	</div>


	<form name="initForm" action="inputCafe" method="post">
		<!-- <div class="row">
                <div class="col-sm-3">매장명</div>
                <div class="col-sm-8"><input type="text" name="kname" class="form-control"> </div>

            </div> -->
		<div class="starRev">
			<span class="starR on" value="1">⭐</span> <span class="starR"
				value="2">⭐</span> <span class="starR" value="3">⭐</span> <span
				class="starR" value="4">⭐</span> <span class="starR" value="5">⭐</span>
		</div>
		<table class="table table-striped " width="">
			<colgroup>
				<col width=20%>
				<col width=40%>
			</colgroup>
			<tr scope="row">
				<td><label class="form-label">매장명</label></td>
				<td><input type="text" name="kname" readonly
					class="form-control"></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 주문시간 </label></td>
				<td><input type="text" name="ename" class="form-control">
				</td>
			</tr>

			<tr scope="row">
				<td>
					<div class="form-group">
						<label for="logoImg" class="form-label mt-4"> 유형 </label>
				</td>
				<td><input type="radio" name="heretogo"
					class="form-control-inline" value="I">매장취식 <input
					type="radio" name="heretogo" class="form-control-inline" value="O">테이크아웃
					</div></td>
			</tr>
			<tr scope="row">
				<td>
					<div class="form-group">
						<label for="logoImg" class="form-label mt-4"> 웨이팅여부 </label>
				</td>
				<td><input type="radio" name="heretogo"
					class="form-control-inline" value="Y">YES <input
					type="radio" name="heretogo" class="form-control-inline" value="N">NO
					</div></td>
			</tr>
		</table>
		<table class="table table-striped">
			<tr scope="row">
				<td><span name="menuList"> 아이스아메리카노 </span></td>
				<td>
					<div class="menu01">
						<span class="starR on" name="menu_rate01" value="1">⭐</span> <span
							class="starR" name="menu_rate01" value="2">⭐</span> <span
							class="starR" name="menu_rate01" value="3">⭐</span> <span
							class="starR" name="menu_rate01" value="4">⭐</span> <span
							class="starR" name="menu_rate01" value="5">⭐</span>
					</div>
				</td>
			</tr>
			<tr scope="row">
				<td><span name="menuList"> 아이스 라떼 </span></td>
				<td>
					<div class="menu01">
						<span class="starR on" name="menu_rate01" value="1">⭐</span>
						<span class="starR" name="menu_rate01" value="2">⭐</span> 
						<span class="starR" name="menu_rate01" value="3">⭐</span> 
						<span class="starR" name="menu_rate01" value="4">⭐</span> 
						<span class="starR" name="menu_rate01" value="5">⭐</span>
					</div>
				</td>
			</tr>
			<td><span name="menuList"> 버블 밀크티 </span></td>
			<td>
				<div class="menu01">
					<span class="starR on" name="menu_rate01" value="1">⭐</span> <span
						class="starR" name="menu_rate01" value="2">⭐</span> <span
						class="starR" name="menu_rate01" value="3">⭐</span> <span
						class="starR" name="menu_rate01" value="4">⭐</span> <span
						class="starR" name="menu_rate01" value="5">⭐</span>
				</div>
			</td>
			</tr>


		</table>
		<table class="table table-striped ">
			<tr scope="row">
				<td><label class="form-label"> KINDNESS </label></td>
				<td>
					<div class="starRev">
						<span class="starR on" value="1">⭐</span> <span class="starR"
							value="2">⭐</span> <span class="starR" value="3">⭐</span> <span
							class="starR" value="4">⭐</span> <span class="starR" value="5">⭐</span>
					</div>
				</td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> CLEANING </label></td>
				<td>
					<div class="starRev">
						<span class="starR on" value="1">⭐</span> <span class="starR"
							value="2">⭐</span> <span class="starR" value="3">⭐</span> <span
							class="starR" value="4">⭐</span> <span class="starR" value="5">⭐</span>
					</div>
				</td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> MOOD </label></td>
				<td>
					<div class="starRev">
						<span class="starR on" value="1">⭐</span> <span class="starR"
							value="2">⭐</span> <span class="starR" value="3">⭐</span> <span
							class="starR" value="4">⭐</span> <span class="starR" value="5">⭐</span>
					</div>
				</td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> PRICE </label></td>
				<td>
					<div class="starRev">
						<span class="starR on" value="1">⭐</span> <span class="starR"
							value="2">⭐</span> <span class="starR" value="3">⭐</span> <span
							class="starR" value="4">⭐</span> <span class="starR" value="5">⭐</span>
					</div>
				</td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> COMFORTABLE SEATS </label></td>
				<td>
					<div class="starRev">
						<span class="starR on" value="1">⭐</span> <span class="starR"
							value="2">⭐</span> <span class="starR" value="3">⭐</span> <span
							class="starR" value="4">⭐</span> <span class="starR" value="5">⭐</span>
					</div>
				</td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> RESTROOM </label></td>
				<td>
					<div class="starRev">
						<span class="starR on" value="1">⭐</span> <span class="starR"
							value="2">⭐</span> <span class="starR" value="3">⭐</span> <span
							class="starR" value="4">⭐</span> <span class="starR" value="5">⭐</span>
					</div>
				</td>
			</tr>


		</table>
		<div style="text-align: center;">

			<button type="button" class="btn btn-primary">done</button>
			<button type="reset" class="btn btn-warning">reset</button>
		</div>
	</form>
</div>