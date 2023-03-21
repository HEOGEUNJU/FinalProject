<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
    <div class="container-margin">
        <div class="find-result-wrap">
            <h4 class="find-title">회원님의 비밀번호를 재설정 해주세요</h4>
            <c:choose>
                <c:when test="${count == 0}">
					등록된 가입 정보가 없습니다. <br>
					입력한 정보를 다시 한 번 확인해주세요.
                </c:when>

                <c:otherwise>
                <!-- submit하면 수정되고 변경완료 알러트 띄우고 로그인페이지로 이동 -->
	                <form action='<c:url value="updatePw"/>' method="post">
			        	<div>
				        	<div>
<%-- 				        		<input type="text" name="memId" value="<%=request.getAttribute("memId")%>" readonly/> --%>
				        		<input type="text" name="memId" value="${memId}" readonly/>
				        	</div>
			        		<div>
			        			<label>변경할 비밀번호</label>
				        		<input type="password" id="pw" name="memPass" required/>
			        		</div>
			        		<div>
			        			<label>변경할 비밀번호 재확인</label>
				        		<input type="password" id="confirmPw" required/>
			        		</div>
			        	</div>
			        	<input type="submit" value="변경"/>
		        	</form>
                </c:otherwise>
            </c:choose>
            <div class="find-result-btn-box">
                <button type="button" onclick="location.href='<c:url value="/"/>'">홈</button>
                <button type="button" class="find-result-btn-login" onclick="location.href='<c:url value="/login/loginForm"/>'">로그인</button>
            </div>
        </div>
    </div>
</div>

<script>
var pw = document.getElementById("pw")
var confirmPw = document.getElementById("confirmPw");

function validatePassword(){
	if(pw.value != confirmPw.value) {
	  confirmPw.setCustomValidity("비밀번호가 일치하지 않습니다.");
	} else {
	  confirmPw.setCustomValidity(''); // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
	}
}

pw.onchange = validatePassword;
confirmPw.onkeyup = validatePassword;
</script>