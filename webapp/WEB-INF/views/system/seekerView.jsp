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


.modal {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
  display: block;
}

.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 800px;
  height: 600px;

  /* padding: 40px; */

  /* text-align: center; */

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}
.m_head{
  height: 10%;
  padding: 20px;
  display: flex;
  justify-content: space-between;
  background-color:#e7e5e5;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
.m_body{
  height: 80%;
  padding: 20px;
}
.m_footer{
  height: 10%;
  padding: 15px;
  background-color:#e7e5e5;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  display: flex;
  justify-content: end;
}
.modal_title{
  font-size: 18px;
  color: gray;
  font-weight: 500;
}
.close_btn{
  font-size: 20px;
  color: rgb(139, 139, 139);
  font-weight: 900;
  cursor: pointer;
}
.modal_label{
  padding-top: 10px;
}
.input_box[readonly]{
  width: 100%;
  border: 1px solid rgb(189, 189, 189);
  height: 30px;
  background-color: #e9ecef;
  opacity: 1;
}
.textBox{
	width: 100%;
  border: 1px solid rgb(189, 189, 189);
  height: 300px;
}
.modal_btn{
  width: 80px;
  height: 30px;
  border-radius: 5px;
  text-align: center;
  font-size: 14px;
  font-weight: bolder;
  padding-top: 5px;
  margin-left: 5px;
  font-family: sans-serif;
}
.cancle{
  background-color: white;
  color: black;
}
.save{
  background-color: rgb(50, 77, 158);
  color: white;
}

</style>

<section class="site-section">
	<div class="container" >
		<div class="radiuss">
			<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
				<span style="font-size: 40px;">일반회원 정보</span>
			</div>
			<hr style="background-color: #5c667b; height: 2px;">
			<table>
			  	<tr>
				    <th scope="row">아이디</th>
				    <td>${seeker.memId }</td>
				    <th scope="row">가입일자</th>
				    <td>${seeker.seekerVO.memJoinDate }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">성명</th>
				    <td>${seeker.memName }</td>
				    <th scope="row">성별</th>
				    <td>${seeker.seekerVO.memGender }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">생년월일</th>
				    <td>${seeker.seekerVO.memBirth }</td>
				    <th scope="row">이메일</th>
				    <td>${seeker.seekerVO.memEmail }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">우편번호</th>
				    <td>${seeker.seekerVO.memZip }</td>
				    <th scope="row">연락처</th>
				    <td>${seeker.seekerVO.memTel }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">기본주소</th>
				    <td colspan="3">${seeker.seekerVO.memAddr1 }</td>
				</tr>
				<tr>
				    <th scope="row">상세주소</th>
				    <td colspan="3">${seeker.seekerVO.memAddr2 }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">상품구매금액합계</th>
				    <td>${seeker.seekerVO.memCarttotal }</td>
				    <th scope="row">다면평가점수</th>
				    <td>${seeker.seekerVO.memScore }</td>
			  	</tr>
			</table>
			<div class="row align-items-center mb-5">
				<div class="col-lg-4 ml-auto">
					<div class="row">
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" class="btn btn-block btn-primary btn-md" id="cutBtn" value="차단" />
						</div>
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" class="btn btn-block btn-primary btn-md" id="blackBtn" value="블랙" />
						</div>
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" 
								onclick="location.href='<c:url value="/systemManagement/memberList/seekerList"/>'" 
								class="btn btn-block btn-primary btn-md" 
								value="목록으로" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 차단 모달 -->
<form:form modelAttribut="member" name="frm" action='${pageContext.request.contextPath }/systemManagement/insertCut' method="post">
	<div class="modal" id="modalCut">
	  <div class="modal_body">
	    <div class="m_head">
	      <div class="modal_title">차단하기</div>
	      <div class="close_btn" id="close_btn">X</div>
	    </div>
	    <div class="m_body">
	      <div class="modal_label">아이디</div>
	      <input type="text" class="input_box" id="name_box" name="memId" value="${seeker.memId }" readonly/>
	      <div class="modal_label">차단 사유</div>
	      <textarea class="textBox" id="des_box" name="cutContent"></textarea>
	    </div>
	    <div class="m_footer">
	      <input type="button" class="modal_btn save" id="save_btn" onclick="Confirm();" value="저장"/>
	      <div class="modal_btn cancle" id="close_btn">취소</div>
	    </div>
	  </div>
	</div>    
</form:form>

<!-- 블랙 모달 -->
<form:form modelAttribut="member" name="fb" action='${pageContext.request.contextPath }/systemManagement/insertBlack' method="post">
	<div class="modal" id="modalBlack">
	  <div class="modal_body">
	    <div class="m_head">
	      <div class="modal_title">블랙리스트 추가</div>
	      <div class="close_btn" id="close_btn">X</div>
	    </div>
	    <div class="m_body">
	      <div class="modal_label">아이디</div>
	      <input type="text" class="input_box" id="name_box" name="memId" value="${seeker.memId }" readonly/>
	      <div class="modal_label">블랙 사유</div>
	      <textarea class="textBox" id="des_box" name="blackListContent"></textarea>
	    </div>
	    <div class="m_footer">
	      <input type="button" class="modal_btn save" id="save_black_btn" value="저장"/>
	      <div class="modal_btn cancle" id="close_btn">취소</div>
	    </div>
	  </div>
	</div>    
</form:form>

<script>
	//차단 모달 열기
	$(document).on('click', '#cutBtn', function (e) {
	  console.log("click event");
	  $('#modalCut').addClass('show');
	
	});
	
	//블랙 모달 열기
	$(document).on('click', '#blackBtn', function (e) {
	  console.log("click event");
	  $('#modalBlack').addClass('show');
	
	});
	
	// 모달 닫기
	$(document).on('click', '#close_btn', function (e) {
	  console.log("click event");
	  $('.modal').removeClass('show');
	
	});

	//차단하기
	/* $('#save_btn').click(function(){
		$('#modal').removeClass('show');
		setTimeout(function () {
			  alert("차단 되었습니다.");
			}, 500);
		setTimeout(function () {
			document.frm.submit();
		}, 1500);
	}); */
	
	//블랙리스트 추가하기
	$('#save_black_btn').click(function(){
		$('#modal').removeClass('show');
		setTimeout(function () {
			  alert("블랙리스트에 추가 되었습니다.");
			}, 500);
		setTimeout(function () {
			document.fb.submit();
		}, 1500);
	});
	
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
				$('#modal').removeClass('show');
				swal('', '차단되었습니다.', "success");
				setTimeout(function () {
					document.frm.submit();
				}, 1500);
			}else{
				return;
			}

		});
	}

	function Confirm() {
		confirm('', '차단 하시겠습니까?');
	}
	
	
</script>














