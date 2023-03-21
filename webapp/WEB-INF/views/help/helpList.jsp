<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">

<!-- HOME -->


<div id="sri_section" class="  has_banner">
	<div id="sri_wrap">
      	<div id="content" style="width: 80%;">
      		<div class="wrap_title_recruit">
			    <h1 class="title_common" style="font-size: 40px;">도움말</h1>
			</div>
			<div class="wrap_help">
				<!-- 검색 -->
				<div class="search_help">
					<form action="/zf_user/help/help-word/help-search" onsubmit="return isValidation();">
      					<label for="helpSearchInput" class="copy">
          					<strong>궁금한 점</strong>이 있으면
          					<br>검색해 주세요<i>!</i>
      					</label>
      					<input id="helpSearchInput" name="keyword" class="input_search_help" type="text" placeholder="검색어는 20자 이내로 입력해주세요." value=""/>
   						<button class="btn_search_help" type="submit">
      						<span class="blind">검색하기</span>
   						</button>
   						<div class="suggetion">
       						<span class="tit">추천검색어</span>
                           	<a href="" class="item">이력서</a>
                           	<a href="" class="item">입사지원</a>
                           	<a href="" class="item">채용정보</a>
                           	<a href="" class="item">인재풀</a>
                   		</div>
  					</form>
				</div>
				<!-- // 검색 -->
				<ul class="tabList">
					<li id="private" class="select">
      					<button class="inTab" value="HPS"> <!-- 컨트롤러로 값을 보내줌 -->
          					<span>개인회원</span>
      					</button>
  					</li>
  					<li id="company" class="">
      					<button class="inTab" value="HPI">
          					<span>기업회원</span>
      					</button>
  					</li>
				</ul>
				<script>
					$("#company").click(function(){
						$("#private").removeClass("select");
						$("#company").addClass("select");
					});
					$("#private").click(function(){
						$("#company").removeClass("select");
						$("#private").addClass("select");
					});
				</script>
				
				<!-- ===========================도움말 구분 이름=========================== -->
				<ul class="tab_help" id="listName">
      			</ul>
      			<!-- ================================================================= -->
      			
      			<!-- 리스트 영역 -->
				<div class="wrap_list_help">
              		<h2 class="tit_list_help">
         				<strong>자주 묻는 질문</strong> 
                    </h2>
      				<!-- ==========================도움말 리스트========================= -->
      				<ul class="list_help" id="helpList">
					</ul>
					<!-- =============================================================== -->
				</div>
			</div>
			<script type="text/javascript">
				var $list = jQuery('.list_help'),
				  $li = jQuery('> li', $list);
				
				$list.on('click', '.btn_close', function () {
				  var $this = jQuery(this).closest('li');
				  if ($this.hasClass('select')) {
				      $this.removeClass('select');
				  } else {
				      $li.removeClass('select');
				      $this.addClass('select');
				  }
				});
				
				function isValidation() {
				  if (jQuery('#helpSearchInput').val().length > 20) {
				      alert('검색어는 20자 이내로 입력해주세요.\n키워드로 검색하시면 더 많은 검색결과를 찾을 수 있습니다.');
				      return false;
				  }
				  return true;
				}
				
			
				let listBody = $('#helpList'); //목록
				let listName = $('#listName'); //구분이름
				
				//구분이름
				let makeNameTag = function(name){ //매개변수 받음
					return $("<li>").append(
							$("<button>").attr({class:"inTab",name:"nameTab",value:name.code}).html(name.codeName)
					);
				}
				//구분전체
				let makeTotalTag = function(){
					return $("<li>").attr("class","select").append(
							$("<button>").attr("class","inTab").attr("name", "nameTab").val("HPS000").html("전체")		
					);
				}
				//목록
				let makeLiTag = function(help){
					return $("<li>").addClass(help.helpCate).append(
								$("<dl>").append(
									$("<dt>").append(
										$("<button>").attr("class","btn_close").append(
											$("<span>").attr("class","question").html("["+help.codeName+"] "+help.helpTitle)		
										)		
									),
									$("<dd>").attr("class","answer").html(help.helpContent),
									$("<dd>").attr("class","date1").html("등록일 : " + help.helpDate),
									$("<input>").attr("hidden", "true").html(help.helpCate)
								),
								$("<button>").attr("class","close btn_close").html("접기").append(
									$("<span>")		
								)
					);
				}
				
				let listAjax = function (inTabVal) {
					$.ajax({
						url : "${pageContext.request.contextPath}/help", //해당 url로 보냄
						data : {"helpSort":inTabVal}, //helpSort에 값 넣어 서버로 보냄
						dataType : "json",
						success : function(resp) {	//서버에서 응답보내준 것
							console.log(resp);
							listBody.empty();	//목록 범위 지우기
							let dataList = resp.list;	//응답이 list인 것 담기
							let nameList = resp.listName;	//응답이 listName인 것 담기
							let liTags = [];	//태그 담을 변수 선언
							let nameTags = [];	//태그 담을 변수 선언
							if(dataList){	//dataList가 있으면
								$.each(dataList, function(index, help){ //반복
									liTags.push(makeLiTag(help));	//태그 담을 변수에 반복해 담아줌 
								});
							}else{ //dataList 없으면
								let li = $("<li>").append(
											$("<dl>").append(
												$("<dt>").html("게시글 없음"),
												$("<dd>").html("올라온 게시글이 없습니다.")
											)
								);	
								liTags.push(li);
							}
							
							nameTags.push(makeTotalTag); //구분전체 태그 넣어줌
							if(nameList){	//nameList 있으면
								$.each(nameList, function(index, name){ //반복해서 넣음
									nameTags.push(makeNameTag(name));
								});
							}
							
							listBody.html(liTags);	//태그 담은거 listBody에 뿌려줌
							listName.html(nameTags);//태그 담은거 listName에 뿌려줌
							
							$("[name=nameTab]").on("click", function(){
								$(".list_help > li").show(); //.list_help가 갖고있는 li 보여주기
								// 선택되어 있는 것 select 해제
								let bul = $(this).parent().parent(); //name=nameTab 인 버튼의 부모(li)의 부모(ui)를 선택
								let selected = bul.find(".select");	//ui의 자식들 중 클래스 select를 찾음
								selected.removeClass("select");		//클래스에 select 해제
								// 선택한 것 select 부여
								let parent = $(this).parent();		//부모(li) 선택
								parent.addClass("select");			//클래스에 select 부여
								// 버튼이 가지고 있는 helpCate
								let helpCate = this.value;			//클릭된 버튼의 값
								if (helpCate != "HPS000"){			//전체 버튼이 아닌 다른게 클릭됬으면
									// li 중 helpCate와 다른 것 안 보이게 하기
									let til = $(".list_help > li."+helpCate)	//list_help가 갖고있는 li의 클래스가 helpCate인것
									$(".list_help > li").not("."+helpCate).hide();	//클래스 helpCate가 다른것은 숨김
								}
								
							});
							
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
				}
				
				listAjax("HPS"); //첫 화면에 helpSort가 HPS인 목록이 나오게 매개변수 넣은 함수 출력
				
				
				let inTab = $(".inTab").on("click", function(){ //클래스가 inTab인놈 클릭시
// 					console.log($(this).val()); //클릭된 inTap의 값
					let inTabVal = $(this).val(); //클릭된 inTap의 값
					
					listAjax(inTabVal)
				});

			</script>
		</div>
	</div>
</div>





