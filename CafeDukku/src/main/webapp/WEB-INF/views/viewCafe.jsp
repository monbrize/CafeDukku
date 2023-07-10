<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="./css/viewCafe.css">
<script>
$(document).ready(function () {
	let container = document.getElementById('locMap'); //지도를 담을 영역의 DOM 레퍼런스
		/* 카카오맵 출력 */
		let options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(<c:out value="${cafe.mapcode1}"/>, <c:out value="${cafe.mapcode2}"/>),
			level: 4 //지도의 레벨(확대, 축소 정도)
		}; 
		let marker = new kakao.maps.Marker({
			position:options.center
		});
		let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		marker.setMap(map);
	
});
$(function(){
	let idx='<c:out value="${loginUser.idx }"/>';
	let cafeid='<c:out value="${cafe.cafeid }"/>';
    $('#menuImg').hover(function(){
        $('.menu-btn').css('display','block');
    },function(){
        $('.menu-btn').css('display','none');
    })
    $('#shopImg').hover(function(){
        $('.shop-btn').css('display','block');
    },function(){
        $('.shop-btn').css('display','none');
    })
    $('#right-menu-btn').click(()=>{
        $('#menuSlide').append($('#menuSlide>img:first'));
    });
    $('#left-menu-btn').click(()=>{
        $('#menuSlide').prepend($('#menuSlide>img:last'));
    });
    $('#right-shop-btn').click(()=>{
        $('#shopSlide').append($('#shopSlide>img:first'));
    });
    $('#left-shop-btn').click(()=>{
        $('#shopSlide').prepend($('#shopSlide>img:last'));
    });
    
    $('#favEmpty').click(()=>{
    	if(!idx){
    		alert('로그인 후 이용 가능합니다.');
    		return false;
    	}
   		$.ajax({
    		type:'put',
    		url:'addfav',
    		data:{cafeid:cafeid, idx:idx},
    		cache:false,
    		success:function(res){
		    	$('#favEmpty').css('display','none');
		    	$('#favFull').css('display', 'inline-block');
		    	let cnt= Number($('#favCnt').html());
		    	$('#favCnt').html(cnt+1);
    		},error:function(err){
    			
    		}
    		
    	});
    });
    $('#favFull').click(()=>{
    	if(!idx){
    		alert('로그인 후 이용 가능합니다.');
    		return false;
    	}
    	$.ajax({
    		type:'delete',
    		url:'cancelfav',
    		data:{cafeid:cafeid, idx:idx},
    		cache:false,
    		success:function(res){
		    	 $('#favFull').css('display','none');
		    	 $('#favEmpty').css('display', 'inline-block');
		    	 let cnt= Number($('#favCnt').html());
		     	$('#favCnt').html(cnt-1);
    		},error:function(err){
    			
    		}
    		
    	});
    });
    $('#openEval').click(()=>{
    	if(!idx){
    		alert('로그인 후 이용 가능합니다.');
    		return false;
    	}
    	$('#evalDiv').css('display','block');
    	var offset = $('#evalDiv').offset(); //선택한 태그의 위치를 반환
        //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
    	$('html').animate({scrollTop : offset.top}, 400);
    	
    });
})
</script>
<div class="container">
	<div class="row mb-3">
	<div id="topInfo" class="row col-12 mt-3 mb-3">
		<!-- 로고/상호명/평균스코어 -->
		<div id="logoImg" class="col-2 mr-2 " >
			<c:forEach var="i" items="${imgs }">
				<c:if test="${not empty i and i.img_type eq 'logo'}">
				<img src="../../logo_img/<c:out value="${i.img_name}"/>"
					onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')" alt="logo">
				</c:if>
			</c:forEach>
		</div><!-- logoImg -->
		
		<div class="row col-9">
			<div class="alert col-9"><!-- 첫번째 라인  -->
				<!-- 상호명 -->
				<span id="cafename1"><c:out value="${cafe.cafename }"/></span>&nbsp;
				<span id="cafename2"> <c:out value=" ${cafe.cafename2 }"/></span>
			</div>
			<!-- 하트버튼 -->
			<div id="fav" class="col-2 mt-3">
			<c:if test="${(not empty loginUser and cafe.myFav eq true) or empty loginUser}">
			<!-- 풀하트 : 로그인을 안했거나 로그인 한 내 fav 일때  -->
				<span id="favEmpty" style="display:none;">
					<i class="fa-regular fa-heart fa-beat-fade fa-2xl mt-4" style="color: #ff8c82;"></i>
				</span>
				<span id="favFull">
					<i class="fa-solid fa-heart fa-2xl mt-4" style="color: #e32400;"></i>
				</span>
			</c:if>
			<c:if test="${cafe.myFav eq false and not empty loginUser}">
			<!-- 빈 하트 : 로그인을 한 상태이고 내 fav가 아닐 때-->
				<span id="favEmpty">
					<i class="fa-regular fa-heart fa-beat-fade fa-2xl mt-4" style="color: #ff8c82;"></i>
				</span>
				<span id="favFull" style="display:none;">
					<i class="fa-solid fa-heart fa-2xl mt-4" style="color: #e32400;"></i>
				</span>
			</c:if>
			<span id="favCnt"> <c:out value="${cafe.favTotalCnt }"/> </span>
			</div><!-- 하트버튼 끝 -->
			
			<div class="col-12"><!-- 두번째 라인 -->
				<span class="alert alert-danger mr-3"> ⭐️<c:if test="${empty cafe.totalScore }">0</c:if>
			<c:if test="${not empty cafe.totalScore }">
				<fmt:formatNumber value="${cafe.totalScore }" pattern="0.00" var="score"/>
				<c:out value="${score }"/>
			</c:if></span> 
				<span class="alert alert-info mr-3"> <span class="title">☎️</span><span>${cafe.call }</span></span> 
				<span class="alert alert-dark "> 
					<a href="https://instagram.com/<c:out value='${cafe.sns_url }'/>" target="_blank">👻@<c:out value="${cafe.sns_url }" /></a>
				</span>
			</div>
		</div>
	</div><!-- topInfo -->
		<div id="midInfo" class="row col-12 mt-2 mb-2 ml-1">
			<!-- 지도, 공지, 정보, 소개 -->
			<div class="col-4">
				<div class="alert alert-light">
					<span class="title">📍</span> <span>${cafe.loc1 }</span> <input
						type="hidden" id="mapLoc" value="${cafe.loc1}">
				</div>
			</div>
				<div class="col-7">
					<div id="notice" class="alert alert-secondary" width="100%">
					📣 ${cafe.notice }</div>
				</div>
				<div id="locMap" class="col-4"></div>
				<div id="infoText" class="col-7 ml-1">${cafe.inform }</div>
			<div class="col-1"></div>
		</div>
		<!-- midInfo -->
		<div id="midInfo2" class="row col">
			<div class="tBtn col-2">SHOP Rank </div>
			<div class="tBtn col-3">MENU Rank</div>
			<div class="tBtn col-6">TAGGING</div>
			<div id="rankMenu" class="row col-2 mt-3">
			<c:if test="${empty evals }">
				<span class="col-10">첫 평가를 해보세요!</span>
			</c:if>
			<c:if test="${not empty evals }">
			<span class="col-8">
				 😊친절함
			</span>
				<span class="badge col-4"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i> 
				<c:out value="${evals.kindness}"/>
				</span>
			<span class="col-8">
				🪑편안함
			</span>
				<span class="badge col-4"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i> 
				<c:out value="${evals.comfort}"/>
				</span>
			<span class="col-8">
				💸가격
			</span>
				<span class="badge col-4"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i> 
				<c:out value="${evals.price}"/>
				</span>
			<span class="col-8">
				🧹청결도
			</span>
				<span class="badge col-4"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i> 
				<c:out value="${evals.clean}"/>
				</span>
			<span class="col-8">
				🧚분위기
			</span>
				<span class="badge col-4"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i> 
				<c:out value="${evals.mood}"/>
				</span>

			</c:if>
			</div>
			<div id="evalShop" class="col-3 row mt-3 ml-2 mr-2">
			<c:if test="${empty topMenu }">아직 별점이 없습니다..</c:if>
			<c:if test="${not empty topMenu }">
			<c:forEach var="m" items="${topMenu }" varStatus="s">
				<span class="col-2"></span>
				<span class="col-8"><c:out value="${s.count}"/>.&nbsp;<c:out value="${m.menu}"/></span>
				<span class="badge col-2"><i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i> 
					<c:out value="${m.menu_rate_avg}"/>
				</span>
			</c:forEach>
			</c:if>
			</div>
			<!-- cafeInfo -->
			<div id="tagInfo" class="row col-6 pl-1 ml-5	">

				<div id="moodArea" class="row ">
					<span class="tag_type">MOOD</span>
					<!--  -->
					<c:forEach var="t" items="${tags}">
						<c:if test="${t.tag_type eq 'mood'}">
						<!-- 태그명 반복문 -->
							<span class="tag_name">${t.tag_name }</span>
						</c:if>
					</c:forEach>
				</div>
				<div id="classifyArea" class="row">
					<span class="tag_type">CLASSIFY</span>
					<!--  -->
					<c:forEach var="t" items="${tags}">
						<c:if test="${t.tag_type eq 'classify'}">
						<!-- 태그명 반복문 -->
							<span class="tag_name">${t.tag_name }</span>
						</c:if>
					</c:forEach>
					<!--  -->
				</div>
				<div id="prideArea" class="row">
					<span class="tag_type">PRIDE</span>
					<!--  -->
					<c:forEach var="t" items="${tags}">
						<c:if test="${t.tag_type eq 'pride'}">
						<!-- 태그명 반복문 -->
							<span class="tag_name">${t.tag_name }</span>
						</c:if>
					</c:forEach>
					<!--  -->
				</div>
				<div id="paymentArea" class="row">
					<span class="tag_type">PAYMENT</span>
					<!--  -->
					<c:forEach var="t" items="${tags}">
						<c:if test="${t.tag_type eq 'payment'}">
						<!-- 태그명 반복문 -->
							<span class="tag_name">${t.tag_name }</span>
						</c:if>
					</c:forEach>
					<!--  -->
				</div>
			</div>
		</div>
	</div>
	<!-- midInfo2 -->
	<div id="bottomInfo" class="row mb-3">
		<!-- 이미지 가로스크롤 -->
		<div class="tBtn col-4">MENU</div>
		<div class=""></div>
		<div class="tBtn col-7">SHOP PHOTOS</div>
		<div class=""></div>
		<div id="menuImg" class="col-4">
			<button id="left-menu-btn" class="menu-btn btn btn-outline-dark"><</button>
			<button id="right-menu-btn" class="menu-btn btn btn-outline-dark">></button>
			<div id="menuSlide">
				<c:forEach var="i" items="${imgs }">
					<c:if test="${not empty i and i.img_type eq 'menu'}">
						<img src="../../menu_img/<c:out value="${i.img_name}"/>"
							onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')" alt="menu" loading="lazy">
					</c:if>
				</c:forEach>
			</div> 
		</div>
		<div id="shopImg" class="col-7 ml-3">
			<button id="left-shop-btn" class="shop-btn btn btn-outline-dark"><</button>
			<button id="right-shop-btn" class="shop-btn btn btn-outline-dark">></button>
			<div id="shopSlide">
				<c:forEach var="i" items="${imgs }">
					<c:if test="${not empty i and i.img_type eq 'cafe'}">
						<img src="../../cafe_img/<c:out value="${i.img_name}"/>"
							onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')" alt="cafe" loading="lazy">
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>


