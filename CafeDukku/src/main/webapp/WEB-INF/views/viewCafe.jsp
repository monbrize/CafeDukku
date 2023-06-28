<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=745bfc22d2b40309a36d71d661a78c0a&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=745bfc22d2b40309a36d71d661a78c0a"></script>
<script>
//let kakao_rest_key='9bc0d569fd0b0a9b1073210142036684';

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
				level: 3 //지도의 레벨(확대, 축소 정도)
			}; 
			let marker = new kakao.maps.Marker({
				position:options.center
			});
			let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			marker.setMap(map);
	    }
	});

	
	$('.starRev span').click(function(){
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        //alert($(this).attr("value"));
        return false;
    });
});
</script>
<style>
#menuImg {
	float: left;
	width: 20%;
	height: 200px;
	overflow: hidden;
	/*position: relative;*/
}
img {
	width: 100px;
	height: auto;
}
#bottomInfo ul {
	position: absolute;
}
#bottomInfo ul li {
	display: inline-block;
}
#shopImg {
	float: right;
	width: 60%;
	height: 200px;
	overflow: hidden;
}
#locMap {
	width: 300px;
	height: 300px;
	float: left;
	margin-right: 10px;
}

#rankInfo {
	height: 200px;
}
</style>
<div class="container">
	<div id="topInfo" class="row">
		<!-- 로고/상호명/평균스코어 -->
		<div class="col-1"></div>
		<img src="../../logo_img/${cafe.cafeid}_shop_01.jpeg" alt="logo" width="50px" height="50px">
		<div class="col-7">	
			<h4 class="display-4">${cafe.cafename }</h4>
			<h5>${cafe.cafename2 }</h5>
		</div>
		<div class="col-2">
			<h4 class="display-4">⭐️4.1</h4>
		</div>
	</div>
	<div id="tagInfo">
		CLASSIFY : #esspressobar #bakery #tea <br> MOOD : #lovely #cozy <br>
		PRIDE : #view #dog #sunshine<br> PAYMENT : #applePay #SamsungPay
		#card<br>
	</div>
	<div id="midInfo" class="row">
		<!-- 지도, 공지, 정보, 소개 -->
		<div id="locMap" class="col-3">
		<input type="hidden" id="mapLoc" value="${cafe.loc1 }">
		</div>
		<div id="notice" class="col-7">
			notice : ${cafe.notice }
			<div id="infoText">${cafe.inform }</div>
		</div>
	</div>
	<div id="rankInfo" class="row">
		<!-- 랭크 정보 - 메뉴순위, 평가 항목 -->
		<div id="rankMenu" class="col-4">
			<ul>
				<li>아메리카노 ⭐️3.5</li>
				<li>아이스라떼 ⭐️3.5</li>
				<li>오렌지자몽티 ⭐️3.5</li>
				<li>아이스블랙티 ⭐️3.5</li>
				<li>레몬에이드 ⭐️3.5</li>
			</ul>
		</div>
		<div id="evalShop" class="col-4">
			<ul>
				<li>청결도 ⭐️5.0</li>
				<li>친절도 ⭐️4.8</li>
				<li>분위기 ⭐️3.9</li>
				<li>안락함 ⭐️3.2</li>
				<li>화장실 ⭐️5.0</li>
				<li>가격 ⭐️2.0</li>
			</ul>
		</div>
	</div>
	<div id="bottomInfo">
		<!-- 이미지 가로스크롤 -->
		<div id="menuImg">
			MENU
			<ul>
				<li><img src="../../image_home/menu01.jpeg"
					onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')"
					alt="" loading="lazy"></li>
				<li><img src="../../image_home/menu03.jpeg" alt=""></li>
			</ul>
		</div>
		<div id="shopImg">
			SHOP PHOTOS
			<ul>
				<li><img src="../../image_home/shopImg-01.jpeg" alt=""></li>
				<li><img src="../../image_home/shopImg-02.jpeg" alt=""></li>
				<li><img src="../../image_home/shopImg-03.jpeg" alt=""></li>
				<li><img src="../../image_home/shopImg-04.jpeg" alt=""></li>
			</ul>

		</div>
	</div>
</div>