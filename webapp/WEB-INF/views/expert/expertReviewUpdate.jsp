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
<div class="site-wrap">
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
							<h2>후기수정</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-lg-12">
					<form class="p-4 p-md-5 border rounded" method="post">
						<div class="form-group">
							<h4><label for="job-title">구매상품명 : </label> 
							<span>${exreview.exprodName }</span></h4>
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
						<input type="hidden" name ="exreviewScore" value="${exreview.exreviewScore }">
						<input type="hidden" name ="excartId" value="${exreview.excartId }">
						<div class="form-group">
							<label for="job-title">제목</label>
							<input type="text" value="${exreview.exreviewName }"
								class="form-control" id="job-title" placeholder="" name ="exreviewName">
						</div>
						<div class="form-group">
							<label for="job-title">작성자</label> 
							<input type="text" value="${exreview.exreviewWriter }"
								class="form-control" id="job-title" placeholder="" name= "exreviewWriter">
						</div>
						<div class="form-group">
							<label for="job-title">내용</label>
							<textarea name="exreviewContent" cols="30" rows="7" class="form-control"
								id="summernote" >${exreview.exreviewContent }</textarea>
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
</div>
<script src="/INUProject/resources/js/owl.carousel.min.js"></script>

<script>
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
</script>