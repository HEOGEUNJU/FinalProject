<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-bordered">
	<thead>
		<tr>
			<th>번호</th>
			<th>직장명</th>
			<th>직무</th>
			<th>업종</th>
		</tr>
	</thead>
	<tbody id="careerBody">
	</tbody>
	<tfoot>
		<a href="${pageContext.request.contextPath}/career/insert"><h1>+</h1></a>
	</tfoot>	
</table>

<script>
let careerBody = $("#careerBody");

let makeTrTag = function(career, index){
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/career/" + career.careerSn)
				.html(career.careerCompany);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(career.careerTask)
				, $("<td>").html(career.careerCategory)
			);
}

$.ajax({
	url : "${pageContext.request.contextPath}/career",
	method : "get",
	dataType : "json",
	success : function(resp) {
		console.log(resp.careerList);
		careerBody.empty();
		let dataList = resp.careerList;
		let trTags = [];
		if(dataList){
			$.each(dataList, function(index, career){
				trTags.push(makeTrTag(career, index));
			});
		}else{
			let tr = $("<tr>").html(
				$("<td>").attr("colspan", "7")
						.html("경력을 아직 등록하지 않았습니다.")
			);	
			trTags.push(tr);
		}
		careerBody.html(trTags);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>