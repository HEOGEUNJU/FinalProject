<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/help.css" />
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
.btn_cert_pop {background-color: #0D6EFD;color: #fff;}
.btn_biggest_type01{border: 1px solid #0D6EFD;background-color: #0D6EFD;}
.btnSizeS {
    padding: 4px 8px;
    height: 32px;
    font-size: 13px;
    letter-spacing: -0.5px;
    line-height: 20px;
}

[class*="btnSize"] {
    display: inline-block;
    border: 1px solid #0D6EFD;
    border-radius: 4px;
    box-sizing: border-box;
    color: #fff;
    letter-spacing: -1px;
    text-align: center;
    background-color: #0D6EFD;
}
</style>
</head>

<body id="top">
<security:authorize access="isAuthenticated()"><!-- 로그인 되었다면.. 로그인된 사람만 볼 수 있다. -->
	<security:authentication property="principal.realMember" var="memberVO" />
	<input type="hidden" class="y" value="y"/>
</security:authorize>
	<div id="overlayer"></div>
	<div class="site-wrap">
		<div id="sri_section" class="has_banner">
			<div id="sri_wrap">
				<div id="content">


					<div class="wrap_title_recruit">
						<h1 class="title_common">문의하기</h1>
					</div>


					<div class="help_find help_lost wrap_help">
						<div class="cont_find">
						<!-- 자동완성  -->
						<div class="qna_write_foot">
							<button type="button" class="btnSizeS btn_qna_write" id="fill">자동완성</button>
						</div>
							<form method="post" action="#" id="writeForm" enctype="multipart/form-data">
								<input type="hidden" id="hSelected_category" value="">
								<input type="hidden" id="hSelected_contents" value="">
								<input type="hidden" name="hSeq" id="hSeq" value="">
								<input type="hidden" name="hType" id="hType" value="">
								<input type="hidden" name="hOption" id="hOption" value="">
								<input type="hidden" name="help_total_size" id="help_total_size" value="">
								<input type="hidden" name="csrfToken" value="9ffdb7871b6d52cc291a2afb174f74c7">
								<input type="hidden" name="channel" id="channel" value="mail">
								<input type="hidden" name="seq" id="seq" value="seq1677046033">
								<input type="hidden" name="confirm_status" id="confirm_status" value="ready">
								<input type="hidden" name="mail_confirm_complete" value="n" id="mail_confirm_complete">

								<fieldset>
									<legend class="blind">이메일 문의 입력 폼</legend>
									<p class="desc_find_type2">
										평일 09시 에서 17시까지 문의하신 내용은 당일 답변해드립니다. <br>
										17시 이후에 문의하신 내용은 다음날에 답변, 주말에 문의하신 내용은 그 다음주 월요일에 답변해 드립니다.
									</p>
									<ul class="list_find">
										<li>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind"> 필수항목 </span>
												</span>
												<label for="help_email" class="lab_find"> 이메일 </label>
											</div>
											<div class="wrap_input">
												<!-- 이메일 작성 -->
												<span class="box_input">
													<input type="text" id="help_email" class="inp_find" name="help_email" value="" autocomplete="off">
												</span>

												<!-- 이메일 제안 -->
												<div class="suggest_email email_list" style="display: none;">
													<ul class="list_email">
														<li class="auto_list">
															<a href="javascript:;" onclick="return false;" class="link_email">
																<strong class="txt_email">abcd</strong>@naver.com
															</a>
														</li>
														<li class="auto_list">
															<a href="javascript:;" onclick="return false;" class="link_email">
																<strong class="txt_email">abcd</strong>@gmail.com
															</a>
														</li>
														<li class="auto_list">
															<a href="javascript:;" onclick="return false;" class="link_email">
																<strong class="txt_email">abcd</strong>@daum.net
															</a>
														</li>
														<li class="auto_list">
															<a href="javascript:;" onclick="return false;" class="link_email">
																<strong class="txt_email">abcd</strong>@nate.com
															</a>
														</li>
														<li class="auto_list">
															<a href="javascript:;" onclick="return false;" class="link_email">
																<strong class="txt_email">abcd</strong>@outlook.com
															</a>
														</li>
													</ul>
												</div>
												<!-- // 이메일 제안 -->

											</div>
										</li>

										<li>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label class="lab_find">구분</label>
											</div>
											<div class="wrap_input">
												<span class="choice_input">
												<span class="inpRdo">
													<input type="radio" name="askCate" id="help_member_type_person" class="help_member_type"value="개인">
													<label class="lbl" for="help_member_type_person">개인</label>
												</span>
												<span class="inpRdo">
													<input type="radio" name="askCate" id="help_member_type_company" class="help_member_type" value="기업">
													<label class="lbl" for="help_member_type_company">기업</label>
												</span>
												</span>
											</div>
										</li>

										<li>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label for="help_category" class="lab_find"> 문의종류 </label>
											</div>
											<div class="wrap_input">
												<span class="sri_input2">
													<select id="help_category" style="width: 338px" name="askType">
														<option selected="" value="">선택해주세요</option>
														<option value="최저임금 위반/불량 기업/공고 신고">최저임금 위반/불량 기업/공고 신고</option>
														<option value="오류 신고">오류 신고</option>
														<option value="이력서 문의">이력서 문의</option>
														<option value="입사지원 문의">입사지원 문의</option>
														<option value="검색 문의">검색 문의</option>
														<option value="회원가입/탈퇴/ID/PW">회원가입/탈퇴/ID/PW</option>
														<option value="공고 문의">공고 문의</option>
														<option value="지원자관리 문의">지원자관리 문의</option>
														<option value="이메일/알림 문의">이메일/알림 문의</option>
														<option value="결제/유료 상품 문의">결제/유료 상품 문의</option>
														<option value="연봉정보 수정요청">연봉정보 수정요청</option>
														<option value="전문가 신청 문의">전문가 신청 문의</option>
														<option value="기업정보">기업정보</option>
														<option value="제안사항">제안사항</option>
														<option value="기타">기타</option>
													</select>
												</span>
											</div>
										</li>

										<li>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label for="help_title" class="lab_find">제목</label>
											</div>
											<div class="wrap_input">
												<span class="box_input">
													<input type="text" id="help_title" class="inp_find" style="width: 533px" name="askTitle">
												</span>
											</div>
										</li>

										<li>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label for="help_desc" class="lab_find">내용</label>
											</div>
											<div class="wrap_input">
												<span class="box_input">
													<textarea id="help_desc" class="inp_find textarea" name="askContent" style="width: 533px; height: 120px;"></textarea>
												</span>
											</div>
										</li>

										<li>
											<div class="wrap_lab">
												<label for="help_upload" class="lab_find">파일첨부</label>
											</div>
											<div class="wrap_input">
												<div class="uploads"></div>
												<div class="wrap_file">
													<input type="file" id="image_add" class="inp_upload" title="파일 업로드" name="attachFiles" style="display: none" multiple>
													<label for="image_add" class="btn_basic2 type03">파일첨부하기</label>
												</div>
												<p class="noti_inp">
													10MB 이하의 hwp, pdf, zip, MS Office 파일, 이미지 파일(JPG, GIF, PNG, BMP) 만 등록 가능합니다.
													<!--<br/>(최대 5개까지 가능)-->
												</p>
											</div>
										</li>

									</ul>

									<div class="noti_find">
										<h3 class="noti_title">[개인정보 수집·이용에 대한 안내]</h3>
										<p class="desc_find_type2">
											(주)I Need You은 이용자 문의를 처리하기 위해 다음과
											같이 개인정보를 수집 및 이용하며, 이용자의 개인정보를 안전하게 취급하는데 최선을 다하고 있습니다.
										</p>
										<ul class="list_noti">
											<li>① 수집항목 : 이메일 주소</li>
											<li>② 수집·이용목적 : 문의에 따른 원활한 상담 제공</li>
											<li>③ 보유 및 이용기간 : <strong>문의 처리 후 3년간 보관</strong></li>
										</ul>
										<p class="desc_find_type2">
											위 동의를 거부 할 권리가 있으며 동의 거부 시 문의하기 이용이 제한됩니다.<br>
											이외의 방법으로 문의하시려면 이메일(help@iny.co.kr)을 통하여 문의하시기 바랍니다.
										</p>
										<div class="check_agree">
											<div class="sri_input3">
												<input type="checkbox" id="agree_chk" value="동의" name="consent">
													<label for="agree_chk">위의 ‘개인정보 수집 및 이용‘에 동의합니다.</label>
											</div>
										</div>
									</div>

									<div class="wrap_link">
										<a href="${pageContext.request.contextPath }/help">
											<button type="button" class="btn_biggest_type03" id="help_cancel">취소하기</button>
										</a>
										<button type="submit" class="btn_biggest_type01" id="help_send">문의하기</button>
									</div>

									<div id="files">
										<ul id="files_ul"></ul>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stickyfill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/board/ask.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/board/email.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<script>
  $(function(){

// 로그인하지 않은 상태에서 문의하기 들어갈 때
	if($(".y").val() != "y"){
 		if(confirm("로그인 후 문의하시면, 내 문의 내역에서 확인 가능합니다. 로그인 하시겠습니까?")){
			location.href="${pageContext.request.contextPath }/login";
		}else{
			location.href="${pageContext.request.contextPath }/";
		}
	}

});
</script>

<script>
$("#fill").on("click",function(event){
	let email = `lcr@naver.com`;
	let category = `전문가 신청 문의`;
	let title = `전문가 신청 문의합니다.`;
	let content = `전문가 신청을 하고싶은데 어디에서 하는지 모르겠어요.`;

	$("#help_email").val(email);
	$("input:radio[name='askCate']:radio[value='개인']").prop("checked",true);

	$("#help_category").val(category);
	$("#help_title").val(title);
	$("#help_desc").val(content);
	$("input:checkbox[name='consent']:checkbox[value='동의']").prop("checked", true);
});


</script>

</body>
</html>
