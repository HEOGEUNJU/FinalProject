<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      작성자명      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script
	src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
.qna_write_wrap .qna_write_selection {
	padding: 0 0 22px;
}

.btn-primary {
	background-color: #045738;
	border-color: #045738;
}

.ck-editor__editable {
	height: 400px;
}

.ck-content {
	font-size: 15px;
}

.uploads {
	margin: 9px 0 15px;
}

.noti_inp {
	margin-top: 8px;
}

.noti_inp {
	font-size: 12px;
	color: #888;
}
</style>
</head>
<div id="overlayer"></div>
<!-- 작성 -->
<!-- <section class="site-section"> -->
	<div class="container" style="max-width: 1140px;">
		<div class="row mb-5">
			<div class="col-lg-12">
				<form:form name="sub" enctype="multipart/form-data"
					class="p-4 p-md-5 border rounded" method="post"
					modelAttribute="exprod">
					<div class="contents_container qna_write_wrap">
						<input type="hidden" name="category_type" value="topic"
							id="category_type" />
						<button type="button" class="btn btn-primary"  id="autoInsert" style="border-radius: 0px">
										<span>자동입력</span>
								</button> 
						<div class="qna_write_selection">
							<span class="qna_category_tit">${form } </span>
							<div class="box_qna_category">
								<div class="inpSel">
								</div>
							</div>
						</div>
					</div>

					<div class="contents_container qna_write_wrap">
						<div class="qna_wright_cont">
							<form:input path="exprodName" type="text"
								cssClass="qna_subject_input" placeholder="상품명을 입력해주세요"
								required="true" />
							<form:errors path="exprodName" element="span"
								cssClass="text-danger" />
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<input type="text" name="datetimes" class="qna_subject_input" />
							<form:hidden path="exprodStart" />
							<form:hidden path="exprodEnd" />
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<form:input path="exprodTarget" type="text"
								cssClass="qna_subject_input" placeholder="대상을 입력해주세요"
								required="true" />
							<form:errors path="exprodTarget" element="span"
								cssClass="text-danger" />
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<form:input path="exprodPrice" type="text"
								cssClass="qna_subject_input" placeholder="가격을 입력해주세요"
								required="true" />
							<form:errors path="exprodPrice" element="span"
								cssClass="text-danger" />
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<form:input path="exprodWay" type="text"
								cssClass="qna_subject_input" placeholder="이용 방법을 입력해주세요"
								required="true" />
							<form:errors path="exprodWay" element="span"
								cssClass="text-danger" />
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<form:input path="exprodTime" type="text"
								cssClass="qna_subject_input" placeholder="상담 예정 시간을 입력해주세요"/>
							<form:errors path="exprodTime" element="span"
								cssClass="text-danger" />
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<form:input path="exprodPr" type="text"
								cssClass="qna_subject_input" placeholder="한줄소개 을 입력해주세요"
								required="true" />
							<form:errors path="exprodPr" element="span"
								cssClass="text-danger" />
						</div>
						<div class="qna_write_post">
							<form:textarea path="exprodDetail" type="text" id="summernote"
								cssClass="form-control" cols="30" rows="7" />
							<form:errors path="exprodDetail" element="span"
								cssClass="text-danger" />
						</div>
						<div class="qna_write_foot">
							<button type="button" class="btnSizeXL btn_qna_write">이전</button>
							<button type="submit" class="btnSizeXL btn_qna_write">상품
								등록</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</div>

<!-- SCRIPTS -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
	/* CKEDITOR */
CKEDITOR
		.replace(
				'exprodDetail',
				{
					filebrowserUploadUrl : '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json',
					height : 450
				});

/* daterangepicker */
$(function() {
	$('input[name="datetimes"]').daterangepicker({
		opens : 'left',
		timePicker : true,
		startDate : moment().startOf('hour'),
		endDate : moment().startOf('hour').add(32, 'hour'),
		locale : {
			format : 'M/DD hh:mm A'
		}
	}, function(start, end, label) {
		//DB로 가져갈 값
		let annoStartdate = document.querySelector("[name=exprodStart]");
		let annoEnddate = document.querySelector("[name=exprodEnd]");
		exprodStart.value = start.format('YYYY-MM-DD HH:mm:ss');
		exprodEnd.value = end.format('YYYY-MM-DD HH:mm:ss');
		console.log('시작날짜', exprodStart.value);
		console.log('종료날짜', exprodEnd.value);
	});
});
	let today = new Date();
	// $('input[name=daterange]').val(today);
	
var autoInsert = document.querySelector("#autoInsert");
autoInsert.addEventListener("click",function(){
	$("input[name=exprodName]").attr('value','웹개발자 취업 상담');
	$("input[name=exprodStart]").attr('value','2023-03-14');
	$("input[name=exprodEnd]").attr('value','2023-06-30');
	$("input[name=datetimes]").daterangepicker({ startDate: '03/14/2023', endDate: '06/30/2023' });
	$("input[name=exprodTarget]").attr('value','모두');
	$("input[name=exprodPrice]").attr('value','40000');
	$("input[name=exprodWay]").attr('value','1:1 채팅');
	$("input[name=exprodTime]").attr('value','1시간');
	$("input[name=exprodPr]").attr('value','웹개발자 취업에 대한 다양한 문의에 대해서 상담을 해드립니다.');
 	$("textarea[name=exprodDetail]").val(`웹개발자 취업에 대한 다양한 문의에 대해서 상담을 해드립니다. 미디어, 콘텐츠, 웹개발, 교육계등 다양한 분야에서 개발자로서의 경험이 있습니다. 직업훈련학교, 대학교, 학원, 평생교육원, 대기업, 중견, 중소기업등에서 개발자양성교육을 진행했으며, 오랜기간의 경험으로 개발자준비에 대한 노하우를 쌓을 수 있었습니다. 이러한 경험을 바탕으로 상담자가 편안한 마음으로 궁금한 부분을 해결할 수 있도록 도움을 드립니다. 웹개발자취업에 맞는 상담 상품외에 개발자준비교육등을 의뢰하실 고객님들께서는 다른 상품을 더 살펴봐주시길 바랍니다.`);
}) 
</script>
