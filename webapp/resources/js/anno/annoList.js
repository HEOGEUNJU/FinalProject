/**
*/
function timeForToday(value) {
    let today = new Date();
    let timeValue = new Date(value);

    let betweenTime = Math.floor((today.getTime() - timeValue.getTime())/1000/60);
    if (betweenTime<1) return '방금 전 등록';
    if (betweenTime<60) {
        return betweenTime+'분 전 등록';
    }

    let betweenTimeHour = Math.floor(betweenTime/60);
    if (betweenTimeHour<24) {
        return betweenTimeHour+'시간 전 등록';
    }

    let betweenTimeDay = Math.floor(betweenTime/60/24);
    if (betweenTimeDay<365) {
    	console.log("betweenTimeDay",betweenTimeDay);
        return betweenTimeDay+'일 전 등록';
    }

    return Math.floor(betweenTimeDay/365)+'년 전 등록';
}

/* 페이징 */
let listBody = $("#listBody");
   
let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
	event.preventDefault();
	let page = $(this).data("page");
	if(!page) return false;
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
	return false;
});

//배열 만들어서 push를 if문으로

let makeNewTag00 = function(anno,annoDate){
	return $("<div class='list_item'>").attr("id",anno.annoNo)
			//파란 강조 글씨
// 	       $("<div class='list_item outstand_point'>").attr("id",anno.annoNo)
			.append(
				$("<div class='col company_nm'>").attr("id",anno.cmpId).append(
					$("<a class='str_tit' target='_blank'>").attr("title",anno.company.cmpName).attr("href","회사상세페이지주소").append(
						$("<span>").html(anno.company.cmpName)
					)
					, $("<div class='toolTipWrap wrap_interested_corp'>").append(
						$("<button>").attr("type","button").attr("aria-pressed","false").attr("class","likeCmpBtn interested_corp likeIcon")
						//관심기업 추가되어 있으면 하트에 불 들어옴
// 						$("<button>").attr("type","button").attr("aria-pressed","false").attr("class","likeCmpBtn interested_corp likeIcon interested_on")
						.attr("first_nudge","off").attr("title","관심기업 등록").append(
							$("<span>").html("관심기업 등록")
						)
						, $("<div class='toolTip'>").append(
							$("<span class='tail tail_bottom_center'>")
							, $("<div class='toolTipCont txtCenter'>").html("관심기업 등록")		
						)
					)
				)
				, $("<div class='col notification_info'>").append(
					$("<div class='job_tit'>").append(
						//HOT 아이콘	
// 						$("<span class='prd_icon_02'>"),
						$("<a class='str_tit' target='_blank'>").attr("title",anno.annoTitle)
							.attr("href","${pageContext.request.contextPath}/announcement/view/"+anno.annoNo)
							.append(
								$("<span>").html(anno.annoTitle)		
							)
						, $("<div class='toolTipWrap wrap_scrap'>").append(
							$("<button type='button' scraped='n' bbs_fl='n' imgtype='button' class='likeAnnoBtn spr_scrap btn_scrap likeIcon'>")
							//관심공고 추가되어 있으면 별에 불 들어옴
// 							$("<button type='button' scraped='n' bbs_fl='n' imgtype='button' class='likeAnnoBtn spr_scrap btn_scrap likeIcon on'>")
							.append(
								$("<span class='blind'>").html("스크랩")
							)
							, $("<div class='toolTip'>").append(
								$("<span class='tail tail_bottom_center'>")
								, $("<div class='toolTipCont txtCenter'>").html("스크랩")
							)
						)
					)	
					, $("<div class='job_meta'>").append(
						$("<span class='job_sector'>").append(
							$("<span>").html(" M직종01 ")
							, $("<span>").html(" M직종02 ")
							, $("<span>").html(" M직종03 ")
						)
					)
				)
				, $("<div class='col recruit_condition'>").append(
					$("<p class='career'>").html("McareerNameList")
					, $("<p class='education'>").html(anno.eduName)
				)
				, $("<div class='col company_info'>").append(
					$("<p class='employment_type'>").html("M고용형태중복제거")
					, $("<p class='work_place'>").html(anno.regionName)	
				)
				, $("<div class='col support_info'>").append(
					$("<p class='support_type'>").append(
						$("<button class='sri_btn_xs' title='클릭하면 입사지원할 수 있는 창이 뜹니다.'>").append(
							$("<span class='sri_btn_immediately'>").html("입사지원")
						)
					)
					, $("<p class='deadlines'>")
						//오늘마감
// 						.append($("<b style='font-weight: bold; color: #d63131;'>").html("오늘마감"))
						.append("~ "+anno.annoEnddate)
						.append($("<span class='reg_date'>").html(annoDate))
				)
	);
}
let makeNewTag10 = function(anno,annoDate){
	return $("<div class='list_item'>").attr("id",anno.annoNo)
			//파란 강조 글씨
// 	       $("<div class='list_item outstand_point'>").attr("id",anno.annoNo)
			.append(
				$("<div class='col company_nm'>").attr("id",anno.cmpId).append(
					$("<a class='str_tit' target='_blank'>").attr("title",anno.company.cmpName).attr("href","회사상세페이지주소").append(
						$("<span>").html(anno.company.cmpName)
					)
					, $("<div class='toolTipWrap wrap_interested_corp'>").append(
// 						$("<button>").attr("type","button").attr("aria-pressed","false").attr("class","likeCmpBtn interested_corp likeIcon")
						//관심기업 추가되어 있으면 하트에 불 들어옴
						$("<button>").attr("type","button").attr("aria-pressed","false").attr("class","likeCmpBtn interested_corp likeIcon interested_on")
						.attr("first_nudge","off").attr("title","관심기업 등록").append(
							$("<span>").html("관심기업 등록")
						)
						, $("<div class='toolTip'>").append(
							$("<span class='tail tail_bottom_center'>")
							, $("<div class='toolTipCont txtCenter'>").html("관심기업 등록")		
						)
					)
				)
				, $("<div class='col notification_info'>").append(
					$("<div class='job_tit'>").append(
						//HOT 아이콘	
// 						$("<span class='prd_icon_02'>"),
						$("<a class='str_tit' target='_blank'>").attr("title",anno.annoTitle)
							.attr("href","${pageContext.request.contextPath}/announcement/view/"+anno.annoNo)
							.append(
								$("<span>").html(anno.annoTitle)		
							)
						, $("<div class='toolTipWrap wrap_scrap'>").append(
							$("<button type='button' scraped='n' bbs_fl='n' imgtype='button' class='likeAnnoBtn spr_scrap btn_scrap likeIcon'>")
							//관심공고 추가되어 있으면 별에 불 들어옴
// 							$("<button type='button' scraped='n' bbs_fl='n' imgtype='button' class='likeAnnoBtn spr_scrap btn_scrap likeIcon on'>")
							.append(
								$("<span class='blind'>").html("스크랩")
							)
							, $("<div class='toolTip'>").append(
								$("<span class='tail tail_bottom_center'>")
								, $("<div class='toolTipCont txtCenter'>").html("스크랩")
							)
						)
					)	
					, $("<div class='job_meta'>").append(
						$("<span class='job_sector'>").append(
							$("<span>").html(" M직종01 ")
							, $("<span>").html(" M직종02 ")
							, $("<span>").html(" M직종03 ")
						)
					)
				)
				, $("<div class='col recruit_condition'>").append(
					$("<p class='career'>").html("McareerNameList")
					, $("<p class='education'>").html(anno.eduName)
				)
				, $("<div class='col company_info'>").append(
					$("<p class='employment_type'>").html("M고용형태중복제거")
					, $("<p class='work_place'>").html(anno.regionName)	
				)
				, $("<div class='col support_info'>").append(
					$("<p class='support_type'>").append(
						$("<button class='sri_btn_xs' title='클릭하면 입사지원할 수 있는 창이 뜹니다.'>").append(
							$("<span class='sri_btn_immediately'>").html("입사지원")
						)
					)
					, $("<p class='deadlines'>")
						//오늘마감
// 						.append($("<b style='font-weight: bold; color: #d63131;'>").html("오늘마감"))
						.append("~ "+anno.annoEnddate)
						.append($("<span class='reg_date'>").html(annoDate))
				)
	);
}
let makeNewTag01 = function(anno,annoDate){
	return $("<div class='list_item'>").attr("id",anno.annoNo)
			//파란 강조 글씨
// 	       $("<div class='list_item outstand_point'>").attr("id",anno.annoNo)
			.append(
				$("<div class='col company_nm'>").attr("id",anno.cmpId).append(
					$("<a class='str_tit' target='_blank'>").attr("title",anno.company.cmpName).attr("href","회사상세페이지주소").append(
						$("<span>").html(anno.company.cmpName)
					)
					, $("<div class='toolTipWrap wrap_interested_corp'>").append(
						$("<button>").attr("type","button").attr("aria-pressed","false").attr("class","likeCmpBtn interested_corp likeIcon")
						//관심기업 추가되어 있으면 하트에 불 들어옴
// 						$("<button>").attr("type","button").attr("aria-pressed","false").attr("class","likeCmpBtn interested_corp likeIcon interested_on")
						.attr("first_nudge","off").attr("title","관심기업 등록").append(
							$("<span>").html("관심기업 등록")
						)
						, $("<div class='toolTip'>").append(
							$("<span class='tail tail_bottom_center'>")
							, $("<div class='toolTipCont txtCenter'>").html("관심기업 등록")		
						)
					)
				)
				, $("<div class='col notification_info'>").append(
					$("<div class='job_tit'>").append(
						//HOT 아이콘	
// 						$("<span class='prd_icon_02'>"),
						$("<a class='str_tit' target='_blank'>").attr("title",anno.annoTitle)
							.attr("href","${pageContext.request.contextPath}/announcement/view/"+anno.annoNo)
							.append(
								$("<span>").html(anno.annoTitle)		
							)
						, $("<div class='toolTipWrap wrap_scrap'>").append(
// 							$("<button type='button' scraped='n' bbs_fl='n' imgtype='button' class='likeAnnoBtn spr_scrap btn_scrap likeIcon'>")
							//관심공고 추가되어 있으면 별에 불 들어옴
							$("<button type='button' scraped='n' bbs_fl='n' imgtype='button' class='likeAnnoBtn spr_scrap btn_scrap likeIcon on'>")
							.append(
								$("<span class='blind'>").html("스크랩")
							)
							, $("<div class='toolTip'>").append(
								$("<span class='tail tail_bottom_center'>")
								, $("<div class='toolTipCont txtCenter'>").html("스크랩")
							)
						)
					)	
					, $("<div class='job_meta'>").append(
						$("<span class='job_sector'>").append(
							$("<span>").html(" M직종01 ")
							, $("<span>").html(" M직종02 ")
							, $("<span>").html(" M직종03 ")
						)
					)
				)
				, $("<div class='col recruit_condition'>").append(
					$("<p class='career'>").html("McareerNameList")
					, $("<p class='education'>").html(anno.eduName)
				)
				, $("<div class='col company_info'>").append(
					$("<p class='employment_type'>").html("M고용형태중복제거")
					, $("<p class='work_place'>").html(anno.regionName)	
				)
				, $("<div class='col support_info'>").append(
					$("<p class='support_type'>").append(
						$("<button class='sri_btn_xs' title='클릭하면 입사지원할 수 있는 창이 뜹니다.'>").append(
							$("<span class='sri_btn_immediately'>").html("입사지원")
						)
					)
					, $("<p class='deadlines'>")
						//오늘마감
// 						.append($("<b style='font-weight: bold; color: #d63131;'>").html("오늘마감"))
						.append("~ "+anno.annoEnddate)
						.append($("<span class='reg_date'>").html(annoDate))
				)
	);
}
let makeNewTag11 = function(anno,annoDate){
	return $("<div class='list_item'>").attr("id",anno.annoNo)
			//파란 강조 글씨
// 	       $("<div class='list_item outstand_point'>").attr("id",anno.annoNo)
			.append(
				$("<div class='col company_nm'>").attr("id",anno.cmpId).append(
					$("<a class='str_tit' target='_blank'>").attr("title",anno.company.cmpName).attr("href","회사상세페이지주소").append(
						$("<span>").html(anno.company.cmpName)
					)
					, $("<div class='toolTipWrap wrap_interested_corp'>").append(
// 						$("<button>").attr("type","button").attr("aria-pressed","false").attr("class","likeCmpBtn interested_corp likeIcon")
						//관심기업 추가되어 있으면 하트에 불 들어옴
						$("<button>").attr("type","button").attr("aria-pressed","false").attr("class","likeCmpBtn interested_corp likeIcon interested_on")
						.attr("first_nudge","off").attr("title","관심기업 등록").append(
							$("<span>").html("관심기업 등록")
						)
						, $("<div class='toolTip'>").append(
							$("<span class='tail tail_bottom_center'>")
							, $("<div class='toolTipCont txtCenter'>").html("관심기업 등록")		
						)
					)
				)
				, $("<div class='col notification_info'>").append(
					$("<div class='job_tit'>").append(
						//HOT 아이콘	
// 						$("<span class='prd_icon_02'>"),
						$("<a class='str_tit' target='_blank'>").attr("title",anno.annoTitle)
							.attr("href","${pageContext.request.contextPath}/announcement/view/"+anno.annoNo)
							.append(
								$("<span>").html(anno.annoTitle)		
							)
						, $("<div class='toolTipWrap wrap_scrap'>").append(
// 							$("<button type='button' scraped='n' bbs_fl='n' imgtype='button' class='likeAnnoBtn spr_scrap btn_scrap likeIcon'>")
							//관심공고 추가되어 있으면 별에 불 들어옴
							$("<button type='button' scraped='n' bbs_fl='n' imgtype='button' class='likeAnnoBtn spr_scrap btn_scrap likeIcon on'>")
							.append(
								$("<span class='blind'>").html("스크랩")
							)
							, $("<div class='toolTip'>").append(
								$("<span class='tail tail_bottom_center'>")
								, $("<div class='toolTipCont txtCenter'>").html("스크랩")
							)
						)
					)	
					, $("<div class='job_meta'>").append(
						$("<span class='job_sector'>").append(
							$("<span>").html(" M직종01 ")
							, $("<span>").html(" M직종02 ")
							, $("<span>").html(" M직종03 ")
						)
					)
				)
				, $("<div class='col recruit_condition'>").append(
					$("<p class='career'>").html("McareerNameList")
					, $("<p class='education'>").html(anno.eduName)
				)
				, $("<div class='col company_info'>").append(
					$("<p class='employment_type'>").html("M고용형태중복제거")
					, $("<p class='work_place'>").html(anno.regionName)	
				)
				, $("<div class='col support_info'>").append(
					$("<p class='support_type'>").append(
						$("<button class='sri_btn_xs' title='클릭하면 입사지원할 수 있는 창이 뜹니다.'>").append(
							$("<span class='sri_btn_immediately'>").html("입사지원")
						)
					)
					, $("<p class='deadlines'>")
						//오늘마감
// 						.append($("<b style='font-weight: bold; color: #d63131;'>").html("오늘마감"))
						.append("~ "+anno.annoEnddate)
						.append($("<span class='reg_date'>").html(annoDate))
				)
	);
}


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
			pagingArea.empty();
			searchForm[0].page.value="";
         
			let pagingVO = resp.pagingVO;
         
			let dataList = pagingVO.dataList;
			let newTags = [];
			if(dataList){
				$.each(dataList, function(index, anno){
					let annoDate = timeForToday(anno.annoDate)
					console.log("annoDate",annoDate);
					if(anno.acheck==0 && anno.company.ccheck==0){
						//둘다 안되어잇음
						newTags.push(makeNewTag00(anno,annoDate));
					} else if (anno.acheck==0 && anno.company.ccheck>0){
						//기업만 되어잇음
						newTags.push(makeNewTag10(anno,annoDate));
					} else if (anno.acheck>0 && anno.company.ccheck==0){
						//공고만 되어잇음
						newTags.push(makeNewTag01(anno,annoDate));
					} else {
						//둘다 되어잇음
						newTags.push(makeNewTag11(anno,annoDate));
					}
				});
			}else{
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "7").html("조건에 맞는 공고 없음.")
				);   
				newTags.push(tr);
			}
			listBody.html(newTags);
			if(resp.pagingHTML)
				pagingArea.html(resp.pagingHTML);  
			
			likeAnnoFt();
			likeCmpFt();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return false;
}).submit();

