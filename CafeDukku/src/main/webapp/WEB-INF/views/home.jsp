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

						<span class="tag_name"><a href="/searchbyTag?type=minimal">minimal</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">cozy</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">modern</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">lovely</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">antique</a></span>
					</div>
					<!--  -->
				</div>
				<div id="classifyArea" class="row">
					<span class="tag_type col-2">CLASSIFY</span>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchbyTag?type=">espressobar</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">bakery</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">roastery</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">desert</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">alcohol</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">tea</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">brunch</a></span>
					</div>
					<!--  -->
				</div>
				<div id="prideArea" class="row">
					<div class="tag_type text-center col-2">PRIDE</div>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchbyTag?type=">comfortable
								seats</a></span> <span class="tag_name"><a href="/searchbyTag?type=">roof
								top</a></span> <span class="tag_name"><a href="/searchbyTag?type=">nice
								view</a></span> <span class="tag_name"><a href="/searchbyTag?type=">photo
								zone</a></span> <span class="tag_name"><a href="/searchbyTag?type=">outdoor
								seats</a></span> <span class="tag_name"><a href="/searchbyTag?type=">plate</a></span>
						<span class="tag_name"><a href="/searchbyTag?type=">sunshine</a></span>
						<!--  -->
					</div>
				</div>
				<div id="paymentArea" class="row">
					<span class="tag_type col-2">PAYMENT</span>
					<!--  -->
					<div class="row col-10">
						<span class="tag_name"><a href="/searchbyTag?type=">credit/debit
								card</a></span> <span class="tag_name"><a href="/searchbyTag?type=">samsung
								pay</a></span> <span class="tag_name"><a href="/searchbyTag?type=">apply
								pay</a></span> <span class="tag_name"><a href="/searchbyTag?type=">account
								transfer</a></span> <span class="tag_name"><a
							href="/searchbyTag?type=">cash</a></span>
					</div>
					<!--  -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- container  -->
