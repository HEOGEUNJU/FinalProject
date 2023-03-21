$("#fillBtn1").on("click",function(event){
	$("[name=annoTitle]").val('[현대차증권] 2023년 하반기 각 분야 채용공고');
	$("[name=annoWorkenv]").val('내용입니다');
	CKEDITOR.instances.annoWorkenv.setData('<p>더 나은 금융을 향한 동반자</p><p>개인금융, 기업금융을 비롯하여 퇴직연금 등 다양한 분야에서 특화된 금융서비스를 제공하고 창의적인 발상으로 새로운 금융의 미래를 열어갑니다.</p>');
	// 날짜는 직접 입력
//	myAnnoForm.annoStartdate.value = '시작일';
//	myAnnoForm.annoEnddate.value = '종료일';
	
	//수동
	$("[name=industry0]").val('4').trigger("change");
//	$("[name=industry1]").val('401').trigger("change");
//	$("[name=industryCode]").val('40125');
	
	//근무환경
	$("[name=eduCode]").val('05');
	$("[name=annoSalary]").val('연봉');
	$("[name=salaryDetail]").val(4000);
	$("#salaryDetail").attr("style","display:block");
	$("[name=annoProbation]").val('2개월');
	//annoContent에는 사진만 업로드하기
	//자동채우기 x
	
	//추가할 개수만큼 만들기
	//태그 비우고 만들기
	$("#welDiv").append(
		$("<li>").append(
			$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('의료비 지원 (본인,가족)')
			, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('A02')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('상해/실손 보험 지원')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('A05')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('웰컴키트 지급')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('B01')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('경조사 지원금')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('B02')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('자녀 학자금 지원')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('B09')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('통신비 지원')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('B10')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('통근버스 운행')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('C04')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('유류비 지원')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('C07')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('인센티브 및 성과급')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('D05')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('연차 수당')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('D07')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('청년 내일 채움 공제 지원')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('D10')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('멘토링 제도 운영')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('G02')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('컨퍼런스 개최 및 지원')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('G07')
		)
	);
	$("#welDiv").append(
		$("<li>").append(
				$("<a>").attr("class","welTag").attr("href","#").attr("onclick","return false;").html('병가 (유급/무급)')
				, $("<input>").attr("type","hidden").attr("name","welfareCodeList").val('E05')
		)
	);
	
	//세부01
	$("[name='detailList[0].daFd']").val('컨텐츠 제작 및 기획자');
	$("[name='detailList[0].job0']").val('05').trigger("change");
//	$("[name='detailList[0].job1']").val('056').trigger("change");
//	$("[name='detailList[0].jobCode']").val('415500');
	$("[name='detailList[0].daCount']").val(2);

	$("[name='detailList[0].careerNames'][value='신입']").prop("checked",true);
	$("[name='detailList[0].careerNames'][value='경력']").prop("checked",true);
	$("[name='detailList[0].daCarYeer']").val('1년 이상').parents(".careerYear").attr("style","display:block");
	
	CKEDITOR.instances.daTask0.setData(`
		<p>ㆍ당사 투자 채널인 &lsquo;투자맛집TV&rsquo;컨텐츠&nbsp;기획 및 제작<br />
		ㆍ국내외 증시/시황 관련 당사&nbsp;애널리스트와 다양한 컨텐츠를 기획, 제작<br />
		ㆍ투자,재테크 등 MZ세대가 관심있어하는&nbsp;금융 컨텐츠를 창의적이고 센스있게&nbsp;기획, 제작<br />
		ㆍ기타 콘텐츠 제작 (글쓰기, 출연, 편집)&nbsp;</p>
	`);
	CKEDITOR.instances.daCondition0.setData(`
		<p>ㆍ컨텐츠 기획 및 제작 경력 3년 이상<br />
		ㆍ포트폴리오 제출 필수&nbsp;(본인의 기여도 표기 必)<br />
		ㆍ스크립트 작성 역량 보유 및 컨텐츠 출연 가능<br />
		ㆍ금융, 경제, 재테크 관심 多</p>

	`);
	CKEDITOR.instances.daPrefer0.setData(`
		<p>ㆍ금융, 경제, 증시 관련 에디터, 유튜버, 인플루언서 경험 보유<br />
		ㆍ차별화된 영상 콘텐츠 기획 및 디렉팅&nbsp;경험 보유<br />
		ㆍ글쓰기, 촬영, 편집 등 역량 보유 보유<br />
		ㆍ유관 부서와의 협업을 위해 원활한&nbsp;커뮤니케이션 능력 보유<br />
		ㆍ브랜딩 관점이 아닌 실제 구독자 입장에서&nbsp;콘텐츠를 기획하고 이슈화 및 BOOM-UP&nbsp;경험 보유</p>
	`);
	
	
	$("[name='detailList[0].empltypeCode']").val('01');

	$("[name='detailList[0].inpositionCode'][value='A07']").prop("checked",true);
	
	$("[name='detailList[0].regionVO.regionName']").val('대전 서구');
	$("#sample4_jibunAddress0").val('대전 서구');
	
	//세부02
	$("[name='detailList[1].daFd']").val('IB (유동화) 담당');
	$("[name='detailList[1].job0']").val('01').trigger("change");
//	$("[name='detailList[1].job1']").val('01C').trigger("change");
//	$("[name='detailList[1].jobCode']").val('031900');
	$("[name='detailList[1].daCount']").val(5);

	$("[name='detailList[1].careerNames'][value='경력']").prop("checked",true);
	$("[name='detailList[1].daCarYeer']").val('4년 이상').parents(".careerYear").attr("style","display:block");
	$("[name='detailList[1].empltypeCode']").val('02');

	$("[name='detailList[1].inpositionCode'][value='A07']").prop("checked",true);
	
	$("[name='detailList[1].regionVO.regionName']").val('서울 용산구');
	$("#sample4_jibunAddress1").val('서울 용산구');

	CKEDITOR.instances.daTask1.setData(`
		<p>ㆍ자산유동화: 원화 및 외화 정기예금유동화&nbsp;등 자산유동화업무 일체<br />
		ㆍ업무수탁 : SPC계좌개설, 유동화증권&nbsp;발행업무 등<br />
		ㆍ기업금융 : 회사채 발행 등 기업금융 실무<br />
		ㆍ부동산PF : PF실무 및 자산관리/대리금융&nbsp;기관 업무 등</p>
	`);
	CKEDITOR.instances.daCondition1.setData(`
		<p>ㆍ영어 역량 우수자<br />
		ㆍ국내/외 증시 상장기업 리서치&nbsp;경력 5년 이상</p>
	`);
	CKEDITOR.instances.daPrefer1.setData(`
		<p>ㆍETF/파생상품 헷지 운용 관련 업무 경험<br />
		ㆍ금융공학/수학/통계 관련 전공자<br />
		ㆍ부동산 개발 및 PF 주선 업무 유경험자<br />
		ㆍ금융 및 부동산 관련 자격증 보유자</p>
	`);
	
	//세부03
	$("[name='detailList[2].daFd']").val('기업분석 RA');
	$("[name='detailList[2].job0']").val('01').trigger("change");
//	$("[name='detailList[2].job1']").val('011').trigger("change");
//	$("[name='detailList[2].jobCode']").val('012205');
	$("[name='detailList[2].daCount']").val(3);

	$("[name='detailList[2].careerNames'][value='경력무관']").prop("checked",true);
//	$("[name='detailList[2].daCarYeer']").val('4년 이상');
	$("[name='detailList[2].empltypeCode']").val('01');
	
	$("[name='detailList[2].inpositionCode'][value='A07']").prop("checked",true);
	$("[name='detailList[2].inpositionCode'][value='A11']").prop("checked",true);

	$("[name='detailList[2].regionVO.regionName']").val('대전 중구');
	$("#sample4_jibunAddress2").val('대전 중구');
	
	CKEDITOR.instances.daTask2.setData(`
		<p>ㆍ국내 및 해외 산업/기업 분석에 필요한&nbsp;DB 업데이트 및 정리<br />
		ㆍ애널리스트 자료발간, 세미나 및&nbsp;리퀘스트 업무 지원<br />
		ㆍ그룹 및 사내 자료 요청 대응 지원,&nbsp;리서치센터 공통업무 수행 등</p>
	`);
	CKEDITOR.instances.daCondition2.setData(`
		<p>ㆍ대학 기졸업자 및 2023.08월 졸업예정자<br />
		ㆍ유효한 어학(영어)성적 보유자&nbsp;(※ 영어권 해외대학 졸업(예정)자 제외)</p>
	`);
	CKEDITOR.instances.daPrefer2.setData(`
		<p>ㆍRA 업무 유경험자<br />
		ㆍ외국어 역량 우수자(중국어)<br />
		ㆍ투자분석사 자격증 보유</p>
	`);
});

$("#fillBtn2").on("click",function(event){
	$("[name=industry1]").val('401').trigger("change");
	$("[name='detailList[0].job1']").val('056').trigger("change");
	$("[name='detailList[1].job1']").val('01C').trigger("change");
	$("[name='detailList[2].job1']").val('011').trigger("change");
});

$("#fillBtn3").on("click",function(event){
	$("[name=industryCode]").val('40125');
	$("[name='detailList[0].jobCode']").val('415500');
	$("[name='detailList[1].jobCode']").val('031900');
	$("[name='detailList[2].jobCode']").val('012205');
});

