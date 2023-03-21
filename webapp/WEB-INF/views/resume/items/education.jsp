<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css"/>  

<style>
  .company_honest_qna .contents_container {
    width: 90%;
}

.wrap_community_topic .section_inner {
    width: 490px;
    height: 520px;
}

.wrap_community_topic .section_inner:nth-child(even) {
    float: left;
}
.radiuss{
	width: 100%;
	height: auto;
	border : 1px solid #eaedf4;
	border-radius: 12px;
	padding: 60px 60px 60px 60px;
	margin-top: 2%;
 	margin-bottom: 2%;
}

</style>
<div class="radiuss">
	<div class="company_honest_qna">
		<div class="contents_container">
			<div class="wrap_story_panel">
				<div class="wrap_section wrap_community_topic" style="margin-top: 36px;">
					<div class="wrap_title">
						<h3 class="main_tit">내 자기소개서 목록</h3>
					</div>
					<div class="tblType">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>학교명</th>
									<th>전공</th>
									<th>입학일</th>
									<th>졸업일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody id="eduBody">
							</tbody>
							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-top: 1rem; margin-right: 1%;">
		<a href="${pageContext.request.contextPath}/education/insert"><button class="btn btn-outline-primary" style="width: 150px; border-radius: 0;">등록하기</button></a>
		<a href="${pageContext.request.contextPath}/resume"><button class="btn btn-outline-secondary"  style="width: 150px; border-radius: 0;">이력서</button></a>
	</div>
</div>

<script>
let eduBody = $("#eduBody");

let makeTrTag = function(edu, index){
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/education/" + edu.eduSn)
				.html(edu.eduName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(edu.eduMajor)
				, $("<td>").html(edu.eduEntered)
				, $("<td>").html(edu.eduGraduated)
				, $("<td>").html(edu.eduStatus)
			);
}

$.ajax({
	url : "${pageContext.request.contextPath}/education",
	method : "get",
	dataType : "json",
	success : function(resp) {
		console.log(resp);
		eduBody.empty();
		let dataList = resp.educationList;
		let trTags = [];
		if(dataList){
			$.each(dataList, function(index, edu){
				trTags.push(makeTrTag(edu, index));
			});
		}else{
			let tr = $("<tr>").html(
				$("<td>").attr("colspan", "7")
						.html("경력을 아직 등록하지 않았습니다.")
			);	
			trTags.push(tr);
		}
		eduBody.html(trTags);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>