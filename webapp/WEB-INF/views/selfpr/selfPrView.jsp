<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      윤호연      최초작성
* 2023.02.13   윤호연      1차수정
* 2023.03.02   윤호연      2차수정
* 2023.03.07   윤호연      3차수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom-bs.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">  
    
    <style>
    /* 폰트 */
		@font-face {
		    font-family: 'TheJamsil5Bold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
		    font-weight: 700;
		    font-style: normal;
		}
	/* 나눔스퀘어 네오 */
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
      .selfpr-block{
        margin-bottom: 1rem!important;
        -webkit-box-flex: 0;
        flex: 0 0 33.33333%;
        position: relative;
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
        border: 1px solid #b3e7b3;
        border-radius: 15px;
      }
      .top-interval{
        height: 25px;
      }
      .top-medium-interval{
      	height: 50px;
      }
      .top-large-interval{
      	height: 100px;
      }
      .img-jobseeker{
      	height: 75px;
      	width: 75px; 
      }
      
      /* 카드 */
      
      @import url('https://fonts.googleapis.com/css?family=Abel');

	.center {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate(-50%, -50%);
	}
	
	.card {
	  width: 485px;
	  height: 250px;
	  background-color: #fff;
	  background: linear-gradient(#f8f8f8, #fff);
	  box-shadow: 6px 12px 16px -8px rgba(0,0,0,0.4);
	  border-radius: 15px;
	  overflow: hidden;
	  position: relative;
	  margin: 1.5rem;
	}
	
	.card h1 {
	  font-family: 'TheJamsil5Bold';
	  font-size : 2.5em;
	  text-align: center;
	}
	
	.card p{
	  font-family: 'NanumSquareNeo-Variable';
	}
	
	.card .additional {
	  position: absolute;
	  width: 150px;
	  height: 100%;
	  background: linear-gradient(#dE685E, #EE786E);
	  transition: width 0.4s;
	  overflow: hidden;
	  z-index: 2;
	  left: 0px;
	}
	
	.card.green .additional {
	  background: linear-gradient(#a09cc5, #1b00ff);
	}
	
	
	.card:hover .additional {
	  width: 100%;
	  border-radius: 0 5px 5px 0;
	  
	}
	
	.card .additional .user-card {
	  width: 150px;
	  height: 100%;
	  position: relative;
	  float: left;
	  
	}
	
	.card .additional .user-card::after {
	  content: "";
	  display: block;
	  position: absolute;
	  top: 10%;
	  right: -2px;
	  height: 80%;
	  border-left: 2px solid rgba(0,0,0,0.025);
	  
	}
	
	.card .additional .user-card .level,
	.card .additional .user-card .points {
	  top: 15%;
	  color: #fff;
	  text-transform: uppercase;
	  font-size: 0.75em;
	  font-weight: bold;
	  background: rgba(0,0,0,0.15);
	  padding: 0.125rem 0.75rem;
	  border-radius: 100px;
	  white-space: nowrap;
	  
	}
	
	.card .additional .user-card .points {
	  top: 85%;
	}
	
	.card .additional .user-card svg {
	  top: 50%;
	}
	
	.card .additional .more-info {
	  width: 300px;
	  float: left;
	  position: absolute;
	  left: 150px;
	  height: 100%;
	}
	
	.card.green .additional .coords {
	  margin: 0 1rem;
	  color: white;
	  font-size: 1rem;
	  font-family: 'NanumSquareNeo-Variable';
	}
	
	.card .additional .coords span + span {
	  float: right;
	}
	
	.card.green .additional .stats {
	  font-family: 'NanumSquareNeo-Variable';
	  font-size: 2rem;
	  display: flex;
	  position: absolute;
	  bottom: 1rem;
	  left: 1rem;
	  right: 1rem;
	  top: auto;
	  color: white;
	}
	
	.card .additional .stats > div {
	  flex: 1;
	  text-align: center;
	}
	
	.card .additional .stats i {
	  display: block;
	}
	
	.card .additional .stats div.title {
	  font-size: 0.9rem;
	  font-weight: bold;
	  text-transform: uppercase;
	  border-bottom: 1px solid white;
	}
	
	.card .additional .stats div.value {
		font-size: 0.9rem;
		font-weight: bold;
		line-height: 1rem;
	}
	
	.card .additional .stats div.value.infinity {
		font-size: 2.5rem;
	}
	
	.card .general {
		width: 300px;
		height: 100%;
		position: absolute;
		top: 0;
		right: 0;
		z-index: 1;
		box-sizing: border-box;
		padding: 1rem;
		padding-top: 0;
	}
	
	.card .general .more {
		position: absolute;
		bottom: 1rem;
		right: 1rem;
		font-size: 0.9em;
	}
	.selectboxwidth{
		width: 205px;
	}
	.prsearchBtn{
		border: 1px solid black;
		width: 90px;
		height: 35px;
		border-radius: 5px;
		background-color: #d9d9f9;
		float: right;
	}
	
	.profileimage{
		width: 110px;
		height: 110px;
		border-radius: 45px;
	}
      
    </style> 
</head>
<body>

	<!-- 검색창 -->
	<section style="padding-top: 100px;">
        <div class="container">
        <h4 style="font-family: 'NanumSquareNeo-Variable'; font-size: 2em;">인재 검색하기</h4>
        <div style="height: 25px;"></div>
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12">
            
              <form method="post" class="p-4 p-md-5 border rounded" id="searchUI">
              	<input type="hidden" name="page"/>
                <div class="row mb-5">
                	<p style="font-family: 'NanumSquareNeo-Variable';">※ 원하는 항목으로 검색해주세요</p>
                	<div style="height: 10px;"></div>
	                <hr style="width: 1000px; height: 1px;">
                
				<!-- 1번째 -->
	            <div class="selectboxwidth">
                 	<p style="text-align: center; font-family:'NanumSquareNeo-Variable';">희망산업분야선택(대분류)</p>
		            <select name="industry0" class="form-select form-select-sm selectBox">
						<option value>기초</option>
					</select>
				 </div>	
                 
                  <!-- 2번째 -->
				 <div class="selectboxwidth">
				 	<p style="text-align: center; font-family:'NanumSquareNeo-Variable';">근무지역선택(광역)</p>
	                  <select name="metro" class="form-select form-select-sm selectBox">
						 <option value>기초</option>
					  </select>
				  </div>	
                  
                  <!-- 3번째 -->
                  <div class="selectboxwidth">
                   <p style="text-align: center; font-family:'NanumSquareNeo-Variable';">직급선택</p>
                      <select class="form-select form-select-sm selectBox" name="prWanttype">
                        <option class="bs-title-option" value="">직급선택</option>
                        <option value="사원급">사원급</option>
                        <option value="주임급">주임급</option>
                        <option value="대리급">대리급</option>
                        <option value="과장급">과장급</option>
                        <option value="부장급">부장급</option>
                      </select>
                  </div>
                 
                  <!-- 4번째 -->
                  <div class="selectboxwidth">
                   <p style="text-align: center; font-family:'NanumSquareNeo-Variable';">근무경력선택</p>
                      <select class="selectpicker" name="prAnnual" title="경력">
                        <option class="bs-title-option" value="none"></option>
                        <option value="신입">신입</option>
                        <option value="1년차 미만">1년차 미만</option>
                        <option value="1~2년">1~2년</option>
                        <option value="2~3년">2~3년</option>
                        <option value="3~5년">3~5년</option>
                        <option value="5~10년">5~10년</option>
                        <option value="10년 이상">10년 이상</option>
					  </select>
                  </div>
                  
                  <!-- 5번째 -->
                  <div class="selectboxwidth">
                   <p style="text-align: center; font-family:'NanumSquareNeo-Variable';">학력선택</p>
                      <select class="selectpicker" name="prEdu" title="학력">
                        <option class="bs-title-option" value=""></option>
                        <option>초,중졸</option>
                        <option>고졸</option>
                        <option>대학교(2,3년)졸업예정</option>
                        <option>대학교(4년)졸업예정</option>
                        <option>대학교(2,3년)졸업</option>
                        <option>대학교(4년)졸업</option>
                        <option>석사</option>
                        <option>박사</option>
                      </select>
                  </div>
                  
                  <!-- 칸 띄우기 -->
                  <div style="width: 840px; height: 15px;"></div>
                  
                  <!-- 다시 검색 시작 -->
                  
                  <!-- 6번째 -->
                  <div class="selectboxwidth">
                  <p style="text-align: center; font-family:'NanumSquareNeo-Variable';">희망분야산업선택(중분류)</p>
	                  <select name="industry1" class="form-select form-select-sm selectBox">
						  <option value>중위</option>
					  </select>
				  </div>
                  
                  <!-- 7번째 -->
                  <div class="selectboxwidth">
                  <p style="text-align: center; font-family:'NanumSquareNeo-Variable';">희망근무지역선택(기초)</p>
	                  <select name="regionCode" class="form-select form-select-sm selectBox">
						 <option value>기초</option>
					  </select>
				  </div>	  
				
                  <!-- 칸 띄우기 -->
                  <div style="width: 890px; height: 15px;"></div>
				
				  <!-- 8번째 (industryCode)하위 -->
				  <div class="selectboxwidth">	 
				    <p style="text-align: center; font-family:'NanumSquareNeo-Variable';">희망분야산업선택(소분류)</p> 
					  <select name="industryCode" class="form-select form-select-sm selectBox">
						 <option value>하위</option>
					  </select>
				  </div>
                </div>
                <hr style="width: 1000px; height: 1px;">
                <button class="prsearchBtn text-white" style="font-family: 'NanumSquareNeo-Variable'; background-color: #0D6EFD;" type="button" id="btnsearch">검색</button>
                
                
              </form>
              <div class="top-medium-interval"></div>
            </div>
          </div>
        </div>
        
        <div class="top-interval"></div>
        
        <!-- 구직자만 보여줘야함 -->
        <security:authorize url="/selfpr/InsertForm">
	       <div class="col-2" style="left: 1400px;">
		       	<input type="button" value="내 홍보글 작성" id="insert-form" style="background-color: #0D6EFD; color: black" class="btn btn-primary text-white" 
		       		   onclick="location.href='${pageContext.request.contextPath}/selfpr/InsertForm'"/>
	       </div>
        </security:authorize>
				
        <div class="row" id="searchTag">

		<!-- 여기 카드 자리임 -->

            </div>
	     <div class="top-medium-interval"></div>
	  </section>
		  
	   <hr>
              
        <!-- 페이징 처리 -->
       
       <div class="col-1" style="left: 300px;">
          <div class="pagingArea"></div>
       </div>
        
        <div class="top-large-interval"></div>
      
      <!-- hidden form -->
	<form id="searchForm">
		<input type="hidden" name="regionCode" />
		<input type="hidden" name="industryCode" />
	</form>
	
    <script>
    
	/* 하위 지역 셀렉트 */
      $("[name=metro]").on("change", function(){
    		$("[name='regionCode'] option").remove();   
    		$("[name='regionCode']").append("<option>지역</option>");
    		
    		let ref = $(this).val();
    		let data = [{type:'region',code:ref}];
    		
    		$.ajax({
    			url : "${pageContext.request.contextPath}/selfpr/search",
    			method : "post",
    			data : JSON.stringify(data),
    			dataType : "json",
    			contentType: 'application/json',
    			success : function(resp) {
    				console.log("리스트뽑아옴");
    				console.log(resp);
    				let regionList = resp.regionList;
    				let regionOption = [];
    				
    				
    				$.each(regionList, function(index, val){
    					let tr = null;
    					tr = $("<option>").attr("class","code").prop("value",val.regionCode).html(val.regionName);
    					regionOption.push(tr);
    				})
    				$("select[name=regionCode]").append(regionOption);
    			},
    			error : function(jqXHR, status, error) {
    				console.log(jqXHR);
    				console.log(status);
    				console.log(error);
    			}
    		});   
    	});
      
      /* 업종 셀렉트 */
      $("[name=industry0]").on("change", function(){
//    	 	console.log($(this).val());
//    	 	console.log($("[name=industry0]").val());
    		
    		$("[name='industry1'] option").remove();   
    		$("[name='industry1']").append("<option>중위</option>");
    		$("[name='industryCode'] option").remove();   
    		$("[name='industryCode']").append("<option>하위</option>");
    		
    		let ref = $(this).val();
    		let data = [{type:'industry',code:ref}];
    		
    		$.ajax({
    			url : "${pageContext.request.contextPath}/selfpr/search",
    			method : "post",
    			data : JSON.stringify(data),
    			dataType : "json",
    			contentType: 'application/json',
    			success : function(resp) {
    				
    				console.log("리스트뽑아옴");
    				let industryList = resp.industryList;
    				let industryOption = [];
    				
    				$.each(industryList, function(index, val){
    					let tr = null;
    					tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
    					industryOption.push(tr);
    				})
    				$("select[name=industry1]").append(industryOption);
    			},
    			error : function(jqXHR, status, error) {
    				console.log(jqXHR);
    				console.log(status);
    				console.log(error);
    			}
    		});   
    	});
		 $("[name=industry1]").on("change", function(){
			$("[name='industryCode'] option").remove();   
			$("[name='industryCode']").append("<option>하위</option>");
			
			let ref = $(this).val();
			let data = [{type:'industry',code:ref}];
			
			$.ajax({
				url : "${pageContext.request.contextPath}/selfpr/search",
				method : "post",
				data : JSON.stringify(data),
				dataType : "json",
				contentType: 'application/json',
				success : function(resp) {
					console.log("리스트뽑아옴");
					let industryList = resp.industryList;
					let industryOption = [];
					
					$.each(industryList, function(index, val){
						let tr = null;
						tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
						industryOption.push(tr);
					})
					$("select[name=industryCode]").append(industryOption);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});   
		});
      
      /* 최상위 셀렉트... */
      let topData = [
    		{type:'region', code:''}
    		, {type:'industry', code:''}
    	]
    	$.ajax({
    		url : "${pageContext.request.contextPath}/selfpr/search",
    		method : "post",
    		data : JSON.stringify(topData),
    		dataType : "json",
    		contentType: 'application/json',
    		success : function(resp) {
    			console.log("리스트뽑아옴");
    			let regionList = resp.regionList;
    			let industryList = resp.industryList;
    			
    			console.log("regionList",regionList);
    			console.log("industryList",industryList);
    			
    			let regionOption = [];
    			let industryOption = [];
    			
    			$.each(regionList, function(index, val){
    				let tr = null;
    				tr = $("<option>").attr("class","code").prop("value",val.regionCode).html(val.regionName);
    				regionOption.push(tr);
    			})
    			
    			$.each(industryList, function(index, val){
    				let tr = null;
    				tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
    				industryOption.push(tr);
    			})
    			
    			$("select[name=metro]").append(regionOption);
    			$("select[name=industry0]").append(industryOption);
    		},
    		error : function(jqXHR, status, error) {
    			console.log(jqXHR);
    			console.log(status);
    			console.log(error);
    		}
    	});
      
	/* 시작하자마자 전체목록 조회 */    
	$(document).ready(function(){
		$("#btnsearch").trigger('click');
	});
	
	/* 서치결과 */
   	$("#btnsearch").click(function(){
		$.ajax({
			url: "<%=request.getContextPath() %>/selfpr",
			method: "get",
			data: $('#searchUI').serialize(),
			dataType: "json",
			success: function(resp){
				console.log("넘어왔니", resp);
				
					let dataList = resp.pagingVO.dataList;
					console.log(dataList);
					let trTags = [];
						$.each(dataList, function(index, selfpr){
							trTags.push(makeTrTag(selfpr));
					});
					$('#searchTag').html(trTags);
					
					if(resp.pagingHTML)
						pagingArea.html(resp.pagingHTML);
					
				}
			});
	    });
    
    let makeTrTag = function(selfpr){
    	let selfprtag = "";
    	selfprtag += `
    	<div class="card green">
	    <div class="additional">
	    
	    <a href="${pageContext.request.contextPath}/selfpr/Detail/?no=\${selfpr.prNo }"><div class="user-card">
	        <div class="level center">
	        	 직종 : \${selfpr.prWantjob }
	        </div>
	        <div class="points center">
	        	 경력 : \${selfpr.prAnnual }
	        </div>
	        
	        <div class="center">
				<img class="profileimage" alt="안나옴" src="<spring:url value='/image/memberFolder/\${selfpr.attSavename}'/>"/>		        	
	        </div>
	        
	      </div>
	      <div class="more-info">
	      	<br>
	        <div class="coords">
	          <span>학력 : \${selfpr.prEdu }</span>
	          <br>
	          <span>원하는 근무지역 : \${selfpr.regionName }</span>
	          <br>
	          <span>원하는 직무 : \${selfpr.prWanttype }</span>
	          <br>
	          <span>원하는 산업 : \${selfpr.industryName }</span>
	        </div>
	        <div class="stats">
	          <div>
	            <div class="title">경력</div>
	            <div class="value"><br>\${selfpr.prAnnual }</div>
	          </div>
	          <div>
	            <div class="title">성별</div>
	            <div class="value"><br>\${selfpr.memGender }</div>
	          </div>
	          <div>
	            <div class="title">원하는 연봉</div>
	            <div class="value"><br>\${selfpr.prWantmn }</div>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="general">
	      <br>
	      <h1>\${selfpr.memName }</h1>
	      <br>
	      <br>
	      <p>&ldquo;\${selfpr.prName }&rdquo;</p>
	    </div></a>
	    </div>`;
    	
          return selfprtag;
    }
    
//  페이징 처리

	let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		$('#searchUI').find("[name=page]").val(page);
		$("#btnsearch").trigger("click");
			
		return false;
	});
	   
    </script>

	<!-- SCRIPTS -->
	<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/isotope.pkgd.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/stickyfill.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.fancybox.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.easing.1.3.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.waypoints.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.animateNumber.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/quill.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/bootstrap-select.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/daumPostcode.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/custom.js"></script>
</body>
</html>