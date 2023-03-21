
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
<!-- 	<link rel="stylesheet" href="/INUProject/resources/css/saramin/pattern.css"> -->
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
<script type="text/javascript">
/* 자동입력 */

</script>
<section class="site-section">
	<div class="site-wrap">
		<div class="sri_section" class="has_banner">
			<div class="sri_wrap">
				<div class="content" style="margin-left: 17%;">
					<div class="wrap_title_recruit">
					    <h1 class="title_common" style="font-size: 40px;">일반회원</h1>
					</div>
					<div class="help_find help_lost wrap_help">
						<div class="cont_find">
							<form:form id="writeForm" modelAttribute="member" method="post"
								enctype="multipart/form-data">
								<fieldset>
								<button type="button" class="btn btn-primary"  id="autoInsert" style="border-radius: 0px">
										<span>자동입력</span>
								</button> 
									<legend class="blind">이메일 문의 입력 폼</legend>
									<p class="desc_find_type2">
										평일 09시 에서 17시까지 문의하신 내용은 당일 답변해드립니다. <br> 17시 이후에 문의하신
										내용은 다음날에 답변, 주말에 문의하신 내용은 그 다음주 월요일에 답변해 드립니다.
									</p>
									<ul class="list_find">
										<li>
											<div class="wrap_lab">
												<span class="ico_required"> <span class="blind">필수항목</span>
												</span> <label for="help_title" class="lab_find">아이디</label>
											</div>
											<input type="hidden" id="idDuplication" value="idUncheck"/>
											<div class="wrap_input">
												<span class="box_input"> <form:input path="memId"
														type="text" cssClass="inp_find"  /> <form:errors
														path="memId" element="span" cssClass="inp_find" id="memId" />
												</span>
												<!-- 회원 아이디 중복확인 -->
												 <button type="button" class="btn btn-primary" onclick="checkId()" id="checkIdBtn" style="margin-left: 20px; border-radius: 0px;background: #0d6efd;">
														<span>중복확인</span>
													</button> 
											</div>
										</li>
										<li>
											<div class="wrap_lab">
												<span class="ico_required"> <span class="blind">필수항목</span>
												</span> <label for="help_title" class="lab_find">비밀번호</label>
											</div>
											<div class="wrap_input">
												<span class="box_input"> <form:input path="memPass"
														type="password" cssClass="inp_find" autocomplete="true"/> <form:errors
														path="memPass" element="span" cssClass="text-danger" />
												</span>
											</div>
										</li>
										<li>
											<div class="wrap_lab">
												<span class="ico_required"> <span class="blind">필수항목</span>
												</span> <label for="help_title" class="lab_find">이름</label>
											</div>
											<div class="wrap_input">
												<span class="box_input"> <form:input path="memName"
														type="text" cssClass="inp_find"  /> <form:errors
														path="memName" element="span" cssClass="inp_find" />
												</span>
											</div>
										</li>
										<li>
											<div class="wrap_lab">
												<span class="ico_required"> <span class="blind">필수항목</span>
												</span> <label for="help_title" class="lab_find">닉네임</label>
											</div>
											<div class="wrap_input">
												<span class="box_input"> <form:input
														path="memNickname" type="text" cssClass="inp_find"
														 /> <form:errors path="memNickname"
														element="span" cssClass="inp_find" />
												</span>
											</div>
										</li>
										<li>
											<div class="wrap_lab">
												<span class="ico_required"> <span class="blind">
														필수항목 </span>
												</span> <label for="help_email" class="lab_find"> 이메일 </label>
											</div>
											<div class="wrap_input">

												<!-- 이메일 작성 -->
												<span class="box_input"> <form:input path="memEmail"
														type="text" cssClass="inp_find" id="memEmail"
														autocomplete="off" /> <form:errors path="memEmail"
														element="span" cssClass="text-danger" />
												</span>

												<!-- 인증버튼 -->
												<button type="button" id="check-accept" 
													class="btnSizeM btn-primary" id="mail-Check-Btn"  style="margin-left: 20px; border-radius: 0px">본인인증</button>

					<%-- 							<!-- 인증버튼 눌렀을 때 팝업창 -->
												<div class="layer_identify open" id="layer_pop_byemail"
													style="display: none">
													<h4>이메일 인증</h4>
													<button type="button" class="btn_layer_close"
														onclick="confirm_layer_close(this);">
														<span>닫기</span>
													</button>

													<!-- 팝업창 내용 -->
													<div class="box_txt_identify">
														<p class="txt" id="email_layer_sub_title"
															name="email_layer_sub_title"></p>
													</div>

													<!-- 인증번호 입력칸 -->
													<table class="tbl_fieldset">
														<caption></caption>
														<colgroup>
															<col style="width: 130px;">
															<col>
														</colgroup>
														<tbody>
															<tr>
																<th>인증번호</th>
																<td><input type="text" id="email_code"
																	name="email_code" value="" class="sri_input"
																	style="width: 96px;">
																	<button type="button"
																		class="btn_basic_type04 confirm-action person">확인</button>
																	<!-- 인증시간 --> <span class="expiredin"
																	id="confirm_remain_mail_time_area"
																	name="confirm_remain_mail_time_area"><strong></strong></span>
																</td>
															</tr>
														</tbody>
													</table>

													<!-- 인증번호 입력하지 않고 확인 눌렀을 때 나오는 내용 -->
													<div class="txt alert_txt">
														<p class="alert_column warning_txt" id="email_confirm_msg"
															style="display: none;">인증번호를 입력해주세요.</p>
													</div>

													<!-- 재발송 및 인증완료 버튼 -->
													<div class="bottom_btn_wrap">
														<button type="button" class="btn_basic_type01"
															onclick="sendCodeAction();">인증번호 재발송</button>
														<button type="button" class="btn_basic_type05"
															onclick="changeConfirmCell()">인증완료</button>
													</div>
												</div> --%>

												<!-- 이메일 제안 -->
												<div class="suggest_email email_list" style="display: none">
													<ul class="list_email">
														<li class="auto_list"><a href="javascript:;"
															onclick="return false;" class="link_email"> <strong
																class="txt_email">abcd</strong>@naver.com
														</a></li>
														<li class="auto_list"><a href="javascript:;"
															onclick="return false;" class="link_email"> <strong
																class="txt_email">abcd</strong>@gmail.com
														</a></li>
														<li class="auto_list"><a href="javascript:;"
															onclick="return false;" class="link_email"> <strong
																class="txt_email">abcd</strong>@daum.net
														</a></li>
														<li class="auto_list"><a href="javascript:;"
															onclick="return false;" class="link_email"> <strong
																class="txt_email">abcd</strong>@nate.com
														</a></li>
														<li class="auto_list"><a href="javascript:;"
															onclick="return false;" class="link_email"> <strong
																class="txt_email">abcd</strong>@outlook.com
														</a></li>
													</ul>
												</div>
												<!-- // 이메일 제안 -->

											</div>
										<li>
											<div class="wrap_lab" style="
											    width: 183px;
											">
												<label for="help_upload" class="lab_find">파일첨부</label>
											</div>
											<div class="wrap_input">
												<div class="uploads"></div>
												<div class="wrap_file">
													<form:input type="file" path="attachFiles" id="help_upload"/>
													<label for="help_upload" class="btn_basic2 type03">프로필사진</label>
												</div>
												<p class="noti_inp">
													10MB 이하의 hwp, pdf, zip, MS Office 파일, 이미지 파일(JPG, GIF, PNG,
													BMP) 만 등록 가능합니다.
													<!--<br/>(최대 5개까지 가능)-->
												</p>
											</div>
										</li>
										<li>
											<div class="wrap_lab" style="
											    width: 183px;
											">
												<span class="ico_required"> <span class="blind">
														필수항목 </span>
												</span> <label for="help_email" class="lab_find"> 주소 </label>
											</div>
											<div class="wrap_input">
												<span class="box_input2"> <input type="button"
													class="inp_find" onclick="sample3_execDaumPostcode()"
													value="우편번호 찾기" > <label
													for="job-title">사업장 우편번호</label>
												</span> <span class="box_input1"> <form:input path="memZip"
														type="text" cssClass="inp_find" id="sample3_postcode"
														placeholder="우편번호" /> <form:errors
														path="memZip" element="span" cssClass="text-danger"
														 />
												</span> <span class="box_input1"> <label for="job-title">사업장주소</label>
													<form:input path="memAddr1" type="text" cssClass="inp_find"
														placeholder="사업장주소" id="sample3_address"/> <form:errors
														path="memAddr1" element="span" cssClass="text-danger"
														 />
												</span> <span class="box_input1"> <label for="job-title">사업장
														상세주소</label> <form:input path="memAddr2" type="text"
														cssClass="inp_find" placeholder="상세주소" id="sample3_detailAddress"
														 /> <form:errors path="memAddr2"
														element="span" cssClass="text-danger"  />
												</span>
											</div>
											<div id="wrap"
												style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
												<img
													src="//t1.daumcdn.net/postcode/resource/images/close.png"
													id="btnFoldWrap"
													style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
													onclick="foldDaumPostcode()" alt="접기 버튼">
											</div>
										</li>


										<li>
											<div class="wrap_lab" style="width: 178px;">
												<span class="ico_required"> <span class="blind">필수항목</span>
												</span> <label for="help_title" class="lab_find">생년월일</label>
											</div>
											<div class="wrap_input">
												<span class="sri_input2	"> <label for="job-title">생년월일</label>
													<form:input path="memBirth" type="date" class="inp_find" />
													<form:errors path="memBirth" element="span"
														cssClass="text-danger" />
												</span>
											</div>
										</li>
										<li>
											<div class="wrap_lab" style="width:177px;">
												<span class="ico_required"> <span class="blind">필수항목</span>
												</span> <label for="help_title" class="lab_find">성별</label>
											</div>
											<div class="wrap_input">
												<span class="choice_input"> 
													<span class="inpRdo"> 
													<input type="radio" id="help_member_type_man" name="memGender" class="help_member_type"
													value="남" /> 
													<label class ="lbl" for="help_member_type_man">남성</label>
													</span>
													<span class="inpRdo"> 
													<input type="radio" name="memGender" 
													class="help_member_type" id="help_member_type_woman" value="여" /> 
													<form:errors path="memGender"
														element="span" cssClass="text-danger" />
													<label class = "lbl" for="help_member_type_woman">여성</label>
													</span>
												</span>
											</div>
										</li>
										<%-- 						<div class="wrap_input">
							<label for="job-title">이메일</label>
							<form:input path="memEmail" type="text" cssClass="inf_find" id="memEmail"/>
							<form:errors path="memEmail" element="span"
								cssClass="text-danger" />
						</div>
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn" disabled>본인인증</button>
						</div> --%>
										<!-- 						<div class="row wrap_input">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">인증번호</label>
			                  	<input class="inf_find mail-check-input" type="text" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" >
			                </div>
			                <span id="mail-check-warn"></span>
						</div>	
			           	<div class="row wrap_input">
			           		<div class="col-md-12">
			               		<input type="submit" value="인증확인"  id="check-accept" class="btn px-4 btn-primary text-white">
			               	</div>
			           	</div> -->
										<li>
											<div class="wrap_lab" style="width:177px;">
												<span class="ico_required"> <span class="blind">필수항목</span>
												</span> <label for="help_title" class="lab_find">전화번호</label>
											</div>
											<div class="wrap_input">
												<span class="box_input"> <form:input path="memTel"
														type="text" class="inp_find" /> <form:errors
														path="memTel" element="span" cssClass="text-danger" />
												</span>
											</div>
										</li>
									</ul>
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
											id="help_send" onclick="updateBtn()" style="
    background: #0D6EFD;
