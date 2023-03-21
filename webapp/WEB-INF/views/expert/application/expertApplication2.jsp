<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      허근주      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style>
li{
	height: 60px;
}
.content {
    max-width: 960px;
}
.help_find .wrap_lab{
	width: 359px;
}
</style>
<link href="<%=request.getContextPath()%>/resources/cks/processView.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/help.css" />
<section class="site-section" id="next-section">
	<ul class="responsive-table"
		style="margin-bottom: 300pxpx; padding-left: 50px; padding-right: 50px; height: 100%;">

		<li class="table-row" style="padding: 0px; box-shadow: 0 0 0 0;">
			<div
				style="padding-left: 50px; padding-right: 50px; width: 100%; height: 100px;">
				<div
					style="position: relative; width: 88%; height: 50%; padding: 50px; margin: auto;">
					<div class="pline-container" style="width: 70%;">
						<div class="pline">
							<div class="percent" style="width: 100%"></div>
						</div>
						<div class="steps">
							<div class="step selected completed" id="0"></div>
							<div class="step selected completed" id="5"></div>
							<div class="step selected completed" id="10"></div>
						</div>
					</div>
					<div class="process-container"
						style="width: 75%; margin-left: 12.5%; margin-top: 20px">
						<div class="process">
							<h5>주의사항</h5>
							<h6 style="font-size: 10px;"></h6>
							<h6 style="font-size: 10px;"></h6>
						</div>
						<div class="process">
							<h5>약관동의</h5>
							<h6 style="font-size: 10px;"></h6>
							<h6 style="font-size: 10px;"></h6>
						</div>
						<div class="process">
							<h5>신청서작성</h5>
							<h6 style="font-size: 10px;"></h6>
							<h6 style="font-size: 10px;"></h6>
						</div>

					</div>
				</div>
			</div>
		</li>
	</ul>
	<div class="site-wrap" >
		<div id="sri_section" class="has_banner">
			<div id="sri_wrap">
				<div id="content">
					<div class="wrap_title_recruit">
						<h1 class="title_common">전문가 정보</h1>
					</div>
					<div class="help_find help_lost wrap_help">
						<div class="cont_find">
								<button type="button" class="btn btn-primary"  id="autoInsert" style="border-radius: 0px; background: #045738">
										<span>자동입력</span>
								</button> 
							<form:form modelAttribute="expert" method="post"
								enctype="multipart/form-data">
								<p class="desc_find_type2 border-bottom">
									평일 09시 에서 17시까지 문의하신 내용은 당일 답변해드립니다. <br> 17시 이후에 문의하신 내용은
									다음날에 답변, 주말에 문의하신 내용은 그 다음주 월요일에 답변해 드립니다. <br>
								</p>
								<ul class="list_find">
									<li style="
									    height: 16%;
									">
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 보유자격증 </label>
										</div>
										<div class="wrap_input">
										<div class="uploads"></div>
										<div class="wrap_file">
											 <label
												for="company-website-tw d-block">보유자격증</label> <label
												class="btn_basic2 type03"> 자격증선택 <input
													type="file" hidden name="attachFiles" required="required">
											</label>
											</div>
											<p class="noti_inp">
													10MB 이하의 hwp, pdf, zip, MS Office 파일, 이미지 파일(JPG, GIF, PNG, BMP) 만 등록 가능합니다.
													<!--<br/>(최대 5개까지 가능)-->
											</p>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 한줄소개 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">한줄소개</label>
												<form:input path="expertIntroduction" type="text"
													cssClass="inp_find" style="width: 508px" /> <form:errors
													path="expertIntroduction" element="span"
													cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 가입경로 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">가입경로</label>
												<form:input path="expertJoinpath" type="text"
													cssClass="inp_find" style="width: 508px" /> <form:errors
													path="expertJoinpath" element="span" cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 직업 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">직업</label>
												<form:input path="expertField" type="text"
													cssClass="inp_find" style="width: 508px" /> <form:errors
													path="expertField" element="span" cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 태그 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">태그</label>
												<form:input path="expertTag" type="text" cssClass="inp_find"
													style="width: 508px" /> <form:errors path="expertTag"
													element="span" cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li style="
    height: 200px;
