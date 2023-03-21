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
							<!-- 자동완성  -->
					<div class="qna_write_foot">
						<button class="btnSizeS btn_qna_write" style="width: 77px;float: right;margin: 10px;" id="fill" title="자동완성">자동완성</button>
					</div>

				<div class="col-lg-12">

					<div class="help_find help_contact wrap_help">
						<div class="cont_find">
							<form enctype="multipart/form-data" method="post" name="sub">
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
													<input type="text" name="incumName" id="incumName" class="inp_find" required="required" placeholder="대상자명을 입력해주세요">
												</span>
											</div>
											<div class="wrap_lab">
												<div class="btn_basic2 type03" style="width: 128px;top: 12px;left: 16px;">
													<button type="button" id="companyModal"data-toggle="modal" data-target="#exampleModal">회사검색</button>
												</div>
											</div>
											<div class="wrap_input">
												<span class="box_input">
													<input type="text" name=cmpName id="cmpName" class="inp_find" required="required" placeholder="회사를 선택해주세요">
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
													<input type="text" name="subTitle" id="subTitle" class="inp_find" required="required" placeholder="담당업무를 입력해주세요">
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
													<input type="text" name="department" id="department" class="inp_find" required="required" placeholder="부서명을 입력해주세요">
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
													<input type="text" name="incumTitle" id="incumTitle" class="inp_find" required placeholder="제목을 입력해주세요">
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
													<input type="text" name="topTitle" id="topTitle" class="inp_find" placeholder="상위제목을 입력해주세요" required>
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
													</span>
												</div>
												<div class="wrap_file">
													<input type="file" id="image_add" class="inp_upload" title="파일 업로드" name="attachFiles" multiple accept=".gif, .jpg, .png" required>
													<label for="image_add" class="btn_basic2 type03">파일 첨부하기</label>
												</div>
												<p class="noti_inp">10MB 이하의 이미지 파일(JPG, GIF, PNG) 만 등록 가능합니다.<br>
													※ 반드시 5장의 이미지를 등록해주세요.
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
													<select id="replySort1" class="selReplySort" name="question1" title="질문 선택">
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
											<textarea name="answer1" class="form-control textIncumContent" id="editor1" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort2" class="selReplySort" name="question2" title="질문 선택">
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
											<textarea name="answer2" class="form-control textIncumContent" id="editor2" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort3" class="selReplySort" name="question3" title="질문 선택">
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
											<textarea name="answer3" class="form-control textIncumContent" id="editor3" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort4" class="selReplySort" name="question4" title="질문 선택">
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
											<textarea name="answer4" class="form-control textIncumContent" id="editor4" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort5" class="selReplySort" name="question5" title="질문 선택">
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
											<textarea name="answer5" class="form-control textIncumContent" id="editor5" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort6" class="selReplySort" name="question6" title="질문 선택">
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
											<textarea name="answer6" class="form-control textIncumContent" id="editor6" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort7" class="selReplySort" name="question7" title="질문 선택">
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
											<textarea name="answer7" class="form-control textIncumContent" id="editor7" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort8" class="selReplySort" name="question8" title="질문 선택">
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
											<textarea name="answer8" class="form-control textIncumContent" id="editor8" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort9" class="selReplySort" name="question9" title="질문 선택">
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
											<textarea name="answer9" class="form-control textIncumContent" id="editor9" placeholder="답변을 입력해주세요"></textarea>
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
													<select id="replySort10" class="selReplySort" name="question10" title="질문 선택">
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
											<textarea name="answer10" class="form-control textIncumContent" id="editor10" placeholder="답변을 입력해주세요"></textarea>
										</div>
						            </div>
								</div>
									<div class="qna_write_foot">
										<button type="submit" class="btnSizeXL btn_qna_write" onclick="return check_submit();">게시글 등록</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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
<script src="<%=request.getContextPath()%>/resources/js/company/incruiterJoin3.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<jsp:include page="incruiterModal.jsp"></jsp:include>

