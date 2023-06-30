<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=745bfc22d2b40309a36d71d661a78c0a&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=745bfc22d2b40309a36d71d661a78c0a"></script>
<link rel="stylesheet" type="text/css" href="./css/viewCafe.css">
<script>
$(document).ready(function () {
	let coords;
	let Xx, Yy;
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
})
</script>
<div class="container">
	<div class="row mb-3">
		<!-- 로고/상호명/평균스코어 -->
		<div id="logoImg" class="col-2">
			<c:if test="${(imgs.img_type eq 'logo') ne null}">
				<img src="../../logo_img/<c:out value="${img_name_origin}"/>"
					onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')" alt="logo">
			</c:if>
			<c:if test="${(imgs.img_type eq 'logo') eq null }">
				<img src="../../logo_img/logo_init.jpg" alt="logo">
				<!-- 사진 없을 때 기본 사진 설정 -->
			</c:if>
		</div>
		<div class="col-8">
			<div class="alert alert-warning col-12">
				<!-- 상호명 한글 12자 -->
				<span id="cafename1">${cafe.cafename }</span>- <span id="cafename2">${cafe.cafename2 }</span>
			</div>
			<div class="row col-12">
				<span class="alert alert-danger col-2 mr-3"> ⭐️4.1 </span> <span
					class="alert alert-success col-5 mr-3"> <span class="title">☎️</span><span>${cafe.call }</span>
				</span> <span class="alert alert-primary col-4"> <a
					href="https://instagram.com/<c:out value='${cafe.sns_url }'/>"
					target="_blank">👻@<c:out value="${cafe.sns_url }" /></a>
				</span>
			</div>
		</div>
		<div id="midInfo" class="row col-12 mt-3 mb-3">
			<!-- 지도, 공지, 정보, 소개 -->
			<div class="col-5">
				<div class="alert alert-light col-12">
					<span class="title">📍</span> <span>${cafe.loc1 }</span> <input
						type="hidden" id="mapLoc" value="${cafe.loc1}">
				</div>
				<div id="locMap" class="col-12"></div>
			</div>
			<div class="row col-7">
				<div id="notice" class="alert alert-secondary col-12">notice :
					${cafe.notice }</div>
				<div id="infoText" class="col-12">${cafe.inform }</div>
			</div>
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
					<c:if test="${tags.tag_type eq 'mood'}">
						<!-- 태그명 반복문 -->
						<c:forEach var="tag" items="${tags.tag_name}">
							<span class="tag_name">${tag }</span>
						</c:forEach>
					</c:if>
					<!--  -->
				</div>
				<div id="classifyArea" class="row">
					<span class="tag_type">CLASSIFY</span>
					<!--  -->
					<c:if test="${tags.tag_type eq 'classify'}">
						<!-- 태그명 반복문 -->
						<c:forEach var="tag" items="${tags.tag_name}">
							<span class="tag_name">${tag }</span>
						</c:forEach>
					</c:if>
					<!--  -->
				</div>
				<div id="prideArea" class="row">
					<span class="tag_type">PRIDE</span>
					<!--  -->
					<c:if test="${tags.tag_type eq 'pride'}">
						<!-- 태그명 반복문 -->
						<c:forEach var="tag" items="${tags.tag_name}">
							<span class="tag_name">${tag }</span>
						</c:forEach>
					</c:if>
					<!--  -->
				</div>
				<div id="paymentArea" class="row">
					<span class="tag_type">PAYMENT</span>
					<!--  -->
					<c:if test="${tags.tag_type eq 'payment'}">
						<!-- 태그명 반복문 -->
						<c:forEach var="tag" items="${tags.tag_name}">
							<span class="tag_name">${tag }</span>
						</c:forEach>
					</c:if>
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
				<c:if test="${(imgs.img_type eq 'menu') ne null}">
					<c:forEach var="menu" items="${imgs.img_name}">
						<img src="../../menu_img/<c:out value="${menu}"/>"
							onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')" alt="menu" loading="lazy">
					</c:forEach>
				</c:if>
				<c:if test="${(imgs.img_type eq 'menu') eq null }">
					<!-- 사진 없을 때 기본 사진 설정 -->
				<img src="../../menu_img/menu_init.jpg" alt="menu">
				</c:if>
			</div> 
		</div>
		<div id="shopImg" class="col-7 ml-3">
			<button id="left-shop-btn" class="shop-btn btn btn-outline-dark"><</button>
			<button id="right-shop-btn" class="shop-btn btn btn-outline-dark">></button>
			<div id="shopSlide">
				<c:if test="${(imgs.img_type eq 'cafe') ne null}">
					<c:forEach var="cafe" items="${imgs.img_name}">
						<img src="../../cafe_img/<c:out value="${cafe}"/>"
							onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')" alt="cafe" loading="lazy">
					</c:forEach>
				</c:if>
				<c:if test="${(imgs.img_type eq 'cafe') eq null }">
				<!-- 사진 없을 때 기본 사진 설정 -->
				<img src="../../cafe_img/cafe_init-01.jpg" alt="cafe">
				<img src="../../cafe_img/cafe_init-02.jpg" alt="cafe">
				</c:if>
			</div>
		</div>
	</div>
</div>