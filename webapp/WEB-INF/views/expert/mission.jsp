<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 17.     	허근주      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}

<
style>.updateExprod {
	text-align: left;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 600px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.modal_input {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 600px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
</style>
<table class="tg"
	style="width: 75%;
	/* max-height: 50%; */ height: 700px; margin: 60px; margin-left: 200px; text-align: center;"
	id="textTable">
	<form:form name="searchUI"
		action="${pageContext.request.contextPath}/mission/search"
		modelAttribute="simpleCondition" method="get">
		<thead>
			<tr>
				<th class="tg-0pky" colspan="2"><input type="text"
					name="searchId" placeholder="아이디"></th>
				<th class="tg-0pky" colspan="2">
				<input type="text"
					name="searchWord" placeholder="상품명"></th>
				<c:forEach items="${exlprod }" var="exlprod">
					<th class="tg-0lax" colspan="2"><input type="radio"
						name="searchType" value="${exlprod.exlprodId }">${exlprod.exlprodName }
					</th>
				</c:forEach>
			</tr>
			<tr>
				<td class="tg-0pky" colspan="2"><select id="exfield"
					name="searchField" onchange="changeExfield()">
						<option value="">중분류</option>
						<c:forEach items="${exfield }" var="exfield">
							<option value="${exfield.exfieldId }">${exfield.exfieldName }
							</option>
						</c:forEach>
				</select></td>
				<td class="tg-0pky" colspan="2"><select id="exjob" class="exjob"
					name="searchValue">
						<option value="">소분류</option>
						<c:forEach items="${exjob }" var="exjob">
							<option value="${exjob.exjobId }">${exjob.exjobName }</option>
						</c:forEach>
				</select></td>
				<td class="tg-0lax" colspan="2"><input type="date"
					name="startDate"></td>
				<td class="tg-0lax" colspan="2"><input type="date"
					name="endDate"></td>
				
			</tr>
			<tr>
				<td class="tg-0pky" colspan="3"></td>
				<td class="tg-0lax"><button type="button" id="appendBtn">추가</button></td>
				<td class="tg-0lax"><button type="button" id="searchBtn">조회</button></td>
				<td class="tg-0lax"><button type="button" id="saveBtn">저장</button></td>
				<td class="tg-0lax"><button type="button" id="excelBtn">엑셀다운</button></td>
				<td class="tg-0lax"><button type="button" id="deleteBtn">삭제</button></td>
			</tr>
		</thead>
	</form:form>
	<tbody id="tbody">
		<tr>
			<td class="tg-0lax"><h4>전문가 아이디</h4></td>
			<td class="tg-0lax" colspan="2"><h4>상품명</h4></td>
			<td class="tg-0lax"><h4>상품분류</h4></td>
			<td class="tg-0lax"><h4>중분류</h4></td>
			<td class="tg-0lax"><h4>소분류</h4></td>
			<td class="tg-0lax"><h4>시작일</h4></td>
			<td class="tg-0lax"><h4>종료일</h4></td>
		</tr>
		<c:set var="exprodList" value="${pagingVO.dataList }"></c:set>
		<!--         <div id="posts" class="row no-gutter"> -->
		<c:choose>
			<c:when test="${not empty exprodList }">
				<c:forEach items="${exprodList }" var="exprod">
					<tr id="exprodList" ondblclick="rowDublclick(this)">
						<td class="tg-0lax"><input type="checkbox" id="checkbox"
							onclick="checkbox()" value="${exprod.exprodId }">${exprod.memId }
						</td>
						<td class="exprodName tg-0lax" colspan="2" id=checkExprodName>${exprod.exprodName }</td>
						<td class="tg-0lax">${exprod.exlprodId }</td>
						<td class="tg-0lax">${exprod.exfieldId }</td>
						<td class="tg-0lax">${exprod.exjobId }</td>
						<td class="tg-0lax">${exprod.exprodStart }</td>
						<td class="tg-0lax">${exprod.exprodEnd }</td>
						<td class="tg-0lax" style="display: none;">${exprod.exprodId }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</tbody>
</table>
<div class="modal">
	<div class="modal_body" id="modal_body">회원정보 수정</div>
</div>
<%-- <table id="appendDiv" style="display: none;"> 
 		<tr id = "appendExprod" >
		  	<td class="tg-0lax">
		  		<input type="checkbox" id="checkbox"  value="">새로추가
		  	</td>
		    <td class="exprodName tg-0lax" colspan="2">
	    		${exprodName }
		    </td>
			<td class="tg-0lax">
					ㅁㄴㅇ
			</td>
			<td class="tg-0lax">
		       	<select id="exfield" name ="searchField" onchange="changeExfield()">
		    			<option value ="">중분류</option>
					<c:forEach items="${exfield }" var="exfield">
						<option value="${exfield.exfieldId }" >${exfield.exfieldName }
						</option>
					</c:forEach>
    			</select>
			</td>
			<td class="tg-0lax">
		    	<select id="exjob" name="searchValue">
		    			<option value ="">소분류</option>
	    			<c:forEach items="${exjob }" var="exjob">
						<option value="${exjob.exjobId }">${exjob.exjobName }
						</option>
					</c:forEach>
		    	</select> 
   			</td>
			<td class="tg-0lax">
					ㅁㄴㅇ
			</td>
			<td class="tg-0lax">
					ㅁㄴㅇ
			</td>
		 </tr>
</table> --%>
<script
	src="${pageContext.request.contextPath}/resources/js/xlsx.full.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.amd.min.js" integrity="sha512-AlRpjF7UjfDG1M770q8zfavkUdoxrIiRAHkNI0r+e67PGA0qOzORC+pHzaBYGgSUIyy0kC+322KAHeZngxCXeA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<script>
function closeModal(){
	$(".modal").hide();
}
/* row 더블클릭시 수정 팝업 */
function rowDublclick(event){
	const modal = document.querySelector('.modal');
    modal.style.display = 'block';
    console.log(event.childNodes);
	var expertId = event.childNodes[1].innerText;
	var exprodName = event.childNodes[3].innerText;
	var exlprod = event.childNodes[5].innerText;
	var exfieldval = event.childNodes[7].innerText;
	var exjob = event.childNodes[9].innerText;
	var exprodStart = event.childNodes[11].innerText;
	var exprodEnd = event.childNodes[13].innerText;
	var exprodId = event.childNodes[15].innerText;
	console.log(exprodName)
	innerText = ""
	innerText += "<div class = 'updateExprod'>아이디 : <input type='text' value='"+expertId+"'id='memId'/></div>"
	innerText += "<div class = 'updateExprod'>상품명 : <input type='text' value='"+exprodName+"' id='exprodName'/></div>"
	innerText += `<div class = 'updateExprod'>대분류 :    	 <c:forEach items="${exlprod }" var="exlprod">
												    <th class="tg-0lax" colspan="2">
												    	<input type="radio" id="exlprod" name="searchType" value ="${exlprod.exlprodId }">${exlprod.exlprodName }
												    </th>
												    </c:forEach></div>`
	innerText += `<div class = 'updateExprod'>중분류 :        	<select id="exfield" name ="searchField"onchange="changeExfield()" >
	    		<option value ="">중분류</option>
			<c:forEach items="${exfield }" var="exfield">
				<option value="${exfield.exfieldId }" >${exfield.exfieldName }
				</option>
			</c:forEach>
	    	</select></div>`
	innerText += `<div class = 'updateExprod'>소분류 :     	<select id="exjob" class="exjob" name="searchValue">
					<option value ="">소분류</option>
					<c:forEach items="${exjob }" var="exjob">
					<option value="${exjob.exjobId }">${exjob.exjobName }
					</option>
				</c:forEach>
			</select> </div>`
	innerText += "<div class = 'updateExprod'>시작일 : <input type='date' id='exprodStart' value='"+exprodStart+"'/></div>"
	innerText += "<div class = 'updateExprod'>종료일 : <input type='date' id='exprodEnd' value='"+exprodEnd+"'/></div>"
	innerText += "<input type='hidden' id='exprodId' value='"+exprodId+"'/>"
	innerText += "<div class = 'updateExprod'><button type='button'onclick='updateBtn()' >수정</button><button type='button' onclick='closeModal()' >취소</button></div>"
	
	innerText += ""
	
	$("#modal_body").html(innerText)
 }
 function updateBtn(){
		var memId = $('#memId').val();
		console.log(memId);
		var exprodId = $('#exprodId').val();
		var exprodName = $('#exprodName').val();
		var exlrpod = $('#exlprod:checked').val();
		var exfield = $('#exfield').val();
		var exjob = $('#exjob').val();
		var exprodStart = $('#exprodStart').val();
		var exprodEnd = $('#exprodEnd').val();
		if(!memId ||!exprodName ||!exprodStart ||!exprodEnd||!exlrpod){
			alert("빈칸을 모두 입력하세요");
			return;
		}else{
		var data = {exprodId : exprodId,
					exprodName : exprodName,
					exlrpod : exlrpod,
					exfield : exfield,
					exjob : exjob,
					exprodStart : exprodStart,
					exprodEnd : exprodEnd}
		console.log(data)
		 $.ajax({
				url: 'mission/updateModal',
				method:"post",
				data : data,
				datatype: "application/json; charset=UTF-8",
				success : (resp)=>{
					window.alert("수정이 완료되었습니다.");
					document.location.reload(true);
				},
				error : (err)=>{
					console.log(err);
				}
		}) 
		}
 }
let tbody = document.querySelector("#tbody");
let exprodList = document.querySelector("#exprodList");
var innerText = "";

/* xlsx 저장 */
let excelBtn = $("#excelBtn").on("click",function(){
	var wb = XLSX.utils.table_to_book(document.getElementById('textTable'), {sheet:"시트명",raw:true});
	XLSX.writeFile(wb, ('파일명.xlsx'));
});
/* 직업필드 선택시 직업 비동기 구현 */
function changeExfield() {
	var exfieldSelect = $("#exfield option:selected").val();
	var exjobSelect = $(".exjob")
	console.log(exjobSelect)
	exjobSelect.find('option').each(function() {
		$(this).remove();
	})
	exjobSelect.append("<option value=''>직업<option>");
	console.log(exjobSelect)
	var data = {
		"exfieldId" : exfieldSelect
	}
	// 	console.log(data)
	$.ajax({
		url : '/INUProject/expert/exfield',
		method : 'post',
		data : JSON.stringify(data),
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success : function(resp) {
			// 			console.log(resp[0].exfieldId)
			console.log(resp)
			for (i = 0; i < resp.length; i++) {
				exjobSelect.append("<option value="+resp[i].exjobId+">" + resp[i].exjobName + "</option>")
			}
			console.log(exjobSelect);

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}

	})

};

/* 조회 버튼 클릭시 검색 기준에 맞춰 비동기 조회  */
let btn = $("#searchBtn").on("click",function(){
	$('#tbody').remove();
	var data = $("form[name=searchUI]").serialize();
	console.log(data);
	$.ajax({
		url : '/INUProject/mission/search',
		method : 'post',
		data : data,
		dataType : 'json',
		success : function(resp) {
			var exprod = resp.dataList;
			console.log(exprod);
			if(exprod.length>0){
				
		
			var innerText =                                     
				'<tbody id = "tbody">'                          
  				+'<tr style="height: 10px;">                                          '
				+'<td class="tg-0lax"><h4>전문가 아이디</h4>    '
				+'</td>                                         '
				+'<td class="tg-0lax" colspan="2"><h4>상품명</h4'
				+'</td>                                         '
				+'<td class="tg-0lax" ><h4>상품분류</h4>        '
				+'</td>                                         '
				+'<td class="tg-0lax" ><h4>중분류</h4>          '
				+'</td>                                         '
				+'<td class="tg-0lax" ><h4>소분류</h4>          '
				+'</td>                                         '
	  			+'<td class="tg-0lax" ><h4>시작일</h4>          '
	  			+'</td>                                         '
	  			+'<td class="tg-0lax" ><h4>종료일</h4>          '
	  			+'</td>                                         '
	  			+'</tr>'     
			for(i=0; i<exprod.length; i++){
				innerText += '<tr id = "exprodList">'
				innerText += '<td class="tg-0lax"><input type="checkbox" id="checkbox" onclick="checkbox()" value="'+exprod[i].exprodId+'">'+exprod[i].memId+'</td>'
				innerText += ' <td class="exprodName tg-0lax" colspan="2" id="checkExprodName">'+exprod[i].exprodName+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exlprodId+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exfieldId+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exjobId+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exprodStart+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exprodEnd+'</td>'
				innerText += ' </tr>'
			}
	  			innerText += '</tbody>'
			}else{
				var innerText =                                     
					'<tbody id = "tbody">'                          
	  				+'<tr style="height: 10px;">                                          '
					+'<td class="tg-0lax"><h4>전문가 아이디</h4>    '
					+'</td>                                         '
					+'<td class="tg-0lax" colspan="2"><h4>상품명</h4'
					+'</td>                                         '
					+'<td class="tg-0lax" ><h4>상품분류</h4>        '
					+'</td>                                         '
					+'<td class="tg-0lax" ><h4>중분류</h4>          '
					+'</td>                                         '
					+'<td class="tg-0lax" ><h4>소분류</h4>          '
					+'</td>                                         '
		  			+'<td class="tg-0lax" ><h4>시작일</h4>          '
		  			+'</td>                                         '
		  			+'<td class="tg-0lax" ><h4>종료일</h4>          '
		  			+'</td>                                         '
		  			+'</tr>'     
				innerText += ' <td class="tg-0lax" colspan="8">게시글 없음.</td>'
				innerText += '</tbody>'
			}
			$('#textTable').append(innerText);
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	})
});

/* 삭제 버튼 클릭시 삭제 후 리스트 조회*/
let deleteBtn = $("#deleteBtn").on("click",function(){
	var checked = 'input[id="checkbox"]:checked';
	var selectedEls = 
		 	document.querySelectorAll(checked);
		selectedEls.forEach((el) => {
	   		data = {exprodId : el.value}
	 	 });
    console.log(data)
	$.ajax({
	url: 'mission/delete',
	method:"post",
	data : data,
	datatype: "json",
	success : (resp)=>{
		window.alert("삭제가 완료가 확인 되었습니다.");
		document.location.reload(true);
	},
	error : (err)=>{
		console.log(err);
	}
	})
});

/* 상품명 수정 후 체크박스 클릭 후 저장 시 상품명 업데이트 후 리스트 조회 // 저장 버튼 클릭시 exprodId가 있으면 수정 없으면 등록 */
 let saveBtn = $("#saveBtn").on("click",function(){
	var exprodName = $('input[id="checkbox"]:checked').parent().next().children().val();
	var exprodId = $('input[id="checkbox"]:checked').val();
	
	if(exprodId==undefined){
		var memId = $('#newId').val();
		console.log(memId);
		var exprodName = $('#newExprodName').val();
		var exprodStart = $('#newExprodStart').val();
		var exprodEnd = $('#newExprodEnd').val();
		var exlprodId = $('#newExlprodID:checked').val();
		if(!memId ||!exprodName ||!exprodStart ||!exprodEnd||!exlprodId){
			alert("빈칸을 모두 입력하세요");
			return;
		}
		var data ={
			memId : memId,
			exprodName : exprodName,
			exprodStart : exprodStart,
			exprodEnd : exprodEnd,
			exlprodId : exlprodId
		} 
		$.ajax({
			url: 'mission/newprod',
			method:"post",
			data : data,
			datatype: "application/json; charset=UTF-8",
			success : (resp)=>{
				window.alert("등록이 완료됐습니다.");
				document.location.reload(true);
			},
			error : (err)=>{
				console.log(err);
			}
		});
	}else{
		var data = {exprodId : exprodId,
					exprodName : exprodName}
		console.log(data)
		 $.ajax({
				url: 'mission/update',
				method:"post",
				data : data,
				datatype: "application/json; charset=UTF-8",
				success : (resp)=>{
					window.alert("수정이 완료되었습니다.");
					document.location.reload(true);
				},
				error : (err)=>{
					console.log(err);
				}
		}) 
	}
 });
 
 /* checked되면 input태그 생성 */
function checkbox(){
	var checkboxes  =document.querySelectorAll("#checkbox")
	 
    for (var i=0; i<checkboxes.length; i++)
    {
    	checkboxes[i].addEventListener('change', function(event)
        {
			var exprodNameArea = event.target.parentNode.nextSibling.nextElementSibling;
			console.log(exprodNameArea)
			var exprodName = exprodNameArea.innerText;
			console.log(exprodName);
             if (event.target.checked) {
				exprodNameArea.innerHTML="<input id='exprodName' type='text' value= "+exprodName+" >";
            }
            else {
            	console.log("여기")
				exprodNameArea.innerHTML= exprodName
            } 
        });
    }
}
	
	/* $("#checkbox").change(function(){
		console.log(checkboxList)
		for(var i=0; i<checkboxList.length; i++){
			if(checkboxList[i].checked==true){
				console.log(checkboxList[i])
				exprodNameArea.html('<input id="exprodName" type="text" value= "'+exprodNameAreaText+'"/>');
			}else{
				exprodNameArea.html(exprodNameAreaText)
			}
		}
	})
// 		if($("#checkbox").is(":checked")){
// 	})
 }); */
 /* 추가 버튼 클릭시 입력 테이블 생성 */
 let appendBtn = $("#appendBtn").on("click",function(){
 	 var innerText =`	  			
 		<tr id = "appendExprod">
		  	<td class="tg-0lax">
		  		<input type="text" id="newId"  value="" placeholder="아이디">
		  	</td>
		    <td class="exprodName tg-0lax" colspan="2" id="checkExprodName">
	    		<input id="newExprodName" type="text" value= "" placeholder="상품명"/>
		    </td>
		     <td class="tg-0lax" >
		   	 <c:forEach items="${exlprod }" var="exlprod">
		     	<input type="radio"  name="searchType" value ="${exlprod.exlprodId }" id="newExlprodID" >${exlprod.exlprodName }
		     </c:forEach>
		     </td>
			<td class="tg-0lax">
		       	<select id="newExfield" name ="searchField"onchange="changeExfield()">
	    			<option value ="">중분류</option>
				<c:forEach items="${exfield }" var="exfield">
					<option value="${exfield.exfieldId }" >${exfield.exfieldName }
					</option>
				</c:forEach>
    			</select>
			</td>
			<td class="tg-0lax">
		    	<select id="newExjob" name="searchValue">
		    			<option value ="">소분류</option>
	    			<c:forEach items="${exjob }" var="exjob">
						<option value="${exjob.exjobId }">${exjob.exjobName }
						</option>
					</c:forEach>
		    	</select> 
			</td>
			<td class="tg-0lax">
				<input id="newExprodStart" name="exprodStart" type="date">
			</td>
			<td class="tg-0lax">
				<input id="newExprodEnd" name="exprodEnd" type="date">
			</td>
		 </tr>
	`
//  	$('#textTable').append(innerText); 
 	var insertDiv = $('#appendDiv').children();
 	
//  	console.log(${exfield});
 	$('#textTable').append(innerText);
 })
 
 /* 라디오 변경 시 목록 조회 */
 $("input[name='searchType']").change(function(){
	$('#tbody').remove();
	var searchType = $("input[name='searchType']:checked").val();
	alert(searchType);			
	var data = {
			"searchType" : searchType
	}
	$.ajax({
		url : '/INUProject/mission/search',
		method : 'post',
		data : data,
		dataType : 'json',
		success : function(resp) {
			var exprod = resp.dataList;
			console.log(exprod);
			if(exprod.length>0){
				
		
			var innerText =                                     
				'<tbody id = "tbody">'                          
  				+'<tr style="height: 10px;">                                          '
				+'<td class="tg-0lax"><h4>전문가 아이디</h4>    '
				+'</td>                                         '
				+'<td class="tg-0lax" colspan="2"><h4>상품명</h4'
				+'</td>                                         '
				+'<td class="tg-0lax" ><h4>상품분류</h4>        '
				+'</td>                                         '
				+'<td class="tg-0lax" ><h4>중분류</h4>          '
				+'</td>                                         '
				+'<td class="tg-0lax" ><h4>소분류</h4>          '
				+'</td>                                         '
	  			+'<td class="tg-0lax" ><h4>시작일</h4>          '
	  			+'</td>                                         '
	  			+'<td class="tg-0lax" ><h4>종료일</h4>          '
	  			+'</td>                                         '
	  			+'</tr>'     
			for(i=0; i<exprod.length; i++){
				innerText += '<tr id = "exprodList">'
				innerText += '<td class="tg-0lax"><input type="checkbox" id="checkbox" onclick="checkbox()" value="'+exprod[i].exprodId+'">'+exprod[i].memId+'</td>'
				innerText += ' <td class="exprodName tg-0lax" colspan="2" id="checkExprodName">'+exprod[i].exprodName+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exlprodId+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exfieldId+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exjobId+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exprodStart+'</td>'
				innerText += ' <td class="tg-0lax" >'+exprod[i].exprodEnd+'</td>'
				innerText += ' </tr>'
			}
	  			innerText += '</tbody>'
			}else{
				var innerText =                                     
					'<tbody id = "tbody">'                          
	  				+'<tr style="height: 10px;">                                          '
					+'<td class="tg-0lax"><h4>전문가 아이디</h4>    '
					+'</td>                                         '
					+'<td class="tg-0lax" colspan="2"><h4>상품명</h4'
					+'</td>                                         '
					+'<td class="tg-0lax" ><h4>상품분류</h4>        '
					+'</td>                                         '
					+'<td class="tg-0lax" ><h4>중분류</h4>          '
					+'</td>                                         '
					+'<td class="tg-0lax" ><h4>소분류</h4>          '
					+'</td>                                         '
		  			+'<td class="tg-0lax" ><h4>시작일</h4>          '
		  			+'</td>                                         '
		  			+'<td class="tg-0lax" ><h4>종료일</h4>          '
		  			+'</td>                                         '
		  			+'</tr>'     
				innerText += ' <td class="tg-0lax" colspan="8">게시글 없음.</td>'
				innerText += '</tbody>'
			}
			$('#textTable').append(innerText);
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	})
});

 
</script>