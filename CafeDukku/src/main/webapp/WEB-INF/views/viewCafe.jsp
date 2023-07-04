<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=745bfc22d2b40309a36d71d661a78c0a&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=745bfc22d2b40309a36d71d661a78c0a"></script>
<link rel="stylesheet" type="text/css" href="./css/viewCafe.css">
<script>
$(document).ready(function () {
	let geocoder = new kakao.maps.services.Geocoder();
	let container = document.getElementById('locMap'); //지도를 담을 영역의 DOM 레퍼런스
	geocoder.addressSearch($('#mapLoc').val(), function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
			/* 카카오맵 출력 */
			let options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(result[0].y, result[0].x),
				level: 4 //지도의 레벨(확대, 축소 정도)
			}; 
			let marker = new kakao.maps.Marker({
				position:options.center
			});
			let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			marker.setMap(map);
	    }
	});	
});
$(function(){
	let idx=$('#idx').val();
	let cafeid=$('#cafeid').val();
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
})
</script>
<div class="container">
<input type="hidden" id="idx" value="${loginUser.idx }">
<input type="hidden" id="cafeid" value="${cafe.cafeid }">

	<div class="row mb-3">
	<div id="topInfo" class="row mt-3 mb-3 ml-3">
		<!-- 로고/상호명/평균스코어 -->
		<div id="logoImg" class="col-2 mr-3">
			<c:forEach var="i" items="${imgs }">
				<c:if test="${not empty i and i.img_type eq 'logo'}">
				<img src="../../logo_img/<c:out value="${i.img_name}"/>"
					onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')" alt="logo">
				</c:if>
			</c:forEach>
		</div><!-- logoImg -->
		
		<div class="row col-10">
			<div class="alert col-10">
				<!-- 상호명 -->
				<span id="cafename1">${cafe.cafename }</span>- <span id="cafename2">${cafe.cafename2 }</span>
			</div>
			<div id="fav" class="col-2">
			<c:if test="${cafe.myFav eq true}">
				<span id="favEmpty" style="display:none;">
					<i class="fa-regular fa-heart fa-beat-fade fa-2xl mt-4" style="color: #ff8c82;"></i>
				</span>
				<span id="favFull">
					<i class="fa-solid fa-heart fa-2xl mt-4" style="color: #e32400;"></i>
				</span>
			</c:if>
			<c:if test="${cafe.myFav eq false}">
				<span id="favEmpty">
					<i class="fa-regular fa-heart fa-beat-fade fa-2xl mt-4" style="color: #ff8c82;"></i>
				</span>
				<span id="favFull" style="display:none;">
					<i class="fa-solid fa-heart fa-2xl mt-4" style="color: #e32400;"></i>
				</span>
			</c:if>
			<span id="favCnt"> <c:out value="${cafe.favTotalCnt }"/> </span>
			</div>
			<div class="col-12">
				<span class="alert mr-3"> ⭐️4.1 </span> 
				<span class="alert  mr-3"> <span class="title">☎️</span><span>${cafe.call }</span></span> 
				<span class="alert "> 
					<a href="https://instagram.com/<c:out value='${cafe.sns_url }'/>" target="_blank">👻@<c:out value="${cafe.sns_url }" /></a>
				</span>
			</div>
		</div>
		</div><!-- topInfo -->
		<div id="midInfo" class="row mt-2 mb-2 ml-1">
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
		<div id="midInfo2" class="row">
			<div class="tBtn col-2">SHOP Rank</div>
			<div class="tBtn col-2">MENU Rank</div>
			<div class="tBtn col-7">TAGGING</div>
			<div id="rankMenu" class="col-2">
				😊KINDNESS ⭐️5.0 <br> 🪑COMFORTABLE ⭐️3.2<br> 💸PRICE
				⭐️2.5<br> 🧹CLEAN ⭐️4.2<br> 🧚‍♀️MOOD ⭐️2.1 <br>
			</div>
			<div id="evalShop" class="col-2">
				AMERICANO ⭐️5.0<br>ESSPRESSO ⭐️4.7<br>YUZU ADE ⭐️4.7<br>BAGEL
				⭐️4.6<br>CHEESECAKE ⭐️4.0
			</div>
			<!-- cafeInfo -->
			<div id="tagInfo" class="container-fluid col-7">

				<div id="moodArea" class="row">
					<span class="tag_type">MOOD</span>
					<!--  -->
					<c:forEach var="t" items="${tags}">
						<c:if test="${t.tag_type eq 'mood'}">
						<!-- 태그명 반복문 -->
							<span class="tag_name">${t.tag_name }</span>
						</c:if>
					</c:forEach>
					<!--  -->
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