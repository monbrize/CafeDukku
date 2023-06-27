<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

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
        console.log(cafeid+'....'+str+'...'+tagType.attr('id'));
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
    	tagCtrl('deleteTag', tag_name, tag_type);
        
    });
    
    const tagCtrl=function(url, str, tagType){
    	console.log(url+'////'+tagType.attr('id')+"////"+str);
    	let urlStr=url+'?tag_type='+tagType.attr('id')+'&tag_name='+str+'&cafeid='+cafeid;
    	console.log('url : '+urlStr);
    	$.ajax({
			type:'get',
			url: urlStr,
			dataType:'json',
			cache:false,
			success:function(res){
				alert(res);
				if(url=='addTag'){
					tagType.append('<span class="'+tagType.attr('id')+'List">'+str+'<button type="button" class="removeTag">X</button></span>');
				} else{
					$(e.target).parent('span').remove();
				}

			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
    	
    }
});

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
				<td><input type="text" name="inform" class="form-control" value="${cafe.inform}"></td>
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
				<td><input type="text" name="postcode" class="form-control"
					value="${cafe.postcode}"></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 주소 1 </label></td>
				<td><input type="text" name="loc1" class="form-control"
					value="${cafe.loc1}"></td>
			</tr>
			<tr scope="row">
				<td><label class="form-label"> 주소 2 </label></td>
				<td><input type="text" name="loc2" class="form-control"
					value="${cafe.loc2}"></td>
			</tr>
		</table>
		<table class="table" id="imgTag">
			<tr>
				<td rowspan="3"><label class="form-label"> 이미지 첨부 </label></td>
				<td><label class="form-label"> 로고이미지 </label></td>
				<td><input type="file" name="logo_img" class="form-control">
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 메뉴판 </label>
					<button type="button" class="btn btn-dark" id="addMenuImg">추가</button>
				</td>
				<td>
					<div id="menuArea">
						<input type="file" name="menu_img" class="form-control"> 
                        <input type="file" name="menu_img" class="form-control">
					</div>
				</td>
			</tr>
			<tr>
				<td><label class="form-label"> 이미지 </label>
					<button type="button" class="btn btn-dark" id="addCafeImg">추가</button>
				</td>
				<td>
					<div id="cafeArea">
						<input type="file" name="cafe_img" class="form-control"> <input
							type="file" name="cafe_img" class="form-control">
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="4"><label class="form-label"> 태그 </label></td>
				<td><label for="exampleSelect2" class="form-label mt-4">MOOD</label>
				</td>
				<td>
                    <select multiple="" id="moodBox" class="form-control" id="exampleSelect2">
						<option value="minimal">minimal</option>
						<option value="cozy">cozy</option>
						<option value="modern">modern</option>
						<option value="lovely">lovely</option>
						<option value="enthic">enthic</option>
				    </select> 직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
					<div id="mood">
					<span class="moodList">lovely<button type="button" class="removeTag">X</button></span>
					</div>
                </td>
			</tr>
			<tr>
				<td><label for="exampleSelect2" class="form-label mt-4">CLASSIFY</label>
				</td>
				<td><select multiple="" class="form-control"
					id="exampleSelect2">
						<option>espressobar</option>
						<option>bakery</option>
						<option>roastery</option>
						<option>desert</option>
						<option>alcohol</option>
						<option>tea</option>
						<option>brunch</option>
				</select> 직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                <div id="classify"></div>
            	</td>
			<tr>
			<td><label for="exampleSelect2" class="form-label mt-4">PRIDE</label> </td>
			<td><select multiple="" class="form-control" id="exampleSelect2">
					<option>comfortable seats</option>
					<option>roof top</option>
					<option>plate</option>
					<option>nice view</option>
					<option>sunshine</option>
					<option>photo zone</option>
					<option>outdoor seats</option>
				</select> 직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                <div id="pride"></div>
            </td>
			</tr>
			<tr>
				<td><label for="exampleSelect1" class="form-label mt-4">PAYMENT</label> </td>
				<td><select multiple="" class="form-control" id="exampleSelect1">
						<option>cash</option>
						<option>credit/debit card</option>
						<option>apply pay</option>
						<option>samsung pay</option>
						<option>account transfer</option>
					</select> 직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                	<div id="payment"></div>
                </td>
			</tr>
		</table>
		<div style="text-align: center;" class="mb-5"> 
			<button type="button" class="btn btn-primary">done</button>
			<button type="reset" class="btn btn-warning">reset</button>
		</div>
	</form>
</div>