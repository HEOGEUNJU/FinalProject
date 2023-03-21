<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.03.03  윤호연      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">

   
<style type="text/css">
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
	

	@import url("https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Montserrat:wght@700&display=swap");

	:root {
	  /* Colors */
	  --brand-color: hsl(46, 100%, 50%);
	  --black: hsl(0, 0%, 0%);
	  --white: hsl(0, 0%, 100%);
	  /* Fonts */
	  --font-title: "Montserrat", sans-serif;
	  --font-text: "Lato", sans-serif;
	}
	
	/* RESET */
	
	/* Box sizing rules */
	*,
	*::before,
	*::after {
	  box-sizing: border-box;
	}
	
	/* Remove default margin */
	body,h2,p {
	  margin: 0;
	}
	
	/* GLOBAL STYLES */
	h2 {
	  font-size: 2.25rem;
	  font-family: var(--font-title);
	  color: var(--white);
	  line-height: 1.1;
	}
	
	p {
	  font-family: var(--font-text);
	  font-size: 1rem;
	  line-height: 1.5;
	}
	
	
	.flow > * + * {
	  margin-top: var(--flow-space, 1em);
	}
	
	/* CARD COMPONENT */
	
	.card {
	  display: grid;
	  place-items: center;
	  width: 80vw;
	  max-width: 21.875rem;
	  height: 28.125rem;
	  overflow: hidden;
	  border-radius: 0.625rem;
	  box-shadow: 0.25rem 0.25rem 0.5rem rgba(0, 0, 0, 0.25);
	}
	
	.card > * {
	  grid-column: 1 / 2;
	  grid-row: 1 / 2;
	}
	
	.card__background {
	  object-fit: cover;
	  max-width: 100%;
	  height: 100%;
	}
	
	.card__content {
	  --flow-space: 0.9375rem;
	  display: flex;
	  flex-direction: column;
	  justify-content: space-between;
	  align-self: flex-end;
	  height: 55%;
	  padding: 12% 1.25rem 1.875rem;
	  background: linear-gradient(
	    180deg,
	    hsla(0, 0%, 0%, 0) 0%,
	    hsla(0, 0%, 0%, 0.3) 10%,
	    hsl(0, 0%, 0%) 100%
	  );
	}
	
	.card__content--container {
	  --flow-space: 1.25rem;
	}
	
	.card__title {
	  position: relative;
	  width: fit-content;
	  width: -moz-fit-content; /* Prefijo necesario para Firefox  */
	}
	
	.card__title::after {
	  content: "";
	  position: absolute;
	  height: 0.3125rem;
	  width: calc(100% + 1.25rem);
	  bottom: calc((1.25rem - 0.5rem) * -1);
	  left: -1.25rem;
 	  background-color: var(--brand-color); 
	} 
	
	.card__button {
	  padding: 0.75em 1.6em;
	  width: fit-content;
	  width: -moz-fit-content; /* Prefijo necesario para Firefox  */
	  font-variant: small-caps;
	  font-weight: bold;
	  border-radius: 0.45em;
	  border: none;
	  background-color: var(--brand-color);
	  font-family: var(--font-title);
	  font-size: 1.125rem;
	  color: var(--black);
	}
	
	.card__button:focus {
	  outline: 2px solid black;
	  outline-offset: -5px;
	}
	
	@media (any-hover: hover) and (any-pointer: fine) {
	  .card__content {
	    transform: translateY(62%);
	    transition: transform 500ms ease-out;
	    transition-delay: 500ms;
	  }
	}	
	
	  .card__title::after {
	    opacity: 0;
	    transform: scaleX(0);
	    transition: opacity 1000ms ease-in, transform 500ms ease-out;
	    transition-delay: 500ms;
	    transform-origin: right;
	  }
	
	  .card__background {
	    transition: transform 500ms ease-in;
	  }
	
	  .card__content--container > :not(.card__title),
	  .card__button {
	    opacity: 0;
	    transition: transform 500ms ease-out, opacity 500ms ease-out;
	  }
	
	  .card:hover,
	  .card:focus-within {
	    transform: scale(1.05);
	    transition: transform 500ms ease-in;
	  }
	
	  .card:hover .card__content,
	  .card:focus-within .card__content {
	    transform: translateY(0);
	    transition: transform 500ms ease-in;
	  }
	
	  .card:focus-within .card__content {
	    transition-duration: 0ms;
	  }
	
	  .card:hover .card__background,
	  .card:focus-within .card__background {
	    transform: scale(1.3);
	  }
	
	  .card:hover .card__content--container > :not(.card__title),
	  .card:hover .card__button,
	  .card:focus-within .card__content--container > :not(.card__title),
	  .card:focus-within .card__button {
	    opacity: 1;
	    transition: opacity 500ms ease-in;
	    transition-delay: 1000ms;
	  }
	
	  .card:hover .card__title::after,
	  .card:focus-within .card__title::after {
	    opacity: 1;
	    transform: scaleX(1);
	    transform-origin: left;
	    transition: opacity 500ms ease-in, transform 500ms ease-in;
	    transition-delay: 500ms;
	  }
	  
	  .card-display{
		display: flex;
   		flex-wrap: wrap;	  
	  }
	  
