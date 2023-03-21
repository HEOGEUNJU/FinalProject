<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@charset "UTF-8";
.pline > li {
  transition: 0.5s color;
  position: relative;
  cursor: pointer;
  background: transparent;
}
.pline > li:before, .pline > li:after {
  content: "";
  display: block;
  width: 14px;
  height: 14px;
  text-align: center;
}
.pline > li:before {
  transition: 0.5s background;
  margin: -7px -7px 0;
  border-radius: 14px;
  box-shadow: 0 0 0 3px #ccc;
  background: #fff;
}
.pline > li:after {
  content: "✓";
  position: absolute;
  left: 0;
  top: 0;
  width: 14px;
  height: 14px;
  margin: -7px -7px;
  line-height: 14px;
  color: #fff;
}

.pline > li > i {
  padding: 5px 10px;
  border-radius: 5px;
  border-top-left-radius: 0;
  background: #eee;
  transition: 0.5s background;
  position: absolute;
  width: 100px;
  margin: -7px 0 0 20px;
  font-style: normal;
}
@media only screen and (min-width: 640px) {
  .pline > li > i {
    border-top-left-radius: 5px;
    text-align: center;
  }
}
.pline > li > i:after {
  transition: 0.5s border-color;
  content: "";
  display: block;
  position: absolute;
  top: 0;
  right: 100%;
  margin-right: -5px;
  border: 5px solid transparent;
  border-top-color: #eee;
}
@media only screen and (min-width: 640px) {
  .pline > li > i:after {
    top: auto;
    left: 50%;
    bottom: 100%;
    right: auto;
    margin-left: -5px;
    margin-right: 0;
    border-color: transparent;
    border-bottom-color: #eee;
  }
}
@media only screen and (min-width: 640px) {
  .pline > li > i {
    margin: 10px 0 0 -50px;
  }
}
.pline > li > i:before {
  counter-increment: point;
  content: counter(point) ". ";
}

.pline {
  counter-reset: point;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
  flex: 1 0;
  position: relative;
  margin: auto;
  padding: 0;
  list-style: none;
  color: #999;
}
@media only screen and (min-width: 640px) {
  .pline {
    flex-direction: row;
    width: 80%;
  }
}
.pline:before, .pline:after {
  content: "";
  display: block;
  position: absolute;
  left: -2px;
  top: 0;
  z-index: -1;
}
@media only screen and (min-width: 640px) {
  .pline:before, .pline:after {
    left: 0;
    top: -2px;
    height: 4px;
  }
}
.pline:before {
  width: 4px;
  height: 100%;
  background: #ccc;
}
@media only screen and (min-width: 640px) {
  .pline:before {
    width: 100%;
    height: 4px;
  }
}
.pline:after {
  transition: 0.5s height;
  width: 4px;
  background: #f00;
}
@media only screen and (min-width: 640px) {
  .pline:after {
    transition-property: width;
  }
}
.pline[data-pline="4"] > li:nth-child(-n+5), .pline[data-pline="3"] > li:nth-child(-n+4), .pline[data-pline="2"] > li:nth-child(-n+3), .pline[data-pline="1"] > li:nth-child(-n+2), .pline[data-pline="0"] > li:nth-child(-n+1) {
  color: #666;
}
.pline[data-pline="4"] > li:nth-child(-n+5):before, .pline[data-pline="3"] > li:nth-child(-n+4):before, .pline[data-pline="2"] > li:nth-child(-n+3):before, .pline[data-pline="1"] > li:nth-child(-n+2):before, .pline[data-pline="0"] > li:nth-child(-n+1):before {
  box-shadow: 0 0 0 3px #666, 0 0 0 5px #fff;
}

.pline[data-pline="4"] > li:nth-child(-n+4):before, .pline[data-pline="3"] > li:nth-child(-n+3):before, .pline[data-pline="2"] > li:nth-child(-n+2):before, .pline[data-pline="1"] > li:nth-child(-n+1):before, .pline[data-pline="0"] > li:nth-child(-n+0):before {
  background: #666;
}

.pline[data-pline="4"] > li:nth-child(5) > i, .pline[data-pline="3"] > li:nth-child(4) > i, .pline[data-pline="2"] > li:nth-child(3) > i, .pline[data-pline="1"] > li:nth-child(2) > i, .pline[data-pline="0"] > li:nth-child(1) > i {
  background: #ccc;
}
.pline[data-pline="4"] > li:nth-child(5) > i:after, .pline[data-pline="3"] > li:nth-child(4) > i:after, .pline[data-pline="2"] > li:nth-child(3) > i:after, .pline[data-pline="1"] > li:nth-child(2) > i:after, .pline[data-pline="0"] > li:nth-child(1) > i:after {
  border-top-color: #ccc;
}
@media only screen and (min-width: 640px) {
  .pline[data-pline="4"] > li:nth-child(5) > i:after, .pline[data-pline="3"] > li:nth-child(4) > i:after, .pline[data-pline="2"] > li:nth-child(3) > i:after, .pline[data-pline="1"] > li:nth-child(2) > i:after, .pline[data-pline="0"] > li:nth-child(1) > i:after {
    border-color: transparent;
    border-bottom-color: #ccc;
  }
}

.pline[data-pline="0"]:after {
  height: 0%;
}
@media only screen and (min-width: 640px) {
  .pline[data-pline="0"]:after {
    height: 4px;
    width: 0%;
  }
}
.pline[data-pline="1"]:after {
  height: 25%;
}
@media only screen and (min-width: 640px) {
  .pline[data-pline="1"]:after {
    height: 4px;
    width: 25%;
  }
}
.pline[data-pline="2"]:after {
  height: 50%;
}
@media only screen and (min-width: 640px) {
  .pline[data-pline="2"]:after {
    height: 4px;
    width: 50%;
  }
}
.pline[data-pline="3"]:after {
  height: 75%;
}
@media only screen and (min-width: 640px) {
  .pline[data-pline="3"]:after {
    height: 4px;
    width: 75%;
  }
}
.pline[data-pline="4"]:after {
  height: 100%;
}
@media only screen and (min-width: 640px) {
  .pline[data-pline="4"]:after {
    height: 4px;
    width: 100%;
  }
}
* {
  box-sizing: inherit;
}

.pline-containter {
  flex: 1;
  display: flex;
  flex-direction: column;
  position: relative;
  height: 75%;
  margin: auto;
  font-size: 12px;
}
@media only screen and (min-width: 640px) {
  .pline-containter {
    height: auto;
  }
}

</style>

</head>
<body>

<div class="pline-containter">
	<ol class="pline" data-pline="0">
	    <li><i>Lorem ipsum</i></li>
	    <li><i>Aliquam tincidunt</i></li>
	    <li><i>Vestibulum auctor</i></li>
	    <li><i>Sed eos recusandae</i></li>
	    <li><i>Eos dolore vero voluptas</i></li>
	    <li><i>E2</i></li>
	</ol>
</div>


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>

<script>
function onProgClick(event) {
  const $el = $(event.currentTarget);
  $el.parent().attr("data-pline", $el.index());
}

function initpline() {
  $(".pline").attr("data-pline", 2).on("click", "li", onProgClick);
}

$(() => setTimeout(initpline, 1000));
</script>

</body>
</html>