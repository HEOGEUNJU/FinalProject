<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<table class="table table-bordered">
	<thead>
		<tr>
			<th>번호</th>
			<th>수상대회명</th>
			<th>수상명</th>
			<th>수상기관</th>
		</tr>
	</thead>
	<tbody id="awardBody">
	</tbody>
	<tfoot>
		<a href="${pageContext.request.contextPath}/award/insert"><h1>+</h1></a>
	</tfoot>
</table>

<script>
let awardBody = $("#awardBody");

let makeTrTag = function(award, index){
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/award/" + award.awardSn)
				.html(award.awardCompetition);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(award.awardName)
				, $("<td>").html(award.awardInstitution)
				, $("<td>").html(award.awardCategory)
			);
}

$.ajax({
	url : "${pageContext.request.contextPath}/award",
	method : "get",
	dataType : "json",
	success : function(resp) {
		console.log(resp);
		awardBody.empty();
		let dataList = resp.awardList;
		let trTags = [];
		if(dataList){
			$.each(dataList, function(index, award){
				trTags.push(makeTrTag(award, index));
			});
		}else{
			let tr = $("<tr>").html(
				$("<td>").attr("colspan", "7")
						.html("수상을 아직 등록하지 않았습니다.")
			);	
			trTags.push(tr);
		}
		awardBody.html(trTags);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>