let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
	searchForm[0]['regionCode'].value=$("[name=regionCode]").val();
	searchForm[0]['industryCode'].value=$("[name=industryCode]").val();
	searchForm[0]['job'].value=$("[name=job]").val();
	searchForm[0]['careerName'].value=$("[name=careerName]").val();
	searchForm[0]['searchWord'].value=$("[name=searchWord]").val();
	
	searchForm.submit();
});



/* 관심찍기 */


function likeAnnoFt(){
	$(".likeAnnoBtn").on("click",function(){
		let clickedAnno = $(this);
		let annoNo = clickedAnno.parents(".list_item").attr("id");
		let memId = `${authMemId}`;
		console.log("likeAnnoFt 클릭",$(this),annoNo,memId);
	    let data = {annoNo:annoNo,memId:memId};
	    
	    $.ajax({
	       url : "${pageContext.request.contextPath}/announcement/likeAnno",
	       method : "post",
	       data : JSON.stringify(data),
	       dataType : "text",
	       contentType: 'application/json',
	       success : function(resp) {
	          if(resp=="delete"){
		          console.log("resp : ",resp);
	        	  clickedAnno.removeClass("on");
	          } else if(resp=="insert") {
		          console.log("resp : ",resp);
	        	  clickedAnno.addClass("on")
	          }
	       },
	       error : function(jqXHR, status, error) {
	          console.log(jqXHR);
	          console.log(status);
	          console.log(error);
	       }
	    });
	})
}

