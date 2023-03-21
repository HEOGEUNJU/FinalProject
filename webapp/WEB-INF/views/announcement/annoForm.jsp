<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      양서연      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set  var="prePath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${prePath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${prePath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${prePath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${prePath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${prePath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${prePath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${prePath}/resources/css/animate.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script src="${prePath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link rel="stylesheet" href="${prePath}/resources/css/saramin/resume.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/contents.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/my_jobs.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/components.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/jobs-view.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/jobs-recruit.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/help.css" />

<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
.pp {
	margin-bottom: 15px;
	color:black;
}
.ck-editor__editable { 
	height: 400px; 
}
.ref{
	color: red;
	font-size: 6px;
}
.chck {
	display: inline-block;
	margin: 1px;
	margin-right: 20px;
}

.text_box {position:relative; display:inline-block; width:100%;}
.text_box textarea {width:100%; height:152px; color:#666; font-family:"ht_r"; font-size:18px; line-height:28px; padding:20px; border:1px solid #e4dcd3; outline:0; resize:none}
.text_box .count {position:absolute; right:20px; bottom:20px; color:#666; font-family:"ht_r"; font-size:15px;}
.box{border:1px solid #dfdfdf; height: 35px; padding:10px;border-radius: 7px;}
.divbox input:focus{border-color: rgb(4, 87, 56); outline: none;}

</style>
<security:authentication property="principal" var="memberVOWrapper"/>
<security:authentication property="principal.realMember" var="authMember"/>	
<!-- html body -->
<div class="site-wrap" style="background-color: white">
	<section class="site-section wrap_jv_header" style="padding-top: 0px">
		<div class="container">
			<div class=" mb-5 resume_section">
				<div class="col-lg-12 resume_write resume_write_add">
					<form:form modelAttribute="anno" enctype="multipart/form-data" id="myAnnoForm" class="p-4 p-md-5 border rounded" method="post">
						<div class="mb-5 text-center">
							<div class="contents_container">
								<div class="sub_top_wrap tag_list2" style="padding-bottom: 50px">
									<span class="sub_title_tag" style="font-size: 30px;">
										공통정보를 입력해주세요
									</span>
									<div class="align">
<!-- 							        	<button type="button" id="fillBtn" class="btnSizeM colorGrayReverse" style="float:right">자동채우기</button> -->
							        </div>
								</div>
							</div>
						</div>
						<div style="margin-top: 40px; margin-bottom: 100px">
							<div class="form-group">
								<form:hidden path="memId" value="${authMember.memId}"/>
								<form:hidden path="cmpId" value="${authMember.incruiterVO.cmpId}"/>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2" >
										공고 제목
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-10 resume_input" >
										<form:input path="annoTitle" type="text" class="box" style="width: 600px" placeholder="제목을 입력해주세요" required="true"/>
									</div>
								</div>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2" >
										모집 기간
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-10" >
										<input type="text" name="datetimes" class="box box_input" style="width: 270px"/>
										<form:hidden path="annoStartdate"/>
										<form:hidden path="annoEnddate"/>
									</div>
								</div>
							</div>
							<div class="container top_btns">
								<div class="row pp align">
									<div class="col-6 col-md-2">
										업종
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-10">
										<div class="inpSel">
											<form:select path="industry0" style="width: 200px" required="required">
												<option value>대분류</option>
											</form:select>
										</div>
										<div class="inpSel">
											<form:select path="industry1" style="width: 200px" required="required">
												<option value>중분류</option>
											</form:select>
										</div>
										<div class="inpSel">
											<form:select path="industryCode" style="width: 200px" required="required">
												<option value>소분류</option>
											</form:select>
										</div>
									</div>
								</div>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2">근무 환경</div>
									<div class="form-group col-md-10">
										<form:textarea path="annoWorkenv" rows="4" cols="50"></form:textarea>
									</div>
								</div>
							</div>
							<div class="container top_btns">
								<div class="row pp align">
									<div class="col-6 col-md-2">
										공통 학력
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-6">
										<div class="inpSel">
											<form:select path="eduCode" class="box" required="required">
												<option value>학력선택</option>
											</form:select>
										</div>
									</div>
								</div>
							</div>
							<div class="container top_btns">
								<div class="row pp align">
									<div class="col-6 col-md-2">
										급여
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-6">
										<div class="inpSel">
											<form:select path="annoSalary" class="box" required="required">
												<option value/>급여선택
												<form:option value="면접후결정"/>면접 후 결정
												<form:option value="연봉"/>연봉
												<form:option value="월급"/>월급
												<form:option value="시급"/>월급
											</form:select>
										</div>
										<div style="display: inline-block;">
											<div id="salaryDetail" style="display: none;">
												<input type="number" name="salaryDetail" class="box" value="0" min="0" step="0.1" style="width: 100px; height: 30px;"> 만원
											</div>
										</div>
									</div>
								</div>
								<div style="font-size: 13px; margin-bottom: 17px">	
									※ 2023년 최저시급 9,620원, 주 40시간 기준 최저연봉 약 24,126,960원 입니다.
									2023년 최저임금에 부합한 급여를 입력해주세요. 위 최저임금은 기본소정 근로시간 기준의 급여이므로, 그 외 수당 발생시 추가 지급되어야 합니다. 
									당사는 본 채용건과 관련하여 '최저임금법'을 준수합니다, 최저임금을 준수하지 않는 경우, 공고 강제 마감 및 행정처분을 받을 수 있습니다.
								</div>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2">
										수습기간
										<div class="ref">
										</div>
									</div>
									<div class="form-group col-md-6 resume_input">
										<form:input path="annoProbation" type="text" class="box" placeholder=" ex) 1개월" />
									</div>
								</div>
							</div>
							<div class="container top_btns">
								<div class="wrap_recommend align">
									<div class="row pp">
										<div class="col-6 col-md-2">복리후생</div>
										<div class="form-group col-md-10">
											<div class="inpSel">
												<form:select path="welfareList[0].welfare0" class="box" style="width: 200px">
													<option value>대분류</option>
												</form:select>
											</div>
											<div class="inpSel">
												<form:select path="welfareList[0].welfareCode" class="box" style="width: 200px">
													<option value>소분류</option>
												</form:select>
											</div>
										</div>
										<div class="box_recommend" style="margin-bottom: 30px; background-color: white">
											<p class="tit_recommend">
												<strong style="font-size: 14px">선택항목</strong>
											</p>
											<ul id="welDiv" class="tag_recommend">
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2">내용작성</div>
									<div class="form-group col-md-10">
										<form:textarea path="annoContent" name="text"></form:textarea>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 					세부 페이지						 -->
						
						
						<div class="mb-5 text-center">
							<div class="contents_container">
								<div class="sub_top_wrap tag_list2" style="padding-bottom: 40px">
									<span class="sub_title_tag" style="font-size: 30px">
										세부 모집분야를 등록해주세요
									</span>
								</div>
							</div>
						</div>
						<!-- 탭머리 -->
						<div class="row" style="margin-top:40px ;margin-bottom: 50px">
						    <div>
						        <div class="profile-head">
							        <div class="align">
							        	<button type="button" id="cloneBtn" class="btnSizeM colorGrayReverse" style="float:right">추가</button>
							        </div>
						            <ul class="nav nav-tabs" id="myTab" role="tablist">
						                <li class="nav-item" style="display: none;">
						                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#detailContainer" role="tab" aria-controls="detailContainer0" aria-selected="true">탭1</a>
						                </li>
						            </ul>
						        </div>
						    </div>
						</div>
						<!-- 탭몸통 -->
						<div class="tab-content profile-tab" id="myTabContent"></div>
						<div class="align">
							<form:button type="submit" class="btnSizeM colorGrayReverse" style="float:right">등록</form:button>
							<button type="button" id="fillBtn3" class="btnSizeM colorGrayReverse" style="float:right; margin: 2px">자동3</button>
							<button type="button" id="fillBtn2" class="btnSizeM colorGrayReverse" style="float:right; margin: 2px">자동2</button>
							<button type="button" id="fillBtn1" class="btnSizeM colorGrayReverse" style="float:right; margin: 2px">자동1</button>
						</div>
						<div class="container">
							<div style="font-size: 13px; margin-top: 80px;">
								※ 성별, 연령 입력 불가 안내<br>
								- 당사는 남녀고용평등 및 연령차별 금지에 관한 법률을 준수하여, 불합리한 성별, 연령 조건은 제시할 수 없습니다. 이를 준수하지 않는 경우, 공고 강제 마감 및 행정처분을 받을 수 있습니다.<br>
								- 성별, 연령 입력 불가로 인해 기존에 등록한 공고는 수정, 연장, 복사시에 '성별무관','연령무관'으로 변경됩니다.
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>  
	</section>
</div>

<!-- Hidden Tab -->
<!-- 탭몸통1  -->
<div class="tab-pane fade show active d-none" id="detailContainer" role="tabpanel" aria-labelledby="home-tab" >
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">
				모집분야
				<div class="ref">
					※필수
				</div>
			</div>
			<div class="form-group col-md-6">
				<input name="detailList[%n].daFd" type="text" class="box" style="width: 100%" placeholder="모집분야를 입력해주세요" required="required"/>
			</div>
		</div>
	</div>
	<div class="container top_btns">
		<div class="row pp align">
			<div class="col-6 col-md-2">직무</div>
			<div class="form-group col-md-10 jobContainer">
				<div class="inpSel">
					<select name="detailList[%n].job0" class="job0 box" style="width: 200px">
						<option value>대분류</option>
					</select>
	            </div>
	            <div class="inpSel">
					<select name="detailList[%n].job1" class="job1 box" style="width: 200px">
						<option value>중분류</option>
					</select>
	            </div>
	            <div class="inpSel">
					<select name="detailList[%n].jobCode" class="jobCode box" style="width: 200px">
						<option value>소분류</option>
					</select>
	            </div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">모집인원</div>
			<div class="form-group col-md-6">
				<input name="detailList[%n].daCount" type="number" class="box" value="0" min="0" style="width: 100px"/> 명
			</div>
		</div>
	</div>
	<div class="container top_btns">
		<div class="row pp align">
			<div class="col-6 col-md-2">
				경력
				<div class="ref">
					※필수
				</div>
			</div>
			<div class="form-group col-md-8" id="careerDiv">
				<div class="row pp">
					<div class="company_honest_qna">
						<div class="qna_list_sort">
							<div class="icoChk_outline filter">
								<span class="inpChk icoChk">
									<input type="checkbox" name="detailList[%n].careerNames" id="경력무관" value="경력무관" class="career0 btn_sort" />
									<label class="lbl" for="경력무관">경력무관</label>
								</span>
								<span class="inpChk icoChk">
									<input type="checkbox" name="detailList[%n].careerNames" id="신입" value="신입" class="career1 btn_sort"/>
									<label class="lbl" for="신입">신입</label>
								</span>
								<span class="inpChk icoChk">
									<input type="checkbox" name="detailList[%n].careerNames" id="경력" value="경력" class="career2 btn_sort"/>
									<label class="lbl" for="경력">경력</label>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="careerYear" style="display: none">
					<div class="inpSel">
						<select name="detailList[%n].daCarYeer">
							<option value>경력 년수</option>
							<option value="1년 이상">1년 이상</option>
							<option value="4년 이상">4년 이상</option>
							<option value="7년 이상">7년 이상</option>
							<option value="10년 이상">10년 이상</option>
							<option value="15년 이상">15년 이상</option>
							<option value="20년 이상">20년 이상</option>
						</select>
	            	</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">근무부서</div>
			<div class="form-group col-md-6">
				<input name="detailList[%n].daDepartment" type="text" class="box" placeholder=" ex) 영업부" />
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">담당 업무</div>
			<div class="form-group col-md-10">
				<textarea name="detailList[%n].daTask" id="daTask%n" rows="4" cols="50"></textarea>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">직급/직책</div>
			<div class="form-group col-md-10">
			    <div class="company_honest_qna">
			        <div class="qna_list_sort">
						<div id="positionCheck" class="filter">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container top_btns">
		<div class="row pp align">
			<div class="col-6 col-md-2">
				고용 형태
				<div class="ref">
					※필수
				</div>
			</div>
			<div class="form-group col-md-6">
				<div class="inpSel">
					<select name="detailList[%n].empltypeCode" class="box" required="required">
						<option value>고용형태</option>
					</select>
	            </div>
			</div>
		</div>
	</div>
	<div class="form-group container">
		<div class="row pp">
			<div class="col-6 col-md-2">
				근무지역
				<div class="ref">
					※필수
				</div>
			</div>
			<div class="form-group col-md-6">
                <input type="hidden" id="sample4_postcode" placeholder="우편번호">
				<input type="text" id="sample4_jibunAddress" class="box" placeholder="지번주소" >
				<input type="button" id="execDaumPostcode" value="주소 찾기" class="box"><br>
				<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
				<input type="hidden" name="detailList[%n].regionVO.regionName"/>
           	</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">지원 조건</div>
			<div class="form-group col-md-10">
				<textarea name="detailList[%n].daCondition" id="daCondition%n" rows="4" cols="50"></textarea>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">우대 사항</div>
			<div class="form-group col-md-10">
				<textarea name="detailList[%n].daPrefer" id="daPrefer%n" rows="4" cols="50"></textarea>
			</div>
		</div>
	</div>
</div>
<!-- 탭몸통1 끝 -->
<!-- SCRIPTS -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
let detailContainer = $("#detailContainer");
let myTabContent = $("#myTabContent");
let myTab = $("#myTab");

let topData = [
	{type:'region', code:''}
	, {type:'industry', code:''}
	, {type:'job', code:''}
	, {type:'edu', code:''}
	, {type:'welfare', code:''}
	, {type:'position', code:''}
	, {type:'empltype', code:''}
]

$(function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/annoAjax",
		method : "post",
		data : JSON.stringify(topData),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			
			let industryList = resp.industryList;
			let welfareList = resp.welfareList;
			let eduList = resp.eduList;
			let positionList = resp.positionList;
			let jobList = resp.jobList;
			let empltypeList = resp.empltypeList;
			
			let industryOption = [];
			let welfareOption = [];
			let eduOption = [];
			let positionOption = [];
			let jobOption = [];
			let empltypeOption = [];
	
			$.each(industryList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
				industryOption.push(tr);
			})
			$.each(eduList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.eduCode).html(val.eduName);
				eduOption.push(tr);
			})
			$.each(welfareList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.welfareCode).html(val.welfareName);
				welfareOption.push(tr);
			})
			$.each(positionList, function(index, val){
				let span = $("<span class='inpChk icoChk'>").append(
								$("<input type='checkbox'>").attr("name","detailList[%n].inpositionCode").prop("value",val.positionCode).attr("id",val.positionCode)
								.attr("class","btn_sort")
								, $("<label class='lbl'>").attr("for",val.positionCode).html(val.positionName)
							).attr("style","margin-right: 16px")
				positionOption.push(span);
			})
			$.each(jobList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
				jobOption.push(tr);
			})
			$.each(empltypeList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.empltypeCode).html(val.empltypeName);
				empltypeOption.push(tr);
			})
			
			$("select[name=industry0]").append(industryOption);
			$("select[name=eduCode]").append(eduOption);
			$("select[name='welfareList[0].welfare0']").append(welfareOption);
			$("#positionCheck").append(positionOption);
			$(".job0").append(jobOption);
			$("select[name='detailList[%n].empltypeCode']").append(empltypeOption);
			
			$("select[name=industry0]").val("${anno.industry0}").trigger("change");
			$("select[name=eduCode]").val("${anno.eduCode}").trigger("change");
			$("select[name=annoSalary]").val("${anno.annoSalary}").trigger("change");
			$("input[name=salaryDetail]").val("${anno.annoSalary2}");

		 	$("#cloneBtn").trigger("click");
		 	
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
})

