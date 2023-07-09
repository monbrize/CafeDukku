<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.tag_name, .tag_type, .tBtn {
    border-radius: 20px;
    padding: 10px 15px 10px 15px;
    clear:both;
    margin: 5px;
}
a{
    color:black;
}
#tagInfo > div > .tag_type {
    font-weight: bolder;
    color: white;
    width: 120px;
    display: flex; 
    align-items: center;
}
.tBtn{
    font-weight: bolder;
    color: white;
    background-color:#EBD8B2;
}
#moodArea > .tag_type{
    background-color: #8294C4;
}
#moodArea > div >.tag_name{
    background-color: #DBDFEA;
}
#classifyArea > .tag_type{
    background-color: #A0C49D;
}
#classifyArea > div > .tag_name{
    background-color: #E1ECC8;
}
#prideArea > .tag_type{
    background-color: #FF9EAA;
}
#prideArea > div > .tag_name{
    background-color: #FFD0D0;
}
#paymentArea > .tag_type{
    background-color: #0A6EBD;
}
#paymentArea > div > .tag_name{
    background-color: #A1C2F1;
}
#openShopInfo a, #rankInfo a{
 	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap; 
}

.subname{
	font-size:0.9em;
}
</style>
<script>
$(function(){
/* 	#slideBox = .rolling-list
	ul = .slideWrap */

let slider = document.querySelector('.slideBox');
slider.id = 'slider1'; // 아이디 부여

let clone = slider.cloneNode(true);
// cloneNode : 노드 복제. 기본값은 false. 자식 노드까지 복제를 원하면 true 사용
clone.id = 'slider2';
document.querySelector('#wrap').appendChild(clone); // wrap 하위 자식으로 부착

document.querySelector('#slider1').style.left = '0px';
document.querySelector('#slider2').style.left = '100px';//document.querySelector('#slideBox .slideWrap').offsetWidth + 'px';
// offsetWidth : 요소의 크기 확인(margin을 제외한 padding값, border값까지 계산한 값)

slider.classList.add('original');
clone.classList.add('clone');
})
</script>
<style>
#wrap { 
	display: flex;
}
#wrap .slideBox { 
width:1000px;
}
#wrap .slideBox .slideWrap{ 
    float:left; 
    padding:10px; 
    width:150px;
}
#wrap .slideBox .slideWrap a{
	
    over-flow:hidden;
    text-overflow: ellipsis;
    white-space: nowrap; 
}
.slideBox .original {
	animation: rollingleft1 33s linear infinite;
}
.slideBox .clone {
	animation: rollingleft2 33s linear infinite;
}

@keyframes rollingleft1 {
	0% { transform: translateX(0); }
	50% { transform: translateX(-100%); }
	50.01% { transform: translateX(100%); }
	100% { transform: translateX(0); }
}

@keyframes rollingleft2 {
	0% { transition: translateX(0); }
	100% { transform: translateX(-200%); }
}
</style>
<%-- <div id="wrap" style="width:80%">
	<div class="slideBox" >
	<c:forEach var="n" items="${newCafe}">
			<div class="slideWrap">
			<span><img src="../../logo_img/<c:out value="${n.img_name }"/>" width="50px;" class="rounded-circle" alt="logo">
						<a href="/viewCafe?cafeid=${n.cafeid }" class="">
							<c:out value="${n.cafename}"/></a></span>
			</div>
	</c:forEach>
	</div>
	</div> --%>