">
										<div class="wrap_lab" >
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 주소 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input2"> <input type="button"
												class="inp_find" onclick="sample3_execDaumPostcode()"
												value="우편번호 찾기" > <label
												for="job-title">사업장 우편번호</label>
											</span> 
											<span class="box_input1"> 
												<form:input
													path="expertZip" type="text" cssClass="inp_find"
													id="sample3_postcode" placeholder="우편번호"
													style="width: 100%;" /> 
												<form:errors path="expertZip"
													element="span" cssClass="text-danger"  />
											</span> 
											<span class="box_input1"> <label for="job-title">사업장주소</label>
												<form:input path="expertAddr" type="text"
													cssClass="inp_find" placeholder="사업장주소"
													style="width: 100%;" id="sample3_address" /> <form:errors path="expertAddr"
													element="span" cssClass="text-danger"  />
											</span> <span class="box_input1"> <label for="job-title">사업장
													상세주소</label> <form:input path="expertAddr2" type="text"
													cssClass="inp_find" placeholder="상세주소" id="sample3_detailAddress" />
												<form:errors path="expertAddr2" element="span"
													cssClass="text-danger"  />
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
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 고객센터 이메일 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">고객센터
													이메일</label> <form:input path="expertEmail" type="text"
													cssClass="inp_find" style="width: 508px" /> <form:errors
													path="expertEmail" element="span" cssClass="text-danger" />
													</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 고객센터 전화번호
											</label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">고객센터
													전화번호</label> <form:input path="expertTel" type="text"
													cssClass="inp_find" style="width: 508px" /> <form:errors
													path="expertTel" element="span" cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 은행 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">은행</label>
												<form:input path="expertBank" type="text"
													cssClass="inp_find" style="width: 508px" /> <form:errors
													path="expertBank" element="span" cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 계좌번호 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">계좌번호</label>
												<form:input path="expertAccount" type="text"
													cssClass="inp_find" style="width: 508px" /> <form:errors
													path="expertAccount" element="span" cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 예금주 </label>
										</div>
										<div class="wrap_input">
											<span class="box_input"> <label for="job-title">예금주</label>
												<form:input path="expertHolder" type="text"
													cssClass="inp_find" style="width: 508px" /> <form:errors
													path="expertHolder" element="span" cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 분야 </label>
										</div>
										<div class="wrap_input">
											<span class="sri_input2"> <form:select
													path="exfieldId" onchange="changeExfield()" id="exfield"
													style="width: 338px">
													<option value>분야코드</option>
													<c:forEach items="${exfield }" var="exfield">
														<form:option value="${exfield.exfieldId }"
															label="${exfield.exfieldName }"></form:option>
													</c:forEach>
												</form:select> <form:errors path="exfieldId" element="span"
													cssClass="text-danger" />
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">
													필수항목 </span>
											</span> <label for="help_email" class="lab_find"> 분야 </label>
										</div>
										<div class="wrap_input">
											<span class="sri_input2"> <form:select path="exjobId"
													id="exjob" style="width: 338px">
													<option value>직업코드</option>
													<c:forEach items="${exjob }" var="exjob">
														<form:option value="${exjob.exjobId }"
															label="${exjob.exjobName }"></form:option>
													</c:forEach>
												</form:select> <form:errors path="exjobId" element="span"
													cssClass="text-danger" />
											</span>
										</div>
									</li>

									<%-- <div class="wrap_input">
								<label for="job-title">직업코드</label>
								<form:input path="exjobId" type="text" cssClass="inp_find" />
								<form:errors path="exjobId" element="span"
									cssClass="text-danger" />
							</div> --%>
										<div class="wrap_link">
											<a href="${pageContext.request.contextPath }"
												class="btn_biggest_type03" style="border: 1px solid;">이전</a>
											<input type="submit" class="btn_biggest_type01" value="등록">
										</div>
								</ul>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<script type="text/javascript">
	var autoInsert = document.querySelector("#autoInsert");
	autoInsert.addEventListener("click",function(){
		$("input[name=expertIntroduction]").attr('value','질문의 답은 내안에 있어요');
		$("input[name=expertJoinpath]").attr('value','인터넷');
		$("input[name=expertField]").attr('value','웹개발자');
		$("input[name=expertTag]").attr('value','웹개발');
		$("input[name=expertZip]").attr('value','22530');
		$("input[name=expertAddr]").attr('value','인천 동구 방축로 105');
		$("input[name=expertAddr2]").attr('value','17동 235호');
		$("input[name=expertTel]").attr('value','02-2224-0200');
		$("input[name=expertEmail]").attr('value','inu@naver.com');
		$("input[name=expertBank]").attr('value','국민은행');
	 	$("input[name=expertAccount]").attr('value','182389-28-23232');
	 	$("input[name=expertHolder]").attr('value','김전문가');
	 	$("select[name=exfieldId]").val('EF003').prop("selected",true);
	 	$("select[name=exjobId]").val('EJ007').prop("selected",true);
	}) 
	function changeExfield() {
		var exfieldSelect = $("#exfield option:selected").val();
		var exjobSelect = $("#exjob")
		exjobSelect.find('option').each(function() {
			$(this).remove();
		})
		exjobSelect.append("<option>직업코드</option>");
		console.log(exjobSelect)
		var data = {
			"exfieldId" : exfieldSelect
		}
		console.log(data)
		$
				.ajax({
					url : '/INUProject/expert/exfield',
					method : 'post',
					data : JSON.stringify(data),
					contentType : 'application/json; charset=UTF-8',
					dataType : 'json',
					success : function(resp) {
						// 			console.log(resp[0].exfieldId)
						console.log(resp)
						for (i = 0; i < resp.length; i++) {
							console.log(resp[i].exfieldId)
							console.log(resp[i].exjobName)
							exjobSelect
									.append("<option value="+resp[i].exjobId+" label="+resp[i].exjobName+"></option>")
						}
						console.log(exjobSelect);

					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}

				})

	}
</script>
<script src="/INUProject/resources/js/daumPostcode.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>