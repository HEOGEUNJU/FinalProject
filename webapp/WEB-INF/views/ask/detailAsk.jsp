<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- MAIN CSS -->
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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/help.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
 <style>
 .ck-editor__editable { height: 300px; }
 .lpop_report {
    display: none;
    overflow-y: auto;
    position: fixed;
    top: 207px;
    bottom: 50px;
    left: 23%;
    z-index: 1127;
    margin-left: -260px;
    padding: 50px;
    width: 578px;
    max-height: 588px;
    border: 1px solid #444;
    box-sizing: border-box;
    letter-spacing: -1px;
    background: #fff;
    box-shadow: 0 0 4px 2px rgba(0, 0, 0, 0.1);
}
.lpop_report .inp_tarea {
width: 463px;
    height: 229px;
}
 </style>
</head>

<body id="top">
	<!-- 작성 -->
	<div id="sri_section" class="  has_banner">
		<div id="sri_wrap">
			<div id="content">
				<div class="wrap_board_view wrap_help">
					<strong class="view_tit">내 문의 내역</strong>
					<div class="wrap_content_view">
						<div class="area_tit">
							<h1 class="content_tit">${ask.askTitle }</h1>
							<dl class="content_info">
								<dt>문의 날짜:</dt>
								<dd>${ask.askDate }</dd>
							</dl>
							<c:if test="${not empty files}">
								<dl class="content_info" style="font-size: 15px;">
									<dt>첨부파일 :</dt>
									<dd>
										<c:forEach items="${files }" var="files">
											<a style="color: #0D6EFD;"
												href="<c:url value='/systemManagement/fileDownLoad?tblId=${files.tblId }'/>">${files.attFilename }</a>
											<span>${files.attFancysize }</span>
										</c:forEach>
									</dd>
								</dl>
							</c:if>
						</div>
						<div class="area_content">
							<div class="inner">
								<!-- 공지 컨텐츠 -->
								<div style="white-space: pre-line">${ask.askContent }</div>
								<c:forEach var="i" begin="0" end="4">
									<img style="max-width: 100%;" alt="${ask.attatchList[i].attFilename}"
										src='<spring:url value="/image/askFolder/${ask.attatchList[i].attSavename}"/>' />
								</c:forEach>

								<c:set var="ref" value="${ask.refContent }" />
							<c:if test="${not empty ref}">
									<!-- 답글 있을 때 -->
								<div class="replies">
									<div class="reply">
										<div class="txt">
											<p>${ask.refContent}</p>
										</div>
										<span class="date">
									      등록일 :
									      ${ask.refDate }
									    </span>
									</div>
								</div>
							</c:if>

							</div>
						</div>
					</div>
					<div class="area_btn">
						<a href="${pageContext.request.contextPath }/ask/askList" class="btn_basic_type01" title="이전 목록 바로가기">
							목록
						</a>
					</div>

					<div class="help_find">
						<div class="find_method">
						<!-- 회원이면 재문의하기, 운영자면 답글달기 -->
						<a href="${pageContext.request.contextPath }/ask/askForm" class="btn_basic_type01" title="문의하기 바로가기">
							재문의하기
						</a>
							<c:if test="${not empty memId}">
								<button type="button" class="btn_basic_type01 btn_list" title="답글 바로가기">답글달기</button>
							</c:if>
							<p class="desc_method">
								아직도 궁금한 점이 남아있다면, 고객센터로 문의해 주세요. ( 전화문의 : <span class="tel">042-123-4567</span>)
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 답글 -->
	<div class="lpop_company_review lpop_report" style="display: none; left:950px">
			<div class="lpop_head">
				<strong>답글 작성</strong>
			</div>

			<div class="area_tit">
				<h1 class="content_tit">제목: ${ask.askTitle }</h1>
			</div>

			<dl class="content_info">
				<dt>문의 날짜: ${ask.askDate }</dt>
			</dl>

			<div class="area_content">
				<div class="inner">
					<div style="white-space: pre-line">내용: ${ask.askContent }</div>
				</div>
			</div>

			<form action="${pageContext.request.contextPath}/ask/askForm/ref" method="post">
					<input value="${ask.askNo }" name="askNo"  hidden="hidden"/>
				<div class="lpop_cont">
				<!-- <input type="hidden" name="refContent" value=""> -->
				<div class="form-group">
					<label for="job-description"></label>
					<!-- rows="24" cols="80" -->
					<textarea name="refContent" class=inp_tarea id="report_contents" title="답글내용 입력"
						placeholder="내용을 입력해주세요">
					</textarea>
				</div>
				<%-- <input type="text" value="${ask.refContent}" name="refContent" /> --%>
				</div>

				<button type="submit" class="btn_report report_submit">등록하기</button>
			</form>
			<div class="lpop_foot">
				<button type="button" class="btn_close lpop_report_layer_close">
					<span class="blind">닫기</span>
				</button>
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
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript">var $j = jQuery.noConflict();</script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
	let creditor;

	ClassicEditor
	  .create(document.querySelector( '#report_contents' ) {
	    language: 'ko'
	  })
	  .then( newEditor => {
		  creditor = newEditor;
	  } )
	  .catch( error => {
	    console.error( error );
	  } );
</script>


	<script>
		$('.btn_list').on('click', function() {
			if ($j(".lpop_report").css("display") == "none") {
				$j('.lpop_report').show();
				$('#report_contents').val('');
			} else {
				$j('.lpop_report').hide();
			}
		});

		$('.lpop_report_layer_close').on('click', function() {
			$('.lpop_report').hide();
		});

		$('.report_submit').click(function() {

			var submit = [];
			var f = document.qna_report_form;
			var contents = creditor.getData();

			//CKEDITOR.instances.example.getData()
			/* console.log("여기니?", creditor.getData()); */
			if (contents.trim() === '') {
				alert('입력된 내용이 없습니다!');
				return;
			}
			if (!confirm('등록 하시겠습니까?'))
				return;
		});

	</script>
</body>
</html>