/* 	슬라이드 효과 주기   */
	  .slider{
		  height: 480px;
		  margin: auto;
		  position:relative;
		  width: 100%;
		  display:grid;
		  place-items:center;
		  overflow:hidden;
		}
		
		.slide-track{
		  display:flex;
 		  width: calc(300px * 9); 
		  animation: scroll 10s linear infinite;	
		}
		
		.slide-track:hover{
		  animation-play-state:paused;
		}
		
		@keyframes scroll{
		  0% {
		    transform: translateX(0);
		  }
		  100%{
		    transform: translateX(calc(-200px * 7));
		  }
		}

/*		
		.slide{
		  height: 250px;
		  width: 300px;
		  display: flex;
		  align-items:center;
		  padding: 15px;
		  perspective:100px;
		}
*/
		
		.train-card{
		  width:100%;
		  transition:transform 2s;
		  border-radius:10px;
		  overflow:hidden;
		}
		
		.train-card:hover{
		  transform:translateZ(18px);
		}
	
	/* 슬라이더 그라데이션 그림자 */

		.slider::before,
		.slider::after {
		  background:linear-gradient(to right, #f6f4f2 0%,
		  rgba(255,255,255,0) 100%);
		  content:'';
		  height:100%;
		  position:absolute;
		  width:15%;
		  z-index:2;
		}
		
		.slider::before{
		  left:0;
		  top:0;
		}
		
		.slider::after{
		  right:0;
		  top:0;
		  transform: rotateZ(180deg);
		}
		
		.imgSize{
			width: 250px;
			height: 250px;
		}
		
		
</style>
<section class="site-section">
	<div class="container">
		<div class="wrap_title_recruit">
		    <h1 class="title_common" style="font-size: 40px;">인기 공모전</h1>
		</div>
<!-- 	<p style="font-size: 1.5em; text-align: center;">인기 공모전</p> -->
	<div style="height: 50px;"></div>
	<div class="slider">
	<div class="slide-track">
	
	<!-- 카드1 -->
	<div class="card-display slide">
		<article class="card train-card" id="card1">
		  <img
		    class="card__background"
		    src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2023%2F03%2F06%2F5c5c0d448e1e43ab9ae0d018983dfc7c.jpg&w=1920&q=75"
		    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
		    width="1920"
		    height="2193"
		  />
		  <div class="card__content | flow">
		    <div class="card__content--container | flow">
<!-- 		      <h2 class="card__title">Colombia</h2> -->
		       <p style="font-family: 'TheJamsil5Bold'; color: white;" class="card__description">
		        	시민과 함께 일상의 변화를 만드는 서울시 시민제안플랫폼‘상상대로 서울’에서 새로워진 시민제안 플랫폼 홍보 및 활성화를 위하여 ｢서울시 시민제안 대학생 응원단｣ 4기를 모집합니다. 
		      </p>
		    <button class="card__button" style="font-family:'NanumSquareNeo-Variable';">Read more</button>
		    </div>
		  </div>
		</article>
		<div style="width: 50px;"></div>
		</div>
	
	<!-- 카드2 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2023%2F03%2F06%2Fc5730a6136894ebdbef997b18a3cb4b2.jpg&w=1920&q=75"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
<!-- 	  <h2 class="card__title">Colombia</h2> -->
	      <p style="font-family: 'TheJamsil5Bold'; color: white;" class="card__description">
	      	  국민의 안전의식 수준을 높이고 안전한 일터를 위해 사업주와 근로자, 그리고 국민이 함께 지키고 실천 할 수 있는 새로운 안전문화 캠페인 슬로건을 만들어주세요!
	      </p>
	    <button class="card__button" style="font-family:'NanumSquareNeo-Variable';">Read more</button>
	    </div>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드3 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2023%2F03%2F05%2Ffa806296383e46c69be60290316ad9b8.jpg&w=1920&q=75"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
<!-- 	      <h2 class="card__title">Colombia</h2> -->
	      <p style="font-family: 'TheJamsil5Bold'; color: white" class="card__description">
		        가객 노계 박인로 선생의 문학정신을 높이 기리고 한국문학발전에 기여하기 위하여
		        개최하는 본 대회에 시낭송을 사랑하는 많은 분들의 참여 바랍니다.
	      </p>
	    <button class="card__button" style="font-family:'NanumSquareNeo-Variable';">Read more</button>
	    </div>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드 4 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2023%2F03%2F03%2F6f67cc69aec94dcc993a946735f24a53.png&w=1920&q=75"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
	       <p style="font-family: 'TheJamsil5Bold'; color: white;" class="card__description">
	        2023 제5회 픽사톤 영상 공모전에 많은 참여 부탁드립니다!
	      </p>
	      <br>
	      <br>
	    <button class="card__button" style="font-family:'NanumSquareNeo-Variable';">Read more</button>
	    </div>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드5 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2023%2F02%2F24%2Fd6b8251dd44b4821b5364c2e230bf266.jpg&w=1920&q=75"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
