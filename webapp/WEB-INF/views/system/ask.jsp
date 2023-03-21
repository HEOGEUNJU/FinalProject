<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css"/>  

<style>
  .company_honest_qna .contents_container {
    width: 90%;
}

.wrap_community_topic .section_inner {
    width: 49%;
    height: 520px;
}

.wrap_community_topic .section_inner:nth-child(even) {
    float: left;
}
.company_honest_qna .contents_container {
    width: 95%;
}
</style>

<div id="sri_section" class="layout_full">
	<div id="sri_wrap">
		<div id="content">
			<div class="company_honest_qna">
				<div class="contents_container">
					<div class="wrap_story_panel">
						<div class="wrap_section wrap_community_topic" style="margin-top: 36px;">
							<div class="wrap_title">
								<h3 class="main_tit">문의 목록</h3>
							</div>
							<div class="wrap_slide_category">
								<div class="bx-wrapper" style="max-width: 1374px">
									<div class="bx-viewport" aria-live="polite" style=" width: 100%; overflow: hidden; position: relative; height: 50px;">
										<ul class="list_category js-category" style=" width: 11215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                        					<li aria-hidden="false" style=" float: left; list-style: none; position: relative; margin-right: 12px;">
                          						<a class="item_cate selected" href="<c:url value='/systemManagement/ask'/>">
													전체
												</a>
											</li>
                        					<li aria-hidden="false" style=" float: left; list-style: none; position: relative; width: 140px; margin-right: 12px;">
                          						<a class="item_cate" href="<c:url value='/systemManagement/ask'/>">
													고객문의목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 140px; margin-right: 12px;">
												<a class="item_cate" href="<c:url value='/systemManagement/ask'/>">
													취업상담목록
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
                			<div class="community_list">
                  				<div class="section_inner" style="margin-right:15px">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href="<c:url value='/systemManagement/ask'/>" >
                        						고객문의목록
                        					</a>
                      					</h4>
                      					<a href="<c:url value='/systemManagement/ask'/>" >
                      						더보기
                      					</a>
                    				</div>
                    				<div class="tblType">
	                    				<table>
	                    					<colgroup>
							            		<col width="70">
							          		</colgroup>
	                    					<thead>
	                    						<tr>
	                    							<th>번호</th>
	                    							<th>문의종류</th>
	                    							<th>제목</th>
	                    							<th>등록일</th>
	                    						</tr>
	                    					</thead>
	                    					<tbody id="ask_list">
	                    					</tbody>
	                    				</table>
                    				</div>
                  				</div>
                  				<div class="section_inner" style="">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href="<c:url value='/systemManagement/ask'/>">
                        						취업상담목록
                        					</a>
                      					</h4>
                      					<a href="<c:url value='/systemManagement/ask'/>">
                      						더보기
                      					</a>
                    				</div>
                    				<div class="tblType">
	                    				<table>
	                    					<colgroup>
							            		<col width="70">
							          		</colgroup>
		                    				<thead>
		                    					<tr>
		                    						<th>번호</th>
	                    							<th>문의종류</th>
	                    							<th>제목</th>
	                    							<th>등록일</th>
		                    					</tr>
		                    				</thead>
		                    				<tbody id="coun_list">
		                    				</tbody>
	                    				</table>
                    				</div>
                  				</div>
                			</div>
              			</div>
           			</div>
        		</div>
      		</div>
    	</div>
  	</div>
</div>


<form id="searchForm">
	<input type="hidden" name="page" />
</form>

<script type="text/javascript">

	let listBody = $("#ask_list");
	let listBody2 = $("#coun_list");
	
	let makeTrTag = function(ask){
		return $("<tr>").append(
			$("<td>").html(ask.rnum),
			$("<td>").html(ask.askType),
			$("<td>").append(
				$("<a>").attr("href","${pageContext.request.contextPath}/ask/detailAsk?askNo="+ask.askNo).html(ask.askTitle)
			),
			$("<td>").html(ask.askDate)
		);
	}
	
	let makeNewTag = function(coun){
		return $("<tr>").append(
			$("<td>").attr("class","count").html(coun.rnum)
			, $("<td style='text-align: center;'>").attr("class","category").html(coun.memName)
			, $("<td style='text-align: center;'>").attr("class","content_tit").append(
				$("<a class='viewHref'>")
//	 			.attr("href","${prePath}/lab/counseling/view/CS"+coun.counNo)
				.attr("href","${pageContext.request.contextPath}/lab/counseling/view/"+coun.counNo)
				.html(coun.counTitle)
				.data("counNo",coun.counNo)
				.data("memId",coun.memId)
				.data("pubChk",coun.pubChk)
			)
			, $("<td>").attr("class","date").html(coun.counDate)
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
				listBody2.empty();
				searchForm[0].page.value="";

				let pagingVO = resp.askList;
				let pagingVO2 = resp.counList;

				let dataList = pagingVO.dataList;
				let dataList2 = pagingVO2.dataList;
				
				let trTags = [];
				let newTags = [];
				if(dataList != null && dataList != ""){
					let i = 0;
					$.each(dataList, function(index, ask){
						trTags.push(makeTrTag(ask));
						i = i + 1;
						if(i == 8)
							return false;
					});
				}else{
					let tr = $("<tr>").html(
						$("<td>").attr("colspan", "4").html("문의게시글 없음.")
					);
					trTags.push(tr);
				}
				listBody.html(trTags);
				
				if(dataList2){
					let i = 0;
					$.each(dataList2, function(index, coun){
						if(coun.counTitle.length > 14){
							coun.counTitle = coun.counTitle.substring(0 , 14)+"....."
						}
						if(coun.isAttached>0){
							coun.counTitle = coun.counTitle +'<i class="bi bi-paperclip"></i>';
						}
						if(coun.pubChk=='N'){
							coun.counTitle = '<i class="bi bi-lock-fill"></i>      '+coun.counTitle;
						}	
						console.log(coun.counTitle.length);
						newTags.push(makeNewTag(coun));
						i = i + 1;
						if(i == 8)
							return false;
					});
				}else{
					let tr = $("<tr>").html(
						$("<td>").attr("colspan", "4").html("조건에 맞는 공고 없음.")
					);   
					newTags.push(tr);
				}
				listBody2.html(newTags);
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	}).submit();


</script>
