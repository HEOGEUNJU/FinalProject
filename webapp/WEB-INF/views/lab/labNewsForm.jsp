<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.02  윤호연      최초작성
* 2023.03.09  윤호연      1차수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<head>
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

/* 나눔스퀘어 네오 */
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
.btn-primary {background-color: #045738; border-color: #045738;}
.ck-editor__editable { height: 400px; }
.ck-content { font-size: 15px; }
.uploads {margin: 9px 0 15px;}
.noti_inp {margin-top: 8px;}
.noti_inp {font-size: 12px;color: #888;}

.semitext{
	border-bottom: 1px solid #d7dce5;
	border-top: 1px solid #d7dce5;
	border-left: 1px solid #d7dce5;
	border-right: 1px solid #d7dce5;
}

</style>
<script>
	//TextArea 엔터키 사용 시 줄바꿈 처리
	
	var text = document.getElementById("newssemiName").value;
		text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
		
</script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>

	<!-- 입력 폼 -->
       <section class="site-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-lg-12">
					<form:form name="sub" enctype="multipart/form-data" class="p-4 p-md-5 border rounded" method="post"
					action="${pageContext.request.contextPath}/lab/News/Insert" modelAttribute="news">
						<div class="contents_container qna_write_wrap">
							<input type="hidden" name="category_type" value="topic" id="category_type" />
							<div class="qna_write_selection">
								<span class="qna_category_tit">카테고리 등록</span>
								<div class="box_qna_category">
									<div class="inpSel">
										<select name="categoryselect" data-width="100%" data-live-search="true" title="Select">
										      <option value="기업">기업</option>
										      <option value="취업">취업</option>
										      <option value="공채">공채</option>
									    </select>
									</div>
								</div>
							</div>
						</div>

						<div class="contents_container qna_write_wrap">
							<div class="qna_wright_cont">
							<p style="font-family: 'NanumSquareNeo-Variable';">기사 제목 입력</p>
								<div style="height: 5px;"></div>
								<input class="qna_subject_input" id="newsName" name="newsName" placeholder="기사 제목을 입력해주세요" required />
								<br>
									<p style="font-family: 'NanumSquareNeo-Variable';">기사 소제목 입력</p>
							<div style="height: 5px;"></div>
								<textarea id="newssemiName" name="newsSemiName" class="editor_wrap h_max semitext" style="overflow: auto; height: 150px;" placeholder="기사 소제목을 입력해주세요"></textarea>
							</div>

						<div class="qna_write_post">
							<p style="font-family: 'NanumSquareNeo-Variable';">기사 본문 입력</p>
							<textarea id="editor" name="newsContent" class="editor_wrap h_max" style="overflow: auto;" placeholder="기사 본문을 입력해주세요"></textarea>
							<div class="qna_input_bottom">
								<input type="file" name="realFile" id="image_add" style="display: none" multiple accept=".gif, .jpg, .png">
								<label for="image_add" class="btn_image_add">이미지첨부</label>
								<p class="noti_inp">10MB 이하의 JPG, GIF, PNG만 등록 가능합니다.</p>
							</div>
						</div>
						<div class="uploads">
							<span class="info_upload">
								<span class="txt_upload" id="fileName">${attachedVO.attFilename }</span>
							</span>
						</div>
							<div class="qna_write_foot">
								<button type="submit" class="btnSizeXL btn_qna_write">뉴스 등록</button>
							</div>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</section>
	
<script>

console.log("text");

CKEDITOR.replace('newsContent', {
	
});


</script>	
        
<!-- SCRIPTS -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/quill.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/daumPostcode.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/custom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>