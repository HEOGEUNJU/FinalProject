<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

 <!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<style>
.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
.ck-editor__editable { height: 100px; }
.ck-content { font-size: 15px; }
.help_find .type2 .inp_find {width: 708px;}
.help_find li.col_type .inp_find {width: 254px;}
.help_find .type2 .wrap_input {width: 750px;}
.btn_basic2.type03 {border: 1px solid #8f8f8f;color: #fff;background-color: #9c9c9c;}
.btn_basic2 {display: inline-block;height: 40px;font-size: 15px;line-height: normal;vertical-align: top;}
.q_num {display: block;padding-bottom: 15px;color: #0D6EFD;font-size: 26px;font-weight: bold;letter-spacing: 0;line-height: 18px;}
.form-group {margin-bottom: 3rem;margin-top: -15px;}
#qna{height: 40px;width: 40px;border-radius: 50px;margin: auto;margin-top: -27px;margin-right: 412px;}
.btn btn-block btn-primary btn-md{/* margin-bottom: 20px; */padding-bottom: 15px;padding-top: 15px;}
#companyModal{color: #fff;}
</style>
</head>

<body id="top">
  <div id="overlayer"></div>
<!-- 작성 -->
	<section class="site-section">
		<div class="container">

			<div class="row mb-5">
				<div class="col-lg-12">

					<div class="help_find help_contact wrap_help">
						<div class="cont_find">
								<form:form enctype="multipart/form-data" id="updateForm" method="post" modelAttribute="interview">
							<form:hidden path="incumNo"/>
								<div class="qna_write_wrap">
									<div class="qna_write_selection">
										<span class="qna_category_tit">카테고리</span>
										<div class="box_qna_category">
											<div class="inpSel">
												<select id="jobSub" name="jobSub" title="직업분류">
													<option value="0" selected="selected">직무분류를 선택하세요</option>
													<option value="1">기획·전략</option>
													<option value="2">마케팅·홍보·조사</option>
													<option value="3">회계·세무·재무</option>
													<option value="4">인사·노무·HRD</option>
													<option value="5">총무·법무·사무</option>
													<option value="6">IT개발·데이터</option>
													<option value="7">디자인</option>
													<option value="8">영업·판매·무역</option>
													<option value="9">고객상담·TM</option>
													<option value="10">구매·자재·물류</option>
													<option value="11">상품기획·MD</option>
													<option value="12">운전·운송·배송</option>
													<option value="13">서비스</option>
													<option value="14">생산</option>
													<option value="15">건설·건축</option>
													<option value="16">의료</option>
													<option value="17">연구·R&amp;D</option>
													<option value="18">미디어·문화·스포츠</option>
													<option value="19">금융·보험</option>
												</select>
											</div>
										</div>
									</div>
								</div>

								<fieldset>
									<legend class="blind">제휴문의 입력 폼</legend>
									<p class="desc_find_type2">
										<span class="txt_required">*</span> 는 필수 항목입니다.
									</p>

									<ul class="list_find type2">
										<li class="col_type">
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label for="incumName" class="lab_find">대상자명</label>
											</div>

											<div class="wrap_input">
												<span class="box_input">
													<form:input type="text" path="incumName" id="incumName" class="inp_find" required="required" placeholder="대상자명을 입력해주세요"/>
												</span>
											</div>

											<div class="wrap_lab">
												<div class="btn_basic2 type03" style="width: 128px;top: 12px;left: 16px;">
													<button type="button" id="companyModal"data-toggle="modal" data-target="#exampleModal">회사검색</button>
												</div>
											</div>

											<div class="wrap_input">
												<span class="box_input">
													<form:input type="text" path="cmpName" id="cmpName" class="inp_find" required="required" placeholder="회사를 선택해주세요"/>
													<%-- <span class="inp_find">${interview.cmpName }</span> --%>
													<input type="hidden" name="cmpId" value="${interview.cmpId }"/>
												</span>
											</div>
										</li>

										<li class="col_type">
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label for="subTitle" class="lab_find">담당업무</label>
											</div>
											<div class="wrap_input">
												<span class="box_input">
													<form:input type="text" path="subTitle" id="subTitle" class="inp_find" required="required" placeholder="담당업무를 입력해주세요"/>
												</span>
												<p class="noti_inp">담당업무에는 업무내용을 한 단어로 적어주세요.</p>
											</div>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label for="department" class="lab_find">부서명</label>
											</div>
											<div class="wrap_input">
												<span class="box_input">
													<form:input type="text" path="department" id="department" class="inp_find" required="required" placeholder="부서명을 입력해주세요"/>
												</span>
											</div>
										</li>


										<li>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label for="incumTitle" class="lab_find">제목</label>
											</div>
											<div class="wrap_input">
												<span class="box_input">
													<form:input type="text" path="incumTitle" id="incumTitle" class="inp_find" required="required" placeholder="제목을 입력해주세요"/>
												</span>
											</div>
										</li>

										<li>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
												<label for="topTitle" class="lab_find">상위제목</label>
											</div>
											<div class="wrap_input">
												<span class="box_input">
													<form:input type="text" path="topTitle" id="topTitle" class="inp_find" placeholder="상위제목을 입력해주세요"/>
												</span>
												<p class="noti_inp">상위제목에는 담당업무를 한 문장으로 표현해주세요.</p>
											</div>
										</li>

										<li>
											<div class="wrap_lab">
												<span class="ico_required">
													<span class="blind">필수항목</span>
												</span>
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
													<input type="file" id="fileUpload" class="inp_upload" title="파일 업로드" name="attachFiles" multiple accept=".gif, .jpg, .png">
													<label for="fileUpload" class="btn_basic2 type03">파일 첨부하기</label>
												</div>
												<p class="noti_inp">10MB 이하의 이미지 파일(JPG, GIF, PNG) 만 등록 가능합니다.<br>
													※ 반드시 4장의 이미지를 등록해주세요.
												</p>
											</div>
										</li>

									</ul>

							<!-- //////////////////////////////// question 시작 ////////////////////////////////////////// -->
								<div id="add_question">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q1</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question1" title="질문 선택">
														<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer1" class="form-control textIncumContent" id="editor1" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>


								<div id="add_question2">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q2</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question2" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer2" class="form-control textIncumContent" id="editor2" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>

								<div id="add_question3">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q3</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question3" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer3" class="form-control textIncumContent" id="editor3" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>

								<div id="add_question4">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q4</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question4" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer4" class="form-control textIncumContent" id="editor4" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>

								<div id="add_question5">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q5</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question5" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer5" class="form-control textIncumContent" id="editor5" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>

								<div id="add_question6">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q6</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question6" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer6" class="form-control textIncumContent" id="editor6" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>

								<div id="add_question7">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q7</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question7" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer7" class="form-control textIncumContent" id="editor7" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>

								<div id="add_question8">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q8</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question8" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer8" class="form-control textIncumContent" id="editor8" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>

								<div id="add_question9">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q9</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question9" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer9" class="form-control textIncumContent" id="editor9" placeholder="답변을 입력해주세요"></form:textarea>
											<!-- <button type="button" class="btn btn-primary qnam" onclick="f_remove(this)">-</button> -->
										</div>
						            </div>
								</div>

								<div id="add_question10">
									<div id="divSample" class="col-100">
										<p class="question">
											<em class="q_num" style="margin-top: 20px;">Q10</em>
										<div class="box_qna_category">
												<div class="inpSel">
													<select id="replySort" class="selReplySort" name="question10" title="질문 선택">
													<option value="" selected="selected">질문을 선택해주세요.</option>
														<option value="자기소개 부탁드립니다.">자기소개 부탁드립니다.</option>
														<option value="담당하고 계신 업무를 소개해 주세요.">담당하고 계신 업무를 소개해 주세요.</option>
														<option value="자신만의 업무 원칙이 있으신가요?">자신만의 업무 원칙이 있으신가요?</option>
														<option value="커리어 성장을 위해 준비하는 것이 있으신가요?">커리어 성장을 위해 준비하는 것이 있으신가요?</option>
														<option value="업무 목표가 있다면?">업무 목표가 있다면?</option>
														<option value="직무 수행에 필요한 지식은 어떤 것이 있나요?">직무 수행에 필요한 지식은 어떤 것이 있나요?</option>
														<option value="업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?">업무 중 가장 힘들었을 때는 언제이며, 어떻게 극복하셨나요?</option>
														<option value="속해 계신 부서는 어떠한 분위기인가요?">속해 계신 부서는 어떠한 분위기인가요?</option>
														<option value="취업준비생들에게 해주고 싶은 조언은 무엇인가요?">취업준비생들에게 해주고 싶은 조언은 무엇인가요?</option>
														<option value="자신을 표현할 수 있는 단어와 이유는?">자신을 표현할 수 있는 단어와 이유는?</option>
														<option value="마지막으로 하고 싶으신 말씀이 있나요?">마지막으로 하고 싶으신 말씀이 있나요?</option>
														<option value="업무를 하며 가장 보람을 느낄 때는 언제인가요?">업무를 하며 가장 보람을 느낄 때는 언제인가요?</option>
														<option value="직무를 수행하면서 생긴 노하우가 있다면?">직무를 수행하면서 생긴 노하우가 있다면?</option>
														<option value="해당 직무의 전망에 대해서 어떻게 생각하시나요?">해당 직무의 전망에 대해서 어떻게 생각하시나요?</option>
														<option value="담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?">담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?</option>
														<option value="업무를 하실 때 어떤 프로그램을 사용하나요?">업무를 하실 때 어떤 프로그램을 사용하나요?</option>
														<option value="해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?">해당 직무는 타 부서와의 협업이 필요할 것 같은데 어떠한 협업이 이루어지나요?</option>
														<option value="협업 과정에서 어려운 점은 따로 없으셨나요?">협업 과정에서 어려운 점은 따로 없으셨나요?</option>
														<option value="회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?">회사 선택 시 중요하게 생각하는 부분과 현재 회사를 선택한 이유는 무엇인가요?</option>
														<option value="회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?">회사 복리후생 혹은 사내문화와 관련하여 자랑할 부분이있다면 어떤 것일까요?</option>
													</select>
												</div>
											</div>
										</p>
										<!-- ckeditor -->
										<div class="form-group">
											<label for="job-description"></label>
											<form:textarea path="answer10" class="form-control textIncumContent" id="editor10" placeholder="답변을 입력해주세요"></form:textarea>
										</div>
						            </div>
								</div>
									<div class="qna_write_foot">
										<button type="submit" class="btnSizeXL btn_qna_write" onclick="return check_submit();">게시글 등록</button>
									</div>
								</fieldset>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<!-- SCRIPTS -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
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
<script>

console.log("incumNo",$("#incumNo").val());
  ClassicEditor.create( document.querySelector( '#editor' ), {
	/* removePlugins: [ 'Heading' ], */
    language: "ko"
  } );

  $(function(){
		let i=1;

		$("#qna").click(function(){
			i++;
			console.log("왔다 : " + i);

			if(i<11){
				$("#add_question2").append($("#divSample").clone().find("textarea").val("").end());

				//Q번호 처리
				$(".q_num").each(function(index,item){
					$(this).html("Q" + (index+1));
				});

				//질문 replySort
				$(".selReplySort").each(function(index,item){
					$(this).attr("name","question"+(index+1));
				});

				//답변
				$(".textIncumContent").each(function(index,item){
					$(this).attr("path","answer"+(index+1));
				});
			}else{
				i = 10;
			}
		});
	});


  //form:form의 아이디
  let updateForm = $("#updateForm");

</script>
<script>
	ClassicEditor.create(document.querySelector('#editor1'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor2'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor3'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor4'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor5'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor6'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor7'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor8'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor9'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor10'), {
		language : "ko"
	});
</script>
<jsp:include page="incruiterModal.jsp"></jsp:include>
<script
	src="<%=request.getContextPath()%>/resources/js/company/incruiterJoin3.js">
</script>
</body>
</html>