/* 탭 생성 */

$("#cloneBtn").on("click",function(){
	let x = $(document).find("[id*='detailContainer']").length - 1;
	let nextContainer = detailContainer.clone();
	nextContainer.attr("id","detailContainer"+x); 
	nextContainer.removeClass("d-none");
	myTabContent.append(nextContainer);
	
	let nWord = myTabContent.find("[name*='%n']");
	for(i=0;i<nWord.length;i++){
        let nName = nWord.eq(i).attr('name');
        let newName = nName.replace("%n",x);
        nWord.eq(i).attr("name",newName);
        
    }
	let nWordId = myTabContent.find("[id*='%n']");
	for(i=0;i<nWordId.length;i++){
        let nId = nWordId.eq(i).attr('id');
        let newNId = nId.replace("%n",x);
        nWordId.eq(i).attr("id",newNId);
    }

	//nextContainer 안에 있는 checkbox id와 siblings.label의 for 변경
	let chkId = nextContainer.find("input[type='checkbox']");
	for(i=0;i<chkId.length;i++){
        let oldId = chkId.eq(i).attr('id');
        chkId.eq(i).attr("id",oldId+x);
        chkId.eq(i).siblings('.lbl').attr('for',oldId+x);
    }
	
	myTab.append(
		$("<li>").attr("class","nav-item").append(
			$("<a>").attr("class","nav-link").attr("id","tab"+x).attr("role","tab").attr("data-toggle","tab")
			.attr("href","#detailContainer"+x).attr("aria-selected",true).css("color","#2d65f2").html("분야"+(x+1))
		)
	);

	nextContainer.find("#sample4_postcode").attr("id","sample4_postcode"+x);
	nextContainer.find("#sample4_jibunAddress").attr("id","sample4_jibunAddress"+x);
	nextContainer.find("#execDaumPostcode").attr("onclick","sample4_execDaumPostcode("+x+")");
	nextContainer.find("#sample4_roadAddress").attr("id","sample4_roadAddress"+x);
	nextContainer.find("#guide").attr("id","guide"+x);
	nextContainer.find("#sample4_postcode").attr("id","sample4_postcode"+x);
	nextContainer.find("#sample4_detailAddress").attr("id","sample4_detailAddress"+x);
	nextContainer.find("#sample4_extraAddress").attr("id","sample4_extraAddress"+x);
	
	$("#tab"+x).trigger("click");
	
	//ckEditor
	cloneCK(x);
	career();
});

