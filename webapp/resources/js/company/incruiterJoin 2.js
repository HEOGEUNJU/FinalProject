$("#companyInsert").hide();
let comBtn = $("#insertComBtn").on("click",function(){
	 if($('#companyInsert').css('display') == 'none'){
		$("#companyInsert").show();
	 }else{
		$("#companyInsert").hide();
	 }
})
// var comId = $('[name=comId]') 
let btn = $("#searchBtn").on("click",function(){
	var inner ="";
	var tbody = document.getElementById('companyList');
	$.ajax({
	    url: '/INUProject/company',
	    method: "post",
	    cache : "false",
	    data :  $("form[name=myform]").serialize()
	    ,
	    datatype: "json",
	    success: (data) =>{
	             var companyList = data.dataList
	             console.log(companyList[0]);
	             if(companyList.length>0){
	            	 for(let i=0; i<companyList.length;i++){
	            		 console.log(companyList[i].cmpId)
	            		 inner += "<tr>"
	            			 inner += "<td><a onclick='companyClick(this)' data-dismiss='modal' style='color: black; font-weight: bold;'>"+companyList[i].cmpName+"</a></td>"
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
	$(companyName).val(clickText);
}







