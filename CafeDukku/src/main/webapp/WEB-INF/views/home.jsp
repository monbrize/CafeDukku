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
</style>
<h1>Hello Caduk!</h1>

<div class="container">
	<div id="homeInfo" class="row">
		<div id="topInfo" class="row col-12 mb-3">
			<span class="tBtn col-6">Top Ranking</span> <span class="tBtn col-5">New
				Open</span>
			<div id="rankInfo" class="col-6">
				😊KINDNESS ⭐️5.0
				<div></div>
				<br> 🪑COMFORTABLE ⭐️3.2
				<div></div>
				<br> 💸PRICE ⭐️2.5
				<div></div>
				<br> 🧹CLEAN ⭐️4.2
				<div></div>
				<br> 🧚‍♀️MOOD ⭐️2.1
				<div></div>
			</div>
			<div id="openShopInfo" class="col-5">
				<div></div>
				<div></div>
				<div></div>
				<div></div>
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

						<span class="tag_name"><a href="/searchCafe?tag=minimal">minimal</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=cozy">cozy</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=modern">modern</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=lovely">lovely</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=antique">antique</a></span>
					</div>
					<!--  -->
				</div>
				<div id="classifyArea" class="row">
					<span class="tag_type col-2">CLASSIFY</span>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchCafe?tag=espressobar">espressobar</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=bakery">bakery</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=roastery">roastery</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=desert">desert</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=alcohol">alcohol</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=tea">tea</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=brunch">brunch</a></span>
					</div>
					<!--  -->
				</div>
				<div id="prideArea" class="row">
					<div class="tag_type text-center col-2">PRIDE</div>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchCafe?tag=comfortable seats">comfortable
								seats</a></span> <span class="tag_name"><a href="/searchCafe?tag=rooftop">roof
								top</a></span> <span class="tag_name"><a href="/searchCafe?tag=niceview">nice
								view</a></span> <span class="tag_name"><a href="/searchCafe?tag=photozone">photo
								zone</a></span> <span class="tag_name"><a href="/searchCafe?tag=outdoorseats">outdoor
								seats</a></span> <span class="tag_name"><a href="/searchCafe?tag=plate">plate</a></span>
						<span class="tag_name"><a href="/searchCafe?tag=sunshine">sunshine</a></span>
						<!--  -->
					</div>
				</div>
				<div id="paymentArea" class="row">
					<span class="tag_type col-2">PAYMENT</span>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchCafe?tag=credit/debitcard">credit/debit
								card</a></span> <span class="tag_name"><a href="/searchCafe?tag=samsungpay">samsung
								pay</a></span> <span class="tag_name"><a href="/searchCafe?tag=applepay">apple
								pay</a></span> <span class="tag_name"><a href="/searchCafe?tag=accounttransfer">account
								transfer</a></span> <span class="tag_name"><a
							href="/searchCafe?tag=case">cash</a></span>
					</div>
					<!--  -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- container  -->