// 하위 업종 셀렉트
$("[name=industry0]").on("change", function(){
	$("[name='industry1'] option").remove();   
	$("[name='industry1']").append("<option>중분류</option>");
	$("[name='industryCode'] option").remove();   
	$("[name='industryCode']").append("<option>소분류</option>");
	
	let ref = $(this).val();
	let data = [{type:'industry',code:ref}];

	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/annoAjax",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			let industryList = resp.industryList;
			let industryOption = [];
			$.each(industryList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
				industryOption.push(tr);
			})
			if(`${anno.industry1}`){
				$("select[name=industry1]").append(industryOption).val("${anno.industry1}").trigger("change");
			} else {
				$("select[name=industry1]").append(industryOption);
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});   
});

$("[name=industry1]").on("change", function(){
	$("[name='industryCode'] option").remove();
	$("[name='industryCode']").append("<option>소분류</option>");
	
	let ref = $(this).val();
	let data = [{type:'industry',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/annoAjax",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			let industryList = resp.industryList;
			let industryOption = [];
			$.each(industryList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
				industryOption.push(tr);
			})
			if(`${anno.industryCode}`){
				$("select[name=industryCode]").append(industryOption).val("${anno.industryCode}");
			} else {
				$("select[name=industryCode]").append(industryOption);
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

// 복지 하위 셀렉트 
$("[name='welfareList[0].welfare0']").on("change", function(){
	let ref = $(this).val();
	let data = [{type:'welfare',code:ref}];

	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/annoAjax",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			let welfareList = resp.welfareList;
			let welfareOption = [];
			$("select[name='welfareList[0].welfareCode'] option").remove();
			$.each(welfareList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.welfareCode).html(val.welfareName);
				welfareOption.push(tr);
			})
			$("select[name='welfareList[0].welfareCode']").append($("<option>").html("소분류"));
			$("select[name='welfareList[0].welfareCode']").append(welfareOption);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});   
});

