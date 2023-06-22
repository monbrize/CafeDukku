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
	background-color: antiquewhite;
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
		<img src="logo-01.jpeg" alt="logo" width="50px" height="50px">
		<div class="col-7">
			<h3 class="display-3">Moon Child</h3>
			<h5>문차일드</h5>
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
		<div id="locMap" class="col-3"></div>
		<div id="notice" class="col-7">
			notice : 오늘은 쉽니다 ...
			<div id="infoText">국내에 첫 에스프레소 붐을 일으킨 곳으로 2018년 약수역 부근에 스탠딩커피
				바를 열며 사람들에게 입소문을 타다 지난 2월에는 청담동에 테이블 자리까지 갖춘 공간을 열며 더욱 큰 사랑을 받고 있다.
				당시 입문자용으로 ‘카페 피에노’를 추천 받았고, 카카오 토핑이 더해진 쫀득한 크림과 진한 에스프레소를 함께 마시니 참으로
				황홀했던 기억이다. 이후 에스프레소에 생크림이 들어간 카페 콘판나와 기본 에스프레소 두 잔을 그 자리에서 또 주문해 바로
				비워냈다.</div>
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
				<li><img src="menu01.jpeg"
					onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')"
					alt="" loading="lazy"></li>
				<li><img src="menu02.jpeg" alt=""></li>
			</ul>
		</div>
		<div id="shopImg">
			SHOP PHOTOS
			<ul>
				<li><img src="shopImg-01.jpeg" alt=""></li>
				<li><img src="shopImg-02.jpeg" alt=""></li>
				<li><img src="shopImg-03.jpeg" alt=""></li>
				<li><img src="shopImg-04.jpeg" alt=""></li>
			</ul>

		</div>
	</div>
</div>