<!-- 	      <h2 class="card__title"></h2> -->
	       <p style="font-family: 'TheJamsil5Bold'; color: white;" class="card__description">
	        축산물품질평가원에서는 벌꿀등급제의 사회적 가치와 역할을 대중께 효과적으로 소개하고, 벌꿀 등급제의 이미지를 적극 브랜딩하기 위해 공모전을 개최합니다.
	      </p>
	    <button onclick="location.href='<%=request.getContextPath() %>/lab/contest/detail?no=1'" class="card__button" style="font-family:'NanumSquareNeo-Variable';">Read more</button>
	    </div>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드6 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2023%2F03%2F03%2F0e7cbd66184c45c5a6c1f358778197c1.jpg&w=1920&q=75"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
<!-- 	      <h2 class="card__title">Colombia</h2> -->
	       <p style="font-family: 'TheJamsil5Bold'; color: white;" class="card__description">
	         2023년 서대문구 청년도전프로젝트를 개최합니다. 많은 참여 부탁드립니다.
	      </p>
	      <br>
	    <button class="card__button" style="font-family:'NanumSquareNeo-Variable';">Read more</button>
	    </div>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드7 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2023%2F03%2F03%2F8dbbd2a995f6406faf68ccfd0d98ae6b.jpg&w=1920&q=75"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
	      <h2 class="card__title">Colombia</h2>
	       <p style="font-family: 'TheJamsil5Bold'; color: white;" class="card__description">
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum in
	        labore laudantium deserunt fugiat numquam.
	      </p>
	    </div>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	</div>
	</div>
	
	</div>
</section>

<section>
	<div id="content" style="width: 1260px;">
		<div class="wrap_title_recruit">
			<h1 class="title_common" style="font-size: 40px">진행 중인 공모전</h1>
		</div>
		<div class="wrap_board">
			<div class="search_area">
<%-- 				<strong class="count" style="font-size: 20px;">총 <span class="num"> ${pagingVO.totalRecord} </span>건 </strong> --%>
<%-- 				<form:form id="searchUI" modelAttribute="simpleCondition" method="get" onclick="return false;"> --%>
					<div class="search_right">
						<span class="inpSel">
							<select>
								<option value>전체</option>
								<option value="announcement" label="주관기관" />
								<option value="open" label="공모 분야" />
								<option value="etc" label="공모전명" />
							<select>
						</span>
						<div class="searchTypoBox">
							<input path="searchWord" style="width: 276px" class="inpTypo" placeholder="특수문자를 제외한 키워드를 입력해주세요."/>
							<input type="button" class="btnTypoSearch" value="검색"  id="searchBtn"/>
						</div>
					</div>
<%-- 				</form:form> --%>
			</div>
			<div class="tblType">
				<table>
					<colgroup>
						<col width= 10%; />
						<col width= 15%; />
						<col width= 50%; />
						<col width= 12.5%; />
						<col width= 12.5%; />
					</colgroup>
					<thead>
						<tr>
							<th>공모분야</th>
							<th>주관 기관</th>
							<th>공모전명</th>
							<th>시작일</th>
							<th>종료일</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
				
		</div>
		
	</div>
</section>

	<security:authorize url="/lab/contest/insertForm">
	<div class="col-2" style="left: 1400px;">
     	<input type="button" value="공모전 등록" id="insert-form" style="background-color: #0D6EFD; color: black" class="btn btn-primary" 
     		   onclick="location.href='${pageContext.request.contextPath}/lab/contest/insertForm'"/>
    </div>
    </security:authorize>
	
  	<div class="col-1" style="left: 300px;">
        <div class="pagingArea"></div>
    </div>
    
    <div style="height: 50px;"></div>
    
      <!-- hidden form -->
	<form:form id="searchForm" modelAttribute="simpleCondition" method="post">
		<input type="hidden" name="page" />
	</form:form>   
	
<script>
	
// 	Tr태그
	function makeTr(index, con) {
		return $("<tr>").append(
			$("<td>").html(con.contField)		
			, $("<td>").html(con.contCo)		
			, $("<td>").append($("<a href='${pageContext.request.contextPath}/lab/contest/detail?no="+ con.contNo +"'>").html(con.contName))	
			, $("<td>").html(con.contStart)		
			, $("<td>").html(con.contDead)		
		);
	}
	
	selectList();
	function selectList(){
		$.ajax({
			url : "${pageContext.request.contextPath}/lab/contest",
			method : "post",
			dataType : "JSON",
			success : function(resp) {
				console.log(resp);
				let cons = resp.dataList;
				$.each(cons, function(index, con) {
					$("tbody").append(makeTr(index, con));
					console.log(con.contNo);
				});
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
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
    
</html>