// 직종 하위 셀렉트
$(document).on("change",".job0", function(){
	let job1 = $(this).parents(".jobContainer").find(".job1");
	let jobCode = $(this).parents(".jobContainer").find(".jobCode");
	let ref = $(this).val();
	let data = [{type:'job',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/annoAjax",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			let jobList = resp.jobList;
			let jobOption = [];
			
			$.each(jobList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
				jobOption.push(tr);
			})
			
			job1.find("option").remove();
			job1.append($("<option>").html("중분류"));
			job1.append(jobOption);
			jobCode.find("option").remove();
			jobCode.append($("<option>").html("소분류"));
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

$(document).on("change",".job1", function(){
	let jobCode = $(this).parents(".jobContainer").find(".jobCode");
	let ref = $(this).val();
	let data = [{type:'job',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/annoAjax",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			let jobList = resp.jobList;
			let jobOption = [];
			
			$.each(jobList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
				jobOption.push(tr);
			})
			jobCode.find("option").remove();
			jobCode.append("<option>소분류</option>");
			jobCode.append(jobOption);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

function cloneCK(x){
	CKEDITOR.replace('detailList['+ x +'].daTask',{
		filebrowserUploadUrl: '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json'
	});
	
	CKEDITOR.replace('detailList['+ x +'].daCondition',{
		filebrowserUploadUrl: '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json'
	});
	
	CKEDITOR.replace('detailList['+ x +'].daPrefer',{
		filebrowserUploadUrl: '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json'
	});
}

// 복지 태그
let welval = $("[name='welfareList[0].welfareCode']").on("change",function(){
	let welSelect = $("[name='welfareList[0].welfareCode'] option:selected");
	console.log(welval.val());
	console.log(welSelect.html());
	$("#welDiv").append(
		$("<li>").append(
			$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html(welSelect.html())
			, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val(welval.val())
		)
	)
	let welTag = $(".welTag").on("click",function(event){
		$(this).parent($("<li>")).remove();
	});
});


// 경력 체크박스
function career(){
	let career0 = $(".career0");
	let career1 = $(".career1");
	let career2 = $(".career2");
	let careerYear = $(".careerYear");

	career0.on("change", function (e) {
	    e.preventDefault();
		console.log($(this));
	    $(this).parents("#careerDiv").find(".career1").prop("checked", false);
	    $(this).parents("#careerDiv").find(".career2").prop("checked", false);
	   	$(this).parents("#careerDiv").find(".careerYear").attr("style","display:none");
	});
	career1.on("change", function (e) {
	    e.preventDefault();
	    console.log($(this));
	    if($(this).parents("#careerDiv").find(".career0").is(":checked")){
	    	$(this).parents("#careerDiv").find(".career0").prop("checked", false);
	    }
	});
	career2.on("change", function (e) {
	    e.preventDefault();
	    console.log($(this));
	    if($(this).parents("#careerDiv").find(".career0").is(":checked")){
	    	$(this).parents("#careerDiv").find(".career0").prop("checked", false);
	    }
	    if($(this).parents("#careerDiv").find(".career2").is(":checked")){
	    	$(this).parents("#careerDiv").find(".careerYear").attr("style","display:block");
	    }else{
	    	$(this).parents("#careerDiv").find(".careerYear").attr("style","display:none");
	    }
	});
}

	let salary = $("#annoSalary");
	let salaryDetail = $("#salaryDetail");
	salary.on("change", function (e) {
	    if(salary.val()=="연봉"||salary.val()=="월급"||salary.val()=="시급"){
	    	salaryDetail.attr("style","display:block");
	    }else{
	    	salaryDetail.attr("style","display:none");
	    }
	});

// 도로명주소
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode(x) {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // DB로 가져갈 값
            let regionName = document.querySelector("[name='detailList["+x+"].regionVO.regionName']");
            regionName.value=data.sido+" "+data.sigungu;
			console.log(regionName.value);

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode'+x).value = data.zonecode;
            document.getElementById("sample4_roadAddress"+x).value = roadAddr;
            document.getElementById("sample4_jibunAddress"+x).value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress"+x).value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress"+x).value = '';
            }

            var guideTextBox = document.getElementById("guide"+x);
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
    
// CKEDITOR
CKEDITOR.replace('annoWorkenv',{
	filebrowserUploadUrl: '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json'
});
CKEDITOR.replace('annoContent',{
	filebrowserUploadUrl: '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json'
	, height : 450
});

// daterangepicker
$(function() {
	$('input[name="datetimes"]').daterangepicker({
		opens: 'left',
		timePicker: true,
		startDate: moment().startOf('hour'),
		endDate: moment().startOf('hour').add(32, 'hour'),
		locale: {
			format: 'M/DD hh:mm A'
		}
	}, function(start, end, label) {
		let annoStartdate = document.querySelector("[name=annoStartdate]");
		let annoEnddate = document.querySelector("[name=annoEnddate]");
		annoStartdate.value=start.format('YYYY-MM-DD HH:mm:ss');
		annoEnddate.value=end.format('YYYY-MM-DD HH:mm:ss');
		console.log('시작날짜',annoStartdate.value);
		console.log('종료날짜',annoEnddate.value);
	});
});
let today = new Date();

</script>

<script src="${prePath}/resources/js/anno/annoFill.js"></script>

<script src="${prePath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${prePath}/resources/js/isotope.pkgd.min.js"></script>
<script src="${prePath}/resources/js/stickyfill.min.js"></script>
<script src="${prePath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${prePath}/resources/js/jquery.easing.1.3.js"></script>

<script src="${prePath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${prePath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${prePath}/resources/js/owl.carousel.min.js"></script>
<script src="${prePath}/resources/js/quill.min.js"></script>

<script src="${prePath}/resources/js/bootstrap-select.min.js"></script>

<script src="${prePath}/resources/js/custom.js"></script>
