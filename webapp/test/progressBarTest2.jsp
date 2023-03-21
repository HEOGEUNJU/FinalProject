<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
  margin: 0;
  padding: 0;
}
.container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.steps {
  position: relative;
  display: flex;
  justify-content: space-between;
  width: 900px;
}
.step {
  width: 20px;
  height: 20px;
  background: #fff;
  border: 2px solid #ACACA6;
  border-radius: 50%;
  transition: background 1s;
}
.step.selected {
  border: 2px solid #4B81BD;   
}
.step.completed {
  border: 2px solid #4B81BD;
  background: #4B81BD; 
}
.pline {
  position: absolute;
  width: 100%;
  height: 50%;
  border-bottom: 2px solid #ACACA6;
  z-index: -1;
}
.percent {
  position: absolute;
  width: 0;
  height: 100%;
  border-bottom: 2px solid #4B81BD;
  z-index: 1;
  transition: width 1s;
}

</style>

</head>
<body>

<div class="container">
  	<div class="pline">
    	<div class="percent"></div>
  	</div>
  	<div class="steps">
    	<div class="step" id="0"></div>
    	<div class="step" id="1"></div>
    	<div class="step" id="2"></div>
    	<div class="step" id="3"></div>
    	<div class="step" id="4"></div>
    	<div class="step" id="5"></div>
    	<div class="step" id="6"></div>
	    <div class="step" id="7"></div>
  	</div>
</div>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>

<script>
let steps = $(".step");
let last = $(".steps").find("div:last-child").attr("id");
let howMuch = 100 / last;

$(".step").on("click", function(){
	let id = $(this).attr("id");
	let percent = $(".percent");
	let thisMuch = howMuch * id;
	
	//초기화
	for (let i = 0; i < steps.length; i++) {
		$("#" + i).removeClass("selected").removeClass("completed");
		percent.css("width", thisMuch + "%");
	}
	
	//다시
	for (let i = 0; i < steps.length; i++) {
		$("#" + i).addClass("selected").addClass("completed");
		if (id == i) {
			return;
		}
	}
	
	percent.css("width", thisMuch+"%");	
});







<!-- 							<div class="pline-container"> -->
<!-- 							  	<div class="pline"> -->
<!-- 							    	<div class="percent"></div> -->
<!-- 							  	</div> -->
<!-- 							  	<div class="steps"> -->
<!-- 							    	<div class="step" id="0"></div> -->
<!-- 							    	<div class="step" id="1"></div> -->
<!-- 							    	<div class="step" id="2"></div> -->
<!-- 							    	<div class="step" id="3"></div> -->
<!-- 							    	<div class="step" id="4"></div> -->
<!-- 							    	<div class="step" id="5"></div> -->
<!-- 							    	<div class="step" id="6"></div> -->
<!-- 								    <div class="step" id="7"></div> -->
<!-- 							  	</div> -->
<!-- 						  	</div> -->
						  	
<!-- 						  	<div class="process-container"> -->
<!-- 						  		<div class="process">입사지원서<br></div> -->
<!-- 						  		<div class="process">자기소개서<br></div> -->
<!-- 						  		<div class="process">필기시험<br></div> -->
<!-- 						  		<div class="process">역량평가<br></div> -->
<!-- 						  		<div class="process">토론면접<br></div> -->
<!-- 						  		<div class="process">실무면접<br></div> -->
<!-- 						  		<div class="process">인턴십<br></div> -->
<!-- 						  		<div class="process">임원면접<br></div> -->
<!-- 						  	</div> -->
</script>
</body>
</html>