<script>
    $(document).ready(function (){
        $('.starDiv span').click(function(){
            $(this).children().removeClass('fa-regular').addClass('fa-solid');   //ok
            $(this).prevAll().children().removeClass('fa-regular').addClass('fa-solid');    //선택이전까지 
            $(this).nextAll().children().removeClass('fa-solid').addClass('fa-regular');
            let str=$(this).parent().prev().text().toLowerCase();
            let score=$(this).children('.fa-solid:last').parent().attr('value');
            $('input[name='+str+']').val(score);
            return false;
        })
        
    });
</script>
<style>
.star {
	color:#fecb3e;
}
#evalDiv{
    background-color:#EBD8B2;
    padding:20px;
    display:none;
}
</style>
<div id="evalDiv" style="">
<h2>Evaluations ...</h2>
<form id="evalF" action="/evalCafe" method="post">
	<div id="favList" class="mb-3">
	<input type="hidden" name="cafeid" value="${cafe.cafeid }">
	<input type="hidden" name="idx" value="${loginUser.idx }">
	<input type="hidden" name="kindness" value="1"> 
	<input type="hidden" name="clean" value="1"> 
	<input type="hidden" name="mood" value="1"> 
	<input type="hidden" name="price" value="1"> 
	<input type="hidden" name="comfort" value="1"> 
		<ul class="list-group">
			<li class="list-group-item row">
				<span class="evalType col-2">KINDNESS</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid   fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">CLEAN</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2"  ></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">MOOD</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2"  ></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">PRICE</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2"   ></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2" ></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2" ></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2" ></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2" ></i></span>
                </span>
			</li>
			<li class="list-group-item row">
				<span class="evalType col-2">COMFORT</span>
				<span class="starDiv col-6">
                    <span class="star" value="1"><i class="fa-solid fa-star fa-lg mt-2 mr-2"  ></i></span>
                    <span class="star" value="2"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="3"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="4"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                    <span class="star" value="5"><i class="fa-regular fa-star fa-lg mt-2 mr-2"></i></span>
                </span>
			</li>
						
		</ul>
	</div>
	<div class="text-center">
	<button type="submit" class="btn btn-primary" >완료</button>
	</div>
</form>

</div> 