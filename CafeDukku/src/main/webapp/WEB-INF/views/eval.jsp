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
        
    });
</script>
<div id="evalDiv">
<form id="evalF" action="/evalCafe" method="post">
	<div id="favList" class="mb-3">
	<input type="hidden" name="cafeid" value="${cafeid }">
	<input type="hidden" name="idx" value="${loginUser.idx }">
	<input type="hidden" name="kindness" value="1"> 
	<input type="hidden" name="clean" value="1"> 
	<input type="hidden" name="mood" value="1"> 
	<input type="hidden" name="price" value="1"> 
	<input type="hidden" name="comfort" value="1"> 
	<input type="hidden" name="restroom" value="1"> 
		<ul class="list-group">
			<li class="list-group-item row">
				<span class="evalType col-2">KINDNESS</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">CLEANING</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">MOOD</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">PRICE</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">COMFORT</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">RESTROOM</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2  a" style="color: #fff76b;"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" style="color: #fff76b;"></i></span>
                </span>
			</li>
			
		</ul>
	</div>
	<button type="submit" class="btn btn-primary" value="완료">
</form>

</div> 