<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      작성자명      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/pay.css">

<section class="block__18514" id="next-section" >
    
<div class="container-fluid px-0" id="bg-div">
    <div class="row justify-content-center">
        <div class="col-lg-9 col-12">
            <div class="card card0">
                <div class="d-flex" id="wrapper" >
                    <!-- Sidebar -->
                    <div class="bg-light border-right" id="sidebar-wrapper">
                        <div class="sidebar-heading pt-5 pb-4"><strong style="font-size: x-large;">   &nbsp;&nbsp; 결제수단</strong></div>
                        <div class="list-group list-group-flush"> <a data-toggle="tab" href="#menu1" id="tab1" class="tabs list-group-item bg-light">
                                <div class="list-div my-2">
                                    <div class="fa fa-home"></div> &nbsp;&nbsp; 카카오페이
                                </div>
                            </a> <a data-toggle="tab" href="#menu2" id="tab2" class="tabs list-group-item active1">
                                <div class="list-div my-2">
                                    <div class="fa fa-credit-card"></div> &nbsp;&nbsp; 이니시스
                                </div>
                            </a> <a data-toggle="tab" href="#menu3" id="tab3" class="tabs list-group-item bg-light">
                                <div class="list-div my-2">
                                    <div class="fa fa-qrcode"></div> &nbsp;&nbsp;&nbsp; Visa QR <span id="new-label">NEW</span>
                                </div>
                            </a> </div>
                    </div> <!-- Page Content -->
                    <div id="page-content-wrapper">
                        <div class="row pt-3" id="border-btm" style="margin-top: 100px;">
                            <div class="col-4"> <button class="btn btn-success mt-4 ml-3 mb-3" id="menu-toggle">
                                    <div class="bar4"></div>
                                    <div class="bar4"></div>
                                    <div class="bar4"></div>
                                </button> </div>
                            <div class="col-8">
                                <div class="row justify-content-right">
                                    <div class="col-12">
                                        <p class="mb-0 mr-4 mt-4 text-right">customer@email.com</p>
                                    </div>
                                </div>
                                <div class="row justify-content-right">
                                    <div class="col-12">
                                        <p class="mb-0 mr-4 text-right">Pay <span class="top-highlight">$ 100</span> </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center" >
                            <div class="text-center" id="test">Pay</div>
                        </div>
                        <div class="tab-content">
                            <div id="menu1" class="tab-pane">
                                <div class="row justify-content-center" >
                                    <div class="col-11">
                                        <div class="form-card">
                                            <h3 class="mt-0 mb-4 text-center">Enter bank details to pay</h3>
                                            <form onsubmit="event.preventDefault()">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="input-group"> <input type="text" id="bk_nm" placeholder="BBB Bank"> <label>BANK NAME</label> </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="input-group"> <input type="text" name="ben_nm" id="ben-nm" placeholder="John Smith"> <label>BENEFICIARY NAME</label> </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="input-group"> <input type="text" name="scode" placeholder="ABCDAB1S" class="placeicon" minlength="8" maxlength="11"> <label>SWIFT CODE</label> </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12"> <input type="submit" value="결제하기" onclick="fn_direct_pay()" class="btn btn-success placeicon" > </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <p class="text-center mb-5" id="below-btn"><a href="#">Use a test card</a></p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu2" class="tab-pane in active">
                                <div class="row justify-content-center" >
                                    <div class="col-11">
                                        <div class="form-card">
                                            <h3 class="mt-0 mb-4 text-center">Enter your card details to pay</h3>
                                            <form onsubmit="event.preventDefault()">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="input-group"> <input type="text" id="cr_no" placeholder="0000 0000 0000 0000" minlength="19" maxlength="19"> <label>CARD NUMBER</label> </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="input-group"> <input type="text" name="exp" id="exp" placeholder="MM/YY" minlength="5" maxlength="5"> <label>CARD EXPIRY</label> </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="input-group"> <input type="password" name="cvcpwd" placeholder="&#9679;&#9679;&#9679;" class="placeicon" minlength="3" maxlength="3"> <label>CVV</label> </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12"> <input type="submit" value="결제하기" class="btn btn-success placeicon" > </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <p class="text-center mb-5" id="below-btn"><a href="#">Use a test card</a></p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu3" class="tab-pane">
                                <div class="row justify-content-center">
                                    <div class="col-11">
                                        <h3 class="mt-0 mb-4 text-center">Scan the QR code to pay</h3>
                                        <div class="row justify-content-center">
                                            <div id="qr"> <img src="https://i.imgur.com/DD4Npfw.jpg" width="200px" height="200px"> </div>
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
</div>
</section>

<script src="<%=request.getContextPath() %>/resources/js/pay.js"></script>
<script>
function fn_direct_pay(){
	console.log("onclick")
	// 결제금액이 0원일경우 바로 결제완료 처리
	// 카카오 결제 API
	  //var IMP = window.IMP; // 생략가능
	  IMP.init('imp23062788');  // 가맹점 식별코드
	  // IMP.request_pay(param, callback) 결제창 호출
	  IMP.request_pay({
	      pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
	      pay_method: 'card',// 기능 없음
	      merchant_uid : 'merchant_' + new Date().getTime(),
	      name : ${member.memName },
	      amount :  (${exprod.exprodPrice }).replace(',',''), // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.
	      //customer_uid 파라메터가 있어야 빌링키 발급을 시도함
			customer_uid : 'imp23062788',
			buyer_email : ${expert.expertEmail },
			buyer_name : ${expert.memName },
			buyer_tel : ${expert.expertTel },
			buyer_addr : '대전광역시 중구 계룡로 846 3층',
	  }, function(rsp) { //callback
		  if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
	  });

	
}
</script>