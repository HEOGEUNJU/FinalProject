<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-bordered">
	<thead>
		<tr>
			<th>번호</th>
			<th>자격증명</th>
			<th>시행부처</th>
			<th>발급일</th>
		</tr>
	</thead>
	<tbody id="certBody">
	</tbody>
	<tfoot>
		<a href="${pageContext.request.contextPath}/certification/insert"><h1>+</h1></a>
	</tfoot>	
</table>

<script>
let certBody = $("#certBody");

let makeTrTag = function(cert, index){
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/certification/" + cert.certSn)
				.html(cert.certName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(cert.certInstitution)
				, $("<td>").html(cert.certDate)
			);
}

$.ajax({
	url : "${pageContext.request.contextPath}/certification",
	method : "get",
	dataType : "json",
	success : function(resp) {
		console.log(resp);
		certBody.empty();
		let dataList = resp.certificationList;
		let trTags = [];
		if(dataList){
			$.each(dataList, function(index, cert){
				trTags.push(makeTrTag(cert, index));
			});
		}else{
			let tr = $("<tr>").html(
				$("<td>").attr("colspan", "7")
						.html("자격증을 아직 등록하지 않았습니다.")
			);	
			trTags.push(tr);
		}
		certBody.html(trTags);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>