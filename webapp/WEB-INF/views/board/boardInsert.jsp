<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
.btn-primary {background-color: #0D6EFD; border-color: #0D6EFD;}
.uploads {margin: 9px 0 15px;}
.noti_inp {margin-top: 8px;}
.noti_inp {font-size: 12px;color: #888;}
.contents_container.qna_write_wrap {width: 1005px;}
#cke_1_contents {min-height: 400px;}
</style>
</head>

<body id="top">
<!-- principal.realMember : MemberVO -->
<security:authorize access="isAuthenticated()"><!-- 로그인 되었다면.. -->
	<security:authentication property="principal.realMember" var="memberVO" />
</security:authorize>
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
					<form:form name="sub" enctype="multipart/form-data" class="p-4 p-md-5 border rounded" method="post"
					action="${pageContext.request.contextPath}/board/boardInsert" modelAttribute="board">
						<div class="contents_container qna_write_wrap">
							<input type="hidden" name="category_type" value="topic" id="category_type" />
							<div class="qna_write_selection">
								<span class="qna_category_tit">카테고리 </span>
								<div class="box_qna_category">
									<div class="inpSel">
										<select id="replySort" name="boardSub" title="분류별선택" >
											<!-- <option value="전체글">전체글</option> -->
											<option value="선택" selected>선택</option>
											<option value="신입"
												<c:if test="${param.gubun=='1'}">selected</c:if>
											>신입</option>
											<option value="취준"
												<c:if test="${param.gubun=='2'}">selected</c:if>
											>취준</option>
											<option value="채용공고"
												<c:if test="${param.gubun=='3'}">selected</c:if>
											>채용공고</option>
											<option value="자소서"
												<c:if test="${param.gubun=='4'}">selected</c:if>
											>자소서</option>
											<option value="면접"
												<c:if test="${param.gubun=='5'}">selected</c:if>
											>면접</option>
											<option value="Q&A"
												<c:if test="${param.gubun=='6'}">selected</c:if>
											>Q&amp;A</option>
										</select>
									</div>
								</div>
							</div>
						</div>

						<div class="contents_container qna_write_wrap">
							<div class="qna_wright_cont">
								<input class="qna_subject_input" id="jobTitle" name="boardTitle" placeholder="제목을 입력해주세요" required />
							</div>

						<div class="qna_write_post">
							<textarea id="editor" name="boardContent" placeholder="내용을 입력해주세요"></textarea>
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
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</section>

<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

<!-- ------------------------------------------------------------------------------------------------------------------- -->
<script>
	// console.log("sub", sub);
	  function check_submit(){
		var sub = document.sub;
    	if(sub.replySort.value=="선택") {
			swal("카테고리를 선택해주세요","","warning");
			sub.replySort.focus();
			return false;
    	}else if(sub.jobTitle.value==""){
    		swal("제목을 입력해주세요","","warning");
    		sub.jobTitle.focus();
			return false;
    	}else {
    		// swal("작성한 게시글이 등록되었습니다","","success");
    	}
    	};
</script>

<script>
CKEDITOR.replace(document.querySelector('#editor'), {
	/* removePlugins: [ 'Heading' ], */
	language : "ko"
});

$("#fill").on("click",function(e){
// 	e.preventDefault();
	let sub = `신입`;
	let title = `재무/회계쪽 연봉 어느정도인지와 신입의 경우 세무사 사무실 vs 기업 고민됩니다.`;
	$("#replySort").val(sub);
	$("#jobTitle").val(title);
	CKEDITOR.instances.editor.setData(`
			<p>안녕하세요. 다른업종에서 2년 일하다가 코로나로 인해 회계공부하고있는 상태입니다.<br/>
			초졸 4점대 비전공, 회계관련 인턴 아르바이트 경력 x , 컴활2급, 전산회계자격증 1급, 전산세무2급까지 취득한 상태입니다.<br/>
			<br/>
			보통 이런경우 재무/회계 분야에서 어느정도의 연봉을 받을 수 있을까요?<br/>
			그리고 at 자격증들이나 재경관리사, erp 자격증등 관련 자격증들이 추가적으로 있으면 신입으로 취업 시 연봉을 더 올릴 수 있다던가, 업무를 하는데 더 수월할 순 있을까요?<br/>
			<br/>
			추가적으로 학원 선생님께 여쭤보니, 세무2급자격증까지만 따고도, 세무사 사무실에서 최소 1-2 년 경력 쌓고, 기업으로 가면 더 우대를 많이 해준다고는 하는데,<br/>
			실제로 그런지 궁금하네요. 세무사 사무실에서 일하는것과 기업의 회계팀등으로 들어갔을때의 차이점이나 장단점들은 어떻게 될까요?<br/>
			</p>
	`);
});
</script>
</body>
</html>