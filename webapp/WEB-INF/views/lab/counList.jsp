<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자         수정내용
* ----------  ---------  -----------------
* 2023. 2. 19.  양서연         최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<c:set  var="prePath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${prePath}/resources/css/style.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/components.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/help.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${prePath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/layout.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal" var="memberVOWrapper"/>
	<security:authentication property="principal.realMember" var="authMember"/>
	<c:set value="${authMember.memId}" var="memId" />
	<c:set value="${authMember.memAuthCd}" var="memAuthCd" />
	<input type="hidden" id="mem" data-mem="${authMember.memId}" />
</security:authorize>
<body id="top">
	<div class="site-wrap">
		<!-- 작성 -->
		<div id="sri_section" class="has_banner">
			<div id="sri_wrap">
				<div id="content">
					<div class="wrap_title_recruit">
						<h1 class="title_common">취업 상담</h1>
					</div>
					<div class="wrap_board wrap_help">
						<p class="copy">
							평일 09시 에서 17시 까지 문의하신 내용은 당일 답변해드립니다.<br> 17시 이후에 문의하신 내용은
							다음날에 답변, 주말에 문의하신 내용은 그 다음주 월요일에 답변해 드립니다.
						</p>
						<div class="company_honest_qna">
							<div class="qna_list_wrap">
								<div class="qna_list_sort">
									<security:authorize access="hasAnyRole('SEEKER','INCRUITER','EXPERT')">
										<div class="icoChk_outline filter">
											<security:authentication property="principal" var="memberVOWrapper"/>
											<security:authentication property="principal.realMember" var="authMember"/>
											<span class="inpChk icoChk">
												<input type="checkbox" id="myBoard" class="btn_sort" value="myBoard"> 
												<label class="lbl" for="myBoard">내 글 보기</label>
											</span>
										</div>
									</security:authorize>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<div class="icoChk_outline filter">
											<span class="inpChk icoChk">
												<input type="checkbox" id="notAnsweredBoard" class="btn_sort" value="notAnsweredBoard" > 
												<label class="lbl" for="notAnsweredBoard">답변대기중인 글 보기</label>
											</span>
										</div>
									</security:authorize>
								</div>
							</div>
						</div>
						<div class="tblType">
							<table>
								<colgroup>
									<col style="width: 100px">
									<col style="width: 210px">
									<col>
									<col style="width: 100px">
									<col style="width: 90px">
								</colgroup>
								<tbody id="ask_list" >
									<tr>
										<td class="count">문의번호</td>
										<td class="category" style="text-align: center;">작성자</td>
										<td class="content_tit" style="text-align: center;">제목</td>
										<td class="date">등록일</td>
										<td class="status end">처리상태</td>
									</tr>
								</tbody>
								<tbody id="listBody"></tbody>
							</table>
						</div>
						<div class="area_btn">
							<a href="${prePath}/lab/counseling/insert" class="btn_basic_type01 btn_list" title="글쓰기">
								글쓰기
							</a>
						</div>
						<!-- 페이징 -->
						<div class="pagingArea"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form:form id="searchForm" modelAttribute="searchVO" method="get">
		<input type="hidden" name="page" />
		<input type="hidden" name="searchType" />
		<input type="hidden" name="searchWord" />
	</form:form>	
<script>
/* 페이징 */
let listBody = $("#listBody");
   
let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
	event.preventDefault();
	let page = $(this).data("page");
	if(!page) return false;
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
	return false;
});

let makeNewTag = function(coun){
	return $("<tr>").append(
		$("<td>").attr("class","count").html(coun.counNo)
		, $("<td style='text-align: center;'>").attr("class","category").html(coun.memName)
		, $("<td style='text-align: center;'>").attr("class","content_tit").append(
			$("<a class='viewHref'>")
// 			.attr("href","${prePath}/lab/counseling/view/CS"+coun.counNo)
			.attr("href","#")
			.html(coun.counTitle)
			.data("counNo",coun.counNo)
			.data("memId",coun.memId)
			.data("pubChk",coun.pubChk)
		)
		, $("<td>").attr("class","date").html(coun.counDate)
		, $("<td>").attr("class","status end").html(coun.counState)
	)
};

let searchForm = $("#searchForm").on("submit", function(event){
	event.preventDefault();
	let url = this.action;
	let method = this.method;
	let queryString = $(this).serialize();
	$.ajax({
		url : url,
		method : method,
		data : queryString,
		dataType : "json",
		success : function(resp) {
			listBody.empty();
			pagingArea.empty();
			searchForm[0].page.value="";
			let pagingVO = resp.pagingVO;
			let dataList = pagingVO.dataList;
			
			let newTags = [];
			if(dataList){
				$.each(dataList, function(index, coun){
					if(coun.isrefed==0){
						coun.counState = '답변대기중';
					} else {
						coun.counState = '답변완료';
					}
					coun.counNo = coun.counNo.substring(2);
					if(coun.isAttached>0){
						coun.counTitle = coun.counTitle +'<i class="bi bi-paperclip"></i>';
					}
					if(coun.pubChk=='N'){
						coun.counTitle = '<i class="bi bi-lock-fill"></i>      '+coun.counTitle;
					}					
					newTags.push(makeNewTag(coun));
				});
			}else{
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "7").html("조건에 맞는 공고 없음.")
				);   
				newTags.push(tr);
			}
			listBody.html(newTags);
			if(resp.pagingHTML)
				pagingArea.html(resp.pagingHTML);  
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return false;
}).submit();

// 내 글 보기
// 페이징 처리
let myBoard = $("#myBoard").on("change",function(){
	if(myBoard.is(":checked")){
		$("[name=searchType]").val("memId");
		$("[name=searchWord]").val(`${authMember.memId}`);
	} else {
		$("[name=searchType]").val(null);
		$("[name=searchWord]").val(null);
	}
	searchForm.submit();
});

// 답변 대기중인 글 보기
// 페이징 처리
let notAnsweredBoard = $("#notAnsweredBoard").on("change",function(){
	if(notAnsweredBoard.is(":checked")){
		$("[name=searchType]").val("isrefed");
	} else {
		$("[name=searchType]").val(null);
	}
	searchForm.submit();
});
if(notAnsweredBoard.is(":checked")){
	notAnsweredBoard.trigger("change");
}

//비공개 게시글 클릭이벤트
$(document).on("click",".viewHref",function(event){
	event.preventDefault();
	let viewHref = $(this);
	let authMemId = `${memId}`;
	let memAuthCd = `${memAuthCd}`;
	let counNo = viewHref.data('counNo');
	let memId = viewHref.data('memId');
	let pubChk = viewHref.data('pubChk');
	if(pubChk=='N' && memId!=authMemId && memAuthCd!='ROLE_ADMIN'){
		Swal.fire('비공개 게시물입니다.');
	} else {
		location.href = '${prePath}/lab/counseling/view/CS'+counNo;
	}
});

</script>