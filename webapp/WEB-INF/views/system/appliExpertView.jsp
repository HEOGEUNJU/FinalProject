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
			<form:form modelAttribute="expert" name="acc" action='${pageContext.request.contextPath }/systemManagement/acceptManagement/updateAcceptExp' method="post">
				<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
					<span style="font-size: 40px;">전문가 신청</span>
					<input type="hidden" name="memId" value="${expert.memId }"/>
					<input type="hidden" id="memEmail" value="${expert.seekerVO.memEmail }"/>
				</div>
				<hr style="background-color: #5c667b; height: 2px;">
				<p class="pf">신청자</p>
				<table>
				  	<tr>
					    <th scope="row">아이디</th>
					    <td>${expert.memId }</td>
					    <th scope="row">신청일자</th>
					    <td>${fn:substring(expert.expertVO.expertAppliDate,0,10) }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">성명</th>
					    <td>${expert.memName }</td>
					    <th scope="row">성별</th>
					    <td>${expert.seekerVO.memGender }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">생년월일</th>
					    <td>${expert.seekerVO.memBirth }</td>
					    <th scope="row">이메일</th>
					    <td>${expert.seekerVO.memEmail }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">연락처</th>
					    <td>${expert.seekerVO.memTel }</td>
					    <th scope="row">직업</th>
					    <td>${expert.expertVO.expertField }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">분야</th>
					    <td>${expert.expertVO.exfieldName }</td>
					    <th scope="row">직종</th>
					    <td>${expert.expertVO.exjobName }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">사업장 우편번호</th>
					    <td>${expert.expertVO.expertZip }</td>
					    <th scope="row">태그</th>
					    <td>${expert.expertVO.expertTag }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">사업장 기본주소</th>
					    <td colspan="3">${expert.expertVO.expertAddr }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">사업장 상세주소</th>
					    <td colspan="3">${expert.expertVO.expertAddr2 }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">고객센터 전화번호</th>
					    <td>${expert.expertVO.expertTel }</td>
					    <th scope="row">고객센터 이메일</th>
					    <td>${expert.expertVO.expertEmail }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">은행</th>
					    <td>${expert.expertVO.expertBank }</td>
					    <th scope="row">계좌번호</th>
					    <td>${expert.expertVO.expertAccount }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">가입경로</th>
					    <td colspan="3">${expert.expertVO.expertJoinpath }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">한줄소개</th>
					    <td colspan="3">${expert.expertVO.expertIntroduction }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">첨부파일</th>
<%-- 					    <td colspan="3"><button id="pdfBtn" class="${files[0].attStreCours}" name="${files[0].attSavename}">${files[0].attFilename}</button></td> --%>
					    <td colspan="3">
					    	<c:forEach items="${files }" var="files">
						    	<a style="color: #0D6EFD;" href="<c:url value='/systemManagement/fileDownLoad?tblId=${files.tblId }'/>">${files.attFilename }</a>
						    	<span>${files.attFancysize }</span>
					    	</c:forEach>
					    </td>
				  	</tr>
				</table>
				<div class="row align-items-center mb-5">
					<div class="col-lg-4 ml-auto">
						<div class="row">
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" class="btn btn-block btn-primary btn-md" id="acceptBtn" value="승인" onclick="Confirm();"/>
							</div>
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" class="btn btn-block btn-primary btn-md" id="mail-Check-Btn"  value="반려" />
							</div>
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" 
									onclick="location.href='<c:url value="/systemManagement/acceptManagement/appliExpertList"/>'" 
									class="btn btn-block btn-primary btn-md" 
									value="목록으로" />
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<form:form action="${pageContext.request.contextPath }/systemManagement/deleteAppliExp" name="frm" method="post">
				<input type="hidden" name="memId" value="${expert.memId }"/>
			</form:form>
		</div>
	</div>
</section>



<script>
	// pdf 보여주기
	/* $("#pdfBtn").on("click", function() {
		let file = $(this).attr("name");
		let path = $(this).attr("class");
		
		window.open("${pageContext.request.contextPath}/systemManagement/showPdf?file=" + file);
	}); */

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
	/* $('#acceptBtn').click(function(){
		const email = $('#memEmail').val();
		console.log('완성된 이메일 : ' + email);
		var flag = confirm("승인하시겠습니까?") 
		if(!flag){
			return;
		}
		$.ajax({
			type : 'get',
			url : '<c:url value="/acceptMail?email="/>'+email,
			success : function(data){
				console.log("data : " + data);
				alert('성공적으로 승인되었습니다.');
				document.acc.submit(); //전자정부에서 많이씀
			}
		});
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












