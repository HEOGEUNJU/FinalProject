<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      작성자명      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
							<h2>이벤트등록</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-lg-12">
					<form:form modelAttribute="exevent" method="post" enctype="multipart/form-data">

						 <div class="form-group">
							<label for="job-title">이벤트ID</label>
							<form:input path="exeventId" type="text" cssClass="form-control" readonly="true"/>
							<form:errors path="exeventId" element="span"
								cssClass="text-danger" />
						</div> 
						<div class="form-group">
							<label for="job-title">이벤트명</label>
							<form:input path="exeventName" type="text"
								cssClass="form-control" />
							<form:errors path="exeventName" element="span"
								cssClass="text-danger" />
						</div>
						<div class="form-group">
							<label for="job-title">이벤트시작일</label>
							<form:input path="exeventStart" type="date"
								cssClass="form-control" />
							<form:errors path="exeventStart" element="span"
								cssClass="text-danger" />
						</div>
						<div class="form-group">
							<label for="job-title">이벤트종료일</label>
							<form:input path="exeventEnd" type="date" cssClass="form-control" />
							<form:errors path="exeventEnd" element="span"
								cssClass="text-danger" />
						</div>

						<div class="form-group">
							<label for="job-title">첨부파일</label>
							<input type="file" name="attachFiles" class="form-control" multiple="multiple"/>
						</div>
						<div class="form-group">
							<label for="job-title">이벤트내용</label>
							<form:textarea path="exeventContent" type="text"
								cssClass="form-control"  id="summernote"  />
							<form:errors path="exeventContent" element="span"
								cssClass="text-danger" />
						</div>
						<br>
		              <div class="col-6">
		                <input type="submit" class="btn btn-block btn-primary btn-md" value="등록">
		              </div>
					</form:form>
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
    <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 500,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>