<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trans.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trans2.css">
</head>

<body id="top">
  <div id="overlayer"></div>
  <div class="site-wrap">
<!-- 작성 -->
    <section class="site-section">
      <div class="container">
          <div class="col-lg-8 mb-4 mb-lg-0">
            <p>모든 항목에 대해 선택사항이며 작성개수에 따라 점수가 부여됩니다.</p>
          </div>

<!-- 작성 폼 -->
        <div class="row mb-5">
          <div class="col-lg-12">
            <form class="p-4 p-md-5 border rounded" method="post">
              <h3 class="text-black mb-5 border-bottom pb-2">작성하기</h3>
              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">채용횟수</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                    	<!-- id 나중에 입력해야하고 for는 id와 묶기 위함 -->
                      <input type="radio" id="dormancy_term_1" name="dormancy_term" value="1">
                      <label class="lbl" for="dormancy_term_1">10회 이상</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" id="dormancy_term_2" class="inp_check" name="dormancy_term" value="2">
                      <label class="lbl" for="dormancy_term_2">5회 이상</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" id="dormancy_term_3" class="inp_check" name="dormancy_term" value="3">
                      <label class="lbl" for="dormancy_term_3">10회 미만</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" id="dormancy_term_4" class="inp_check" name="dormancy_term" value="4">
                      <label class="lbl" for="dormancy_term_4">5회 미만</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="cont_division form-group">
                <label class="terms_agree" style="font-weight:bold">근무형태</label>
                <div class="agree_desc">
                  <span class="inpChk">
                    	<!-- id 나중에 입력해야하고 for는 id와 묶기 위함 -->
                    <input type="checkbox" id="agree_rule1">
                    <label class="lbl check_custom check_off" for="agree_rule1">
                      <span>정규직</span>
                    </label>
                  </span>
                  <span class="inpChk">
                    <input type="checkbox" id="agree_rule1">
                    <label class="lbl check_custom check_off" for="agree_rule1">
                      <span>계약직</span>
                    </label>
                  </span>
                  <span class="inpChk">
                    <input type="checkbox" id="agree_rule1">
                    <label class="lbl check_custom check_off" for="agree_rule1">
                      <span>아르바이트</span>
                    </label>
                  </span>
                  <span class="inpChk">
                    <input type="checkbox" id="agree_rule1">
                    <label class="lbl check_custom check_off" for="agree_rule1">
                      <span>인턴</span>
                    </label>
                  </span>
                  <span class="inpChk">
                    <input type="checkbox" id="agree_rule1">
                    <label class="lbl check_custom check_off" for="agree_rule1">
                      <span>프리랜서</span>
                    </label>
                  </span>
                  <span class="inpChk">
                    <input type="checkbox" id="agree_rule1">
                    <label class="lbl check_custom check_off" for="agree_rule1">
                      <span>파견직</span>
                    </label>
                  </span>
                  <span class="inpChk">
                    <input type="checkbox" id="agree_rule1">
                    <label class="lbl check_custom check_off" for="agree_rule1">
                      <span>이외</span>
                    </label>
                  </span>
                </div>
              </div>


              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">내일채움공제여부</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inpRdo" value="1" name="benefit">
                      <label class="lbl">Yes</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" class="inpRdo" value="2" name="benefit">
                      <label class="lbl">No</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">면접통보유무</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" value="1" name="inform">
                      <label class="lbl">합격자에게만 통보</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" value="2" name="inform">
                      <label class="lbl">모든 면접자에게 통보</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">근속연수</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="years" value="1">
                      <label class="lbl">1~4년</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="years" value="2">
                      <label class="lbl">5~7년</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="years" value="3">
                      <label class="lbl">8~9년</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="years" value="4">
                      <label class="lbl">10년 이상</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="cont_division" style="font-weight:bold">
                  <label class="terms_agree">연령구성</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="age" value="1">
                      <label class="lbl">20·30대</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="age" value="2">
                      <label class="lbl">30·40대</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="age" value="3">
                      <label class="lbl">40대이상</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="age" value="4">
                      <label class="lbl">연령구성다양</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">야근빈도</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="overtime" value="1">
                      <label class="lbl">대부분없음</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="overtime" value="2">
                      <label class="lbl">주 1~2회</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="overtime" value="3">
                      <label class="lbl">주 3~4회</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="overtime" value="4">
                      <label class="lbl">주 5일</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">업력</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="history" value="1">
                      <label class="lbl">1년 미만</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="history" value="2">
                      <label class="lbl">10년 미만</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="history" value="3">
                      <label class="lbl">30년 미만</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="history" value="4">
                      <label class="lbl">30년 이상</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">기업형태</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="type" value="1">
                      <label class="lbl">대기업</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="type" value="2">
                      <label class="lbl">중견기업</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="type" value="3">
                      <label class="lbl">중소기업</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="type" value="4">
                      <label class="lbl">이외</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">직원 수</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="emp" value="1">
                      <label class="lbl">10명 미만</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="emp" value="2">
                      <label class="lbl">50명 미만</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="emp" value="3">
                      <label class="lbl">100명 미만</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="emp" value="4">
                      <label class="lbl">1000명 미만</label>
                    </span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="terms_agree" style="font-weight:bold">복리후생</label>
                  <div class="row">
                <div class="agree_desc col-md-12">
                  <label style="display: block; margin: 10px 0px 0px 10px;">의료/건강</label>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule2">
                    <label class="lbl check_custom check_off" for="rule2">
                      <span>건강검진 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule2">
                    <label class="lbl check_custom check_off" for="rule2">
                      <span>의료비 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule2">
                    <label class="lbl check_custom check_off" for="rule2">
                      <span>불임부부 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule2">
                    <label class="lbl check_custom check_off" for="rule2">
                      <span>체력단련비 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule2">
                    <label class="lbl check_custom check_off" for="rule2">
                      <span>상해/실손보험 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule2">
                    <label class="lbl check_custom check_off" for="rule2">
                      <span>사내 병원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule2">
                    <label class="lbl check_custom check_off" for="rule2">
                      <span>무료 진료 지정 병원</span>
                    </label>
                  </span>
                </div>


                <div class="agree_desc col-md-12">
                  <label style="display: block; margin: 7px 0px 0px 10px;" >지원제도</label>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>웰컴키트 지급</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>경조사 지원금</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>직원대출지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>명절선물 및 귀향비지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>자사제품 직원할인</span>
                    </label>
                  </span>
                  <br>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>콘도 및 휴양시설 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>임신/출산 선물</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>자녀 학자금 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>통신비 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>주택 지원 대출</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule3">
                    <label class="lbl check_custom check_off" for="rule3">
                      <span>사택/기숙사 운영 및 지원</span>
                    </label>
                  </span>
                </div>



                <div class="agree_desc col-md-12">
                  <label style="display: block; margin: 20px 0px 0px 10px;" >교통/출퇴근</label>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>재택 근무제도</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>기숙사 및 사택 운영</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>야간 교통비 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>통근버스 운행</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>주차장 및 주차비 지원</span>
                    </label>
                  </span>
                  <br>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>절반 근무 및 문화 데이</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>유류비 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>자율 및 탄력 근무 제도</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule4">
                    <label class="lbl check_custom check_off" for="rule4">
                      <span>주 4일 / 주 4.5일 근무</span>
                    </label>
                  </span>
                </div>


                <div class="agree_desc col-md-12">
                  <label style="display: block; margin: 20px 0px 0px 10px;" >급여/보상</label>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>야근 및 휴일 특근 수당</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>장기근속자 금전포상</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>퇴직연금 및 퇴직금</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>생일 선물 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>인센티브 및 성과급</span>
                    </label>
                  </span>
                  <br>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>우수사원 금전포상</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>연차 수당</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>우리 사주 및 스톡옵션</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule5">
                    <label class="lbl check_custom check_off" for="rule5">
                      <span>위험 수당</span>
                    </label>
                  </span>
                </div>


                <div class="agree_desc col-md-12">
                  <label style="display: block; margin: 20px 0px 0px 10px;" >연차/휴가</label>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>반차 및 시간제 연차 사용</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>리프레쉬/장기근속 휴가</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>결혼/장례 등 경조사 휴가</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>본인 출산 휴가</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>병가 (유급/무급)</span>
                    </label>
                    <br>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>배우자 출산 휴가</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>육아 휴직</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>휴직 (유급/무급)</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>창립 기념일 휴무</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>임산부 단축근무</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>생일 조기퇴근직원 등록</span>
                    </label>
                  </span>
                  <br>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>입사 1주년 조기퇴근직원 등록</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule6">
                    <label class="lbl check_custom check_off" for="rule6">
                      <span>여름 휴가</span>
                    </label>
                  </span>
                </div>


                <div class="agree_desc col-md-12">
                  <label style="display: block; margin: 20px 0px 0px 10px;" >근무환경</label>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>구내 식당 및 카페테리아 운영</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>아침/점심/저녁식사 지원 제공</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>업무용 소프트 웨어 제공</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>최고 성능 PC/노트북 지원</span>
                    </label>
                  </span>
                  <br>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>무료 간식 및 음료 제공</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>어린이집 지원/운영</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>사내 동호회 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>수면실 및 휴게실 운영</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>안마실 및 안마 의자 운영</span>
                    </label>
                  </span>
                  <br>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule7">
                    <label class="lbl check_custom check_off" for="rule7">
                      <span>스탠딩 책상 지원</span>
                    </label>
                  </span>
                </div>


                <div class="agree_desc col-md-12">
                  <label style="display: block; margin: 20px 0px 0px 10px;" >교육/자기개발</label>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>도서구입비 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>멘토링 제도 운영</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>어학 교육비 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>대학원, 유학 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>기타 자기계발비 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>자격증 취득 지원</span>
                    </label>
                  </span>
                  <br>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>컨퍼런스 개최 및 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>본인 학자금 지원</span>
                    </label>
                  </span>
                  <span class="inpChk" style="margin: 16px 0px 0px 10px;">
                    <input type="checkbox" id="rule8">
                    <label class="lbl check_custom check_off" for="rule8">
                      <span>연간 복지비 제공직원 등록</span>
                    </label>
                  </span>
                </div>
              </div>
              </div>


              <div class="form-group">
                <div class="cont_division">
                  <label class="terms_agree" style="font-weight:bold">회식빈도</label>
                  <div class="sri_radio_wrap">
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="dining" value="1">
                      <label class="lbl">월 2회 이상</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="dining" value="2">
                      <label class="lbl">월 1회</label>
                    </span>

                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="dining" value="3">
                      <label class="lbl">분기 1회</label>
                    </span>
                    <span class="inpRdo">
                      <input type="radio" class="inp_check" name="dining" value="4">
                      <label class="lbl">연 1회</label>
                    </span>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

        <div class="row align-items-center mb-5">
          <div class="col-lg-6 ml-auto">
            <div class="row">
              <div class="col-4">
                <a href="#" class="btn btn-block btn-light btn-md">취소</a>
              </div>
              <div class="col-4">
                <a href="#" class="btn btn-block btn-light btn-md">
                <span class="icon-open_in_new mr-2"></span>임시저장</a>
              </div>
              <div class="col-4">
                <a href="#" class="btn btn-block btn-primary btn-md">투명도 등록</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
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
<script src="${pageContext.request.contextPath}/resources/js/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>