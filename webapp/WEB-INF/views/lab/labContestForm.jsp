<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.03.10  윤호연      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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

.neofont {
	font-family: 'NanumSquareNeo-Variable';
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
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<body>

	<section class="site-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-lg-12">
					<form:form name="sub" enctype="multipart/form-data" class="p-4 p-md-5 border rounded" method="post"
					action="${pageContext.request.contextPath}/lab/contest/insert" modelAttribute="contest">
						<div class="contents_container qna_write_wrap">
<!-- 							<input type="hidden" name="category_type" value="topic" id="category_type" /> -->
							<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.5em">기본 정보 등록</p>
							<hr style="border: 1px solid black">
							<div class="qna_write_selection">
								<span class="qna_category_tit" style="font-family: 'NanumSquareNeo-Variable'; font-size: 20px;">카테고리 등록</span>
								<div class="box_qna_category">
									<div class="inpSel">
										<select name="categoryselect" data-width="100%" data-live-search="true" title="Select">
										      <option value="아이디어/기획">아이디어/기획</option>
										      <option value="사진/영상/UCC">사진/영상/UCC</option>
										      <option value="사업">사업</option>
										      <option value="IT/학술/논문">IT/학술/논문</option>
									    </select>
									</div>
								</div>
							</div>
						</div>

						<div class="contents_container qna_write_wrap">
							<div class="qna_wright_cont">
							
							<p style="font-family: 'NanumSquareNeo-Variable';">공모전 제목 입력</p>
								<div style="height: 5px;"></div>
								<input class="qna_subject_input" name="" placeholder="공모전 제목을 입력해주세요" required />
								<br>
							<p style="font-family: 'NanumSquareNeo-Variable';">주최 기관/업체 입력</p>
								<div style="height: 5px;"></div>
								<input class="qna_subject_input" name="" placeholder="주최 기관/업체를 입력해주세요" required />
								<br>
							<div style="display: flex;">
								<p style="font-family: 'NanumSquareNeo-Variable';">공모기간을 선택하세요&nbsp;&nbsp;</p>
									<div style="height: 5px;"></div>
									<input type="date" name="" required>&nbsp;부터&nbsp;<input type="date" name="" required>&nbsp;까지
							</div>
							
							<div style="height: 15px;"></div>
							
							<div style="display: flex;">
								<p style="font-family: 'NanumSquareNeo-Variable';">총 상금 규모를 입력하세요&nbsp;&nbsp;</p>
									<div style="height: 5px;"></div>
									<input type="number" name="">&nbsp;만원
							</div>
							
							</div>

						<div class="qna_write_post" style="min-height: 160px;">
							<p style="font-family: 'NanumSquareNeo-Variable';">참가대상 입력</p>
							<textarea id="editor" name="contTarget" class="editor_wrap" style="overflow: auto;" placeholder="공모전 참가대상을 입력해주세요"></textarea>
							
							<div class="qna_input_bottom">
								<input type="file" name="realFile" id="image_add" style="display: none" multiple accept=".gif, .jpg, .png">
								<hr style="border-bottom: 1px solid black; width: 915px;">
								<label for="image_add" class="btn_image_add">공모전 포스터 첨부</label>
								<p class="noti_inp">10MB 이하의 JPG, GIF, PNG만 등록 가능합니다.</p>
							</div>
						</div>
						
						<div class="uploads">
							<span class="info_upload">
								<span class="txt_upload" id="fileName">${attachedVO.attFilename }</span>
							</span>
						</div>
						
						<div style="height: 15px;"></div>
						<p style="font-family: 'NanumSquareNeo-Variable';">※ 추가 내용 등록</p>
						
						<!-- 추가 내용 등록 단추 -->
						<div class="wrap_section wrap_community_topic">	
							<div class="wrap_slide_category" style="margin-top: 10px;">				
								<ul class="list_category js-category" style="max-width: 889px;">
							        <li id="contsummerybutton" aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
							        	<a class="item_cate" href="#" onclick="selectcontSummery()">모집개요<span></span></a>
							        </li>
							        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
							        	<a class="item_cate" href="#" onclick="selectcontContent()">공모주제<span></span></a>
							        </li>
							        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
							        	<a class="item_cate" href="#" onclick="selectcontRoad()">접수방법<span></span></a>
							        </li>
							        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
							        	<a class="item_cate" href="#" onclick="selectcontFile()">제출서류<span></span></a>
							        </li>
							        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
							        	<a class="item_cate" href="#" onclick="selectcontAsk()">문의사항<span></span></a>
							        </li>
							  	</ul>			
							</div>				
						</div>		
						
						<!-- 추가 내용 들어가려는 div -->
						<div id="addform">
						
						<!-- 추가 내용 폼 들어가는칸 -->

						
						</div>		
									
									
													
						<div style="height: 30px;"></div>
							<div class="qna_write_foot">
								<button type="submit" class="btnSizeXL btn_qna_write">공모전 등록</button>
							</div>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</section>

<script>


$("a").click(function(e){
    e.preventDefault();
});


// 추가내용 클릭시 생성

function selectcontSummery(){
	$("#addform").append(
		`<div id="addcontSummery">
			<div style="height: 50px;"></div>	
			<div class="qna_write_post" style="min-height: 100px;">
				<p class="neofont">모집개요</p>
				<textarea name="contSummery" class="editor_wrap" style="overflow: auto; height: 140px;" placeholder="공모전 참가대상을 입력해주세요"></textarea>
			</div>
		</div>`	
	);
}

function selectcontContent(){
	$("#addform").append(
		`<div id="addcontContent">
			<div style="height: 50px;"></div>	
			<div class="qna_write_post" style="min-height: 100px;">
				<p class="neofont">공모주제</p>
				<textarea name="contContent" class="editor_wrap" style="overflow: auto; height: 140px;" placeholder="공모전 주제를 입력해주세요"></textarea>
			</div>
		</div>`			
	);
}


</script>	
</body>
<!-- SCRIPTS -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/daumPostcode.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>