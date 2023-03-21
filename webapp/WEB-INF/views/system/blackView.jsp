<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">

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
				<span style="font-size: 40px;">블랙회원 정보</span>
			</div>
			<hr style="background-color: #5c667b; height: 2px;">
			<table>
			  	<tr>
				    <th scope="row">아이디</th>
				    <td>${black.memId }</td>
				    <th scope="row">가입일자</th>
				    <td>${black.seekerVO.memJoinDate }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">성명</th>
				    <td>${black.memName }</td>
				    <th scope="row">성별</th>
				    <td>${black.seekerVO.memGender }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">생년월일</th>
				    <td>${black.seekerVO.memBirth }</td>
				    <th scope="row">이메일</th>
				    <td>${black.seekerVO.memEmail }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">우편번호</th>
				    <td>${black.seekerVO.memZip }</td>
				    <th scope="row">연락처</th>
				    <td>${black.seekerVO.memTel }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">기본주소</th>
				    <td colspan="3">${black.seekerVO.memAddr1 }</td>
				</tr>
				<tr>
				    <th scope="row">상세주소</th>
				    <td colspan="3">${black.seekerVO.memAddr2 }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">상품구매금액합계</th>
				    <td>${black.seekerVO.memCarttotal }</td>
				    <th scope="row">다면평가점수</th>
				    <td>${black.seekerVO.memScore }</td>
			  	</tr>
			  	<tr>
			  		<th scope="row">블랙일자</th>
			  		<td colspan="3" style="color:red;">${black.blackVO.blackListDate }</td>
			  	</tr>
			  	<tr>
			  		<th scope="row">블랙사유</th>
			  		<td colspan="3" style="color:red;">${black.blackVO.blackListContent }</td>
			  	</tr>
			</table>
			<form:form modelAttribute="member" action="${pageContext.request.contextPath }/systemManagement/releaseBlack" name="bbb" method="post">
				<input type="hidden" name="memId" value="${black.memId }"/>
				<input type="hidden" name="blackListSn" value="${black.blackVO.blackListSn }"/>
			</form:form>
			<div class="row align-items-center mb-5">
				<div class="col-lg-4 ml-auto">
					<div class="row">
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" class="btn btn-block btn-primary btn-md" id="blackBtn" value="블랙해제" />
						</div>
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" 
								onclick="location.href='<c:url value="/systemManagement/memberList/blackList"/>'" 
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
	$('#blackBtn').click(function(){
		var flag = confirm("블랙해제 하시겠습니까?") 
		if(!flag){
			return;
		}
		document.bbb.submit(); //전자정부에서 많이씀
	});
	
</script>














