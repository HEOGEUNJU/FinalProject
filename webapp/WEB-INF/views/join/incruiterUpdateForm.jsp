
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="8kb"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom-bs.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/quill.snow.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/help.css" />
<style>
.btn_cert_pop {
	background-color: #045738;
	color: #fff;
}

.wrap_input {
	width: 80%;
}

.content {
	max-width: 960px;
}

.wrap_lab{
	width:153px;
}
</style>
</head>
<section class="site-section">
	<div class="site-wrap">
		<div class="sri_section" class="has_banner">
			<div class="sri_wrap" id="updateForm">
				<div class="content" style="margin-left: 17%;">
					<div class="wrap_title_recruit">
					    <h1 class="title_common" style="font-size: 40px;">기업회원</h1>
					</div>
					<div class="help_find help_lost wrap_help">
						<div class="cont_find">
							<form:form id="writeForm" modelAttribute="incruiter" method="post"
								enctype="multipart/form-data">
								<fieldset>
									<legend class="blind">이메일 문의 입력 폼</legend>
									<p class="desc_find_type2">
										평일 09시 에서 17시까지 문의하신 내용은 당일 답변해드립니다. <br> 17시 이후에 문의하신
										내용은 다음날에 답변, 주말에 문의하신 내용은 그 다음주 월요일에 답변해 드립니다.
									</p>
									<div class="help_find help_lost wrap_help" >
						<div class="cont_find">
								<ul class="list_find">
								<h3 class="text-black mb-5 border-bottom pb-2">인사 담당자 정보</h3>
								<!-- 회사 아이디 담을 히든폼 -->
								<!-- 	<div class="wrap_input">
	                    <label for="company-website-tw d-block">보유자격증</label> <br>
	                    <label class="btn btn-primary btn-md btn-file">
	                      자격증선택<input type="file" hidden>
	                    </label>
                  		</div> -->
<!-- 							<li> -->
<!-- 								<div class="wrap_lab"> -->
<!-- 									<span class="ico_required"> <span class="blind">필수항목</span> -->
<!-- 									</span> <label for="help_title" class="lab_find">회사명</label> -->
<!-- 								</div> -->
<%-- 									<form:input path="cmpId" type="hidden" id="companyId" --%>
<%-- 										cssClass="inp_find" /> --%>
<!-- 								<div class="wrap_input"> -->
<!-- 									<label for="job-title">회사명</label> <input type="text" -->
<!-- 										class="inp_find" id="companyName" placeholder="" -->
<!-- 										name="cmpName" disabled> -->
<!-- 								</div> -->
<!-- 							</li> -->
								<!-- <div class="wrap_input">
							<label for="company-website-tw d-block">프로필사진</label> <br> <label
								class="btn btn-primary btn-md btn-file"> 사진선택<input
								type="file" hidden>
							</label>
						</div> -->
							<li>
								<div class="wrap_lab">
									<span class="ico_required"> <span class="blind">필수항목</span>
									</span> <label for="help_title" class="lab_find">이메일</label>
								</div>
								<div class="wrap_input">
									<label for="job-title">이메일</label>
									<form:input path="memId" type="hidden" cssClass="inp_find" />
									<form:input path="memName" type="hidden" cssClass="inp_find" />
									<form:input path="memEmail" type="text" cssClass="inp_find" />
									<form:input path="memPass" type="hidden" cssClass="inp_find" />
									<form:errors path="memEmail" element="span"
										cssClass="text-danger" />
								</div>
							</li>
							<li>
								<div class="wrap_lab">
									<span class="ico_required"> <span class="blind">필수항목</span>
									</span> <label for="help_title" class="lab_find">전화번호</label>
								</div>
								<div class="wrap_input">
									<label for="job-title">전화번호</label>
									<form:input path="memTel" type="text" cssClass="inp_find" />
									<form:errors path="memTel" element="span"
										cssClass="text-danger" />
								</div>
							</li>
									
									</ul>
								</div>
							</div>
									<div class="noti_find">
										<h3 class="noti_title">[개인정보 수집·이용에 대한 안내]</h3>
										<p class="desc_find_type2">(주)I Need You은 이용자 문의를 처리하기 위해
											다음과 같이 개인정보를 수집 및 이용하며, 이용자의 개인정보를 안전하게 취급하는데 최선을 다하고 있습니다.</p>
										<ul class="list_noti">
											<li>① 수집항목 : 이메일 주소</li>
											<li>② 수집·이용목적 : 문의에 따른 원활한 상담 제공</li>
											<li>③ 보유 및 이용기간 : <strong>문의 처리 후 3년간 보관</strong></li>
										</ul>
										<p class="desc_find_type2">
											위 동의를 거부 할 권리가 있으며 동의 거부 시 문의하기 이용이 제한됩니다.<br> 이외의 방법으로
											문의하시려면 이메일(help@inu.co.kr)을 통하여 문의하시기 바랍니다.
										</p>
										<div class="check_agree">
											<div class="sri_input3">
												<input type="checkbox" id="agree_chk" value="동의"
													name="consent"> <label for="agree_chk">위의
													개인정보 수집 및 이용에 동의합니다.</label>
											</div>
										</div>
									</div>
									<div class="wrap_link">
										<a href="${pageContext.request.contextPath }/">
											<button type="button" class="btn_biggest_type03"
												id="help_cancel">취소하기</button>
										</a>
										<button type="button" class="btn_biggest_type01"
											id="help_send" onclick="updateBtn()">수정하기</button>
									</div>
								</fieldset>
							</form:form>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/stickyfill.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/quill.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/board/ask.js"></script> --%>