function likeCmpFt(){
    $(".likeCmpBtn").on("click",function(){
    	let clickedCmp = $(this);
	    let cmpId=clickedCmp.parents(".company_nm").attr("id");
	    let memId=`${authMemId}`;
	    console.log("likeCmpFt 클릭",$(this),cmpId,memId);
    	let data = {cmpId:cmpId,memId:memId};
        
    	$.ajax({
           url : "${pageContext.request.contextPath}/announcement/likeCmp",
           method : "post",
           data : JSON.stringify(data),
           dataType : "text",
           contentType: 'application/json',
           success : function(resp) {
              console.log("resp : ",resp);
              if(resp=="delete"){
            	  clickedCmp.removeClass("interested_on");
              } else if(resp=="insert") {
            	  clickedCmp.addClass("interested_on")
              }
           },
           error : function(jqXHR, status, error) {
              console.log(jqXHR);
              console.log(status);
              console.log(error);
           }
        }); 
    })
}




/* 보내자... */
/* 하위 지역 셀렉트... */

$("[name=metro]").on("change", function(){
	$("[name='regionCode'] option").remove();   
	$("[name='regionCode']").append("<option>기초</option>");
	
	let ref = $(this).val();
	let data = [{type:'region',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/select",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			console.log("리스트뽑아옴");
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

/* 하위 업종 셀렉트 */

$("[name=industry0]").on("change", function(){
	$("[name='industry1'] option").remove();   
	$("[name='industry1']").append("<option>중위</option>");
	$("[name='industryCode'] option").remove();   
	$("[name='industryCode']").append("<option>하위</option>");
	
	let ref = $(this).val();
	let data = [{type:'industry',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/select",
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
		url : "${pageContext.request.contextPath}/announcement/select",
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

/* 직종 하위 셀렉트 */

$("[name=job0]").on("change", function(){
	$("[name='job1'] option").remove();  
	$("[name='job1']").append("<option>중위</option>");
	$("[name='job'] option").remove();   
	$("[name='job']").append("<option>하위</option>");
	
	let ref = $(this).val();
	let data = [{type:'job',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/select",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			console.log("리스트뽑아옴");
			let jobList = resp.jobList;
			let jobOption = [];
			
			$.each(jobList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
				jobOption.push(tr);
			})
			$("select[name=job1]").append(jobOption);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});   
});
$("[name=job1]").on("change", function(){
	$("[name='job'] option").remove();   
	$("[name='job']").append("<option>하위</option>");
	
	let ref = $(this).val();
	let data = [{type:'job',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/select",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			console.log("리스트뽑아옴");
			let jobList = resp.jobList;
			let jobOption = [];
			
			$.each(jobList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
				jobOption.push(tr);
			})
			$("select[name=job]").append(jobOption);
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
	, {type:'job', code:''}
]
$.ajax({
	url : "${pageContext.request.contextPath}/announcement/select",
	method : "post",
	data : JSON.stringify(topData),
	dataType : "json",
	contentType: 'application/json',
	success : function(resp) {
		console.log("리스트뽑아옴");
		let regionList = resp.regionList;
		let industryList = resp.industryList;
		let jobList = resp.jobList;
		
		console.log("regionList",regionList);
		console.log("industryList",industryList);
		console.log("jobList",jobList);
		
		let regionOption = [];
		let industryOption = [];
		let jobOption = [];
		
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
		$.each(jobList, function(index, val){
			let tr = null;
			tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
			jobOption.push(tr);
		})
		$("select[name=metro]").append(regionOption);
		$("select[name=industry0]").append(industryOption);
		$("select[name=job0]").append(jobOption);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});