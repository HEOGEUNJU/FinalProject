<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<style>
.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
.ck-editor__editable { height: 100px; }
.ck-content { font-size: 15px; }
.help_find .type2 .inp_find {width: 844px;}
.help_find li.col_type .inp_find {width: 254px;}
.help_find .type2 .wrap_input {width: 886px;}
.help_find .type2 .wrap_lab {width: 210px;}
.help_find li.col_type .wrap_lab:first-child {width: 210px;}
.help_find li.col_type .wrap_input {width: 364px;}
.btn_basic2.type03 {border: 1px solid #8f8f8f;color: #fff;background-color: #9c9c9c;}
.btn_basic2 {display: inline-block;height: 40px;font-size: 15px;line-height: normal;vertical-align: top;}
.q_num {display: block;padding-bottom: 15px;color: #045738;font-size: 26px;font-weight: bold;letter-spacing: 0;line-height: 18px;}
.form-group {margin-bottom: 3rem;margin-top: -15px;}
#qna{height: 40px;width: 40px;border-radius: 50px;margin: auto;margin-top: -27px;margin-right: 412px;}
.btn btn-block btn-primary btn-md{
    /* margin-bottom: 20px; */
    padding-bottom: 15px;
    padding-top: 15px;
}
</style>

<section class="site-section">
	<div class="container">

		<div class="row mb-5">
			<div class="col-lg-12">

				<div class="help_find help_contact wrap_help">
					<div class="cont_find">
						<form:form modelAttribute="education" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/education/insertt">
							<div class="qna_write_wrap">
								<div class="qna_write_selection">
									<span class="qna_category_tit">학력 등록하기</span>
								</div>
							</div>
							<fieldset>
								<legend class="blind">이력서의 입력 폼</legend>
								<p class="desc_find_type2">
									<span class="txt_required">*</span> 는 필수 항목입니다.
								</p>

								<ul class="list_find type2">
								
									<li>
										<div class="wrap_lab">
											<span class="ico_required">
												<span class="blind">필수항목</span>
											</span>
											<label for="incumTitle" class="lab_find">학교명</label>
										</div>
										<div class="wrap_input">
											<span class="box_input">
												<form:input path="eduName" type="text" cssClass="form-control" />
												<form:errors path="eduName" element="span" cssClass="text-danger" />											
											</span>
										</div>
									</li>

									<li>
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">전공분류</label>
										</div>
										<div class="wrap_input">
											<span class="box_input">
												<form:input path="eduDepartment" type="text" cssClass="form-control" />
												<form:errors path="eduDepartment" element="span" cssClass="text-danger" />
											</span>
											<p class="noti_inp">사회과학, 인문, 공학 등</p>
										</div>
									</li>
									
									<li class="col_type">
										<div class="wrap_lab">
											<span class="ico_required">
												<span class="blind">필수항목</span>
											</span>
											<label for="incumName" class="lab_find">전공</label>
										</div>
										<div class="wrap_input">
											<span class="box_input">
												<form:input path="eduMajor" type="text" cssClass="form-control" />
												<form:errors path="eduMajor" element="span" cssClass="text-danger" />
											</span>
										</div>
										<div class="wrap_lab">
											<span class="ico_required">
												<span class="blind">필수항목</span>
											</span>
											<label for="department" class="lab_find">상태</label>
										</div>
										<div class="wrap_input">
											<span class="box_input">
												<form:select path="eduStatus" type="text" cssClass="form-control" style="width: 200px;">
													<form:option value="">선택</form:option>
													<form:option value="졸업">졸업</form:option>
													<form:option value="재학" id="ing">재학</form:option>
													<form:option value="중퇴">중퇴</form:option>
													<form:option value="자퇴">자퇴</form:option>
													<form:option value="기타">기타</form:option>
												</form:select>
												<form:errors path="eduStatus" element="span" cssClass="text-danger" />
											</span>
											<p class="noti_inp">학력 상태 등</p>
										</div>										
									</li>

									<li class="col_type">
										<div class="wrap_lab">
											<span class="ico_required">
												<span class="blind">필수항목</span>
											</span>
											<label for="cmdName" class="lab_find">입학일</label>
										</div>
										<div class="wrap_input">
											<span class="box_input">
												<form:input path="eduEntered" type="date" cssClass="form-control" />
												<form:errors path="eduEntered" element="span" cssClass="text-danger" />
											</span>
										</div>									
										<div class="wrap_lab">
											<span class="ico_required">
												<span class="blind">필수항목</span>
											</span>
											<label for="subTitle" class="lab_find">졸업일</label>
										</div>
										<div class="wrap_input">
											<span class="box_input">
												<form:input path="eduGraduated" type="date" cssClass="form-control" />
												<form:errors path="eduGraduated" element="span" cssClass="text-danger" />
											</span>
											<p class="noti_inp">졸업일, 자퇴일, 중퇴일 등</p>
										</div>
									</li>
									
									<li class="col_type">
										<div class="wrap_lab">
											<span class="ico_required">
											</span>
											<label for="subTitle" class="lab_find">학점</label>
										</div>
										<div class="wrap_input">
											<span class="box_input">
												<form:input path="eduScore" type="number" cssClass="form-control" step="0.01"/>
												<form:errors path="eduScore" element="span" cssClass="text-danger" />
											</span>
										</div>
										<div class="wrap_lab">
											<span class="ico_required">
											</span>
											<label for="department" class="lab_find">기준학점</label>
										</div>
										<div class="wrap_input">
											<span class="box_input">
												<form:input path="eduStandard" type="number" cssClass="form-control" step="0.01"/>
												<form:errors path="eduStandard" element="span" cssClass="text-danger" />
											</span>
											<p class="noti_inp">4.5, 4.3, 4.0 등</p>
										</div>
									</li>



									<li>
										<div class="wrap_lab">

											<label for="help_upload" class="lab_find">파일첨부</label>
										</div>
										<div class="wrap_input">
											<div class="uploads" style="display: none;" id="uploadedDiv">
												<span class="info_upload">
													<span class="txt_upload" id="uploadedFileNm"></span>
													<button type="button" class="btn_delete btn_delete" id="fileDeleteBtn">
														<span class="blind">파일삭제</span>
													</button>
												</span>
											</div>
											<div class="wrap_file">
												<input type="file" id="fileUpload" class="inp_upload" title="파일 업로드" name="attachFiles" multiple>
												<label for="fileUpload" class="btn_basic2 type03">파일 첨부하기</label>
											</div>
											<p class="noti_inp">
												10MB 이하의 hwp, pdf, zip, MS Office
												파일, 이미지 파일(JPG, GIF, PNG, BMP) 만 등록 가능합니다.<br>
												※ 이력서와 관련된 서류를 올려주세요.
											</p>
										</div>
									</li>
								</ul>

								<div class="row align-items-center mb-5" style="margin-bottom:-1rem !important;">
									<div class="col-lg-4 ml-auto" style="margin: 46px 10px -15px;">
										<div class="row">
											<div class="col-6">
												<button type="submit" class="btn btn-block btn-primary btn-md" style=" border-radius: 0;">게시글등록</button>
											</div>
											<div class="col-6">
												<a href="${pageContext.request.contextPath }/education" class="btn btn-block btn-danger btn-md" style="border-radius: 0;">취소</a>
											</div>
										</div>
										<div class="row" style="margin-top: 30px; margin-bottom: 0px; justify-content: right;">
											<div class="col-6">
												<button id="autoComp" type="button" class="btn btn-block btn-success btn-md" style=" border-radius: 0;">자동완성</button>
											</div>
										</div>										
									</div>
					 			</div>
							</fieldset>
						</form:form>
					</div>
				</div>
				
			</div>
		</div>
		
	</div>
</section>

	<script>
		let autoComp = document.querySelector("#autoComp");
		
		let eduName = document.querySelector("[name=eduName]");
		let eduDepartment = document.querySelector("[name=eduDepartment]");
		let eduMajor = document.querySelector("[name=eduMajor]");
		let eduStatus = document.querySelector("#ing");
		let eduEntered = document.querySelector("[name=eduEntered]");
		let eduGraduated = document.querySelector("[name=eduGraduated]");
		let eduScore = document.querySelector("[name=eduScore]");
		let eduStandard = document.querySelector("[name=eduStandard]");
		
		autoComp.addEventListener("click", function(event) {
			eduName.value = "대덕인재개발원";
			eduDepartment.value = "풀스택 개발자";
			eduMajor.value = "JAVA";
			eduStatus.setAttribute("selected", true);
			eduEntered.value = "2022-08-01";
			eduGraduated.value = "2023-03-17";
			eduScore.value = "99";
			eduStandard.value = "100";
		});
	</script>
								