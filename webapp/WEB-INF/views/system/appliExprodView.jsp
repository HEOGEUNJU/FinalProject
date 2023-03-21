<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
.pf {
 	font-size: 24px; 
}
.radiuss{
	border : 1px solid #eaedf4;
	border-radius: 12px;
	padding: 80px 99px 100px 99px;
}
.table1 {
  	width: 100%;
  	height: 180px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
}
.table2 {
  	width: 100%;
  	height: 600px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
}
th{
	background: #f7f7f7;
	border-bottom: 1px solid #eaedf4;
  	padding: 10px;
  	width: 155px;
} 
td {
  	border-bottom: 1px solid #eaedf4;
  	padding: 20px;
  	width: 393px;
}
</style>

<section class="site-section">
	<div class="container" >
		<div class="radiuss">
			<form:form modelAttribute="exprod" name="acc" action='${pageContext.request.contextPath }/systemManagement/acceptManagement/updateAcceptProd' method="post">
				<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
					<span style="font-size: 40px;">상품 신청</span>
					<input type="hidden" name="exprodId" value="${exprod.exprodId }"/>
					<input type="hidden" id="memEmail" value="${exprod.memEmail }" />
				</div>
				<hr style="background-color: #5c667b; height: 2px;">
				<p class="pf">신청자</p>
				<table class="table1">
				  	<tr>
					    <th scope="row">아이디</th>
					    <td>${exprod.memId }</td>
					    <th scope="row">신청일자</th>
					    <td>${fn:substring(exprod.exprodAppliDate,0,10) }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">성명</th>
					    <td>${exprod.memName }</td>
					    <th scope="row">이메일</th>
					    <td>${exprod.memEmail }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">연락처</th>
					    <td>${exprod.memTel }</td>
					    <th scope="row">직업</th>
					    <td>${exprod.expertField }</td>
				  	</tr>
			  	</table>
			  	<br>
			  	<p class="pf">상품 정보</p>
			  	<table class="table2">
				  	<tr>
					    <th scope="row">시작일</th>
					    <td>${fn:substring(exprod.exprodStart,0,10) }</td>
					    <th scope="row">종료일</th>
					    <td>${fn:substring(exprod.exprodEnd,0,10) }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">대상</th>
					    <td>${exprod.exprodTarget }</td>
					    <th scope="row">상품명</th>
					    <td>${exprod.exprodName }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">상품구분</th>
					    <td>
					    	<c:if test="${exprod.exlprodId eq 'EL001'}">
								클래스					    	
					    	</c:if>
					    	<c:if test="${exprod.exlprodId eq 'EL002'}">
								컨설팅					    	
					    	</c:if>
					    </td>
					    <th scope="row">이용방법</th>
					    <td>${exprod.exprodWay }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">시간</th>
					    <td>${exprod.exprodTime }</td>
					    <th scope="row">상품가격</th>
					    <td>${exprod.exprodPrice }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">상세설명</th>
					    <td colspan="3">${exprod.exprodDetail }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">전문가 포부</th>
					    <td colspan="3">${exprod.exprodPr }</td>
				  	</tr>
				</table>
				<div class="row align-items-center mb-5">
					<div class="col-lg-4 ml-auto">
						<div class="row">
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" class="btn btn-block btn-primary btn-md" id="acceptBtn" onclick="Confirm();" value="승인" />
							</div>
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" class="btn btn-block btn-primary btn-md" id="mail-Check-Btn"  value="반려" />
							</div>
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" 
									onclick="location.href='<c:url value="/systemManagement/acceptManagement/appliProdList"/>'" 
									class="btn btn-block btn-primary btn-md" id="mail-Check-Btn"
									value="목록으로" />
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<form:form action="${pageContext.request.contextPath }/systemManagement/deleteAppliProd" name="frm" method="post">
				<input type="hidden" name="exprodId" value="${exprod.exprodId }"/>
			</form:form>
		</div>
	</div>
</section>

<script>
	//반려
	$('#mail-Check-Btn').click(function(){
		const email = $('#memEmail').val();
		console.log('완성된 이메일 : ' + email);
		var flag = confirm("한번 반려된 데이터는 복구불가합니다.\n반려하시겠습니까?") 
		if(!flag){
			return;
		}
		$.ajax({
			type : 'get',
			url : '<c:url value="/returnMail?email="/>'+email,
			success : function(data){
				console.log("data : " + data);
				alert('성공적으로 반려되었습니다.');
				document.frm.submit(); //전자정부에서 많이씀
			}
		});
	});
	
	//승인
// 	$('#acceptBtn').click(function(){
// 		const email = $('#memEmail').val();
// 		console.log('완성된 이메일 : ' + email);
// 		var flag = confirm("승인하시겠습니까?") 
// 		if(!flag){
// 			return;
// 		}
// 		$.ajax({
// 			type : 'get',
// 			url : '<c:url value="/acceptMail?email="/>'+email,
// 			success : function(data){
// 				console.log("data : " + data);
// 				alert('성공적으로 승인되었습니다.');
// 				document.acc.submit(); //전자정부에서 많이씀
// 			}
// 		});
// 	});
	
	var confirm = function(msg, title, resvNum) {
		swal({
			title : title,
			text : msg,
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "예",
			cancelButtonText : "아니오",
			closeOnConfirm : false,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				swal('', '승인되었습니다.', "success");
				setTimeout(function () {
					document.acc.submit();
				}, 1500);
			}else{
				return;
			}

		});
	}

	function Confirm() {
		confirm('', '승인할까요?');
	}
	
	
	
</script>


























