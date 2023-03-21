<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 18.      작성자명      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!doctype html>
<html style="
    overflow: hidden;
">    
<title>INU</title>
<script src="/INUProject/resources/header/lib/wow/wow.min.js"></script>
<!-- <script src="/INUProject/resources/header/js/main.js"></script> -->
<script src="https://code.jquery.com/jquery-1.8.3.min.js" ></script>   
<link href="/INUProject/resources/header/bootstrap.min.css" rel="stylesheet">
<link href="/INUProject/resources/header/css/style.css" rel="stylesheet">
<style>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.chat_wrap {
    background-color: #A8C0D6;
}
.chat_wrap::-webkit-scrollbar {
	width: auto; /*스크롤바의 너비*/
}
.chat_wrap::-webkit-scrollbar-track {
	 background-color: #A8C0D6;
}
.chat_wrap::-webkit-scrollbar-thumb {
	 box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

.chat_wrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 20px;
}

.chat_wrap .chat .icon {
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #eee;
}

.chat_wrap .chat .icon i {
    position: absolute;
    top: 10px;
    left: 50%;
    font-size: 2.5rem;
    color: #aaa;
    transform: translateX(-50%);
}

.chat_wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
}

.chat_wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.chat_wrap .ch1 .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

.chat_wrap .ch1 .textbox::before {
    left: -15px;
    content: "◀";
    color: #ddd;
}

.chat_wrap .ch2 {
    flex-direction: row-reverse;
}

.chat_wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #F9EB54;
}

.chat_wrap .ch2 .textbox::before {
    right: -15px;
    content: "▶";
    color: #F9EB54;
}
.time_ch1{
	margin-top: 23px;
	margin-left: 5px;
	font-size: small;
}
.time_ch2{
	margin-top: 23px;
	margin-right: 5px;
	font-size: small;
}
/* .icon{
	margin-top: 20px;
} */
 .name{ 
     margin-left: 20px; 
     font-size: small; 
     font-weight: bold;
 } 
</style>
<%-- <div id="container" style=" margin-top: 30px; margin-bottom: 100px;">
<div class="row mt-3">
	<div class="col-auto">
		<input class="btn btn-primary controlBtn " type="button" value="connect" id="connBtn" onclick="openSocket();"
			
		/>
		<input class="btn btn-danger controlBtn " type="button" value="disconnect" id="disconnBtn" onclick="closeSocket();" />
	</div>

	<div class="col-auto">
		<input class="btn btn-success controlBtn " onclick="send();" type="button" value="SEND" id="sendBtn" />
	</div>
</div>  
<div id="messages" style="width: 400px;">
</div>
<div id="container" >
	<aside>
		<header>
			<input type="text" placeholder="search">
		</header>
		<ul>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_05.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					<h3>
						<span class="status green"></span>
						online
					</h3>
				</div>
			</li>
			
		</ul>
	</aside>
	<main>
		<header>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg" alt="">
			<div>
				<h2>${sessionScope }</h2>
				<h3>already 1902 messages</h3>
			</div>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_star.png" alt="">
		</header>
		<ul id="chat" style="width: 400px;">
			
		</ul>
		<footer>
			<!-- <textarea placeholder="Type your message"></textarea> -->
			<input type="text" id="sender" value="${sessionScope.memId}" style="display: none;">
			<input type="text" id="messageinput" name="text"/>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png" alt="">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png" alt="">
			 <input class="btn btn-success controlBtn " onclick="send();" type="button" value="SEND" id="sendBtn" />
		</footer>
	</main>
	</div>
</div> --%>
<header class="ks-header nav-bar bg-transparentt radius" style="
    width: 100%;
">
    <nav class="navbar navbar-expand-lg navbar-light py-0 px-4 bg-transparent radius">
            <h1 style="font-weight: revert; color: green;     font-size: xx-large;
            " >INU</h1>
      		<button class = "btn" onclick="used()" style="background-color: aliceblue;">사용완료</button>
	</nav>
</header>
<body style="background:#A8C0D6; ">
	<div>
	
    <div class="chat_wrap" id="chatArea" style="height: 510px; overflow: auto;" >
	    <div class="inner" id="chatting">
	    <input type="text" id="sender" value="${sessionScope.memId}" style="display: none;">
