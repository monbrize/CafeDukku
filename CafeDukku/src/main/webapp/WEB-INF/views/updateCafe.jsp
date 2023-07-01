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
        $('#menuArea').append('<input type="file" name="menu_img" class="form-control col-9 mb-2"> ')
        	.append('<input type="button" class="delFile btn btn-outline-danger btn-sm col-1 ml-2 mb-2" value="취소">');
    });
    $('#addCafeImg').click(function () {
        $('#cafeArea').append('<input type="file" name="cafe_img" class="form-control col-9 mb-2"> ')
        	.append('<input type="button" class="delFile btn btn-outline-danger btn-sm col-1 ml-2 mb-2" value="취소">');
    });
    if($('#logoArea').html().length<20){
    	$('#logoArea').append('<input type="file" name="logo_img" class="form-control col-9"> ')
    	.append('<input type="button" class="delFile btn btn-outline-danger btn-sm col-1 ml-2" value="취소">');
    }
    //파일 업로드 취소 
    $(document).on('click','.delFile',function(e){
		$(e.target).prev('input').val('');
	})
    let cafeid=$('input[name=cafeid]').val();
    //태그 추가 이벤트
    $('option').dblclick(function(){
        let tag_name=$(this).val();
        let tag_type = $(this).parents('td').find('div');
        tagCtrl('addTag',tag_name, tag_type);
    })
    $('#imgTag input:text').on('keyup', function(key){
        let tag_name=$(this).val();
        let tag_type=$(this).nextAll('div');
        if(key.keyCode==13){
        	tagCtrl('addTag', tag_name, tag_type);
            $(this).val('');
        }
    })

    $(document).on("click",".removeTag",function(e){
    	let tag_type=$(e.target).parents('div');
		let tag_name=$(e.target).prev('span').html();
		console.log(tag_type+'//////'+tag_name);
    	tagCtrl('deleteTag', tag_name, tag_type, e);
        
    });
    
    const tagCtrl=function(url, tag_name, tag_type, e){
    	let urlStr=url+'?tag_type='+tag_type.attr('id')+'&tag_name='+tag_name+'&cafeid='+cafeid;
    	console.log('url : '+urlStr);
    	let type=(url==='deleteTag')?'delete':'put';
		$.ajax({
			type:type,
			url: urlStr,
			//dataType:'json',
			cache:false,
			success:function(res){
				if(type==='put'){
					tag_type.append('<span>'+tag_name+'</span><input type="button" class="removeTag btn btn-outline-info btn-sm ml-2 mr-2" value="x">');
				} else if(type ==='delete'){
					$(e.target).prev().remove();
			        $(e.target).remove();
				}
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
    	
    }
    
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
const delImg=function(e, imgid, img_type){
	$.ajax({
		type:'delete',
		url:'delImg',
		data:{imgid:imgid},
		cache:false,
		success:function(res){
			console.log(res+"success!!!");
			$(e).parent('span').remove();
			if(img_type==='logo'){
				$('#logoArea').append('<input type="file" name="logo_img" class="form-control col-9">')
				.append('<input type="button" class="delFile btn btn-outline-danger btn-sm col-1 ml-2" value="취소">');
			}
		},error:function(jqXHR){
			console.log(jqXHR.responseText);
		}
	});
//	let obj=$(e).parent('span').remove();
	
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
				<td  style="display:flex;"><input type="text" name="postcode" id="postcode" class="form-control col-3" readonly required value="${cafe.postcode}"">
				<input type="button" class="btn btn-outline-primary  ml-1" onclick="findAddr()" style="display:relative;" value="찾기">
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

		<table class="table" id="imgTag">
			<colgroup>
				<col width=10%>
				<col width=10%>
				<col width=50%>
			</colgroup>
			<tr>
				<td rowspan="3"><label class="form-label"> 이미지 첨부 </label></td>
				<td><label class="form-label"> 로고이미지 </label></td>
				<td>
				<div id="logoArea" class="row">
				
				<c:forEach var="i" items="${imgs }">
					<c:if test="${not empty i and i.img_type eq 'logo'}">
						<span class="col-10">
							<img class="img img-thumbnail" src="../../logo_img/<c:out value="${i.img_name}"/>" style="height:30px">
							<c:out value="${i.img_name_origin}" />
							<input type="button" 
							onclick="delImg(this, <c:out value='${i.imgid}'/>, '<c:out value="${i.img_type}"/>')" 
							class="btn btn-outline-info btn-sm ml-1" value="삭제">
						</span>
				</c:if>
				</c:forEach>
				</div>
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 메뉴 </label>
					<button type="button" class="btn btn-dark btn-sm" id="addMenuImg">+</button>
				</td>
				<td> 
					<div id="menuArea" class="row">
					<c:forEach var="i" items="${imgs }">
	 					<c:if test="${not empty i and i.img_type eq 'menu'}" >
								<span class="col-10 mb-2">
									<img class="img img-thumbnail" src="../../menu_img/<c:out value="${i.img_name}"/>" style="height:30px">
									<c:out value="${i.img_name_origin}" />
									<input type="button" onclick="delImg(this, <c:out value='${i.imgid}'/>, '<c:out value="${i.img_type}"/>')" 
									class="btn btn-outline-info btn-sm ml-1" value="삭제">
								</span>
							</c:if>
					</c:forEach>
					<input type="file" name="menu_img" class="form-control col-9 mb-2"> 
					<input type="button" class="delFile btn btn-outline-danger btn-sm col-1 ml-2 mb-2" value="취소">
					</div>
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 카페 </label>
					<button type="button" class="btn btn-dark btn-sm" id="addCafeImg">+</button>
				</td>
				<td>
					<div id="cafeArea" class="row">
					<c:forEach var="i" items="${imgs }">
						<c:if test="${not empty i and i.img_type eq 'cafe'}" >
							<span class="col-10 mb-2">
								<img class="img img-thumbnail" src="../../cafe_img/<c:out value="${i.img_name}"/>" style="height:30px">
								<c:out value="${i.img_name_origin}" />
								<input type="button" onclick="delImg(this, <c:out value='${i.imgid}'/>, '<c:out value="${i.img_type}"/>')" 
								class="btn btn-outline-info btn-sm ml-1" value="x">
							</span>
						</c:if>
					</c:forEach>
							<input type="file" name="cafe_img" class="form-control col-9 mb-2"> 
							<input type="button" class="delFile btn btn-outline-danger btn-sm col-1 ml-2 mb-2" value="취소">
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="4"><label class="form-label"> 태그 </label></td>
				<td>MOOD </td>
				<td class="row">
                    <select multiple="" class="form-control col-9 mb-2">
						<option>minimal</option>
						<option>cozy</option>
						<option>modern</option>
						<option>lovely</option>
						<option>enthic</option>
				    </select> 
				    <span class="col-3"></span>
				    <span class="col-2 mb-2">입&nbsp; &nbsp; 력 : </span> <input type="text" class="form-control col-7 mb-2" placeholder="Enter...">
				    <span class="col-3 mb-2"></span>
					<div id="mood">
					<c:forEach var="t" items="${tags}">
						<c:if test="${not empty t and t.tag_type eq 'mood'}" >
							<span>${t.tag_name }</span><input type="button" class="removeTag btn btn-outline-info btn-sm ml-2 mr-2"  value="x">
						</c:if>
					</c:forEach>
					</div>
                </td>
			</tr>
 			<tr>
				<td>CLASSIFY </td>
				<td class="row">
					<select multiple="" class="form-control col-9 mb-2">
						<option>espressobar</option>
						<option>bakery</option>
						<option>roastery</option>
						<option>desert</option>
						<option>alcohol</option>
						<option>tea</option>
						<option>brunch</option>
					</select>
					<span class="col-3"></span>
					<span class="col-2 mb-2">입&nbsp; &nbsp; 력 : </span> <input type="text" class="form-control col-7 mb-2" placeholder="Enter...">
					<span class="col-3 mb-2"></span>
                	<div id="classify">
					<c:forEach var="t" items="${tags}">
						<c:if test="${not empty t and t.tag_type eq 'classify'}" >
							<span>${t.tag_name }</span><input type="button" class="removeTag btn btn-outline-info btn-sm ml-2 mr-2"  value="x">
						</c:if>
					</c:forEach>
                </div>
            	</td>
			<tr>
			<td> PRIDE </td>
			<td class="row"><select multiple="" class="form-control col-9 mb-2">
					<option>comfortable seats</option>
					<option>roof top</option>
					<option>plate</option>
					<option>nice view</option>
					<option>sunshine</option>
					<option>photo zone</option>
					<option>outdoor seats</option>
				</select>
				<span class="col-3"></span>
				<span class="col-2 mb-2">입&nbsp; &nbsp; 력 : </span> <input type="text" class="form-control col-7 mb-2" placeholder="Enter...">
				<span class="col-3 mb-2"></span>
                <div id="pride">
                	<c:forEach var="t" items="${tags}">
						<c:if test="${not empty t and t.tag_type eq 'pride'}" >
							<span>${t.tag_name }</span><input type="button" class="removeTag btn btn-outline-info btn-sm ml-2 mr-2"  value="x">
						</c:if>
					</c:forEach>
				<!--  -->
                </div>
            </td>
			</tr>
			<tr>
				<td>PAYMENT</td>
				<td class="row"><select multiple="" class="form-control col-9 mb-2">
						<option>cash</option>
						<option>credit/debit card</option>
						<option>apply pay</option>
						<option>samsung pay</option>
						<option>account transfer</option>
					</select>
					<span class="col-3"></span>
					<span class="col-2 mb-2">입&nbsp; &nbsp; 력 : </span> <input type="text" class="form-control col-7 mb-2" placeholder="Enter...">
					<span class="col-3 mb-2"></span>
                	<div id="payment">
                	<!--  -->
					<c:forEach var="t" items="${tags}">
						<c:if test="${not empty t and t.tag_type eq 'payment'}" >
							<span>${t.tag_name }</span><input type="button" class="removeTag btn btn-outline-info btn-sm ml-2 mr-2"  value="x">
						</c:if>
					</c:forEach>
					<!--  -->
                	</div>
                </td>
			</tr>
		</table>
				</form>
		<div style="text-align: center;" class="mb-5"> 
			<button type="button" class="btn btn-primary" onclick="cafeUpdate()">done</button>
			<button type="reset" class="btn btn-warning">reset</button>
		</div>
</div>