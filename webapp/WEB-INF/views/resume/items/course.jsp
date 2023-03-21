<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-bordered">
	<thead>
		<tr>
			<th>번호</th>
			<th>교육명</th>
			<th>교육기관</th>
			<th>교육종류</th>
			<th>교육기간</th>
		</tr>
	</thead>
	<tbody id="courseBody">
	</tbody>
	<tfoot>
		<a href="${pageContext.request.contextPath}/course/insert"><h1>+</h1></a>
	</tfoot>	
</table>

<script>
let courseBody = $("#courseBody");

let makeTrTag = function(course, index){
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/course/" + course.courseSn)
				.html(course.courseName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(course.courseInstitution)
				, $("<td>").html(course.courseCategory)
				, $("<td>").html(course.coursePeriod)
			);
}

$.ajax({
	url : "${pageContext.request.contextPath}/course",
	method : "get",
	dataType : "json",
	success : function(resp) {
		console.log(resp);
		courseBody.empty();
		let dataList = resp.courseList;
		let trTags = [];
		if(dataList){
			$.each(dataList, function(index, course){
				trTags.push(makeTrTag(course, index));
			});
		}else{
			let tr = $("<tr>").html(
				$("<td>").attr("colspan", "7")
						.html("교육이수를 아직 등록하지 않았습니다.")
			);	
			trTags.push(tr);
		}
		courseBody.html(trTags);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>