<script>
CKEDITOR.replace(document.querySelector('#editor1'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor2'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor3'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor4'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor5'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor6'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor7'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor8'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor9'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
CKEDITOR.replace(document.querySelector('#editor10'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});
</script>

<script>
$("#fill").on("click",function(e){
	let jobSub = `6`;
	let incumName = `최지성`;
	let subTitle = `백엔드/서버개발, 프론트엔드`;
	let department = `IT개발부서`;
	let incumTitle = `개발부터 PM까지, Value up을 꿈꾸다.`;
	let topTitle = `개발, PM 모두 직무 전문성이 중요한 업무입니다.`;

	/* 질문 1~10 */
	let category1 = `자기소개 부탁드립니다.`;
	let category2 = `담당하고 계신 업무를 소개해 주세요.`;
	let category3 = `담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?`;
	let category4 = `커리어 성장을 위해 준비하는 것이 있으신가요?`;
	let category5 = `업무 목표가 있다면?`;
	let category6 = `협업 과정에서 어려운 점은 따로 없으셨나요?`;
	let category7 = `취업준비생들에게 해주고 싶은 조언은 무엇인가요?`;
	let category8 = `속해 계신 부서는 어떠한 분위기인가요?`;
	let category9 = `자신만의 업무 원칙이 있으신가요?`;
	let category10 = `마지막으로 하고 싶으신 말씀이 있나요?`;

	$("#jobSub").val(jobSub);
	$("#incumName").val(incumName);
	$("#subTitle").val(subTitle);
	$("#department").val(department);
	$("#incumTitle").val(incumTitle);
	$("#topTitle").val(topTitle);

	/* 질문 1~10 */
	$("#replySort1").val(category1);
	$("#replySort2").val(category2);
	$("#replySort3").val(category3);
	$("#replySort4").val(category4);
	$("#replySort5").val(category5);
	$("#replySort6").val(category6);
	$("#replySort7").val(category7);
	$("#replySort8").val(category8);
	$("#replySort9").val(category9);
	$("#replySort10").val(category10);

	/* 답변 1~10 */
	CKEDITOR.instances.editor1.setData(`
			<p>안녕하세요, 업템포 IT개발부서의 tech lead를 맡은 chris입니다.</br></p>
	`);
	CKEDITOR.instances.editor2.setData(`
			<p>저는 IT 부서에서 개발자와 PM을 맡고 있습니다. 고객사의 요구사항 분석부터 소프트웨어 설계, 기획,</br>
			디자인, 베트남 개발자들과의 협업을 함께 해나가고 있습니다.
			</p>
	`);
	CKEDITOR.instances.editor3.setData(`
			<p>제가 만든 새로운 것들을 사용자들이 경험하고, 또 그에 대한 피드백을 들을 수 있는 이러한 환경이 저를</br>
			즐겁게 만듭니다. 그리고 그런 점들이 제가 소프트웨어 개발을 계속 할 수 있게 만들어주는 것 같습니다.
			</p>
	`);
	CKEDITOR.instances.editor4.setData(`
			<p>네! 직무 전문성을 쌓아야 원하는 커리어로 나아갈 수 있기에 전문성을 키우는 것은 필수라고 생각합니다.</br>
			회사 내에서는 매주 사내 세미나를 통해 본인이 공부한 부분을 같이 이야기하고 우리 팀은 어떤 것을 공부하는지</br>
			공유하는 시간을 갖고 있습니다. 그리고 기술을 선택할 때에도 항상 사용했던 기술만 사용하기보단 쓰고 싶은</br>
			기술이 있다면 우선적으로 도입하기 위해 노력합니다.
			</p>
	`);
	CKEDITOR.instances.editor5.setData(`
			<p>지금보다 더 효과적으로 의사소통을 할 수 있는 사람이 되고 싶어요. 프로젝트는 혼자 하는 것이 아니라 다 같이 해나가는 것이니까요.</br>
			개발자들과 원활한 의사소통으로 프로젝트를 함께 해나가는 사람이 되는 것이 목표입니다!
			</p>
	`);
	CKEDITOR.instances.editor6.setData(`
			<p>여러 부서와의 협업을 통해 프로젝트를 진행해 나갑니다. 영업팀과 번역팀 그리고 통역팀까지 여러 분야 다양한 분들과의 교류가 일어납니다.</br>
			처음엔 각자 다른 관점에서 프로젝트를 바라보기 때문에 협업이 어려웠지만, 전문화되고 고도화되어있는 통번역팀, 영업팀의</br>
			도움으로 점차 개선되는 것을 느꼈고, 쉽게 협업할 수 있었습니다.
			</p>
	`);
	CKEDITOR.instances.editor7.setData(`
			<p>다양한 경험을 하는 것을 추천합니다. 인생에 정답이 없고 오답도 없지만 5지 선다 문제에서 바로 결정하는 것이 아니라 아닌 것부터 지워 나가는</br>
			것처럼 여러 가지 경험을 통해 본인에게 맞지 않는 것들을 알아보는 것도 중요하다고 생각합니다.
			</p>
	`);
	CKEDITOR.instances.editor8.setData(`
			<p>자기 주도적이고 의견 교류가 활발하며 이성적입니다. Job이 떨어지면 업무 협의를 하며 함께 요구 사항과 예상 문제점 등을 짚어</br>
			프로젝트를 준비합니다. 중간중간 필요시 얼마든지 미팅을 요청할 수 있으며 이슈에 대한 해결을 위해 논리적으로 고민하고 솔루션을 마련합니다.
			</p>
	`);
	CKEDITOR.instances.editor9.setData(`
			<p>매일 일지를 Notion을 활용하여 작성합니다. 일지를 기반으로 주간 보고에도 활용하고 추후 보고서 작성에도 용이하게 사용할 수 있습니다.</br>
			가이드를 작성할 때도 기록한 내용을 바탕으로 작성하기 때문에 가능하면 작업한 내역들을 기록하는 편입니다.
			</p>
	`);
	CKEDITOR.instances.editor10.setData(`
			<p>개발 직무는 ‘경험치’가 중요한 직무입니다. 게임에서도 레벨업을 하려면 경험치를 올려야 하듯 개발도 그러합니다.</br>
			그래서 저는 경험치를 쌓기 위해 저만의 토이 프로젝트도 진행하고 있습니다.</br>
			그렇게 만들어진 것들이 실제 업무와 프로젝트에도 사용되었고 패키지화 하기도 하였습니다.</br>
			이렇게 자신을 성장시키면서 다양한 경험을 쌓는 것을 좋아하시는 분들이라면 개발 직무를 추천드리고 싶습니다!
			</p>
	`);
});
</script>

<!-- <script>
	  function check_submit(){
		var sub = document.sub;
    	if(sub.cmpName.value=="") {
			swal("회사를 선택해주세요","","warning");
			sub.cmpName.focus();
			return false;
    	}else if(sub.image_add.value==""){
    		swal("이미지 5개를 선택해주세요","","warning");
			return false;
    	}else {
    	}
    	};
</script> -->
</body>
</html>