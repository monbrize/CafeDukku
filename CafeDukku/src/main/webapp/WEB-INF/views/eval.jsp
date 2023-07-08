<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<script>
$(document).ready(function (){
    $('.starDiv span').click(function(){
        $(this).children().removeClass('fa-regular').addClass('fa-solid');   //ok
        $(this).prevAll().children().removeClass('fa-regular').addClass('fa-solid');    //선택이전까지 
        $(this).nextAll().children().removeClass('fa-solid').addClass('fa-regular');
        let str=$(this).parent().parent().parent().children().children().text().toLowerCase();
        let score=$(this).find('.fa-solid:last').parent().attr('value');
        $('input[name='+str+']').val(score);
        return false;
    })
});//////////$()
$(document).on('click', '.menuStar span', function(){
	$(this).children().removeClass('fa-regular').addClass('fa-solid');   //ok
    $(this).prevAll().children().removeClass('fa-regular').addClass('fa-solid');    //선택이전까지 
    $(this).nextAll().children().removeClass('fa-solid').addClass('fa-regular');
    let score=$(this).find('.fa-solid:last').parent().attr('value');
    $(this).parent().find('input[name=rate]').val(score);
    return false;
})

const submitReceipt=function(){
	let user=$('input[name=idx]').val();
	if(user==0000){
		let con=confirm('로그인하지 않은 경우에는 기록되지 않습니다..');
		return con;
	}
	//let imgUrl=$('#evalReceipt').val().split('/').pop().split('\\').pop();
   	let form=new FormData();
   	let inputfile= $('#evalReceipt');
   	form.append('imgReceipt', inputfile[0].files[0]);
	$.ajax({
		type:'post',
		url:'sendReceipt',
		data:form,
		processData:false,
		contentType:false
	}).done((res)=>{
		if(res===null){
			alert('등록이 되지 않은 카페입니다.');
		}else{
			console.log('!!!success!!!');
			let store = res.images[0].receipt.result.storeInfo;
		    let cafename=store.name.text;
		    let sub = res.images[0].receipt.result.subResults[0];
		    
		    $('#cafeInfo').html('<h3>'+store.name.text+'</h3><input type="hidden" name="cafename" value="'+store.name.text+'">');
		    let str='';
		    $.each(sub.items, function(i, menu){
		        str+='<tr><td>'
				+'<span class="menuName col-3">'+menu.name.text+'</span>'
				+'</td><td>'
				   +'<span class="menuStar col-6">'
				   +'<span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;">  </i></span>'
				   +'<span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
				   +'<span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
				   +'<span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
				   +'<span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
				   +'<input type="hidden" name="menu" value="'+menu.name.text+'">'
				   +'<input type="hidden" name="rate" value="1">'
				   +'</span>'
				   +'</td></tr>';
		    })
		    $('#receiptResult').html(str);
	    	$('#inputArea').css('display','hide');
	    	$('#evalDiv').css('display','block');
		//console.log(JSON.stringify(res));
		}
	}).fail((err)=>{
		alert(err.status);
	});
}   
</script>
<style>
table tr td:first-child{
	text-align:center;
}
</style>
<div class="container">
<h2>Evaluations ...</h2>
<div id="inputArea">
    <span class="row mb-4 ml-4">
        <span class="col-11">영수증을 업로드해주세요!!</span>
        <input type="file" id="evalReceipt" class="form-control col-5">
        <input type="button" id="btnReceipt" class="btn btn-outline-warning col-1 ml-2" style="display:relative;" onclick="submitReceipt()" value="첨부하기">
    </span>
</div>
<div id="evalDiv" style="display:none;">
<form id="evalF" action="/evalReceipt" method="post">
	<div id="cafeInfo"></div>
	<c:if test = "${ empty loginUser}">
		<input type="hidden" name="idx" value="0000">
	</c:if>
	<c:if test="${not empty loginUser }">
		<input type="hidden" name="idx" value="<c:out value='${loginUser.idx }'/>">
	</c:if>
	<input type="hidden" name="kindness" value="1"> 
	<input type="hidden" name="clean" value="1"> 
	<input type="hidden" name="mood" value="1"> 
	<input type="hidden" name="price" value="1"> 
	<input type="hidden" name="comfort" value="1"> 
	<table class="table col-10">
		<tr>
			<td width="30%"></td>
			<td width="70%"></td>
		</tr>
		<tr>
			<td colspan="2"><h2>Menu☕️🍵🍹🍰🍩</h2></td>
		</tr>
		<div id="receiptResult"></div>
		<tr>
			<td colspan="2"><h2>Additionally➕🧐</h2></td>
		</tr>
		<tr>
			<td><span class="col-2"> 🫶매장 이용 여부 </span></td>
			<td>
				<div class="form-check-inline col-4">
                    <label class="form-check-label" for="radio1">
                      <input type="radio" class="form-check-input" id="radio1" name="heretogo" value="H" checked>매장에서 있었어요.
                    </label>
                  </div>
                  <div class="form-check-inline col-4">
                    <label class="form-check-label" for="radio2">
                      <input type="radio" class="form-check-input" id="radio2" name="heretogo" value="T">밖에서 즐겼어요.
                    </label>
                  </div>
			</td>
		</tr>
		<tr>
			<td><span class="col-3"> 🧘‍♀️ 웨이팅 여부 </span></td>
			<td>
                    <div class="form-check-inline col-4">
                    <label class="form-check-label" for="radio1">
                       <input type="radio" class="form-check-input" id="radio1" name="waiting" value="N" checked>바로 입장했어요.
                    </label>
                  </div>
                  
                  <div class="form-check-inline col-4">
                    <label class="form-check-label" for="radio2">
                      <input type="radio" class="form-check-input" id="radio2" name="waiting" value="Y">기다렸어요.
                    </label>
                  </div>
			</td>
		</tr>
		<tr>
			<td>😊<span class="evalType col-3">KINDNESS</span></td>
			<td>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</td>
		</tr>
		<tr>
			<td>🧹<span class="evalType col-3">CLEAN</span></td>
			<td>
				
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</td>
		</tr>
		<tr>
			<td>
			🧚<span class="evalType col-3">MOOD</span>
			</td>
			<td>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</td>
		</tr>
		<tr>
			<td>
			💸<span class="evalType col-3">PRICE</span>
			</td>
			<td>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</td>
		</tr>
		<tr>
			<td>
				🪑<span class="evalType col-3">COMFORT</span>
			</td>
			<td>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</td>
		</tr>

		<tr>
			<td>
				<span class="menuName col-3">아메리카노</span>
			</td>
			<td>
			    <span class="menuStar col-6">
			    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <input type="hidden" name="menu" value="아메리카노">
			    <input type="hidden" name="rate" value="1">
			    </span>
			</td>
		</tr>
		<tr>
			<td>
				<span class="menuName col-3">카페라떼</span>
			</td>
			<td>
			    <span class="menuStar col-6">
			    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
			    <input type="hidden" name="menu" value="카페라떼">
			    <input type="hidden" name="rate" value="1">
			    </span>
			</td>
		</tr>
         	
        <tr>
        <td colspan="2" class="text-center">
			<button type="submit" class="btn btn-primary" value="">done</button>
        </td>
        </tr>
	</table>
</form>
</div>
</div> 