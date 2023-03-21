<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-bordered">
	<thead>
		<tr>
			<th>번호</th>
			<th>기능명</th>
			<th>기능종류</th>
			<th>수준</th>
		</tr>
	</thead>
	<tbody id="facilityBody">
	</tbody>
	<tfoot>
		<a href="${pageContext.request.contextPath}/facility/insert"><h1>+</h1></a>
	</tfoot>	
</table>

<script>
let facilityBody = $("#facilityBody");

let makeTrTag = function(facility, index){
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/facility/" + facility.facilitySn)
				.html(facility.facilityName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(facility.facilityCategory)
				, $("<td>").html(facility.facilityLevel)
			);
}

$.ajax({
	url : "${pageContext.request.contextPath}/facility",
	method : "get",
	dataType : "json",
	success : function(resp) {
		console.log(resp);
		facilityBody.empty();
		let dataList = resp.facilityList;
		let trTags = [];
		if(dataList){
			$.each(dataList, function(index, facility){
				trTags.push(makeTrTag(facility, index));
			});
		}else{
			let tr = $("<tr>").html(
				$("<td>").attr("colspan", "7")
						.html("경력을 아직 등록하지 않았습니다.")
			);	
			trTags.push(tr);
		}
		facilityBody.html(trTags);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>