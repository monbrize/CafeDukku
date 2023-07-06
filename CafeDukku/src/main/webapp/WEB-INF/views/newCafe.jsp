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

$(document).ready(function () {

    //이미지 추가 버튼 
    $('#addImg').click(function () {
        $('#imgArea ').append('<div class="row"><span class="col-10"><input type="file" name="img" class="form-control">'
            +'</span><span class="col-2"><input type="checkbox" name="imgChk" class="form-check-input-inline" value="">메뉴</span></div>');
    });
    //태그 추가 이벤트
    $('#moodBox option').dblclick(function(){
        let mood=$('option:selected').val();
        $('#moodArea').append('<span class="moodList">'+mood+'<button type="button" class="removeMood">X</button></span>');
    })
    $('#moodText').on('keyup', function(key){
        let mood=$('#moodText').val();
        if(key.keyCode==13){
            $('#moodArea').append('<span class="moodList">'+mood+'<button type="button" class="removeMood">X</button></span>');
            $('#moodText').val('');
        }
    })
    $(document).on("click",".removeMood",function(e){
        let aaa=$(e.target).parent('span').remove();
    });

   
});

const findAddr=function(){
	openAddr();
	inputmap();
}
const openAddr=function(){	
	//카카오 지도 발생
	new daum.Postcode({
	    oncomplete: function(data) { //선택시 입력값 세팅
	        document.getElementById("postcode").value = data.zonecode;
	        document.getElementById("loc1").value = data.address; // 주소 넣기
	        document.querySelector("input[name=loc2]").focus(); //상세입력 포커싱
	        inputmap();
	    }
	}).open();
}

//submit 
const newCafe=function(){
	//let x=$('input[name=mapcode1]').val();
	//let y=$('input[name=mapcode2]').val();
	//console.log(x+"///"+y);
	$('form').submit();
}
const inputmap=function(){
	//주소 좌표 얻기
    let geocoder = new kakao.maps.services.Geocoder();
	geocoder.addressSearch($('#loc').val(), function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	$('input[name=mapcode1]').val(result[0].y);
	    	$('input[name=mapcode2]').val(result[0].x);
	    }
	});
}
</script>
        <h1>매장 등록</h1>
        <div class="container col-10">
        <form name="initForm" action="createCafe" method="post" enctype="multipart/form-data">
        <input type="hidden" name="idx" value="${loginUser.idx}">
        <input type="hidden" name="mapcode1" value="">
        <input type="hidden" name="mapcode2" value="">
            <table class="table table-striped " width="">
                <colgroup>
                    <col width=20%>
                    <col width=50%>
                </colgroup>
                <tr scope="row">
                    <td><label class="form-label">매장명*</label></td>
                    <td>
                        <input type="text" name="cafename" class="form-control"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 매장명(서브) </label></td><td>
                       <input type="text" name="cafename2" class="form-control"> 
                    </td>
                </tr>

                <tr scope="row">
                    <td>
                       <label class="form-label"> 공지사항 </label></td><td>
                       <input type="text" name="notice" class="form-control"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 소개 </label></td><td>
                       <textarea type="text" name="inform" id="infoForm" class="form-control"> </textarea>
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 인스타그램 ID </label></td><td>
                       <input type="text" name="sns_url" class="form-control"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 전화번호 </label></td><td>
                       <input type="text" name="call" class="form-control"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 우편번호 </label></td><td style="display:flex;">
                       <input type="text" name="postcode" id="postcode" readonly class="form-control col-3"> 
                       <input type="button" class="btn btn-outline-primary ml-1" onclick="findAddr()" style="display:relative;" value="찾기">
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 주소 1 </label></td><td>
                       <input type="text" name="loc1" id="loc1" readonly class="form-control"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 주소 2 </label></td><td>
                       <input type="text" name="loc2" class="form-control"> 
                    </td>
                </tr>

            </table>
            <div style="text-align: center;">

                <button type="button" onclick="newCafe()" class="btn btn-primary" >done</button>
                <button type="reset" class="btn btn-warning">reset</button>
            </div>
        </form>
	</div>