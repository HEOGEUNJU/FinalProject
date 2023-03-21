<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
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

<style>
.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
#cke_1_contents {min-height: 400px;}
.uploads {margin: 9px 0 15px;}
.noti_inp {margin-top: 8px;}
.noti_inp {font-size: 12px;color: #888;}
</style>
</head>
<body id="top">
	<div id="overlayer"></div>
<!-- 작성 -->
	<section class="site-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-lg-12">
					<form:form name="sub" enctype="multipart/form-data" class="p-4 p-md-5 border rounded" method="post" modelAttribute="board">
						<div class="qna_write_wrap">
							<div class="qna_write_selection">
								<span class="qna_category_tit">카테고리</span>
								<div class="box_qna_category">
									<div class="inpSel">
										<select id="replySort" name="boardSub" title="글 선택">
											<option value="선택" selected>선택</option>
											<option value="신입">신입</option>
											<option value="취준">취준</option>
											<option value="채용공고">채용공고</option>
											<option value="자소서">자소서</option>
											<option value="면접">면접</option>
											<option value="Q&amp;A">Q&amp;A</option>
										</select>
									</div>
								</div>
							</div>
						</div>

						<form:input type="hidden" path="boardNo"/>
						<div class="contents_container qna_write_wrap">
							<div class="qna_wright_cont">
								<form:input class="qna_subject_input" id="jobTitle" path="boardTitle" placeholder="제목을 입력해주세요"/>
							</div>
						</div>

						<div class="qna_write_post">
							<form:textarea id="editor" path="boardContent" placeholder="내용을 입력해주세요"></form:textarea>
							<div class="qna_input_bottom">
								<input type="file" name="attachFiles" id="image_add" style="display: none" multiple accept=".gif, .jpg, .png">
								<label for="image_add" class="btn_image_add">이미지첨부</label>
								<p class="noti_inp">10MB 이하의 JPG, GIF, PNG만 등록 가능합니다.(최대 5개까지 가능)</p>
							</div>
						</div>

						<div class="uploads">
							<span class="info_upload">
								<span class="txt_upload" id="fileName"></span>
							</span>
						</div>

						<div class="qna_write_foot">
							<button type="submit" class="btnSizeXL btn_qna_write" onclick="return check_submit();">게시글 등록</button>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</section>
<!-- SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
CKEDITOR.replace(document.querySelector('#editor'), {
	language : "ko"
});
</script>

<script>
//console.log("sub", sub);
function check_submit(){
	var sub = document.sub;
	if(sub.replySort.value=="선택") {
		swal("카테고리를 선택해주세요","","warning");
		sub.replySort.focus();
		return false;
	}else if(sub.jobTitle.value==""){
		swal("제목을 입력해주세요","","warning");
		sub.boardTitle.focus();
		return false;
	}else if(sub.con.value==""){
		swal("내용을 입력해주세요","","warning");
		sub.con.focus();
		return false;
	}
};

</script>
</body>
</html>