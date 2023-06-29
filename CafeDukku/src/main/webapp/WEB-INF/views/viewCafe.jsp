<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=745bfc22d2b40309a36d71d661a78c0a&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=745bfc22d2b40309a36d71d661a78c0a"></script>
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
<style>
#menuImg {
	float: left;
	width: 20%;
	height: 200px;
	overflow: hidden;
	/*position: relative;*/
}
#bottomInfo img {
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
	width: 100%;
	height: 300px;
	float: left;
	margin-right: 10px;
}

#rankInfo {
	height: 200px;
}
#tagInfo>div>span, .tBtn{
    border-radius: 20px;
    padding: 10px 15px 10px 15px;
    clear:both;
    vertical-align:middle;
    text-align: center;
    margin: 5px;
}
#tagInfo >div> .tag_type {
    font-weight: bolder;
    color: white;
    width: 120px;
}
#moodArea > .tag_type{
    background-color: #8294C4;
}
#moodArea > .tag_name{
    background-color: #DBDFEA;
}
#classifyArea > .tag_type{
    background-color: #A0C49D;
}
#classifyArea > .tag_name{
    background-color: #E1ECC8;
}
#prideArea > .tag_type{
    background-color: #FF9EAA;
}
#prideArea > .tag_name{
    background-color: #FFD0D0;
}
#paymentArea > .tag_type{
    background-color: #0A6EBD;
}
#paymentArea > .tag_name{
    background-color: #A1C2F1;
}
#cafename1{
    /* width: 100%; */
    font-size:xx-large;
    text-size-adjust: auto;
    height: 50px;
    white-space : nowrap;
    font-weight: bolder;
}
#cafename2{
    font-size:medium;
}
#menuImg, #shopImg{
    width: 100%;
    height: 300px;
    position: relative;
    display: flex;
    overflow: hidden;
    transition: transform 0.5s;
}
#menuSlide, #shopSlide{
    overflow: hidden;
    text-align: center;
    
}
#menuSlide img{
    width: 70%;
    height: 300px;
}
#bottomInfo button{
    top:120px;
    z-index: 1;
    display: none;
    position: absolute;
}
#left-menu-btn {
    float:left;
    left:25px;
}
#right-menu-btn{
    float:right;
    right:25px;
}
#shopSlide img{
    width: 40%;
    height: 300px;
}
#left-shop-btn {
    float:left;
    left:25px;
}
#right-shop-btn{
    float:right;
    right:25px;
}
.tBtn{
	font-weight: bolder;
    color: white;
	background-color:#EBD8B2;
}
#logoImg{
	position:relative;
}
#logoImg img{
    position: absolute;
    top: 0;
    left: 0;
    transform: translate(50, 50);
    width: 100%;
    height:100%;
    object-fit: cover;
    margin: auto;
}
</style>
<div class="container">
	<div class="row mb-3">
	 <!-- 로고/상호명/평균스코어 -->
                <div id="logoImg" class="col-2">
					<img src="../../logo_img/logo-01.jpeg" alt="logo">
				</div>
                <div class="col-8">
                <div class="alert alert-warning col-12">
                    <!-- 상호명 한글 12자 -->
                    <span id="cafename1">하나두울셋넷다섯여섯일곱</span>-
                    <span id="cafename2">cafename</span>
                </div>
                <div class="row col-12">
                	<span class="alert alert-danger col-2 mr-3">
                        ⭐️4.1
                    </span>

                    <span class="alert alert-success col-5 mr-3">
                        <span class="title">☎️</span>
                        <span>010-6700-8002</span>
                    </span>
                    <span class="alert alert-primary col-4">
                        <a href="https://instagram.com/yuureru" target="_blank">👻@instagram</a>
                    </span>
                </div>
                </div>
			<div id="midInfo" class="row col-12 mt-3 mb-3">
		            <!-- 지도, 공지, 정보, 소개 -->
		            <div class="col-5">
		                <div class="alert alert-light col-12">
		                <span class="title" >📍</span>
		                    <span>${cafe.loc1 }</span>
		                    <input type="hidden" id="mapLoc" value="${cafe.loc1}">
		                </div>
		                <div id="locMap" class="col-12"></div>
		            </div>
		            <div class="row col-7">
						<div id="notice" class="alert alert-secondary col-12">
						notice : ${cafe.notice }
						</div>
						<div id="infoText" class="col-12">
							${cafe.inform }
						</div>
				</div>
			</div>
			<!-- midInfo -->
			<div id="midInfo2" class="row">
                <div class="tBtn col-2">SHOP Rank</div>
                <div class="tBtn col-2">MENU Rank</div>
                <div class="tBtn col-7">TAGGING</div>
            		<div id="rankMenu" class="col-2">
		                😊KINDNESS ⭐️5.0     <br>
		                🪑COMFORTABLE ⭐️3.2<br>
		                💸PRICE ⭐️2.5<br> 
		                🧹CLEAN ⭐️4.2<br>
						🧚‍♀️MOOD ⭐️2.1  <br>                               
            		</div>
	            	<div id="evalShop" class="col-2">
	                AMERICANO ⭐️5.0<br>ESSPRESSO ⭐️4.7<br>YUZU ADE ⭐️4.7<br>BAGEL ⭐️4.6<br>CHEESECAKE ⭐️4.0
	            	</div>
            <!-- cafeInfo -->
		<div id="tagInfo" class="container-fluid col-7">
		
            <div id="moodArea" class="row">
                <span class="tag_type">MOOD</span>
                <span class="tag_name">lovely</span>
                <span class="tag_name">minimal</span>
                <span class="tag_name">classic</span>
            </div>
            <div id="classifyArea" class="row">
                <span class="tag_type">CLASSIFY</span>
                <span class="tag_name" >bakery</span>
                <span class="tag_name" >esspressobar</span>
                <span class="tag_name" >classic</span>
            </div>
            <div id="prideArea" class="row">
                <span class="tag_type">PRIDE</span>
                <span class="tag_name" >sunshine</span>
                <span class="tag_name" >petfriendly</span>
                <span class="tag_name" >goods</span>
            </div>
            <div id="paymentArea" class="row">
                <span class="tag_type">PAYMENT</span>
                <span class="tag_name" >creditcard</span>
                <span class="tag_name" >applepay</span>
                <span class="tag_name" >cash</span>
            </div>
        </div>
    </div>
    </div>
        <!-- midInfo2 -->
	<div id="bottomInfo" class="row mb-3">
		<!-- 이미지 가로스크롤 -->
            <div class="tBtn col-4">
                MENU
            </div>
            <div class=""></div>
            <div class="tBtn col-7">
                SHOP PHOTOS
            </div>
            <div class=""></div>
            <div id="menuImg" class="col-4">
                <button id="left-menu-btn" class="menu-btn btn btn-outline-dark"><</button>
                <button id="right-menu-btn" class="menu-btn btn btn-outline-dark">></button>
                <div id="menuSlide">
                    <img src="../../image_home/menu01.jpeg" onclick="window.open(this.src, this.alt, '_parent', 'location=no, status=no')" alt="" loading="lazy">
                    <img src="../../image_home/menu02.jpeg" alt="">
                    <img src="../../image_home/menu03.jpeg" alt="">
                </div>
            </div>
            <div id="shopImg" class="col-7 ml-3">
                <button id="left-shop-btn" class="shop-btn btn btn-outline-dark"><</button>
                <button id="right-shop-btn" class="shop-btn btn btn-outline-dark">></button>
                <div id="shopSlide">
                    <img src="../../image_home/shopImg-01.jpeg" alt="">
                    <img src="../../image_home/shopImg-02.jpeg" alt="">
                    <img src="../../image_home/shopImg-03.jpeg" alt="">
                    <img src="../../image_home/shopImg-04.jpeg" alt="">
                </div>
                
            </div>
	</div>
</div>