<!-- 	        <div class="chat ch1">
	            <div class="icon"><i class="fa-solid fa-user"></i></div>
	          	  	 <div class="name">허근주</div>
		           	 <div class="textbox">
		           	 안녕하세요. 반갑습니다.
		           	 </div>
	            <span class="time_ch1" >오전 10:05</span>
	        </div>
	        <div class="chat ch2">
	            <div class="icon"><i class="fa-solid fa-user"></i></div>
	            <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
	            
	        </div> -->
	        
	    </div>
    </div>
    <input type="text" class="form-control" name="text" id="textIpt" style="position: absolute; top: 83%; height: 112px;">
    </div>
</body>
 <script type="text/javascript">
 var checkUnload = true;
 var data = {"exprodId":`${exprodId}`,
		 	"memId" : `${sessionScope.memId}`}
 console.log(data);
 function used(){
	 if(!confirm("사용을 완료하였습니까?")){
	 }else{
		$.ajax({
			url : '/INUProject/expert/updateState',
			type : 'post',
			data : JSON.stringify(data),
			contentType: 'application/json; charset=utf-8',
			success: function(res){
				console.log(res);
			},
			error : function(error){
	            console.log("실패원인 :"+error );
	            window.close();
	        },
	        cache:false,
		});
	 }
}

var currentTime = function(){
    var date = new Date();
    var hh = date.getHours();
    var mm = date.getMinutes();
    var apm = hh >12 ? "오후":"오전";
    var ct = apm + " "+hh+":"+mm+"";
    return ct;
}
openSocket();
var ws;
var messages = document.getElementById("chatting");
function openSocket(){
    if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
    	writeWhoResponse("WebSocket is already opened.");
        return;
    }
    //웹소켓 객체 만드는 코드
<<<<<<< .mine
    ws = new WebSocket("ws://192.168.219.123:8080${pageContext.request.contextPath}/exprodChat");
||||||| .r312092
=======
    ws = new WebSocket("ws://192.168.35.51${pageContext.request.contextPath}/exprodChat");
>>>>>>> .r312155
    
    ws.onopen = function(event){
        if(event.data === undefined){
              return;
        }
        writeMineResponse(event.data);
    };
    
    ws.onmessage = function(event){
       	var myArray = event.data.split(":");
        if(myArray[0]=="mine"){
        	writeMineResponse(myArray[1]);
        }else{
        	writeWhoResponse(myArray[1]);
        }
    };
    
    ws.onclose = function(event){
    	writeWhoResponse("대화 종료");
    }
    
}

function send(){
   // var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
    var text = document.getElementById("textIpt").value+","+document.getElementById("sender").value;
    console.log(text);
    ws.send(text);
    text = "";
    
}

function closeSocket(){
    ws.close();
}
function writeMineResponse(text){
/*     var _val = $(this).val();
    var _class = $(this).attr("class");
    $(this).val('');
*/
 	var _tar = $(".chat_wrap .inner").append('<div class="chat ch2"><div class="textbox">'+text+'</div><span class="time_ch2">'+currentTime()+'</span> </div>');

    var lastItem = $(".chat_wrap .inner").find(".chat:last");
/*  setTimeout(function(){
     lastItem.addClass("on");
 },10); */
    let messageTextArea = document.getElementById("chatArea")
    messageTextArea.scrollTop = messageTextArea.scrollHeight;
//     var position = lastItem.position().top + $(".chat_wrap").scrollTop();

//     $(".chat_wrap .inner").stop().animate({scrollTop:position},660);
   /*  messages.innerHTML += "<br/>"+text; */
}
function writeWhoResponse(text){
/*     var _val = $(this).val();
    var _class = $(this).attr("class");
    $(this).val('');
*/
 	var _tar = $(".chat_wrap .inner").append('<div class="chat ch1"><div class="icon"><i class="fa-solid fa-user"></i></div><div class="textbox">'+text+'</div><span class="time_ch2">'+currentTime()+'</span> </div>');

    var lastItem = $(".chat_wrap .inner").find(".chat:last");
/*  setTimeout(function(){
     lastItem.addClass("on");
 },10); */
    let messageTextArea = document.getElementById("chatArea")
    messageTextArea.scrollTop = messageTextArea.scrollHeight;
//     var position = lastItem.position().top + $(".chat_wrap").scrollTop();

//     $(".chat_wrap .inner").stop().animate({scrollTop:position},660);
   /*  messages.innerHTML += "<br/>"+text; */
}


function clearText(){
    console.log(messages.parentNode);
    messages.parentNode.removeChild(messages)
  }
$(function(){
    $("input[type='text']").keypress(function(e){
        if(e.keyCode == 13 && $(this).val().length){
       	 send();
		$(this).val("");
        }
    });

});
      

</script>
</html>