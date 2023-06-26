<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

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


</script>
        <h1>카페 정보 업데이트</h1>
        <div class="container col-10">
        <form name="updateForm" action="updateCafe" method="post" enctype="multipart/form-data">
        <input type="hidden" name="cafeid" value="${cafe.cafeid}">
            <table class="table table-striped " width="">
                <colgroup>
                    <col width=20%>
                    <col width=50%>
                </colgroup>
                <tr scope="row">
                    <td><label class="form-label">매장명*</label></td>
                    <td>
                        <input type="text" name="cafename" class="form-control" value="${cafe.cafename }"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 매장명(서브) </label></td><td>
                       <input type="text" name="cafename2" class="form-control" value="${cafe.cafename2}"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 공지사항 </label></td><td>
                       <input type="text" name="notice" class="form-control" value="${cafe.notice}"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 소개 </label></td><td>
                       <input type="text" name="inform" class="form-control" value="${cafe.inform}"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> SNS URL </label></td><td>
                       <input type="text" name="sns_url" class="form-control" value="${cafe.sns_url}"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 전화번호 </label></td><td>
                       <input type="text" name="call" class="form-control" value="${cafe.call}"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 우편번호 </label></td><td>
                       <input type="text" name="postcode" class="form-control"  value="${cafe.postcode}"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 주소 1 </label></td><td>
                       <input type="text" name="loc1" class="form-control" value="${cafe.loc1}"> 
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                       <label class="form-label"> 주소 2 </label></td><td>
                       <input type="text" name="loc2" class="form-control" value="${cafe.loc2}"> 
                    </td>
                </tr>
				<tr>
                     <td>
                        <label class="form-label"> 로고이미지 </label>
                    </td>
                            <td>
                           <input type="file" name="logo_img" class="form-control">
                    </td>
                </tr>
                        </div>
                <tr>
                    <td>
                        <label class="form-label"> 매장이미지 </label><br>
                        <button type="button" class="btn btn-dark" id="addImg">추가</button>
                    </td>
                    <td>
                        <div id="imgArea">
                        <div class="row">
                            <span class="col-10">
                                <input type="file" name="img_name" class="form-control">
                            </span>
                            <span class="col-2">
                                <input type="checkbox" name="imgChk" class="form-check-input" value="">메뉴
                            </span>
                        </div>
                        <div class="row">
                            <span class="col-10">
                                <input type="file" name="img_name" class="form-control">
                            </span>
                            <span class="col-2">
                                <input type="checkbox" name="imgChk" class="form-check-input" value="">메뉴
                            </span>
                        </div>
                        <div class="row">
                            <span class="col-10">
                                <input type="file" name="img_name" class="form-control">
                            </span>
                            <span class="col-2">
                                <input type="checkbox" name="imgChk" class="form-check-input" value="">메뉴
                            </span>
                        </div>
                    </div>
                        
                    </td>
                </tr>
                <tr scope="row">
                    <td>
                        <label class="form-label"> 태그 </label>
                    </td>
                    <td>
                        <label for="exampleSelect2" class="form-label mt-4">MOOD</label>
                        <select multiple="" id="moodBox" class="form-control" id="exampleSelect2">
                            <option value="minimal">minimal</option>
                            <option value="cozy">cozy</option>
                            <option value="modern">modern</option>
                            <option value="lovely">lovely</option>
                            <option value="enthic">enthic</option>
                        </select>
                        직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                        <div id="moodArea">
                            <span class="moodList">lovely<button type="button" class="removeMood">X</button></span>
                        </div>
                        <label for="exampleSelect2" class="form-label mt-4">CLASSIFY</label>
                        <select multiple="" class="form-control" id="exampleSelect2">
                            <option>espresso bar</option>
                            <option>bakery</option>
                            <option>roastery</option>
                            <option>desert</option>
                            <option>alcohol</option>
                            <option>tea</option>
                            <option>brunch</option>
                        </select>
                        직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                        <label for="exampleSelect2" class="form-label mt-4">PRIDE</label>
                        <select multiple="" class="form-control" id="exampleSelect2">
                            <option>comfortable seats</option>
                            <option>roof top</option>
                            <option>plate</option>
                            <option>nice view</option>
                            <option>sunshine</option>
                            <option>photo zone</option>
                            <option>outdoor seats</option>
                        </select>
                        직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                        <label for="exampleSelect1" class="form-label mt-4">PAYMENT</label>
                        <select multiple="" class="form-control" id="exampleSelect1">
                            <option>cash</option>
                            <option>credit/debit card</option>
                            <option>apply pay</option>
                            <option>samsung pay</option>
                            <option>account transfer</option>
                        </select>
                        직접입력 : <input type="text" id="moodText" class="form-control" placeholder="입력 후 Enter...">
                    </td>
                </tr>
            </table>
            <div style="text-align: center;">

                <button type="submit" class="btn btn-primary" >done</button>
                <button type="reset" class="btn btn-warning">reset</button>
            </div>
        </form>
	</div>