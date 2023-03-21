function updateBtn(){
	if($("#agree_chk").is(":checked")){
// 		swal("개인정보 수집에 동의하셔야 합니다.","확인","warning")
		$("#help_send").attr("type","submit");
	}else{
		swal("오류", "개인정보 수집 및 이용에 동의에 체크하세요.", "error");
	}
}

$("#companyInsert").hide();
let comBtn = $("#insertComBtn").on("click",function(){
	 if($('#companyInsert').css('display') == 'none'){
		$("#companyInsert").show();
		$(companyName).val("");
		$(companyId).val("");
	 }else{
		$("#companyInsert").hide();
	 }
})
// var comId = $('[name=comId]') 
let btn = $("#searchBtn").on("click",function(){
	var inner ="";
	var tbody = document.getElementById('companyList');
	var data = $("form[name=myform]").serialize();
	$.ajax({
		url: '/INUProject/company',
		method: "post",
		cache : "false",
		data :  data
		,
		datatype: "json",
		success: (resp) =>{
			console.log(data);
			console.log($("form[name=myform]"));
			console.log(resp)
			var companyList = resp.dataList;
			if(companyList.length>0){
				for(let i=0; i<companyList.length;i++){
					console.log(companyList[i].cmpId)
					inner += "<tr>"
					inner += "<td style='width: 47%;'><a onclick='companyClick(this)' data-dismiss='modal' style='color: black; font-weight: bold;'>"+companyList[i].cmpName+"</a></td>"
					inner += "<td>"+companyList[i].cmpRepName+"</td>"
					inner += "<td>"+companyList[i].cmpAddr2+"</td>"
					inner += "</tr>"
				}
				tbody.innerHTML=inner;
			}else{
				inner += "<tr>"
					inner += "<td colspan='3'>회사 없음</td>"
						inner += "</tr>"
							tbody.innerHTML=inner;
			}
		},
		error : (err)=>{
// 	              console.log(err);
		}
	});
})
// var comId = $('[name=comId]') 
let modalBtn = $("#companyModal").on("click",function(){
	var inner ="";
	var tbody = document.getElementById('companyList');
	var data = $("form[name=myform]").serialize();
	$.ajax({
	    url: '/INUProject/company',
	    method: "post",
	    cache : "false",
	    data :  data
	    ,
	    datatype: "json",
	    success: (resp) =>{
	    		console.log(data);
	    		console.log($("form[name=myform]"));
	    		console.log(resp)
	             var companyList = resp.dataList;
	             if(companyList.length>0){
	            	 for(let i=0; i<companyList.length;i++){
	            		 console.log(companyList[i].cmpId)
	            		 inner += "<tr>"
	            			 inner += "<td style='width: 47%;'><a onclick='companyClick(this)' data-dismiss='modal' style='color: black; font-weight: bold;'>"+companyList[i].cmpName+"</a></td>"
	            			 inner += "<td>"+companyList[i].cmpRepName+"</td>"
	            			 inner += "<td>"+companyList[i].cmpAddr2+"</td>"
	            			 inner += "</tr>"
	            	 }
	            	 tbody.innerHTML=inner;
	             }else{
	            	 inner += "<tr>"
        			 inner += "<td colspan='3'>게시글 없음</td>"
        			 inner += "</tr>"
    				 tbody.innerHTML=inner;
	             }
	              },
	    error : (err)=>{
// 	              console.log(err);
	              }
	   });
})

function companyClick(company){
	var clickText = $(company).text();
	var data ={
			searchType : "company",
			searchWord : clickText
	}
	$.ajax({
		url: '/INUProject/company',
		method:"post",
		cache:"false",
		data : data,
		datatype: "json",
		success : (resp)=>{
			var inputText = resp.dataList[0];
			console.log(inputText)
			$(companyName).val(inputText.cmpName);
			$(companyId).val(inputText.cmpId);
		},
		error : (err)=>{
			console.log(err);
		}
			
	})
	
}

//회사등록 ajax 전송 

let companyInsert = $("#insertCompanyBtn").on("click", function(){
	var companyForm = $("form[name=companyForm]")[0];
	console.log(companyForm)
	var formData =new FormData(companyForm);
	console.log(formData);
	$.ajax({
		url : '/INUProject/company/new',
		type : 'post',
		data : formData,
		success: function(res){
			console.log(res);
			$("#companyInsert").hide();
			$(companyName).val(res.cmpName);
			$(companyId).val(res.cmpId);
		},
		error : function(error){
            console.log("실패원인 :"+error );
        },
        cache:false,
        contentType:false,
        processData:false
	});
})
	 

