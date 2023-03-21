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
table {
  	width: 100%;
  	height: 400px;
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
			<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
				<span style="font-size: 40px;">차단회원 정보</span>
			</div>
			<hr style="background-color: #5c667b; height: 2px;">
			<table>
			  	<tr>
				    <th scope="row">아이디</th>
				    <td>${cut.memId }</td>
				    <th scope="row">가입일자</th>
				    <td>${cut.seekerVO.memJoinDate }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">성명</th>
				    <td>${cut.memName }</td>
				    <th scope="row">성별</th>
				    <td>${cut.seekerVO.memGender }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">생년월일</th>
				    <td>${cut.seekerVO.memBirth }</td>
				    <th scope="row">이메일</th>
				    <td>${cut.seekerVO.memEmail }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">우편번호</th>
				    <td>${cut.seekerVO.memZip }</td>
				    <th scope="row">연락처</th>
				    <td>${cut.seekerVO.memTel }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">기본주소</th>
				    <td colspan="3">${cut.seekerVO.memAddr1 }</td>
				</tr>
				<tr>
				    <th scope="row">상세주소</th>
				    <td colspan="3">${cut.seekerVO.memAddr2 }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">상품구매금액합계</th>
				    <td>${cut.seekerVO.memCarttotal }</td>
				    <th scope="row">다면평가점수</th>
				    <td>${cut.seekerVO.memScore }</td>
			  	</tr>
			  	<tr>
			  		<th scope="row">차단일자</th>
			  		<td colspan="3" style="color:red;">${cut.cutVO.cutDate }</td>
			  	</tr>
			  	<tr>
			  		<th scope="row">차단사유</th>
			  		<td colspan="3" style="color:red;">${cut.cutVO.cutContent }</td>
			  	</tr>
			</table>
			<form:form modelAttribute="member" action="${pageContext.request.contextPath }/systemManagement/releaseCut" name="ccc" method="post">
				<input type="hidden" name="memId" value="${cut.memId }"/>
				<input type="hidden" name="cutSn" value="${cut.cutVO.cutSn }"/>
			</form:form>
			<div class="row align-items-center mb-5">
				<div class="col-lg-4 ml-auto">
					<div class="row">
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" class="btn btn-block btn-primary btn-md" id="cutBtn" onclick="Confirm();" value="차단해제" />
						</div>
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" 
								onclick="location.href='<c:url value="/systemManagement/memberList/cutList"/>'" 
								class="btn btn-block btn-primary btn-md" 
								value="목록으로" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>

	//해제
	/* $('#cutBtn').click(function(){
		var flag = confirm("차단해제 하시겠습니까?") 
		if(!flag){
			return;
		}
		document.ccc.submit(); //전자정부에서 많이씀
	}); */
	
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
				swal('', '해제되었습니다.', "success");
				setTimeout(function () {
					document.ccc.submit();
				}, 1500);
			}else{
				return;
			}

		});
	}

	function Confirm() {
		confirm('', '차단해제 하시겠습니까?');
	}
	
</script>














