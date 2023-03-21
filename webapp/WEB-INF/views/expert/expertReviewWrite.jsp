<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      허근주      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/star.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
<div id="overlayer"></div>
<!-- 작성 -->
<!-- <section class="site-section"> -->
	<div class="container" style="max-width: 1140px;">
		<div class="row mb-5">
			<div class="col-lg-12">
				<form class="p-4 p-md-5 border rounded" method="post">
					<div class="contents_container qna_write_wrap">
						<input type="hidden" name="category_type" value="topic"
							id="category_type" />
							<button type="button" class="btn btn-primary"  id="autoInsert" style="border-radius: 0px">
								<span>자동입력</span>
						</button> 
						<div class="qna_write_selection">
							<span class="qna_category_tit">후기등록 </span>
							<div class="box_qna_category">
								<div class="inpSel">
								</div>
							</div>
						</div>
					</div>

					<div class="contents_container qna_write_wrap">
						<div class="qna_wright_cont">
							<label for="job-title">구매상품</label> 
							<select name = "excartId" class="qna_subject_input">
								<c:forEach items="${exprodList }" var="exprodList" varStatus="status">
									<option value = ${excartList[status.index].excartId }>${exprodList.exprodName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<label for="company-website-tw d-block">별점</label> <br>
							<div class="star-rating space-x-4 mx-auto">
								<input type="radio" id="5-stars" name="rating" value="5"  />
									<label for="5-stars" class="star pr-4">★</label> 
								<input
									type="radio" id="4-stars" name="rating" value="4" />
									<label for="4-stars" class="star">★</label> 
								<input type="radio"
									id="3-stars" name="rating" value="3" /> <label
									for="3-stars" class="star">★</label> 
								<input type="radio"
									id="2-stars" name="rating" value="2" /> <label
									for="2-stars" class="star">★</label> 
								<input type="radio"
									id="1-star" name="rating" value="1" /> <label for="1-star"
									class="star">★</label>
							</div>
						</div>
						<input type="hidden" name ="exreviewScore">
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<label for="job-title">제목</label> <input type="text"
								class="qna_subject_input" id="job-title" placeholder="" name ="exreviewName">
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<label for="job-title">작성자</label> <input type="text"
								class="qna_subject_input" id="job-title" placeholder="" name= "exreviewWriter">
						</div>
						<div class="qna_wright_cont" style="margin-top: 15px;">
							<label for="job-title">내용</label>
							<textarea name="exreviewContent" cols="30" rows="7" class="qna_wright_cont"
								id="summernote" ></textarea>
						</div>
						</div>
						<div class="qna_write_foot">
							<button type="button" class="btnSizeXL btn_qna_write">이전</button>
							<button type="submit" class="btnSizeXL btn_qna_write">후기
								등록</button>
						</div>
					</form>
					</div>
			</div>
		</div>
<%-- <div class="site-wrap">
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	<!-- .site-mobile-menu -->


	<section class="site-section">
		<div class="container">

			<div class="row align-items-center mb-5">
				<div class="col-lg-8 mb-4 mb-lg-0">
					<div class="d-flex align-items-center">
						<div>
							<h2>후기등록</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-lg-12">
					<form class="p-4 p-md-5 border rounded" method="post">
						<div class="form-group">
							<label for="job-title">구매상품</label> 
							<select name = "excartId">
								<c:forEach items="${exprodList }" var="exprodList" varStatus="status">
									<option value = ${excartList[status.index].excartId }>${exprodList.exprodName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="company-website-tw d-block">별점</label> <br>
							<div class="star-rating space-x-4 mx-auto">
								<input type="radio" id="5-stars" name="rating" value="5"  />
									<label for="5-stars" class="star pr-4">★</label> 
								<input
									type="radio" id="4-stars" name="rating" value="4" />
									<label for="4-stars" class="star">★</label> 
								<input type="radio"
									id="3-stars" name="rating" value="3" /> <label
									for="3-stars" class="star">★</label> 
								<input type="radio"
									id="2-stars" name="rating" value="2" /> <label
									for="2-stars" class="star">★</label> 
								<input type="radio"
									id="1-star" name="rating" value="1" /> <label for="1-star"
									class="star">★</label>
							</div>
						</div>
						<input type="hidden" name ="exreviewScore">
						<div class="form-group">
							<label for="job-title">제목</label> <input type="text"
								class="qna_subject_input" id="job-title" placeholder="" name ="exreviewName">
						</div>
						<div class="form-group">
							<label for="job-title">작성자</label> <input type="text"
								class="qna_subject_input" id="job-title" placeholder="" name= "exreviewWriter">
						</div>
						<div class="form-group">
							<label for="job-title">내용</label>
							<textarea name="exreviewContent" cols="30" rows="7" class="form-control"
								id="summernote" ></textarea>
						</div>
						<br>
						 <div class="col-6">
		                <input type="submit" class="btn btn-block btn-primary btn-md" value="등록">
		              </div>
					</form>
				</div>


			</div>
			<div class="row align-items-center mb-5">

				<div class="col-lg-4 ml-auto">
					<div class="row">
						<div class="col-6">
							<a href="#" class="btn btn-block btn-light btn-md"
								style="border: 1px solid;">이전</a>
						</div>
						<div class="col-6">
							<a href="#" class="btn btn-block btn-primary btn-md">등록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div> --%>
<script src="/INUProject/resources/js/owl.carousel.min.js"></script>

<script>
	var autoInsert = document.querySelector("#autoInsert");
	$('#summernote').summernote(
		{
			placeholder : 'Hello stand alone ui',
			tabsize : 2,
			height : 500,
			toolbar : [ [ 'style', [ 'style' ] ],
			[ 'font', [ 'bold', 'underline', 'clear' ] ],
			[ 'color', [ 'color' ] ],
			[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
			[ 'table', [ 'table' ] ],
			[ 'insert', [ 'link', 'picture', 'video' ] ],
			[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
		});
	$('input[name=rating]').change(function(){
		var checkVal = $('input[name=rating]:checked').val();
		var exreviewScore = $('input[name=exreviewScore]').attr('value',checkVal);
		console.log(checkVal);
		console.log($('input[name=exreviewScore]').val());
	});
	autoInsert.addEventListener("click",function(){
		$("input:radio[name=rating]:radio[value='4']").prop('checked','true');
		$("input[name=exreviewName]").attr('value','너무 너무 유익한 시간 감사합니다!!');
		$("input[name=exreviewWriter]").attr('value','김시커');
		$("input[name=exreviewScore]").attr('value','4');
		$("#summernote").summernote('pasteHTML',`이렇게 친절하고 가족보다 더 소중한 느낌을 주는 상담은 처음이었어요❤️정말정말 감사드려요❤️ 시간도 저에게 기꺼이 맞춰주시고, 상담도 약속시간보다 훨씬 길게 해주셨어요. 원하던 결과는 아니었지만, 최대한 좋은쪽으로 생각해보고, 저를 최우선으로 생각해볼게요! 너무너무 감사합니다😊`);
	}) 
</script>