">가입하기</button>
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
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/resources/js/board/email.js"></script> --%>
<script src="/INUProject/resources/js/daumPostcode.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	var $j = jQuery.noConflict();
</script>
<script type="text/javascript">


/* 약관동의 */
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
			for(var i=0; i<resp.length; i++){
				if(inputId==""||inputId.length<4){
					swal("사용불가","아이디는 최소 4글자 이상 입력해야 합니다.","error");
				}else if(inputId==resp[i]){
					swal("사용불가","중복되는 아이디입니다.","error");
				}else{
					swal("사용가능","사용가능한 아이디입니다.","success");
					checkIdBtn.attr("disabled","disabled")
				}
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

 var autoInsert = document.querySelector("#autoInsert");
autoInsert.addEventListener("click",function(){
	$("input[name=memId]").attr('value','INUseeker');
	$("input[name=memPass]").attr('value','java');
	$("input[name=memName]").attr('value','김시커');
	$("input[name=memNickname]").attr('value','시시커커');
	$("input[name=memEmail]").attr('value','hjpark9833@naver.com');
	$("input[name=memZip]").attr('value','34611');
	$("input[name=memAddr1]").attr('value','대전 동구 우암로 133');
	$("input[name=memAddr2]").attr('value','101동101호');
	$("input[name=memBirth]").attr('value','2000-01-01');
 	$("input:radio[name=memGender]:radio[value='남']").prop('checked','true');
 	$("input[name=memTel]").attr('value','010-1234-5678');
	
}) 

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

