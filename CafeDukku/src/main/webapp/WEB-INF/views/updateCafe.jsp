<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ckEditor 4 CDN ----------------------------------------------------------- -->
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<!-- -------------------------------------------------------------------------- -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	CKEDITOR.replace('infoForm');
})


const cafeUpdate=function(){
	$('form').submit();
}
$(document).ready(function () {
    //이미지 추가 버튼 
    $('#addMenuImg').click(function () {
        $('#menuArea').append('<input type="file" name="menu_img" class="form-control"> ');
    });
    $('#addCafeImg').click(function () {
        $('#cafeArea').append('<input type="file" name="cafe_img" class="form-control"> ');
    });
    let cafeid=$('input[name=cafeid]').val();
    //태그 추가 이벤트
    $('option').dblclick(function(){
        let tag_name=$(this).val();
        let tag_type = $(this).parents('td').find('div');
        tagCtrl('addTag',tag_name, tag_type);
    })
    $('#imgTag input:text').on('keyup', function(key){
        let tag_name=$(this).val();
        let tag_type=$(this).next();
        if(key.keyCode==13){
        	tagCtrl('addTag', tag_name, tag_type);
            $(this).val('');
        }
    })
    $(document).on("click",".removeTag",function(e){
    	let tag_type=$(e.target).parents('div');
		let tag_name=$(e.target).parent('span').html().split('<')[0];
		console.log(tag_type+'//////'+tag_name);
    	tagCtrl('deleteTag', tag_name, tag_type);
        
    });
    
    const tagCtrl=function(url, tag_name, tag_type){
    	let urlStr=url+'?tag_type='+tag_type.attr('id')+'&tag_name='+tag_name+'&cafeid='+cafeid;
    	console.log('url : '+urlStr);
    	$.ajax({
			type:'get',
			url: urlStr,
			dataType:'json',
			cache:false,
			success:function(res){
				if(url=='addTag'){
					tag_type.append('<span>'+tag_name+'<button type="button" class="removeTag">X</button></span>');
					tag_type.append('<input type="hidden" name="tag_name" value="str">');
				} else if(url=='deleteTag'){
					$(e.target).parent('span').remove();
				}

			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
    	
    }
    $('input[name=logo_img]').on('change',function(){
		let ff=this.files[0];
		console.log(ff.name);
		
		let formData=new FormData();
		console.log(formData);
		formData.append("logoFile",ff);
		
		$.ajax({
			type:'post',
			url:'addLogoImg',
			data : formData,
			contentType:false,
			processData:false,
			success:function(res){
				console.log(res);
				alert("로고이미지가 등록되었습니다.");
			},error:function(jqXHR){
				console.log(jqXHR.responseText);
			}
			
			
		})

	})
});
const findAddr=function(){
	//카카오 지도 발생
	new daum.Postcode({
	    oncomplete: function(data) { //선택시 입력값 세팅
	        document.getElementById("postcode").value = data.zonecode;
	        document.getElementById("loc1").value = data.address; // 주소 넣기
	        document.querySelector("input[name=loc2]").focus(); //상세입력 포커싱
	    }
	}).open();
};

/* 이미지 삭제 */
const delImg=function(e, imgid){
	$.ajax({
		type:'post',
		url:'delImg',
		data:{imgid=imgid},
		cache:false,
		success:function(res){
			consol.log(res+"success!!!");
			$(e).parent('span').remove();
		},error:function(jqXHR){
			console.log(jqXHR.responseText);
		}
	});
//	let obj=$(e).parent('span').remove();
	
}
/* 태그 삭제 */
const delTag=function(e, str){
	let obj=$(e).siblings('span').remove();
}
 
</script>
<h1>카페 정보 업데이트</h1>
<div class="container col-10">
	<form name="updateForm" action="updateCafe" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="cafeid" value="${cafe.cafeid}">
		<table class="table table-striped " width="">
			<colgroup>
				<col width=20%>
				<col width=50%>
			</colgroup>
			<tr scope="row">
				<td><label class="form-label">매장명*</label></td>
				<td><input type="text" name="cafename" class="form-control" value="${cafe.cafename }" required></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 매장명(서브) </label></td>
				<td><input type="text" name="cafename2" class="form-control" value="${cafe.cafename2}"></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 공지사항 </label></td>
				<td><input type="text" name="notice" class="form-control" value="${cafe.notice}"></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 소개 </label></td>
				<td><textarea name="inform" class="form-control" id="infoForm" >${cafe.inform}</textarea></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> SNS URL </label></td>
				<td><input type="text" name="sns_url" class="form-control"
					value="${cafe.sns_url}"></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 전화번호 </label></td>
				<td><input type="text" name="call" class="form-control"
					value="${cafe.call}"></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 우편번호 </label></td>
				<td><input type="text" name="postcode" id="postcode" class="form-control" readonly required value="${cafe.postcode}">
				<input type="button" class="btn btn-warning" onclick="findAddr()" value="찾기">
				</td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 주소 1 </label></td>
				<td><input type="text" name="loc1" id="loc1" class="form-control" readonly required value="${cafe.loc1}"></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 주소 2 </label></td>
				<td><input type="text" name="loc2" id="loc2" class="form-control" value="${cafe.loc2}"></td>
			</tr>
		</table>
		</form>
		<table class="table" id="imgTag">
			<tr>
				<td rowspan="3"><label class="form-label"> 이미지 첨부 </label></td>
				<td><label class="form-label"> 로고이미지 </label></td>
				<td>
				<c:if test="${(imgs.img_type eq 'logo') ne null}" >
					<!-- 사진이 있다면 -->
					<span>
					<img class="img img-thumbnail" src="../../logo_img/<c:out value="${shop.img_name}"/>" style="width:80px">
					<c:out value="${imgs.img_name_origin}" /><input type="button" onclick="delImg(this, <c:out value='${imgs.imgid}'/>)" class="btn btn-outline-info" value="X">
					</span>
				</c:if>
				<c:if test="${(imgs.img_type eq 'logo') eq null }">
					<input type="file" name="logo_img" class="form-control">
				</c:if>
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 메뉴 </label>
					<button type="button" class="btn btn-dark" id="addMenuImg">추가</button>
				</td>
				<td> 
					<div id="menuArea">
					<c:if test="${(imgs.img_type eq 'menu') ne null}" >
						<!-- 사진이 있다면 -->
						<c:forEach var="menu" items="${imgs.img_name}" varStatus="s">
						<span>
							<img class="img img-thumbnail" src="../../menu_img/<c:out value="${menu}"/>" style="width:80px">
							<c:out value="${imgs[s.index].img_name_origin}" />
							<input type="button" onclick="delImg(this, <c:out value='${imgs[s.index].imgid}'/>)" class="btn btn-outline-info" value="X">
						</span>
						</c:forEach>
					</c:if>
					<c:if test="${(imgs.img_type eq 'menu') eq null }">
						<input type="file" name="menu_img" class="form-control"> 
					</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 이미지 </label>
					<button type="button" class="btn btn-dark" id="addCafeImg">추가</button>
				</td>
				<td>
					<div id="cafeArea">
					<c:if test="${(imgs.img_type eq 'cafe') ne null}" >
						<!-- 사진이 있다면 -->
						<c:forEach var="cafe" items="${imgs.img_name}" varStatus="s">
						<span>
							<img class="img img-thumbnail" src="../../cafe_img/<c:out value="${cafe}"/>" style="width:80px">
							<c:out value="${imgs[s.index].img_name_origin}" />
							<input type="button" onclick="delImg(this, <c:out value='${imgs[s.index].imgid}'/>)" class="btn btn-outline-info" value="X">
						</span>
						</c:forEach>
					</c:if>
					<c:if test="${(imgs.img_type eq 'cafe') eq null }">
						<input type="file" name="cafe_img" class="form-control"> 
					</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="4"><label class="form-label"> 태그 </label></td>
				<td>MOOD
				</td>
				<td>
                    <select multiple="" class="form-control">
						<option value="minimal">minimal</option>
						<option value="cozy">cozy</option>
						<option value="modern">modern</option>
						<option value="lovely">lovely</option>
						<option value="enthic">enthic</option>
				    </select> 직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
					<div id="mood">
					<!--  -->
					<c:if test="${tags.tag_type eq 'mood'}" >
						<!-- 태그명 반복문 -->
						<c:forEach var="tag" items="${tags.tag_name}">
							<span>${tag }</span><input type="button" class="removeTag btn btn-outline-info" value="X">
						</c:forEach>
					</c:if>
					<!--  -->
					</div>
                </td>
			</tr>
			<tr>
				<td>CLASSIFY
				</td>
				<td><select multiple="" class="form-control">
						<option>espressobar</option>
						<option>bakery</option>
						<option>roastery</option>
						<option>desert</option>
						<option>alcohol</option>
						<option>tea</option>
						<option>brunch</option>
				</select> 직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                <div id="classify">
                <!--  -->
					<c:if test="${tags.tag_type eq 'classify'}" >
						<!-- 태그명 반복문 -->
						<c:forEach var="tag" items="${tags.tag_name}">
							<span>${tag }</span><input type="button" class="removeTag btn btn-outline-info" value="X">
						</c:forEach>
					</c:if>
				<!--  -->
                </div>
            	</td>
			<tr>
			<td> PRIDE </td>
			<td><select multiple="" class="form-control">
					<option>comfortable seats</option>
					<option>roof top</option>
					<option>plate</option>
					<option>nice view</option>
					<option>sunshine</option>
					<option>photo zone</option>
					<option>outdoor seats</option>
				</select> 직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                <div id="pride">
                	<!--  -->
					<c:if test="${tags.tag_type eq 'pride'}" >
						<!-- 태그명 반복문 -->
						<c:forEach var="tag" items="${tags.tag_name}">
							<span>${tag }</span><input type="button" class="removeTag btn btn-outline-info" value="X">
						</c:forEach>
					</c:if>
				<!--  -->
                </div>
            </td>
			</tr>
			<tr>
				<td>PAYMENT</td>
				<td><select multiple="" class="form-control">
						<option>cash</option>
						<option>credit/debit card</option>
						<option>apply pay</option>
						<option>samsung pay</option>
						<option>account transfer</option>
					</select> 직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                	<div id="payment">
                	<!--  -->
					<c:if test="${tags.tag_type eq 'payment'}" >
						<!-- 태그명 반복문 -->
						<c:forEach var="tag" items="${tags.tag_name}">
							<span>${tag }</span><input type="button" class="removeTag btn btn-outline-info" value="X">
							<!-- <input type="button" onclick="delTag(this, 'payment')" class="btn btn-outline-info" value="X"> -->
						</c:forEach>
					</c:if>
					<!--  -->
                	</div>
                </td>
			</tr>
		</table>
		<div style="text-align: center;" class="mb-5"> 
			<button type="button" class="btn btn-primary" onclick="cafeUpdate()">done</button>
			<button type="reset" class="btn btn-warning">reset</button>
		</div>
	
</div>