<div class="container col-12">
	<div class="setTitle mb-3 col-11">
		<h2>Hello Caduk!</h2>
		</div>
		<div id="topInfo" class="row col-12 mb-3" style="vertical-align:middle;">
			<div class="tBtn row col-6">Top Ranking</div> 
			<div class="tBtn row col-5">NewOpen</div>
			<div id="rankInfo" class="row col-6 mt-3 ml-3">
			<c:forEach var="t" items="${topRank}">
				<div class="rankList row col-12 mb-2">
					<span class="col-2">
				<c:if test="${t.scoreType eq 'kind' }">
				😊<br>친절도 
				</c:if>
				<c:if test="${t.scoreType eq 'comfort' }">
				🪑<br>편안함
				</c:if>
				<c:if test="${t.scoreType eq 'mood' }">
				🧚<br>분위기
				</c:if>
				<c:if test="${t.scoreType eq 'price' }">
				 💸<br>가격
				</c:if>
				<c:if test="${t.scoreType eq 'clean' }">
				🧹<br>청결도
				</c:if>
				</span>
					<span class="badge col-2">
						<i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i><c:out value="${t.score }"/>
					</span>
						<img src="../../logo_img/<c:out value="${t.img_name }" />" class="rounded-circle col-2" alt="logo">
						<a href="/viewCafe?cafeid=${t.cafeid }" class="col-4" width="100%">
							<c:out value="${t.cafename}"/></a>
						<span class="badge col-2"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>
						<c:out value="${t.fav_cnt}"/></span>
						</span>
					</div>
			</c:forEach>
			</div>

			<div id="openShopInfo" class="row col-5 ml-4">
				<c:forEach var="n" items="${newCafe}">
				<div class="openList row mt-3">
					<img src="../../logo_img/<c:out value="${n.img_name }"/>" class="rounded-circle col-2" alt="logo">
					<a href="/viewCafe?cafeid=${n.cafeid }" class="col-5">
						<c:out value="${n.cafename}"/></a>
						<span class="badge col-2">
							<i class="fa-solid fa-star fa-2xl mt-2 mr-2" style="color: #fff76b;"></i><c:out value="${n.score }"/>
						</span>
					<span class="badge col-2"><i class="fa-solid fa-heart fa-2xl mt-2 mr-2" style="color: #e32400;"></i>
					<c:out value="${n.fav_cnt}"/></span>
					</span>
				</div>
				</c:forEach>
			</div>
		</div>
		<!-- topInfo -->
		<div id="midInfo" class="row col-12 mb-3">
			<div class="tBtn col-11">Tags</div>
			<div id="tagInfo" class="col-10 ml-4">

				<div id="moodArea" class="row">
					<div class="tag_type col-2">MOOD</div>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchCafe?tag=classic">classic</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=contemporary">contemporary</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=minimal">minimal</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=unique">unique</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=fancy">fancy</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=vintage">vintage</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=antique">antique</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=planterior">planterior</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=lovely">lovely</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=cozy">cozy</a></span>
					</div>
					<!--  -->
				</div>
				<div id="classifyArea" class="row">
					<span class="tag_type col-2">CLASSIFY</span>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchCafe?tag=handDrip">handDrip</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=specialTea">specialTea</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=espressoBar">espressoBar</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=bakery">bakery</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=desert">desert</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=brunch">brunch</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=tea">tea</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=milkTea">milkTea</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=bar">bar</a></span>
					</div>
					<!--  -->
				</div>
				<div id="prideArea" class="row">
					<div class="tag_type text-center col-2">PRIDE</div>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchCafe?tag=petFriendly">petFriendly</a></span> 
						<span class="tag_name"><a href="/searchCafe?tag=parkingLot">parkingLot</a></span> 
						<span class="tag_name"><a href="/searchCafe?tag=roofTop">roofTop</a></span> 
						<span class="tag_name"><a href="/searchCafe?tag=outdoorSeats">outdoorSeats</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=garden">garden</a></span> 
						<span class="tag_name"><a href="/searchCafe?tag=goods">goods</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=noKids">noKids</a></span>
						<!--  -->
					</div>
				</div>
				<div id="paymentArea" class="row">
					<span class="tag_type col-2">PAYMENT</span>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchCafe?tag=cash">cash</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=card">card</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=samsungPay">samsungPay</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=applePay">applePay</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=zeroPay">zeroPay</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=accountTransfer">accountTransfer</a></span>
					</div>
					<!--  -->
				</div>
			</div>
		</div>
</div>
<!-- container  -->
