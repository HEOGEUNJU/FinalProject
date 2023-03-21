<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      허근주      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<link href="<%=request.getContextPath()%>/resources/cks/processView.css" rel="stylesheet"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	    <ul class="responsive-table" style="position: relative; margin-bottom: 300px; padding-left: 50px; padding-right: 50px; height: 100%; ">
			<li class="table-row" style="padding: 0px; box-shadow: 0 0 0 0; margin-left: 14%;">
			<div>
			 	 <span class="text-primary d-block mb-5">
			  	 	 <span class="icon-magnet display-1"></span>
				 </span>
		  	</div>	
			</li>
			<li class="table-row" style="padding: 0px; box-shadow: 0 0 0 0;">
				<div style="padding-left: 50px; padding-right: 50px; width: 100%; height: 100px;">
					<div style="position: relative; width: 88%; height: 50%; padding: 50px; margin: auto;">
						<div class="pline-container" style=" width: 70%;">
						  	<div class="pline">
						    	<div class="percent"></div>
						  	</div>
						  	<div class="steps">
						    	<div class="step selected completed" id="0"></div>
						    	<div class="step selected " id="5"></div>
						    	<div class="step selected " id="10"></div>
						  	</div>
					  	</div>	
					  	<div class="process-container" style=" width: 75%; margin-left: 12.5%; margin-top: 20px">
						  		<div class="process">
						  			<h5>주의사항</h5>
						  			<h6 style="font-size: 10px;"></h6>
						  			<h6 style="font-size: 10px;"></h6>
						  		</div>
						  		<div class="process" >
						  			<h5>약관동의</h5>
						  			<h6 style="font-size: 10px;"></h6>
						  			<h6 style="font-size: 10px;"></h6>
						  		</div>
						  		<div class="process" >
						  			<h5>신청서작성</h5>
						  			<h6 style="font-size: 10px;"></h6>
						  			<h6 style="font-size: 10px;"></h6>
						  		</div>
							
					  	</div>					  	
					</div>
				</div>
			</li>
			<li class="table-row" style="padding: 0px; box-shadow: 0 0 0 0; margin-top: 100px">
			      <div class="container">
			        <div class="row">
			            <br>
			            <h3>신청 시작 전 확인해주세요.</h3>
			            <p>INU 엑스퍼트는 분야별 전문성을 확인할 수 있는 자격증을 소지하거나 해당 분야의 많은 경험을 확인할 수 있는 분들을 대상으로 모집하고 있습니다. </p>
			           
			            <br>
			            <br>
			            <br>
			            <h3>주의사항</h3>
			            <p>매월 1~3일은 시스템 점검 기간으로 해당 기간 동안 전환 신청 승인이 지연될 수 있습니다.</p>
			            <p>단계 별로 ‘다음’ 버튼 클릭 시, 뒤로 가기 및 수정이 되지않으니 작성 내용을 잘 확인해주세요.
			              신청서 작성 중 또는 작성 완료 후, 화면 상단의 ‘신청 취소하기’ 버튼을 선택하면 신청 정보를 초기화할 수 있습니다.</p>
			            <p><a href="<%=request.getContextPath() %>/expert/application3" class="btn btn-primary btn-md mt-4">신청서작성하기</a></p>
			          </div>
			      </div>
			      </li>
		</ul>
        
