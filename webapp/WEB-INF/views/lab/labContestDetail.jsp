<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.03.03  윤호연      최초작성
* 2023.03.10  윤호연      1차수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">

<style>
/* 더잠실체  */
@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

/* 나눔스퀘어 네오 */
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.img-size {
	width: 600px;
	height: 700px;
	border: 1px solid black;
	border-radius: 5px;
}

.apply-button {
	background-color: rgb(15, 15, 15);
	border-radius: 5px;
	color: rgb(255, 255, 255);
	font-size: 20px;
	font-weight: 500;
	line-height: 1.4;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	width: 200px;
	height: 50px;
	cursor: pointer;
}

.share-button {
	background-color: rgb(15, 15, 15);
	border-radius: 5px;
	color: rgb(255, 255, 255);
	font-size: 20px;
	font-weight: 200;
	line-height: 1.4;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	width: 50px;
	height: 50px;
	cursor: pointer;
}

.contest-background {
	content: "";
	border-radius: 10px;
	width: 100%;
	height: 100%;
	inset: 0px;
	background: rgba(0, 0, 0, 0.8);
	backdrop-filter: blur(20px);
	z-index: -1;
}
</style>

<section class="site-section">
	<div class="contest-background">
		<div class="row">
			<div style="height: 50px;"></div>
			<br>
			<div style="text-align: center; border-bottom: 1px solid white">
				<p style="font-size: 2.5em; font-family: 'TheJamsil5Bold'; color: white;">
					${contest.contName }
				</p>
			</div>
			<div style="height: 50px;"></div>

			<!-- 이미지 -->
			<div class="col-lg-6" style="left: 150px;">
				<img
					src="https://allforyoung.com/_next/image?url=https%3A%2F%2Fallforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com%2Fuploads%2Fpost_photos%2F2023%2F02%2F24%2Fd6b8251dd44b4821b5364c2e230bf266.jpg&w=1920&q=75"
					alt="Image" class="img-size">
			</div>

			<!-- 내용 -->
			<div class="col-lg-5 ml-auto">
				<h3
					style="font-size: 1.2em; font-family: 'TheJamsil5Bold'; color: white">주최주관</h3>
				<hr style="border: 1.5px solid; color: white; width: 100px;">
				<div id="collapseFive" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordion">
					<div class="body-text">
						<p style="color: #fbbfbf; font-family: 'NanumSquareNeo-Variable';">${contest.contCo }</p>
					</div>
				</div>
				<div style="height: 30px;"></div>

				<h3
					style="font-size: 1.2em; font-family: 'TheJamsil5Bold'; color: white">지원기간</h3>
				<hr style="border: 1.5px solid #ffffff; width: 100px;">
				<div id="collapseFive" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordion">
					<div class="body-text">
						<p style="color: #fbbfbf; font-family: 'NanumSquareNeo-Variable';">
						<fmt:formatDate value="${contest.contStart }" type="date"/> ~ <fmt:formatDate value="${contest.contDead }" type="date"/></p>
					</div>
				</div>
				<div style="height: 30px;"></div>

				<h3
					style="font-size: 1.2em; font-family: 'TheJamsil5Bold'; color: white">공모분야</h3>
				<hr style="border: 1.5px solid #ffffff; width: 100px;">
				<div id="collapseFive" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordion">
					<div class="body-text">
						<p style="color: #fbbfbf; font-family: 'NanumSquareNeo-Variable';">
							${contest.contField }
						</p>
					</div>
				</div>
				<div style="height: 30px;"></div>

				<h3
					style="font-size: 1.2em; font-family: 'TheJamsil5Bold'; color: white">상금규모</h3>
				<hr style="border: 1.5px solid #ffffff; width: 100px;">
				<div id="collapseFive" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordion">
					<div class="body-text">
						<p style="color: #fbbfbf; font-family: 'NanumSquareNeo-Variable';">
							총 ${contest.contAward } 만원
						</p>
					</div>
				</div>
				<div style="height: 30px;"></div>

				<h3
					style="font-size: 1.2em; font-family: 'TheJamsil5Bold'; color: white">참가대상</h3>
				<hr style="border: 1.5px solid #ffffff; width: 100px;">
				<div id="collapseFive" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordion">
					<div class="body-text">
						<p style="color: #fbbfbf; font-family: 'NanumSquareNeo-Variable';">축평원과
							${contest.contTarget }
						</p>
					</div>
				</div>
				<div style="height: 30px;"></div>
				<div class="col-6" style="display: flex; gap: 15px; left: -20px;">
					<button
						style="color: white; font-family: 'NanumSquareNeo-Variable';"
						class="apply-button"
						onclick="supplyURL()">지원하기</button>
						
					<!-- 주소 복사하기 -->
					<button type="button" onclick="shareContest(); return false;"
						class="id__Icon-sc-gkada4-14 share-button" data-projection-id="10">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
							width="16" height="16" fill="#fff">
							<path fill-rule="evenodd"
								d="M13.5 3a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM15 3a3 3 0 01-5.175 2.066l-3.92 2.179a3.005 3.005 0 010 1.51l3.92 2.179a3 3 0 11-.73 1.31l-3.92-2.178a3 3 0 110-4.133l3.92-2.178A3 3 0 1115 3zm-1.5 10a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zm-9-5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0z">
	              		</path></svg>
					</button>

				</div>

				<div style="height: 100px;"></div>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div style="height: 50px;"></div>
			<div>
				<h3
					style="font-size: 1.8em; font-family: 'TheJamsil5Bold'; color: black">상세설명</h3>
				<hr>
				<h1
					style="font-size: 1.2em; font-family: 'NanumSquareNeo-Variable';">
					<strong>●&nbsp;모집개요</strong>
				</h1>
				<br>
				<p style="font-size: 1em; font-family: 'NanumSquareNeo-Variable';">
					${contest.contSummery }
				</p>
			</div>
			<div style="height: 35px;"></div>
			<div>
				<h1
					style="font-size: 1.2em; font-family: 'NanumSquareNeo-Variable';">
					<strong>●&nbsp;공모주제</strong>
				</h1>
				<br>
				<p style="font-size: 1em; font-family: 'NanumSquareNeo-Variable';">
					${contest.contContent }
				</p>
			</div>
			<div style="height: 35px;"></div>
			<div>
				<h1
					style="font-size: 1.2em; font-family: 'NanumSquareNeo-Variable';">
					<strong>●&nbsp;기간 및 일정</strong>
				</h1>
				<br>
				<p style="font-size: 1em; font-family: 'NanumSquareNeo-Variable';">
					- 온라인 접수 : '23 .2 .27 ~ 3 .13.<br> - 1차 심사 : '23 .3 .16.<br>
					- 2차 심사 : '23 .3 .20 ~ 4 .3.<br> - 결과 발표 : '23 .4 .12<br>
					※&nbsp;세부일정은 상황에 따라 변경될 수 있음
				</p>
			</div>
			<div style="height: 35px;"></div>
			<div>
				<h1
					style="font-size: 1.2em; font-family: 'NanumSquareNeo-Variable';">
					<strong>●&nbsp;접수방법</strong>
				</h1>
				<br>
				<p style="font-size: 1em; font-family: 'NanumSquareNeo-Variable';">
					❶ 축산물품질평가원 홈페이지 접속 (https://www.ekape.or.kr)<br>
					❷ 공지사항 게시글 확인<br>
					❸ 작성 및 제출
				</p>
			</div>
			<div style="height: 35px;"></div>
			<div>
				<h1
					style="font-size: 1.2em; font-family: 'NanumSquareNeo-Variable';">
					<strong>●&nbsp;제출서류</strong>
				</h1>
				<br>
				<p style="font-size: 1em; font-family: 'NanumSquareNeo-Variable';">
					❶ 공모전 참가신청서<br>
					❷ 개인정보 수집·이용 및 위탁 동의서<br>
					❸ 저작권 및 유의사항에 관한 동의서
				</p>
			</div>
			<div style="height: 35px;"></div>
			<div>
				<h1
					style="font-size: 1.2em; font-family: 'NanumSquareNeo-Variable';">
					<strong>●&nbsp;문의사항</strong>
				</h1>
				<br>
				<p style="font-size: 1em; font-family: 'NanumSquareNeo-Variable';">
					- 행사관련 문의사항 : 운영 사무국 (k4107081@ekape.or.kr, 044-410-7045)<br>
					- 기타 자세한 사항은 축산물품질평가원 홈페이지 참조<br>
					* 축산물품질평가원 홈페이지(www.ekape.or.kr)
				</p>
			</div>
			<div style="height: 35px;"></div>
			<hr>
		</div>
	</div>
</section>




<script>
	function shareContest() {
		let No = '${contest.contNo}';
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = '<%=request.getContextPath()%>/lab/contest/detail?no=' + No;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		
	};
	
	function supplyURL(){
		location.href = '${contest.contURL}';
	}
	
	swal({
		  title: "Good job!",
		  text: "You clicked the button!",
		  icon: "success",
		});
	

</script>


<!-- SCRIPTS -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/daumPostcode.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>