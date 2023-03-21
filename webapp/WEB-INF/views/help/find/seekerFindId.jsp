<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!-- Custom styles for this template -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/quill.snow.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">  


<section class="site-section" style="display:flex; justify-content : center;">
	<div class="container" style="width:600px;">
		<form action="<c:url value='seekerFindIdResult' />" method="post">
           	<h2 class="mb-4">일반회원 아이디 찾기</h2>
			<div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">이름</label>
                  <input type="text" id="memName" name="memName" class="form-control" >
                </div>
           	</div>
			<div class="row form-group">
				<div class="col-md-12 mb-3 mb-md-0">
					<label class="text-black" for="memEmail">이메일</label>
                  	<input type="text" id="memEmail" name="memEmail"  class="form-control" >
                </div>
			</div>
			<!-- 이름 이메일 비교해서 맞는지 해줘야함 -->
			<div class="input-group-addon">
				<button type="button" class="btn btn-primary" id="mail-Check-Btn" style="background-color: #0D6EFD; border-color: #0D6EFD;" disabled>본인인증</button>
			</div>
			<hr>
			<div class="row form-group">
				<div class="col-md-12 mb-3 mb-md-0">
					<label class="text-black" for="fname">인증번호</label>
                  	<input class="form-control mail-check-input" type="text" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" >
                </div>
                <span id="mail-check-warn"></span>
			</div>
			<!-- 개발끝나면 disabled 주기 -->
           	<div class="row form-group">
           		<div class="col-md-12">
               		<input type="submit" value="인증확인"  id="check-accept" class="btn px-4 btn-primary text-white" style="background-color: #0D6EFD; border-color: #0D6EFD;">
               	</div>
           	</div>
        </form>
	</div>
</section>

<script>
//이름 이메일 비교해서 맞는지 확인

// 이름과 이메일 input에 value가 입력되면

$('#memEmail').keyup(function() {
	console.log(this);
	
	let mailBtn = $("#mail-Check-Btn");
	let memName = $("input[name = memName]").val();
	let memEmail = $("input[name = memEmail]").val();
	
	// ajax를 실행해서 본인인증 활성화
	$.ajax({
		url : '<c:url value ="/help/find/ajax"/>',
		method : "get",
		data : {
			"memName" : memName,
			"memEmail" : memEmail
		},
		dataType : "json",
		success : function(resp) {
			console.log(resp);
			if(resp.memId != null && resp.memId != "") {			
				mailBtn.attr("disabled", false);
			} else {
				console.log("엥엥 틀려씀");
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});


// 본인인증 버튼을 눌렀을 때 이메일 보내기
$('#mail-Check-Btn').click(function() {
	
	const email = $('#memEmail').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'get',
		url : '<c:url value ="/mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); // end ajax
}); // end send eamil	

//인증번호 비교 
//blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-warn');
	
	if(inputCode === code){
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','green');
		$('#mail-Check-Btn').attr('disabled',true);
 		$('#check-accept').attr('disabled',false); 
		$('#memEmail').attr('readonly',true);
		$('#memName').attr('readonly',true);
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});
</script>


<!-- SCRIPTS -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>

    
