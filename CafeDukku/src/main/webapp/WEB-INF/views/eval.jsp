<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h2>Evaluations ...</h2>
<script>
$(document).ready(function (){
    $('.starDiv span').click(function(){
        $(this).children().removeClass('fa-regular').addClass('fa-solid');   //ok
        $(this).prevAll().children().removeClass('fa-regular').addClass('fa-solid');    //선택이전까지 
        $(this).nextAll().children().removeClass('fa-solid').addClass('fa-regular');
        let str=$(this).parent().prev().text().toLowerCase();
        let score=$('.fa-solid:last').parent().attr('value');
        $('input[name='+str+']').val(score);
        return false;
    })
	$(document).on('click', '.menuStar span', function(){
		$(this).children().removeClass('fa-regular').addClass('fa-solid');   //ok
	    $(this).prevAll().children().removeClass('fa-regular').addClass('fa-solid');    //선택이전까지 
	    $(this).nextAll().children().removeClass('fa-solid').addClass('fa-regular');
	    let str=$(this).parent().prev().text();
	    let score=$(this).find('.fa-solid:last').parent().attr('value');
	    return false;
    })
});//////////$()

const submitReceipt=function(){
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
		alert('success');
		let store = res.images[0].receipt.result.storeInfo;
	    let cafename=store.name.text;
	    let sub = res.images[0].receipt.result.subResults[0];
	    
	    $('#cafeInfo').html('<h3>'+store.name.text+'</h3>');
	    let str='';
	    $.each(sub.items, function(i, menu){
	        str+='<li class="list-group-item row col">'
	        +'<span class="menuName col-3">'+menu.name.text+'</span>'
	        +'<span class="menuStar col-6">'
	        +'<span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
	        +'<span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
	        +'<span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
	        +'<span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
	        +'<span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>'
	        +'</span>'
	        +'</li>';
	    })
	    $('#receiptResult').html(str);
		//console.log(JSON.stringify(res));
	}).fail((err)=>{
		alert(err.status);
	});
}   
</script>
<div class="inputArea">
    <span class="row mb-4 ml-4">
        <span class="col-11">영수증을 업로드해주세요!!</span>
        <input type="file" id="evalReceipt" class="form-control col-5">
        <input type="button" id="btnReceipt" class="btn btn-outline-warning col-1 ml-2" style="display:relative;" onclick="submitReceipt()" value="첨부하기">
    </span>
</div>
<div id="cafeInfo"></div>
<div id="evalDiv">
<form id="evalF" action="/evalCafe" method="post">
	<div id="favList" class="mb-3 col">
	<input type="hidden" name="cafeid" value="${cafeid }">
	<input type="hidden" name="idx" value="${loginUser.idx }">
	<input type="hidden" name="kindness" value="1"> 
	<input type="hidden" name="clean" value="1"> 
	<input type="hidden" name="mood" value="1"> 
	<input type="hidden" name="price" value="1"> 
	<input type="hidden" name="comfort" value="1"> 
		<ul class="list-group">
            <li class="list-group-item row col">
                <span class="col-3"> 🫶매장 이용 여부 </span>
                  <div class="form-check-inline col-3">
                    <label class="form-check-label" for="radio1">
                      <input type="radio" class="form-check-input" id="radio1" name="heretogo" value="H" checked>매장에서 있었어요.
                    </label>
                  </div>
                  
                  <div class="form-check-inline col-3">
                    <label class="form-check-label" for="radio2">
                      <input type="radio" class="form-check-input" id="radio2" name="heretogo" value="T">테이크어웨이 했어요.
                    </label>
                  </div>
            </li>
            <li class="list-group-item row col">
                <span class="col-3"> 🧘‍♀️ 웨이팅 여부 </span>
                    <div class="form-check-inline col-3">
                    <label class="form-check-label" for="radio1">
                       <input type="radio" class="form-check-input" id="radio1" name="waiting" value="N" checked>바로 입장했어요.
                    </label>
                  </div>
                  
                  <div class="form-check-inline col-3">
                    <label class="form-check-label" for="radio2">
                      <input type="radio" class="form-check-input" id="radio2" name="waiting" value="Y">기다렸어요.
                    </label>
                  </div>
            </li>
			<li class="list-group-item row col">
				<span class="evalType col-3">😊KINDNESS</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row col">
				<span class="evalType col-3">🧹CLEAN</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row col">
				<span class="evalType col-3">🧚‍♀️MOOD</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row col">
				<span class="evalType col-3">💸PRICE</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row col">
				<span class="evalType col-3">🪑COMFORT</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
           	<div id="receiptResult"></div>
		</ul>
	</div>
	<button type="submit" class="btn btn-primary" value="">done</button>
</form>

</div> 