<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />

<!-- CSS -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ftco-32x32.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<style type="text/css">
.inpSel>select {padding: 2px 36px 4px 12px;width: 100%;min-width: 80px;height: 40px;border: 1px solid #d7dce5;border-radius: 4px;box-sizing: border-box;color: #5c667b;font-size: 14px;letter-spacing: -1px;line-height: 20px;text-align: left;vertical-align: top;background: #fff url(//www.saraminimage.co.kr/sri/person/bg/bg_select_default.png) no-repeat right 12px top 50%;cursor: pointer;-webkit-appearance: none;-moz-appearance: none;}
</style>
</head>
<body id="top">
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.realMember" var="memberVO"/>
</security:authorize>
<input type="hidden" id="boardNo" value="${board.boardNo}">
<input type="hidden" id="memId" value="${memId}">
	<!-- 작성 -->
	<div id="sri_section" class=" layout_full ">
		<div id="sri_wrap">
			<div id="content">
				<div class="company_honest_qna">
					<div class="contents_container detail_wrap">
						<a href="${pageContext.request.contextPath }/board/boardTotal" class="btn_back_list" onmousedown="DETAILPAGE.Detail.gaEvent('qst_detail', 'resume_total')">전체 게시글</a>

						<!-- 게시글 상단 -->
						<div class="post_view_wrap">
							<div class="post_top">
								<h1 class="qna_subject">${board.boardTitle }</h1>

								<div class="post_btns">
									<c:url value="/board/boardUpdate" var="viewURL">
										<c:param name="what" value="${board.boardNo }" />
									</c:url>

								<input type="hidden" name="memId" value="${memId}" />
								<%-- <p>${board.memId } vs ${memId}</p> --%>
									<c:if test="${board.memId == memId}">
										<a href="${viewURL}" class="btns btnSizeXS colorBlueReverse">수정</a>
										<form action="${pageContext.request.contextPath}/board/boardDelete" method="post" class="btns  btnSizeXS colorGrayReverse">
											<input type="hidden" name="boardNo" value="${board.boardNo }"/>
											<button type="submit" onclick="return check_submit();">삭제</button>
										</form>
									</c:if>
								</div>
							</div>

							<!-- 게시글 정보 -->
							<div class="post_infos">
								<div class="post_profile">
									<div class="profile_pic_wrap">
										<a href="#" target="_blank">
											<div class="profile_pic profile1">
												<svg><img src="${pageContext.request.contextPath}/resources/images/noImage.png"></img></svg>
											</div>
										</a>
									</div>
									<span class="nickname">
										<security:authorize access="hasRole('ROLE_ADMIN')">
											<a href="<c:url value='/systemManagement/memberList/seekerList/${board.memId }'/>">
												${board.memId }
											</a>
										</security:authorize>
										<security:authorize access="hasAnyRole('ROLE_SEEKER','ROLE_INCRUITER','ROLE_EXPERT')">
												${board.memId }
										</security:authorize>
									</span>
									<span class="post_date">${board.boardDate } 작성</span>
								</div>
								<div class="post_data_wrap">
									<span class="qna_info qna_like likeTotalCount">${board.likeCnt }</span>
									<span class="qna_info qna_reply">${board.replyCnt }</span>
								</div>
							</div>

							<!-- 게시글 내용 -->
							<div class="post_cont">
								<div>${board.boardContent }</div>
								<c:forEach var="i" begin="0" end="4">
									<img style="max-width: 100%;" alt="${board.attatchList[i].attFilename}"
									src='<spring:url value="/image/boardFolder/${board.attatchList[i].attSavename}"/>'/>
								</c:forEach>
							</div>

							<!-- 게시글 이모티콘 -->
							<ul class="post_emoticon">
								<li>
									<!-- 감정버튼을 누르면 class가 기본class+on으로 바뀜 -->
									<c:choose>
										<c:when test="${likeOn eq 1}">
											<button type="button" class="emotion like on" data-like-type="1" name="like"></button>
										</c:when>
										<c:otherwise>
											<button type="button" class="emotion like" data-like-type="1" name="like"></button>
										</c:otherwise>
									</c:choose>
										<span class="sympathy_result">좋아요<br> <strong id="like">${board.like }</strong></span>
								</li>
								<li>
									<c:choose>
										<c:when test="${likeOn eq 2}">
											<button type="button" class="emotion fun on" data-like-type="2" name="fun"></button>
										</c:when>
										<c:otherwise>
											<button type="button" class="emotion fun" data-like-type="2" name="fun"></button>
										</c:otherwise>
									</c:choose>
										<span class="sympathy_result">재밌어요<br> <strong id="fun">${board.fun }</strong></span>
								</li>
								<li>
									<c:choose>
										<c:when test="${likeOn eq 3}">
											<button type="button" class="emotion help on" data-like-type="3" name="help"></button>
										</c:when>
										<c:otherwise>
											<button type="button" class="emotion help" data-like-type="3" name="help"></button>
										</c:otherwise>
									</c:choose>
										<span class="sympathy_result">도움돼요<br> <strong id="help">${board.help }</strong></span>
								</li>
								<li>
									<c:choose>
										<c:when test="${likeOn eq 4}">
											<button type="button" class="emotion cheer on" data-like-type="4" name="cheer"></button>
										</c:when>
										<c:otherwise>
											<button type="button" class="emotion cheer" data-like-type="4" name="cheer"></button>
										</c:otherwise>
									</c:choose>
										<span class="sympathy_result">힘내요<br> <strong id="cheer">${board.cheer }</strong></span>
								</li>
							</ul>
						</div>

						<!-- -------------------------------------- 댓글 등록 시작 -------------------------------------- -->
						<form class="qna_answer_form" name="qna_answer_form" method="post" action="${pageContext.request.contextPath}/reply/replyInsert">
							<div class="comment_input_wrap">
								<div class="comment_input img_add">
									<span class="nickname">${memberVO.memId}</span>
									<input type="hidden" name="boardNo" value="${param.boardNo}" />
									<input type="hidden" name="memId" value="${memId}" />
									<textarea name="replyContent" id="contents"
										<c:if test="${memberVO.memId==null}">readonly</c:if>
									 class="scrollbar" placeholder="“나도 이런 고민했었지, 라떼는 말이야~” 위 고민과 같은 경험이 있거나, 알고 계신 정보가 있다면 조언 부탁드려요!" rows="24" cols="80" required></textarea>
								</div>
								<div class="comment_input_bot info_write"></div>
								<button type="submit" class="btnSizeL comment_submit btn_anwr_register"
									<c:if test="${memberVO.memId==null}">disabled</c:if>
								 name="btn_anwr_register">댓글 등록</button>
							</div>
							<security:csrfInput/>
						</form>
						<!-- -------------------------------------- 댓글 등록 끝 -------------------------------------- -->

						<!-- 댓글 정렬 -->
							<c:if test="${not empty reply }">
								<div class="comment_lists_wrap" id="qna_answer_box">
									<div class="comment_lists_sort">
										<div class="inpSel">
											<select id="replySort" name="replySort" title="댓글 정렬 선택">
												<option value="last" selected="selected">최신 댓글순</option>
												<option value="like">인기 댓글순</option>
											</select>
										</div>
									</div>
								<form>
									<div class="list_answer paywall">
										<ul class="comment_lists">
											<c:forEach items="${reply }" var="reply">
												<li>
													<div class="wrap_comment">
														<div class="comment_view">
															<span class="comment_txt">${reply.replyContent }
															</span>
															<div class="comment_data_wrap">
																<button type="button" class="comment_data comment_like">공감하기 <strong></strong></button>
																<button type="button" class="comment_data comment_reply">대댓글달기 <strong></strong></button>
															</div>
															<div class="comment_info">
																<span class="comment_from"><span class="nickname">${reply.memId }</span>님이 ${reply.replyDate } 작성</span>
															</div>
														</div>
														<input type="hidden" name="memId" value="${memId}" />
														<c:if test="${reply.memId == memId}">
															<button type="button" class="btn_comment_etc">수정 및 삭제</button>

																<!-- 버튼 누르면 class에 on 추가 : comment_modify_wrap on -->
																<div class="comment_modify_wrap">
			                                                    	<button type="button" class="btn_comment_mnd" id="btnDelete">삭제</button>
			                                                    	<input type="hidden" value="${reply.replyNo }"/>
			                                    				</div>
		                                    			</c:if>
													</div>
												</li>
											</c:forEach>
										</ul>
										</div>
									</form>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stickyfill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<form>
	<input type="hidden" name="likeCheck"/>
	<input type="hidden" name="boardNo" value="${board.boardNo }"/>
</form>
<!-- 좋아요 -->
<script type="text/javascript">
	// 좋아요 존재여부 확인
	   $(function(){
		   let memId = $("#memId").val();
		   if(memId != ""){
			// 좋아요 버튼 클릭 시 추가 또는 취소
			$(".emotion").click(function(){
				let likeType = $(this).data("likeType");
				let like = $(this);
				console.log("클릭한 것:",likeType);
				let olike = Number($("#like").html());
				let ofun = Number($("#fun").html());
				let ohelp = Number($("#help").html());
				let ocheer = Number($("#cheer").html());

				let emotions = $(".emotion");
				let active = "";
				for (let i = 0; i < emotions.length; i++){
					if($(emotions[i]).hasClass("on") == true) {
						active = $(emotions[i]).data("likeType");
					}
				}
				if (active == "") {
		 			$.ajax({
						url:"likeInsert",
						type:"post",
						dataType:"JSON",
						data:{
							boardNo:"${ board.boardNo}"
							, likeType:likeType
						},
						success:function(resp){
							console.log(resp);
							//like.addClass('on');
							if(resp.error){

							}else{
							like.toggleClass('on');
								likeCnt();
								if (likeType == "1") {
									$("#like").html(olike + 1);
								} else if (likeType == "2") {
									$("#fun").html(ofun + 1);
								} else if (likeType == "3") {
									$("#help").html(ohelp + 1);
								} else if (likeType == "4") {
									$("#cheer").html(ocheer + 1);
								}
							}
						},
					});
				} else if (active != "") {
					$.ajax({
						url : "likeDelete",
						method : "post",
						data : {
							boardNo:"${ board.boardNo}"
							, likeType:active
						}
						,
						dataType : "JSON"
						,
						success : function(resp) { // 요청처리 성공 -> 데이터(resp)
							if (active == "1") {
								$("#like").html(olike - 1);
							} else if (active == "2") {
								$("#fun").html(ofun - 1);
							} else if (active == "3") {
								$("#help").html(ohelp - 1);
							} else if (active == "4") {
								$("#cheer").html(ocheer - 1);
							}
							$(".emotion").removeClass("on");
							likeCnt();
						},
						error : function(jqXHR, status, error) { // 에러에 대한 정보(받아올 데이터)
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
				}
			});
		}

		//삭제 버튼 보여주기
		$(".btn_comment_etc").click(function(){
			$(this).next().toggleClass('on');
		});

		// 삭제 버튼 클릭 -> 본인이 쓴 댓글만 삭제 가능
		$(".btn_comment_mnd").click(function(){
			let replyNo = $(this).siblings("input").val();
			console.log(replyNo);

			if(confirm("입력하신 댓글을 정말 삭제하시겠어요? 삭제하신 댓글은 복구하실 수 없습니다..ㅠㅠ 다시 등록하고 싶으시다면, 삭제 후 다시 작성해주세요!")){
				let str = "<div class='comment_view'><span class='comment_txt'>댓글이 삭제되었습니다</span></div><div class='comment_reply_wrap list_reply'><div id='list_reply_785062'></div></div>";

				$.ajax({
					url : "${pageContext.request.contextPath}/reply/replyDelete?replyNo=" + replyNo,
					method : "post",
					dataType : "json" // 응답데이터
					,
					success : function(resp) { // 요청처리 성공 -> 데이터(resp)

					},
					error : function(jqXHR, status, error) { // 에러에 대한 정보(받아올 데이터)
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});

				$(this).parent().parent().html(str);

// 				document.form1.action = "/board/boardDelete";
// 				document.form1.submit();
			}else{
				$(".comment_modify_wrap").removeClass('on');
			}
		});

		// 게시글 좋아요 수
		function likeCnt(){
			$.ajax({
				url:"likeCount",
				type: "post",
				dataType:"text",
				data:{
					boardNo:"${ board.boardNo}"
				},
				success:function(count){
					$(".likeTotalCount").html(count);
				},
			})
		}
		likeCnt(); // 처음 시작했을 때 실행되도록 함수 호출

		// 댓글 수
		function replyCnt(){
			$.ajax({
				url:"replyCount",
				type: "post",
				dataType:"text",
				data:{
					boardNo:"${ board.boardNo}"
				},
				success:function(count){
					$(".qna_reply").html(count);
				},
			})
		}
		replyCnt(); // 처음 시작했을 때 실행되도록 함수 호출
	});
</script>
<script>
	// 게시글 삭제
	function check_submit() {
	 	if (confirm("입력하신 글을 정말 삭제하시겠어요? 삭제하신 글은 복구하실 수 없습니다..ㅠㅠ 글 수정을 원할 경우, 수정 버튼 클릭 후 수정해주세요.")) {
			alert("게시글이 삭제 되었습니다.");
		}else{
			return false;
		}

/* 		Swal.fire({
			  title: "입력하신 글을 정말 삭제하시겠어요??",
			  text: "삭제하신 글은 복구하실 수 없습니다..ㅠㅠ 글 수정을 원할 경우, 수정 버튼 클릭 후 수정해주세요.",
			  icon: "info",
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니요'
			})
			.then((result) => {
			  if (result.isConfirmed) {
			    swal("삭제되었습니다.", {
			      icon: "success",
			    });
			  } else {
			    swal("삭제에 실패했습니다.");
			  }
			});
	}; */
</script>
</body>
</html>