<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">

<style>
.qna_write_wrap .qna_write_selection {
	padding: 0 0 22px;
}
#cke_1_contents {
    min-height: 400px;
}
.noti_inp {
	margin-top: 8px;
	font-size: 12px;color: #888;
}
</style>

<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>



<!-- 작성 -->
<section class="site-section">
<div class="container">
	<div class="row mb-5">
		<div class="col-lg-12">
			<form:form modelAttribute="notice" enctype="multipart/form-data" class="p-4 p-md-5 border rounded" method="post">
				<div class="contents_container qna_write_wrap">
					<form:hidden path="noticeSn"/>
					<form:hidden path="memId"/>
					<div class="qna_write_selection">
						<span class="qna_category_tit">카테고리 </span>
						<div class="box_qna_category">
							<div class="inpSel">
								<select id="noticeSort" name="noticeSort">
									<option value="안내">안내</option>
									<option value="오픈">오픈</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
					</div>
				</div>

				<div class="contents_container qna_write_wrap" style="width: auto;">
					<div class="qna_wright_cont">
						<input class="qna_subject_input" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력해주세요" value="${notice.noticeTitle }" required/>
					</div>

					<div class="qna_write_post">
						<textarea id="noticeContent" name="noticeContent" placeholder="내용을 입력해주세요">${notice.noticeContent }</textarea>
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
						<input type="submit" class="btnSizeXL btn_qna_write" value="저장"/>
						<input type="button" class="btnSizeXL btn_qna_write" onclick="location.href='<c:url value="/help/notice"/>'" value="목록으로"/>
					</div>
				</div>

			</form:form>
		</div>
	</div>
</div>
</section>



<script>

CKEDITOR.replace('noticeContent', {
	filebrowserUploadUrl: '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json'
});

</script>