<script
	src="${pageContext.request.contextPath}/resources/js/board/email.js"></script>
<script src="/INUProject/resources/js/daumPostcode.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	var $j = jQuery.noConflict();
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function updateBtn(){
	if($("#agree_chk").is(":checked")){
// 		swal("개인정보 수집에 동의하셔야 합니다.","확인","warning")
		$("#help_send").attr("type","submit");
	}else{
		swal("오류", "개인정보 수집 및 이용에 동의에 체크하세요.", "error");
	}
}

/* 아이디 중복확인*/
function checkId(){
	var inputId = $("#memId").val();
	var checkState = $("#idDuplication");
	console.log(checkState.val());
	checkState.val("incheck");
	console.log(checkState.val());
	var checkIdBtn = $("#checkIdBtn");
	var submitBtn = $("#help_send");
	$.ajax({
		url : '<c:url value ="/join/memIdcheck"/>',
		method : "get",
		dataType : "json",
		success : function(resp) {
			console.log(resp);
			var message = ""
			for(var i=0; i<resp.length; i++){
				if(inputId==""||inputId.length<4){
					message = "아이디는 최소 4글자 이상 입력해야 합니다."
				}else if(inputId==resp[i]){
					message = "중복되는 아이디입니다."
				}else{
					message = "사용가능한 아이디입니다."
					checkIdBtn.attr("disabled","disabled")
				}
			}
			alert(message);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 	//이름 이메일 비교해서 맞는지 확인

	//이름과 이메일 input에 value가 입력되면

	$('#memEmail').keyup(function() {
		console.log(this);

		let mailBtn = $("#mail-Check-Btn");
		let memName = $("input[id = memName]").val();
		let memEmail = $("input[id = memEmail]").val();

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
				if (resp.memId != null && resp.memId != "") {
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
	//본인인증 버튼을 눌렀을 때 이메일 보내기
	$('#mail-Check-Btn').click(function() {

		const email = $('#memEmail').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

		$.ajax({
			type : 'get',
			url : '<c:url value ="/mailCheck?email="/>' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function(data) {
				console.log("data : " + data);
				checkInput.attr('disabled', false);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}
		}); // end ajax
	}); // end send eamil	
	$('.mail-check-input').blur(function() {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');

		if (inputCode === code) {
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color', 'green');
			$('#mail-Check-Btn').attr('disabled', true);
			// 		$('#check-accept').attr('disabled',false); 개발끝나면 풀기
			$('#memEmail').attr('readonly', true);
		} else {
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color', 'red');
		}
	}); */
</script>

