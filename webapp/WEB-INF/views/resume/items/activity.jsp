<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<table class="table table-bordered">
	<thead>
		<tr>
			<th>번호</th>
			<th>주요활동명</th>
			<th>주요활동종류</th>
			<th>주요활동기간</th>
		</tr>
	</thead>
	<tbody id="activityBody">
	</tbody>
	<tfoot>
		<a href="${pageContext.request.contextPath}/activity/insert"><h1>+</h1></a>
	</tfoot>	
</table>

<script>
let activityBody = $("#activityBody");

let makeTrTag = function(act, index){
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/activity/" + act.actSn)
				.html(act.actName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(act.actCategory)
				, $("<td>").html(act.actPeriod)
			);
}

$.ajax({
	url : "${pageContext.request.contextPath}/activity",
	method : "get",
	dataType : "json",
	success : function(resp) {
		console.log(resp);
		activityBody.empty();
		let dataList = resp.activityList;
		let trTags = [];
		if(dataList){
			$.each(dataList, function(index, act){
				trTags.push(makeTrTag(act, index));
			});
		}else{
			let tr = $("<tr>").html(
				$("<td>").attr("colspan", "7")
						.html("주요활동을 아직 등록하지 않았습니다.")
			);	
			trTags.push(tr);
		}
		activityBody.html(trTags);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>