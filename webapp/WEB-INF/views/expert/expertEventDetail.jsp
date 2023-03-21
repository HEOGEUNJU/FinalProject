<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      작성자명      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script
	src="${pageContext.request.contextPath }/resources/ckeditorEasyimage/ckeditor.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/jobs-view.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/jobs-recruit.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/recruit-template-reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/recruit-template.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/common_ui_keeping.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/expert/exprodDetail.css" />
	<style>.titleSection--1lnfz{-webkit-box-sizing:border-box;box-sizing:border-box;max-width:1280px;margin:0 auto;padding:0 20px;position:relative;display:block;font-size:13px;line-height:20px}@media only screen and (min-width: 768px){.titleSection--1lnfz{padding-left:40px;padding-right:40px}}.titleSection--1lnfz:first-child{padding-top:40px} .title--1Yy8N{-webkit-box-flex:1;-webkit-flex:1 1 auto;-ms-flex:1 1 auto;flex:1 1 auto;overflow:hidden;font-size:18px;font-weight:bold}.titleSection--1lnfz .titleText--2C27G{position:relative}.titleSection--1lnfz .count--3dDe1{margin-left:4px;color:#4a65f6}.titleSection--1lnfz .count--3dDe1{margin-left:4px;color:#4a65f6}.titleSection--1lnfz .titleArea--s3-rN,.titleSectionMore--1SMjB .titleArea--s3-rN{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;width:100%;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}.titleSection--1lnfz .titleText--2C27G,.titleSectionMore--1SMjB .titleText--2C27G{-webkit-box-flex:1;-webkit-flex:1 1 auto;-ms-flex:1 1 auto;flex:1 1 auto;line-height:24px;font-size:20px;font-weight:600}@media screen and (min-width: 1025px){.titleSection--1lnfz .titleText--2C27G,.titleSectionMore--1SMjB .titleText--2C27G{line-height:29px;font-size:24px;font-weight:700}}.titleSection--1lnfz .titleLink--2BV8L,.titleSectionMore--1SMjB .titleLink--2BV8L{-webkit-box-flex:0;-webkit-flex:none;-ms-flex:none;flex:none;margin:-10px -10px -10px 0;padding:10px;color:#7e96ff}.titleSection--1lnfz .titleLink--2BV8L .linkText--Nm8Me,.titleSectionMore--1SMjB .titleLink--2BV8L .linkText--Nm8Me{margin-right:4px}.titleSection--1lnfz .titleLink--2BV8L .iconCircleArrow--oYTT- circle,.titleSectionMore--1SMjB .titleLink--2BV8L .iconCircleArrow--oYTT- circle{stroke:rgba(126,150,255,.5)}.titleSection--1lnfz .titleLink--2BV8L .iconCircleArrow--oYTT- path,.titleSectionMore--1SMjB .titleLink--2BV8L .iconCircleArrow--oYTT- path{stroke-width:2}.titleSection1--3W4WE{-webkit-box-sizing:border-box;box-sizing:border-box;max-width:1280px;margin:0 auto;padding:4rem 20px 0;text-align:center}@media only screen and (min-width: 768px){.titleSection1--3W4WE{padding-left:40px;padding-right:40px}}.titleSection1--3W4WE:first-child{padding-top:0}.titleSection1--3W4WE.primary--27Ntp{color:#fff}.titleSection1--3W4WE.secondary--16KZp{color:#4a65f6}.titleSection1--3W4WE .SubTitleItem_titleSection--ai8xs .SubTitleItem_title--m9p8G{letter-spacing:-0.5px}.titleSection1--3W4WE .desc--C15dj{font-size:1.3rem;line-height:2.6rem;font-weight:500;letter-spacing:-0.5px}.titleSection2--14028{-webkit-box-sizing:border-box;box-sizing:border-box;max-width:1280px;margin:0 auto;padding:4rem 20px 0}@media only screen and (min-width: 768px){.titleSection2--14028{padding-left:40px;padding-right:40px}}.titleSection2--14028:first-child{padding-top:0}.titleSection2--14028 .titleWrap--2uknh{position:relative}.titleSection2--14028 .title--1Yy8N{display:inline-block;font-size:2rem;line-height:2.4rem;font-weight:600;letter-spacing:-0.5px;vertical-align:top}@media screen and (min-width: 1025px){.titleSection2--14028 .title--1Yy8N{font-weight:bold}}.titleSection2--14028 .title--1Yy8N em{position:relative;color:#4a65f6;display:inline-block;vertical-align:top;font-weight:900}.titleSection2--14028 .title--1Yy8N em::after{position:absolute;right:0;bottom:0;left:0;height:4px;background-color:rgba(74,101,246,.3);content:""}@media screen and (min-width: 768px){.titleSection2--14028 .title--1Yy8N em::after{height:6px}}.titleSection2--14028 .optionText--1NnLG{font-size:1.3rem;line-height:24px;font-weight:500}.titleSection2--14028 .optionText--1NnLG.primary--27Ntp{color:#7e96ff}.titleSection2--14028 .iconCircleArrow--oYTT-{margin:0 0 2px 2px;vertical-align:bottom}@media screen and (min-width: 1025px){.titleSection2--14028 .iconCircleArrow--oYTT-{margin-left:5px}}.titleSection2--14028 .iconInfo--1jcml{margin-top:2px}.titleSection2--14028 .optionArea--2CQRF{position:absolute;right:0;bottom:0;white-space:nowrap}.titleSection2--14028 .Tooltip_tooltipBox--3cktk{position:static}.titleSection2--14028 .Tooltip_button--1GcuD{margin:0;padding:4px 5px;line-height:16px}@media screen and (min-width: 768px){.titleSection2--14028 .Tooltip_button--1GcuD{padding-top:6px;padding-bottom:6px}}.titleSection2--14028 .Tooltip_tooltip--oqI7T{top:30px;padding:20px;width:260px}.titleSection2--14028 .Tooltip_tooltipText--1BSaG{color:#333}.titleSection2--14028 .Tooltip_description--3nWLN li{padding-left:0;color:#8c8c8c}.titleSection2--14028 .Tooltip_description--3nWLN li::before{display:none}.titleSectionMore--1SMjB{display:block;position:relative;text-align:left;-webkit-box-sizing:border-box;box-sizing:border-box}.titleSectionMore--1SMjB:after{content:"";display:block;clear:both}.titleSectionMore--1SMjB .iconCircleArrow--oYTT-{margin-top:3px}.titleSectionMore--1SMjB .iconArrow--amU8P{display:inline-block;overflow:hidden;position:relative;width:16px;height:8px;vertical-align:top;margin:8px 0 0 10px}.titleSectionMore--1SMjB .iconArrow--amU8P:before{position:absolute;top:50%;left:50%;content:""}.titleSectionMore--1SMjB .iconArrow--amU8P:before{width:9px;height:9px;-webkit-transform:translate(-50%, -50%) rotate(45deg);transform:translate(-50%, -50%) rotate(45deg);margin-top:-3px;border:1px solid #4c4c4c;border-width:0 1px 1px 0}.titleSectionMore--1SMjB[aria-expanded=true] .iconArrow--amU8P{-webkit-transform:rotate(180deg);transform:rotate(180deg)}.titleSectionMore--1SMjB .SubTitleItem_title--m9p8G{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;width:100%}.titleSectionMore--1SMjB .SubTitleItem_title--m9p8G .title--1Yy8N{-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1}.sortSection--1hdXB .sortBox--3CPHM:first-child{margin-left:10px}.sortSection--1hdXB .sortChoose--VNsXx{display:block;font-size:14px;font-weight:normal;color:#4c4c4c}.sortSection--1hdXB .sortChoose--VNsXx .iconSort--36f2f{display:inline-block;overflow:hidden;position:relative;width:10px;height:5px;margin:6px 0 0 10px;vertical-align:top}.sortSection--1hdXB .sortChoose--VNsXx .iconSort--36f2f:before{position:absolute;top:50%;left:50%;content:""}.sortSection--1hdXB .sortChoose--VNsXx .iconSort--36f2f:before{width:5px;height:5px;-webkit-transform:translate(-50%, -50%) rotate(45deg);transform:translate(-50%, -50%) rotate(45deg);margin-top:-2px;border:1px solid #4c4c4c;border-width:0 1px 1px 0}.tooltip--2TWvw{position:absolute;top:-44px;right:-2px;padding:8px 12px;-webkit-border-radius:6px;border-radius:6px;background-color:#484e68;font-size:13px;line-height:17px;color:#fff;-webkit-box-sizing:border-box;box-sizing:border-box}.tooltip--2TWvw strong{font-weight:bold;color:#c6d1fd}.tooltip--2TWvw:before{position:absolute;right:25px;bottom:-6px;width:0;height:0;margin-left:-10px;border-style:solid;border-width:10px 10px 0 10px;border-color:#484e68 rgba(0,0,0,0) rgba(0,0,0,0) rgba(0,0,0,0);content:""}.dropdownSection--1ngOa{-webkit-box-sizing:border-box;box-sizing:border-box;max-width:1280px;margin:0 auto;padding:0 20px}@media only screen and (min-width: 768px){.dropdownSection--1ngOa{padding-left:40px;padding-right:40px}}.dropdownSection--1ngOa.isSmall--3O7ME{padding-top:7px;padding-bottom:7px}.dropdownSection--1ngOa.isLarge--310Iv{padding-top:20px;padding-bottom:20px}.dropdownSection--1ngOa.isLarge--310Iv .SelectBox_selectCustom--7JJey .SelectBox_choose--2fT2b{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;max-width:209px;font-size:15px;line-height:28px}.dropdownSection--1ngOa .titleWrap--2uknh{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;-ms-flex-pack:justify;justify-content:space-between}.dropdownSection--1ngOa .titleArea--s3-rN{-webkit-box-flex:0;-webkit-flex:0;-ms-flex:0;flex:0}.dropdownSection--1ngOa .titleArea--s3-rN .title--1Yy8N{white-space:nowrap;font-weight:normal}.dropdownSection--1ngOa .count--3dDe1{color:#000}.dropdownSection--1ngOa .selectArea--2Ssvf{min-width:0;white-space:nowrap}.dropdownSection--1ngOa .titleWrap--2uknh{position:relative;z-index:2}.dropdownSection--1ngOa .title--1Yy8N{display:inline-block;font-size:14px;line-height:24px;letter-spacing:-0.5px;vertical-align:top}.dropdownSection--1ngOa .title--1Yy8N.primary--27Ntp{font-size:15px;line-height:28px}.dropdownSection--1ngOa .title--1Yy8N em{position:relative;color:#4a65f6;display:inline-block;vertical-align:top;font-weight:900}.dropdownSection--1ngOa .title--1Yy8N em::after{position:absolute;right:0;bottom:0;left:0;height:4px;background-color:rgba(74,101,246,.3);content:""}@media screen and (min-width: 768px){.dropdownSection--1ngOa .title--1Yy8N em::after{height:6px}}.dropdownSection--1ngOa .count--3dDe1{margin-left:4px}.dropdownSection--1ngOa .optionText--1NnLG{font-size:1.3rem;line-height:2.4rem;font-weight:500}.dropdownSection--1ngOa .optionText--1NnLG.primary--27Ntp{color:#7e96ff}.dropdownSection--1ngOa .iconCircleArrow--oYTT-{margin:0 0 .3rem 2px;vertical-align:bottom}@media screen and (min-width: 1025px){.dropdownSection--1ngOa .iconCircleArrow--oYTT-{margin-left:5px}}.dropdownSection--1ngOa .iconInfo--1jcml{margin-top:2px}.dropdownSection--1ngOa .SelectBox_selectCustom--7JJey .SelectBox_choose--2fT2b{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;max-width:209px;font-size:14px;line-height:24px;padding:0 27px 0 0;border:0;color:#000;background-color:rgba(0,0,0,0)}.dropdownSection--1ngOa .SelectBox_selectCustom--7JJey .SelectBox_choose--2fT2b .SelectBox_iconArrow--U1ZjD:before{border-color:#000}.dropdownSection--1ngOa .SelectBox_selectCustom--7JJey .SelectBox_choose--2fT2b[aria-expanded=true]{color:#000}.dropdownSection--1ngOa .SelectBox_selectCustom--7JJey .SelectBox_choose--2fT2b[aria-expanded=true] .SelectBox_iconArrow--U1ZjD:before{border-color:#000}.dropdownSection--1ngOa .SelectBox_selectCustom--7JJey .SelectBox_iconArrow--U1ZjD{right:4px}.dropdownSection--1ngOa .SelectBox_selectCustom--7JJey .SelectBox_label--5hJJJ{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-right:50px}.dropdownSection--1ngOa .SelectBox_selectCustom--7JJey .SelectBox_selectList--3ZxjR{left:auto;top:34px;min-width:136px;max-width:280px;overflow:hidden}.dropdownSection--1ngOa .SelectBox_selectCustom--7JJey .SelectBox_selectCustom--7JJey{z-index:2}</style>
<style>
html {
	font-size: 10px
}

@media only screen and (min-width: 768px) {
	html {
		font-size: 12px
	}
}

html, body {
	min-width: 320px
}

body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
	form, fieldset, legend, input, textarea, button, select {
	margin: 0;
	padding: 0
}

body {
	-webkit-text-size-adjust: none;
	text-size-adjust: none
}

body, input, textarea, select, button, table, h1, h2, h3, h4, h5, h6 {
	font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue",
		Helvetica, "Apple SD Gothic Neo", sans-serif
}

html[data-useragent*=Windows] body, html[data-useragent*=Windows] input,
	html[data-useragent*=Windows] textarea, html[data-useragent*=Windows] select,
	html[data-useragent*=Windows] button, html[data-useragent*=Windows] table,
	html[data-useragent*=Macintosh] body, html[data-useragent*=Macintosh] input,
	html[data-useragent*=Macintosh] textarea, html[data-useragent*=Macintosh] select,
	html[data-useragent*=Macintosh] button, html[data-useragent*=Macintosh] table,
	html[data-useragent*=X11] body, html[data-useragent*=X11] input, html[data-useragent*=X11] textarea,
	html[data-useragent*=X11] select, html[data-useragent*=X11] button,
	html[data-useragent*=X11] table {
	font-family: -apple-system, BlinkMacSystemFont, Helvetica,
		"Apple SD Gothic Neo", "\B9D1\C740   \ACE0\B515", "Malgun Gothic",
		Dotum, "\B3CB\C6C0", sans-serif
}

body, input, textarea, select, button, table {
	font-size: 14px;
	line-height: 1.2;
	color: #000
}

img, fieldset {
	border: 0
}

img, svg {
	vertical-align: top
}

ul, ol {
	list-style: none
}

em, address {
	font-style: normal;
	font-weight: 400
}

a {
	color: #000;
	text-decoration: none
}

button {
	background-color: rgba(0, 0, 0, 0);
	border: 0;
	-webkit-border-radius: 0;
	border-radius: 0
}

table {
	border-collapse: collapse
}

hr {
	display: none
}

.u_skip, .blind {
	position: absolute;
	clip: rect(0, 0, 0, 0);
	width: 1px;
	height: 1px;
	margin: -1px;
	overflow: hidden
}

select, input[type=text], input[type=tel], input[type=checkbox], input[type=number]
	{
	-webkit-border-radius: 0;
	border-radius: 0
}

input[type=text]::-ms-clear, input[type=text]::-ms-reveal {
	display: none;
	width: 0;
	height: 0
}

input[type=search]::-webkit-search-decoration, input[type=search]::-webkit-search-cancel-button,
	input[type=search]::-webkit-search-results-button, input[type=search]::-webkit-search-results-decoration
	{
	display: none
}

::-webkit-input-placeholder {
	color: #8c8c8c
}

input[type=number]::-webkit-inner-spin-button, input {
	-webkit-appearance: none
}

@font-face {
	font-family: NanumSquare;
	font-weight: 400;
	src: url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareR.eot);
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareR.eot?#iefix)
		format("embedded-opentype"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff)
		format("woff"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareR.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumSquare;
	font-weight: 600;
	src: url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareB.eot);
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareB.eot?#iefix)
		format("embedded-opentype"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareB.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareB.woff)
		format("woff"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareB.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumSquareNeo;
	font-weight: 400;
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-bRg.eot);
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-bRg.eot?#iefix)
		format("embedded-opentype"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-bRg.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-bRg.woff)
		format("woff"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-bRg.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumSquareNeo;
	font-weight: 700;
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-cBd.eot);
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-cBd.eot?#iefix)
		format("embedded-opentype"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-cBd.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-cBd.woff)
		format("woff"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-cBd.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumSquareNeo;
	font-weight: 800;
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-dEb.eot);
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-dEb.eot?#iefix)
		format("embedded-opentype"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-dEb.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-dEb.woff)
		format("woff"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-dEb.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumSquareNeo;
	font-weight: 900;
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-eHv.eot);
	src:
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-eHv.eot?#iefix)
		format("embedded-opentype"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-eHv.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-eHv.woff)
		format("woff"),
		url(https://ssl.pstatic.net/static/kin/fonts/NanumSquareNeoTTF-eHv.ttf)
		format("truetype")
}

.bgType {
	background-color: #ebebeb
}

.separateBar {
	position: relative;
	border: 1px solid #eaeaea;
	border-width: 1px 0;
	background-color: #f7f7f7;
	height: 10px
}

.separateBar+.section_topic {
	border-top-width: 0
}

.separateBarBg {
	height: 8px;
	background-color: #eee
}

.toolTipLayer {
	position: fixed;
	right: 0;
	bottom: 10px;
	left: 0;
	display: none;
	z-index: 10;
	width: 100%;
	padding: 0 5px 0;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	font-size: 13px;
	white-space: nowrap;
	text-align: center
}

.toolTipLayer .descTooltip {
	display: inline-block;
	margin: 0 auto;
	padding: 1.1rem 1.5rem .9rem;
	background-color: rgba(0, 0, 0, .8);
	color: #fff;
	border: 1px solid #000;
	word-wrap: break-word;
	white-space: pre-wrap
}

.toolTipLayer.toolTipLayer3s {
	animation-name: toolTip3s;
	animation-duration: 1s;
	animation-delay: 3s;
	animation-fill-mode: forwards;
	-webkit-animation-name: toolTip3s;
	-webkit-animation-duration: 1s;
	-webkit-animation-delay: 3s;
	-webkit-animation-fill-mode: forwards
}

@
-webkit-keyframes toolTip3s { 0%{
	opacity: 1
}

100%{
opacity
:
0;z-index
:
-1
}
}
@
keyframes toolTip3s { 0%{
	opacity: 1
}

100%{
opacity
:
0;z-index
:
-1
}
}
.loadingBox {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: table;
	z-index: 10000;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, .7);
	text-align: center
}

.loadingBox .loadingInner {
	display: table-cell;
	height: 8px;
	vertical-align: middle
}

.loadingItem {
	display: inline-block;
	width: 8px;
	height: 8px;
	margin: 0 2px;
	font-size: 0;
	line-height: 0;
	background-color: #00c73c;
	vertical-align: middle;
	-webkit-animation: loadingBox .8s ease-in-out infinite;
	animation: loadingBox .8s ease-in-out infinite
}

.loadingItem+.loadingItem {
	-webkit-animation-delay: .1s;
	animation-delay: .1s
}

.loadingItem+.loadingItem+.loadingItem {
	-webkit-animation-delay: .2s;
	animation-delay: .2s
}

@
-webkit-keyframes loadingBox { 40%,60%{
	-webkit-transform: scale(1);
	transform: scale(1)
}

0%,100%{
-webkit-transform
:scale(0)
;transform
:scale(0)
}
}
@
keyframes loadingBox { 40%,60%{
	-webkit-transform: scale(1);
	transform: scale(1)
}

0%,100%{
-webkit-transform
:scale(0)
;transform
:scale(0)
}
}
.iconLoading {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -4px 0 0 -21px
}

.iconLoading:after {
	content: "";
	display: block;
	clear: both
}

.iconLoading span {
	float: left;
	width: 8px;
	height: 8px;
	margin: 0 3px;
	background-color: #7e96ff;
	-webkit-animation: bounce 1.5s .5s linear infinite;
	animation: bounce 1.5s .5s linear infinite;
	content: ""
}

.iconLoading span.loading2 {
	-webkit-animation-delay: .1s;
	animation-delay: .1s
}

.iconLoading span.loading3 {
	-webkit-animation-delay: .2s;
	animation-delay: .2s
}

@
-webkit-keyframes bounce { 0%,50%,100%{
	-webkit-transform: scale(1);
	transform: scale(1)
}

25%{
-webkit-transform
:scale
(0
.6
);transform
:scale
(0
.6
)
}
75%{
-webkit-transform
:scale
(1
.4
);transform
:scale
(1
.4
)
}
}
@
keyframes bounce { 0%,50%,100%{
	-webkit-transform: scale(1);
	transform: scale(1)
}

25%{
-webkit-transform
:scale
(0
.6
);transform
:scale
(0
.6
)
}
75%{
-webkit-transform
:scale
(1
.4
);transform
:scale
(1
.4
)
}
}
.section_more .inner {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	display: table;
	position: relative;
	width: 100%;
	border: 1px solid rgba(0, 0, 0, 0);
	text-align: center
}

.section_more.loader_wrap .loader {
	display: block;
	position: relative;
	height: 4.1rem
}

.section_more.loader_wrap .loader img {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -11px;
	margin-left: -11px
}

.commPaging {
	display: block;
	text-align: center
}

.commPaging .pagingCount {
	display: inline-block;
	width: 68px;
	font-size: 14px;
	line-height: 28px;
	color: #999
}

.commPaging .pagingCount .current {
	color: #4778ff
}

.commPaging .pagingPrev, .commPaging .pagingNext {
	display: inline-block;
	width: 26px;
	height: 26px;
	border: 1px solid #dfdfdf;
	font-size: 0;
	line-height: 0;
	color: rgba(0, 0, 0, 0);
	vertical-align: top
}

.commPaging .pagingPrev:before, .commPaging .pagingNext:before {
	display: block;
	width: 8px;
	height: 8px;
	margin: 8px 0 0 10px;
	border-top: 1px solid #979797;
	border-left: 1px solid #979797;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
	content: ""
}

.commPaging .pagingNext:before {
	margin: 8px 0 0 6px;
	-webkit-transform: rotate(135deg);
	transform: rotate(135deg)
}

.endCbox.u_cbox {
	margin: 0 20px -1px;
	padding: 0
}

.endCbox.u_cbox .u_cbox_layer_sticker {
	left: 0;
	right: 0
}

@media only screen and (min-width: 768px) {
	.endCbox.u_cbox {
		margin: 0 8.3%
	}
}

@media only screen and (min-width: 1024px) {
	.endCbox.u_cbox {
		margin: 0 15.8%
	}
}
</style>
<style>
.bg_Pink--s53e1 {
	background-color: #fff2f5
}

.bg_Purple--1qKs2 {
	background-color: #ede6ff
}

.bg_Blue--3DXHu {
	background-color: #dfe3ff
}

.bg_Skyblue--2UpLe {
	background-color: #dcf2fc
}

.bg_Green--4gKt_ {
	background-color: #e1f4e6
}

.eventInfo--3Uj1c {
	background-color: #fafbff
}

.inner--22EO_ {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 20px;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	height: 54px;
	line-height: 22px
}

@media only screen and (min-width: 768px) {
	.inner--22EO_ {
		padding-left: 40px;
		padding-right: 40px
	}
}

.eventPeriod--Fjuj5 {
	font-size: 17px;
	font-weight: 300
}

.eventBadge--2e1qA {
	font-size: 13px;
	font-weight: 500;
	padding: 0 8px;
	margin-left: 8px;
	-webkit-border-radius: 12px;
	border-radius: 12px;
	color: #969dbc;
	background-color: #e7eaf7
}

.eventBadge--2e1qA.badgeHighlight--16y0J {
	color: #ff7070;
	background-color: rgba(255, 112, 112, .2)
}

.eventThumbnail--2Xi17 {
	min-height: 360px;
	max-height: 540px;
	background: no-repeat center/auto 100%
}

.eventBox--3-oBr {
	padding: 0 20px;
	max-width: 688px;
	margin: 0 auto
}

@media only screen and (min-width: 768px) {
	.eventBox--3-oBr {
		padding-left: 40px;
		padding-right: 40px
	}
}

.eventSummary--31Rx2 {
	position: relative;
	padding: 20px;
	margin: -40px auto 0;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-border-radius: 5px;
	border-radius: 5px
}

.summaryText--3_x7Y {
	word-break: break-all;
	word-wrap: break-word;
	margin-top: 12px;
	font-size: 15px;
	line-height: 20px;
	color: #fff
}

.eventContent--17g10 {
	word-break: break-all;
	word-wrap: break-word;
	padding: 30px 0 40px
}

@media screen and (min-width: 768px) {
	.eventContent--17g10 {
		padding: 50px 0 60px
	}
}

.eventContent--17g10 .eventBox--3-oBr+.eventBox--3-oBr {
	margin-top: 20px
}

.eventContent--17g10 .eventBox--3-oBr+.eventArea--3hpam,
	.eventContent--17g10 .eventArea--3hpam+.eventBox--3-oBr {
	margin-top: 40px
}

@media screen and (min-width: 768px) {
	.eventContent--17g10 .eventBox--3-oBr+.eventArea--3hpam,
		.eventContent--17g10 .eventArea--3hpam+.eventBox--3-oBr {
		margin-top: 60px
	}
}

.eventContent--17g10 .alignLeft--Vmc40 {
	text-align: left
}

.eventContent--17g10 .alignCenter--RRhD9 {
	text-align: center
}

.eventContent--17g10 .alignRight--2wDQh {
	text-align: right
}

.eventTimer--3FYfN {
	position: relative;
	margin: 6px auto 26px;
	width: 288px;
	height: 205px;
	padding-top: 13px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	text-align: center;
	background:
		url("https://ssl.pstatic.net/static/kin/section/expert/m/bgEventTimer.png")
		no-repeat center/cover
}

.eventTimer--3FYfN .timer--1ywSe {
	display: inline-block;
	position: relative;
	width: 260px;
	padding: 25px 0;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-border-radius: 12px;
	border-radius: 12px;
	background-color: #4a65f6;
	vertical-align: top;
	color: #fff
}

.eventTimer--3FYfN .timer--1ywSe::before {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	-webkit-border-radius: 12px;
	border-radius: 12px;
	background-color: rgba(0, 0, 0, .2);
	content: ""
}

.eventTimer--3FYfN .title--MQjtT {
	display: block;
	position: relative;
	font-family: NanumSquare, sans-serif;
	font-size: 18px;
	line-height: 21px
}

.eventTimer--3FYfN .time--2LC4J {
	position: relative;
	margin: 20px -4px 0
}

.eventTimer--3FYfN .box--uUKZq {
	display: inline-block;
	width: 30px;
	height: 40px;
	margin: 0 2px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	background-color: rgba(255, 255, 255, .2);
	font-size: 24px;
	font-weight: 600;
	line-height: 40px;
	vertical-align: top
}

.eventTimer--3FYfN .icon--2vTXT {
	display: inline-block;
	margin: 13px 4px 0;
	vertical-align: top
}

.eventTimer--3FYfN .icon--2vTXT::before, .eventTimer--3FYfN .icon--2vTXT::after
	{
	display: block;
	width: 4px;
	height: 4px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: rgba(255, 255, 255, .4);
	content: ""
}

.eventTimer--3FYfN .icon--2vTXT::after {
	margin-top: 6px
}

.eventTimer--3FYfN.isDimmed--3efVR .timer--1ywSe {
	background-color: #a6a9b9
}

.eventArea--3hpam {
	padding: 40px 0
}

@media screen and (min-width: 768px) {
	.eventArea--3hpam {
		padding: 50px 0
	}
}

.eventTitle--R9vNv {
	display: block;
	font-size: 22px;
	line-height: 30px;
	padding: 10px 0
}

.eventText--h6TOq {
	font-size: 18px;
	line-height: 27px;
	padding: 10px 0;
	color: rgba(0, 0, 0, .8)
}

.eventText--h6TOq em, .eventText--h6TOq strong, .eventText--h6TOq b {
	font-weight: bold
}

.eventImage--3GyS6 {
	text-align: center;
	margin-top: 10px
}

.eventImage--3GyS6 a {
	display: inline-block
}

.eventImage--3GyS6 img {
	max-width: 100%
}

.eventImage--3GyS6+.eventText--h6TOq {
	margin-top: 10px
}

.couponList--2rvQz {
	margin: 5px -14px 0
}

.couponItem--1a-w4 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center
}

.couponItem--1a-w4+.couponItem--1a-w4 {
	margin-top: 6px
}

.noticeItem--2ynXt {
	position: relative;
	padding-left: 10px;
	font-size: 14px;
	line-height: 20px;
	color: rgba(0, 0, 0, .9)
}

.noticeItem--2ynXt::before {
	position: absolute;
	top: 7px;
	left: 0;
	width: 5px;
	height: 5px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #4a65f6;
	content: ""
}

.noticeItem--2ynXt+.noticeItem--2ynXt {
	margin-top: 10px
}

.noticeItem--2ynXt em, .noticeItem--2ynXt strong, .noticeItem--2ynXt b {
	font-weight: bold
}

.eventButton--2y4SQ {
	margin-top: 20px
}

.eventButton--2y4SQ+.eventButton--2y4SQ {
	margin-top: 20px
}

.eventButton--2y4SQ .ExpertButton_buttonExpert--Rf7mx:not (.ExpertButton_secondary--3exkC
	){
	border: none;
	background-color: rgba(59, 81, 197, .1)
}

.eventEmpty--3jOAA {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	width: 100%;
	height: 400px;
	border-bottom: 1px solid #e5e5e5;
	background-color: #fafbfe;
	font-size: 18px;
	line-height: 23px;
	text-align: center;
	color: #8c8c8c
}

.EventCarousel_section--17ygN {
	padding-top: 40px;
	background-color: #f4f7ff
}

@media screen and (min-width: 768px) {
	.EventCarousel_section--17ygN {
		padding-top: 60px
	}
}

.eventItem--2Nm83 {
	padding: 10px 0
}

.primary--jWV7u .ExpertButton_buttonExpert--Rf7mx:not (.ExpertButton_secondary--3exkC
	){
	color: #4a65f6
}

.primary--jWV7u .ExpertButton_secondary--3exkC {
	border-color: rgba(74, 101, 246, .1)
}

.primary--jWV7u .FixedButton_button--EYn0- {
	background-color: #3447b0
}

.secondary--1atM5 .timer--1ywSe {
	background-color: #6f7acd
}

.secondary--1atM5 .timer--1ywSe::after {
	border-color: #d5d8f1
}

.secondary--1atM5 .shape--2nlSK::before {
	background-color: #d5d8f1
}

.secondary--1atM5 .ExpertButton_buttonExpert--Rf7mx:not (.ExpertButton_secondary--3exkC
	){
	color: #6f7acd
}

.secondary--1atM5 .ExpertButton_secondary--3exkC {
	border-color: rgba(111, 122, 205, .1);
	background-color: #6f7acd
}

.secondary--1atM5 .FixedButton_button--EYn0- {
	background-color: #4f5793
}

.tertiary--3GQSi .timer--1ywSe {
	background-color: #34495d
}

.tertiary--3GQSi .timer--1ywSe::after {
	border-color: #c3c9cf
}

.tertiary--3GQSi .shape--2nlSK::before {
	background-color: #c3c9cf
}

.tertiary--3GQSi .ExpertButton_buttonExpert--Rf7mx:not (.ExpertButton_secondary--3exkC
	){
	background-color: rgba(41, 58, 74, .1);
	color: #34495d
}

.tertiary--3GQSi .ExpertButton_secondary--3exkC {
	border-color: rgba(52, 73, 93, .1);
	background-color: #34495d
}

.tertiary--3GQSi .FixedButton_button--EYn0- {
	background-color: #243442
}

.quarternary--326mj .timer--1ywSe {
	background-color: #687a85
}

.quarternary--326mj .timer--1ywSe::after {
	border-color: #d2d8db
}

.quarternary--326mj .shape--2nlSK::before {
	background-color: #d2d8db
}

.quarternary--326mj .ExpertButton_buttonExpert--Rf7mx:not (.ExpertButton_secondary--3exkC
	){
	background-color: rgba(83, 97, 106, .1);
	color: #687a85
}

.quarternary--326mj .ExpertButton_secondary--3exkC {
	border-color: rgba(104, 122, 133, .1);
	background-color: #687a85
}

.quarternary--326mj .FixedButton_button--EYn0- {
	background-color: #4a575f
}

.quinary--1YMA7 .timer--1ywSe {
	background-color: #6f7382
}

.quinary--1YMA7 .timer--1ywSe::after {
	border-color: #d4d5da
}

.quinary--1YMA7 .shape--2nlSK::before {
	background-color: #d4d5da
}

.quinary--1YMA7 .ExpertButton_buttonExpert--Rf7mx:not (.ExpertButton_secondary--3exkC
	){
	background-color: rgba(89, 92, 104, .1);
	color: #6f7382
}

.quinary--1YMA7 .ExpertButton_secondary--3exkC {
	border-color: rgba(111, 115, 130, .1);
	background-color: #6f7382
}

.quinary--1YMA7 .FixedButton_button--EYn0- {
	background-color: #4f525d
}

.senary--bqZdP .timer--1ywSe {
	background-color: #333
}

.senary--bqZdP .timer--1ywSe::after {
	border-color: #c2c2c2
}

.senary--bqZdP .shape--2nlSK::before {
	background-color: #c2c2c2
}

.senary--bqZdP .ExpertButton_buttonExpert--Rf7mx:not (.ExpertButton_secondary--3exkC
	){
	background-color: rgba(40, 40, 40, .1);
	color: #333
}

.senary--bqZdP .ExpertButton_secondary--3exkC {
	border-color: rgba(51, 51, 51, .1);
	background-color: #333
}

.senary--bqZdP .FixedButton_button--EYn0- {
	background-color: #232323
}
</style>
<style>
.endHeader--2JPNw .Header_buttonRight--328uE .Header_buttonWrap--2Eaxy {
	margin-left: 3px
}

@media screen and (min-width: 1025px) {
	.endHeader--2JPNw .Header_buttonRight--328uE .Header_buttonWrap--2Eaxy {
		margin-left: 0
	}
}

.endHeader--2JPNw.themeBlack--1Ty3v .Header_headerWrap--yXlqe.Header_isFixed--2w1Ic
	{
	background-color: #000
}

.subHeader--2JFq0 {
	background-color: #fff
}

.inner--2-cpy {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 16px 20px;
	position: relative
}

@media only screen and (min-width: 768px) {
	.inner--2-cpy {
		padding-left: 40px;
		padding-right: 40px
	}
}

.headerFixed--phElc {
	height: 56px
}

@media screen and (min-width: 1025px) {
	.headerFixed--phElc {
		height: 68px
	}
}

.buttonSection--3nGYz {
	position: absolute;
	top: 50%;
	right: 15px;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%)
}

@media screen and (min-width: 768px) {
	.buttonSection--3nGYz {
		right: 35px
	}
}

.buttonCompose--3CK-3 {
	position: relative
}

.button--3hHJJ {
	padding: 5px;
	vertical-align: top
}

.iconMore--LVQCS {
	display: block;
	padding: 4px 4px 3px 17px
}

.iconMore--LVQCS span {
	display: block;
	width: 3px;
	height: 3px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #000
}

.iconMore--LVQCS span+span {
	margin-top: 4px
}

.layerMenu--icI85 {
	position: absolute;
	top: 38px;
	right: 0;
	z-index: 1;
	min-width: 100px;
	padding: 4px 0;
	border: 1px solid rgba(126, 150, 255, .3);
	-webkit-border-radius: 10px;
	border-radius: 10px;
	background-color: #fff;
	-webkit-box-shadow: 0 3px 8px 0 rgba(126, 150, 255, .1);
	box-shadow: 0 3px 8px 0 rgba(126, 150, 255, .1);
	text-align: left;
	white-space: nowrap
}

.menuLink--3S6O5 {
	position: relative;
	display: block;
	padding: 8px 20px;
	font-size: 15px;
	line-height: 20px;
	color: #333
}

.menuLink--3S6O5:focus {
	outline: none
}
</style>
<style>
.headerWrap--23wBY {
	position: relative;
	z-index: 200;
	background-color: #fff
}

.header--1g99W {
	word-break: break-all;
	word-wrap: break-word;
	position: relative;
	z-index: 1;
	width: 100%;
	height: 56px;
	padding: 0 58px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

@media screen and (min-width: 768px) {
	.header--1g99W {
		padding: 0 78px
	}
}

.headerCenter--31bd_ {
	text-align: center
}

.headerDescription--bhdxH {
	height: auto
}

.headerDescription--bhdxH .buttonRight--1C20G {
	top: 28px
}

@media screen and (min-width: 1025px) {
	.headerDescription--bhdxH .buttonRight--1C20G {
		top: 36px
	}
}

.headerBorder--MDpc4::after {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	height: 1px;
	background-color: rgba(0, 0, 0, .1);
	content: ""
}

.headerDefault--1Mbdq .header--1g99W {
	max-width: 1280px;
	padding: 0 132px;
	margin: 0 auto
}

@media screen and (min-width: 1025px) {
	.headerDefault--1Mbdq .header--1g99W {
		height: 68px
	}
	.headerDefault--1Mbdq .header--1g99W .SubTitle_SubTitleItem_titleSection--kazRN .SubTitle_SubTitleItem_title--3bO3r
		{
		line-height: 68px
	}
}

.headerDefault--1Mbdq .header--1g99W.headerDescription--bhdxH {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 20px
}

@media only screen and (min-width: 768px) {
	.headerDefault--1Mbdq .header--1g99W.headerDescription--bhdxH {
		padding-left: 40px;
		padding-right: 40px
	}
}

@media screen and (min-width: 1025px) {
	.headerDefault--1Mbdq .header--1g99W.headerDescription--bhdxH {
		height: 92px;
		padding: 24px 30px 0
	}
	.headerDefault--1Mbdq .header--1g99W.headerDescription--bhdxH .SubTitle_SubTitleItem_titleSection--kazRN .SubTitle_SubTitleItem_title--3bO3r
		{
		line-height: 23px
	}
}

.headerDefault--1Mbdq .description--2tK9P {
	line-height: 20px;
	margin-top: 5px;
	font-size: 14px;
	color: rgba(0, 0, 0, .6)
}

.headerLeft--AcggC .header--1g99W {
	padding: 0 62px 0 20px
}

@media screen and (min-width: 768px) {
	.headerLeft--AcggC .header--1g99W {
		padding: 0 82px 0 40px
	}
}

.header--1g99W .SubTitle_SubTitleItem_titleSection--kazRN .SubTitle_SubTitleItem_title--3bO3r
	{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: block;
	line-height: 56px
}

.header--1g99W .SubTitle_SubTitleItem_titleSection--kazRN .SubTitle_SubTitleItem_title--3bO3r svg
	{
	vertical-align: middle
}

.header--1g99W .thumbnailArea--A1ZTf {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	width: 100%;
	height: 100%;
	font-size: 16px;
	line-height: 20px
}

.header--1g99W .thumbnail--3yO0l {
	position: relative;
	width: 30px;
	height: 30px;
	-webkit-border-radius: 11px;
	border-radius: 11px;
	background: rgba(255, 255, 255, .2) no-repeat center/cover;
	display: block;
	overflow: hidden;
	-webkit-box-flex: 0;
	-webkit-flex: none;
	-ms-flex: none;
	flex: none;
	margin-right: 8px
}

.header--1g99W .thumbnail--3yO0l:after {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border: 1px solid rgba(0, 0, 0, .05);
	-webkit-border-radius: 11px;
	border-radius: 11px;
	content: ""
}

.header--1g99W .userName--2FGOF {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-break: break-all;
	word-wrap: break-word;
	display: block
}

.header--1g99W .iconArrow--3jbLl {
	display: inline-block;
	overflow: hidden;
	position: relative;
	width: 5px;
	height: 10px;
	-webkit-box-flex: 0;
	-webkit-flex: none;
	-ms-flex: none;
	flex: none;
	margin: 0 5px
}

.header--1g99W .iconArrow--3jbLl:before {
	position: absolute;
	top: 50%;
	left: 50%;
	content: ""
}

.header--1g99W .iconArrow--3jbLl:before {
	width: 5px;
	height: 5px;
	-webkit-transform: translate(-50%, -50%) scale(1, 1) rotate(45deg);
	transform: translate(-50%, -50%) scale(1, 1) rotate(45deg);
	margin-left: -2px;
	border: 1px solid #cdcdcd;
	border-width: 1px 1px 0 0
}

.header--1g99W .current--24Y0c {
	display: block;
	-webkit-box-flex: 0;
	-webkit-flex: none;
	-ms-flex: none;
	flex: none
}

.button--2W5mD {
	position: relative;
	vertical-align: top
}

.buttonLeft--2VL7u, .buttonRight--1C20G {
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%)
}

.buttonLeft--2VL7u {
	left: 15px
}

@media screen and (min-width: 768px) {
	.buttonLeft--2VL7u {
		left: 35px
	}
}

.buttonRight--1C20G {
	right: 15px
}

@media screen and (min-width: 768px) {
	.buttonRight--1C20G {
		right: 35px
	}
}

.button--2W5mD+.button--2W5mD {
	margin-left: 2px
}

.button--2W5mD .iconActive--3G3wR {
	position: absolute;
	right: 4px;
	width: 4px;
	height: 4px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #ff7070
}

.buttonShare--2-UYu {
	position: relative;
	display: inline-block
}

.buttonShare--2-UYu>a {
	display: block
}

.buttonShare--2-UYu svg {
	pointer-events: none
}

.buttonWrap--3Hf-b {
	display: inline-block;
	vertical-align: top
}

.buttonWrap--3Hf-b+.buttonWrap--3Hf-b {
	margin-left: 2px
}

.buttonCompose--1fqVa {
	z-index: 5
}

.buttonCompose--1fqVa button {
	vertical-align: top
}

.layerMenu--1TyTj {
	position: absolute;
	top: 38px;
	right: 0;
	z-index: 1;
	min-width: 100px;
	padding: 4px 0;
	border: 1px solid rgba(126, 150, 255, .3);
	-webkit-border-radius: 10px;
	border-radius: 10px;
	background-color: #fff;
	-webkit-box-shadow: 0 3px 8px 0 rgba(126, 150, 255, .1);
	box-shadow: 0 3px 8px 0 rgba(126, 150, 255, .1);
	text-align: left;
	white-space: nowrap
}

.layerMenu--1TyTj .menuLink--2GtgJ {
	position: relative;
	display: block;
	padding: 8px 20px;
	font-size: 15px;
	line-height: 20px;
	color: #333
}

.layerMenu--1TyTj .menuLink--2GtgJ:focus {
	outline: none
}

.themeTransparent--3P5kO.headerWrap--23wBY {
	background-color: rgba(0, 0, 0, 0)
}

.userThumbnail--1mcev {
	position: relative;
	width: 26px;
	height: 26px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background: #eff1ee no-repeat center/cover;
	margin: -1px
}

.userThumbnail--1mcev:after {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border: 1px solid rgba(0, 0, 0, .05);
	-webkit-border-radius: 50%;
	border-radius: 50%;
	content: ""
}

.expertThumbnail--2ItGN {
	position: relative;
	width: 30px;
	height: 30px;
	-webkit-border-radius: 11px;
	border-radius: 11px;
	background: #eff1ee no-repeat center/cover;
	margin: -3px
}

.expertThumbnail--2ItGN:after {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border: 1px solid rgba(0, 0, 0, .05);
	-webkit-border-radius: 11px;
	border-radius: 11px;
	content: ""
}

.fontWhite--Lm-4G .header--1g99W .buttonIcon--30yDL * {
	fill: #fff
}

.fontWhite--Lm-4G .SubTitle_SubTitleItem_title--3bO3r, .fontWhite--Lm-4G .thumbnailArea--A1ZTf,
	.fontWhite--Lm-4G .button--2W5mD {
	color: #fff
}

.fontWhite--Lm-4G .iconArrow--3jbLl:before {
	border-color: #fff
}

.fontWhite--Lm-4G .iconMore--mD6OV span {
	background-color: #fff
}

.isFixed--3MSk4 {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%
}

.headerLogo--3skgT {
	position: absolute;
	top: 50%;
	left: 20px;
	line-height: 0;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%)
}

.headerLogo--3skgT:after {
	content: "";
	display: block;
	clear: both
}

@media screen and (min-width: 768px) {
	.headerLogo--3skgT {
		left: 40px
	}
}

.headerLogo--3skgT .linkNaver--3UjQd {
	position: relative;
	float: left;
	width: 26px;
	height: 26px;
	background-color: #4a65f6
}

.headerLogo--3skgT .linkNaver--3UjQd.primary--ptcYx {
	background-color: rgba(0, 0, 0, 0)
}

.headerLogo--3skgT .logoNaver--M4TjT {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -6px 0 0 -6.5px
}

.headerLogo--3skgT .headerService--2oCkV {
	float: left;
	margin: 1px 0 0 10px
}

.headerLogo--3skgT .headerService--2oCkV:after {
	content: "";
	display: block;
	clear: both
}

.headerLogo--3skgT .serviceItem--2NuJW {
	float: left
}

.headerLogo--3skgT .serviceItem--2NuJW+.serviceItem--2NuJW {
	position: relative;
	padding-left: 8px;
	margin-left: 8px
}

.headerLogo--3skgT .serviceItem--2NuJW+.serviceItem--2NuJW::before {
	position: absolute;
	top: 50%;
	left: 0;
	width: 1px;
	height: 12px;
	margin-top: -6px;
	background-color: #d8d8dd;
	content: ""
}

.headerLogo--3skgT .serviceLink--2VR8P {
	display: inline-block;
	vertical-align: top
}

.visibleSensor--mtdPr {
	height: 1px;
	margin-top: -1px
}

.headerLogoKin--1xmQQ .linkNaver--3UjQd {
	background-color: #03cf5d
}

.headerLogoKin--1xmQQ .logoNaver--M4TjT path {
	fill: #fff
}

.headerLogoKin--1xmQQ .logoKin--3U-le path {
	opacity: 1
}

.errorMenu--1VQOn .item--dv9tE {
	display: inline-block;
	position: relative;
	padding: 5px 12px;
	color: #8c8c8c;
	font-size: 14px;
	font-weight: 500
}

.errorMenu--1VQOn .item--dv9tE+.item--dv9tE {
	position: relative;
	padding-left: 12px
}

.errorMenu--1VQOn .item--dv9tE+.item--dv9tE::before {
	position: absolute;
	top: 50%;
	left: 0;
	width: 1px;
	height: 12px;
	margin-top: -6px;
	background-color: #d8d8dd;
	content: ""
}

.iconMore--mD6OV {
	display: block;
	padding: 4px 4px 3px 17px
}

.iconMore--mD6OV span {
	display: block;
	width: 3px;
	height: 3px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #000
}

.iconMore--mD6OV span+span {
	margin-top: 4px
}

.tabRoundPill--2wowL {
	position: relative;
	height: 44px;
	margin: 0 20px 20px
}

.tabRoundPill--2wowL.isHidden--3twb0 {
	display: none
}

.tabRoundPill--2wowL .tabList--19rrs {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	max-width: 100%;
	height: 100%;
	-webkit-border-radius: 32px;
	border-radius: 32px;
	background-color: #eceff5
}

.tabRoundPill--2wowL .tab--1KTge {
	display: block;
	-ms-flex: 1 1 auto;
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	flex: 1;
	text-align: center
}

.tabRoundPill--2wowL .tab--1KTge:nth-child(1) {
	-webkit-border-radius: 32px 0 0 32px;
	border-radius: 32px 0 0 32px
}

.tabRoundPill--2wowL .tab--1KTge:last-child {
	-webkit-border-radius: 0 32px 32px 0;
	border-radius: 0 32px 32px 0
}

.tabRoundPill--2wowL .tab--1KTge .tabTitle--2dVfV {
	position: relative;
	display: inline-block;
	color: #8c8c8c;
	line-height: 44px;
	font-size: 16px
}

.tabRoundPill--2wowL .tab--1KTge[aria-selected=true] {
	background-color: #4a65f6;
	-webkit-border-radius: 32px;
	border-radius: 32px;
	-webkit-box-shadow: 0 12px 10px -10px #7e96ff;
	box-shadow: 0 12px 10px -10px #7e96ff
}

.tabRoundPill--2wowL .tab--1KTge[aria-selected=true] .tabTitle--2dVfV {
	color: #fff;
	opacity: 1;
	font-weight: bold
}

.tabArea--1IQFM {
	padding: 0 20px;
	position: relative;
	height: 56px;
	-webkit-overflow-scrolling: touch;
	white-space: nowrap;
	overflow-y: hidden;
	overflow-x: auto;
	border-top: 1px solid #f2f3f5;
	background-color: #fff
}

@media only screen and (min-width: 768px) {
	.tabArea--1IQFM {
		padding-left: 40px;
		padding-right: 40px
	}
}

.tabArea--1IQFM.isHidden--3twb0 {
	display: none
}

.tabArea--1IQFM .tabList--19rrs {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	max-width: 100%;
	height: 100%
}

.tabArea--1IQFM .tab--1KTge {
	-ms-flex: 1 1 auto;
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	flex: 1;
	text-align: center;
	min-width: -webkit-min-content;
	min-width: min-content
}

.tabArea--1IQFM .tab--1KTge .tabTitle--2dVfV {
	position: relative;
	display: inline-block;
	margin: 0 10px;
	padding: 20px 0 12px;
	font-size: 16px;
	font-weight: 600;
	line-height: 24px;
	color: #333
}

.tabArea--1IQFM .tab--1KTge[aria-selected=true] .tabTitle--2dVfV {
	color: #4a65f6
}

.tabArea--1IQFM .tab--1KTge[aria-selected=true] .tabTitle--2dVfV:before
	{
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1;
	height: 3px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	background-color: #4a65f6;
	content: ""
}

.themeBlue--3BLTD {
	background: #4a65f6
}

.themeBlue--3BLTD .tabArea--1IQFM {
	background-color: rgba(0, 0, 0, 0);
	border-top: 1px solid rgba(0, 0, 0, .05)
}

.themeBlue--3BLTD .tabArea--1IQFM .tab--1KTge .tabTitle--2dVfV {
	color: rgba(255, 255, 255, .5)
}

.themeBlue--3BLTD .tabArea--1IQFM .tab--1KTge[aria-selected=true] .tabTitle--2dVfV
	{
	color: #fff
}

.themeBlue--3BLTD .tabArea--1IQFM .tab--1KTge[aria-selected=true] .tabTitle--2dVfV:before
	{
	background-color: #fff
}

.themeBlue--3BLTD .tabRoundPill--2wowL .tabList--19rrs {
	background-color: rgba(0, 0, 0, .1)
}

.themeBlue--3BLTD .tabRoundPill--2wowL .tab--1KTge .tabTitle--2dVfV {
	color: #fff;
	opacity: .8
}

.themeBlue--3BLTD .tabRoundPill--2wowL .tab--1KTge[aria-selected=true] {
	background-color: #fff;
	-webkit-box-shadow: 0 12px 10px -10px #5c69a1;
	box-shadow: 0 12px 10px -10px #5c69a1
}

.themeBlue--3BLTD .tabRoundPill--2wowL .tab--1KTge[aria-selected=true] .tabTitle--2dVfV
	{
	color: #4a65f6;
	opacity: 1
}

.iconDotted--oA9-m {
	display: inline-block;
	width: 4px;
	height: 4px;
	margin: 20px 9px 0 -9px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #ff7070;
	vertical-align: top
}

.iconNew--1lsTP {
	display: inline-block;
	margin: 14px 0 0 3px;
	vertical-align: top
}

.iconSearch--233ks {
	position: relative;
	display: block;
	width: 36px;
	height: 36px
}

.iconSearch--233ks:before {
	position: absolute;
	right: 8px;
	bottom: 6px;
	width: 2px;
	height: 7px;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
	background-color: #1e1e1e;
	content: ""
}

.iconSearch--233ks:after {
	position: absolute;
	top: 8px;
	left: 9px;
	width: 15px;
	height: 15px;
	border: 2px solid #1e1e1e;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	content: ""
}

.icon--362bQ {
	padding: 4px
}

.text--2FQyR {
	padding: 8px 5px
}
</style>
<style>
.innerShare--3Acs4 {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0
}

._ly_spi.spi_default.spi_onebtn:after {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(4, 4, 15, .4);
	content: ""
}

._ly_spi.spi_default.spi_onebtn ._spi_release_ly.spi_lst_release {
	position: fixed !important;
	top: -webkit-calc(50% - 128px) !important;
	top: calc(50% - 128px) !important;
	left: -webkit-calc(50% - 172px) !important;
	left: calc(50% - 172px) !important
}

._ly_spi.spi_default.spi_onebtn .spi_pad_lyr._spi_release_pad_ly {
	position: fixed !important;
	top: -webkit-calc(50% - 128px) !important;
	top: calc(50% - 128px) !important;
	left: -webkit-calc(50% - 172px) !important;
	left: calc(50% - 172px) !important
}

._ly_spi.spi_default.spi_onebtn ._ly_bmk_ok.spi_ly_pop.spi_pop_bookmark
	{
	position: fixed !important;
	top: -webkit-calc(50% - 37px) !important;
	top: calc(50% - 37px) !important;
	left: -webkit-calc(50% - 128px) !important;
	left: calc(50% - 128px) !important
}

._ly_spi.spi_default.spi_onebtn ._ly_bmk_cnf.spi_ly_pop.spi_ly_pop_v2.spi_pop_unbookmark
	{
	position: fixed !important;
	top: -webkit-calc(50% - 57px) !important;
	top: calc(50% - 57px) !important;
	left: -webkit-calc(50% - 128px) !important;
	left: calc(50% - 128px) !important
}

._ly_spi.spi_default.spi_onebtn ._spi_ly_keep_ok.spi_ly_pop.spi_ly_pop_v2
	{
	position: fixed !important;
	top: -webkit-calc(50% - 48px) !important;
	top: calc(50% - 48px) !important;
	left: -webkit-calc(50% - 128px) !important;
	left: calc(50% - 128px) !important
}

._ly_spi.spi_default.spi_onebtn ._spi_ly_keep_cnf.spi_ly_pop {
	position: fixed !important;
	top: -webkit-calc(50% - 48px) !important;
	top: calc(50% - 48px) !important;
	left: -webkit-calc(50% - 128px) !important;
	left: calc(50% - 128px) !important
}

._ly_spi.spi_default.spi_onebtn ._spi_ly_copyurl_ok.spi_ly_pop {
	position: fixed !important;
	top: -webkit-calc(50% - 37px) !important;
	top: calc(50% - 37px) !important;
	left: -webkit-calc(50% - 128px) !important;
	left: calc(50% - 128px) !important
}
</style>
<style>
.inputBox:after {
	content: "";
	display: block;
	clear: both
}

.inputBox .labelText {
	word-break: break-all;
	word-wrap: break-word;
	display: block;
	overflow: hidden;
	font-size: 15px;
	line-height: 20px;
	color: #4c4c4c
}

.inputBox .labelText em {
	color: #7e96ff
}

.inputBox.labelLeft--ty2fC .iconInput--1uN3v {
	float: right;
	margin-right: 0;
	margin-left: 8px
}

.expertLabel {
	display: block
}

.expertLabel:after {
	content: "";
	display: block;
	clear: both
}

.expertLabel.primary .labelText em {
	color: #ff7070
}

.expertLabel.secondary .labelText em {
	color: #03cf5d
}

.expertInput:checked+.expertLabel .iconInput--1uN3v {
	overflow: hidden;
	background-color: #7e96ff
}

.expertInput:checked+.expertLabel .iconInput--1uN3v:after {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 5px;
	height: 10px;
	margin: -7px 0 0 -3.5px;
	border: 2px solid #fff;
	border-width: 0 2px 2px 0;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	content: ""
}

.expertInput:checked+.expertLabel .iconRadio--1Ozyv:after {
	width: 8px;
	height: 8px;
	margin: -4px 0 0 -4px;
	border: 0;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #fff
}

.expertInput:checked+.expertLabel.primary .iconInput--1uN3v {
	background-color: #ff7070
}

.expertInput:checked+.expertLabel.secondary .iconInput--1uN3v {
	background-color: #03cf5d
}

.expertInput:focus+.expertLabel .iconInput--1uN3v, .expertInput:active+.expertLabel .iconInput--1uN3v
	{
	outline: dotted thin;
	outline: -webkit-focus-ring-color auto 5px
}

.expertInput:focus+.labelFile--30ntn, .expertInput:active+.labelFile--30ntn
	{
	background-color: #6b7fd9;
	outline: dotted thin;
	outline: -webkit-focus-ring-color auto 5px
}

.expertInput[disabled]+.expertLabel {
	opacity: .5
}

.iconInput--1uN3v {
	position: relative;
	float: left;
	width: 20px;
	height: 20px;
	margin-right: 8px;
	border: 1px solid rgba(0, 0, 0, .1);
	-webkit-border-radius: 5px;
	border-radius: 5px;
	background-color: #fff;
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

.iconInput--1uN3v.iconRadio--1Ozyv, .iconInput--1uN3v.iconCircle--2G2r9
	{
	width: 22px;
	height: 22px;
	-webkit-border-radius: 50%;
	border-radius: 50%
}

.expertToggle--3FPqc {
	float: right
}

.expertToggle--3FPqc[aria-pressed=true] .iconToggle--2_40O {
	background-color: #6f8aff
}

.expertToggle--3FPqc[aria-pressed=true] .iconToggle--2_40O::before {
	-webkit-transform: translateX(18px);
	transform: translateX(18px)
}

.expertToggle--3FPqc[aria-pressed=true] .iconToggle--2_40O::after {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 4px;
	height: 8px;
	margin: -6px 0 0 6px;
	border: 2px solid #6f8aff;
	border-width: 0 2px 2px 0;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	content: ""
}

.expertToggle--3FPqc[aria-pressed=true].primary--2lANC .iconToggle--2_40O
	{
	background-color: #03cf5d
}

.expertToggle--3FPqc[aria-pressed=true].primary--2lANC .iconToggle--2_40O::after
	{
	border-color: #03cf5d
}

.expertToggle--3FPqc[aria-pressed=true].primary--2lANC+.labelText .isOn--1MRiQ
	{
	color: #03cf5d
}

.expertToggle--3FPqc+.labelText {
	padding-right: 10px;
	line-height: 26px
}

.toggleStatus--2jgpV {
	margin-left: 4px;
	color: #dedede
}

.toggleStatus--2jgpV.isOn--1MRiQ {
	color: #6f8aff
}

.iconToggle--2_40O {
	display: block;
	position: relative;
	width: 44px;
	height: 26px;
	background-color: #dedede;
	-webkit-border-radius: 13px;
	border-radius: 13px;
	-webkit-transition: background-color .2s;
	transition: background-color .2s
}

.iconToggle--2_40O::before {
	position: absolute;
	top: 2px;
	left: 2px;
	width: 22px;
	height: 22px;
	background-color: #fff;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	-webkit-transition: -webkit-transform .2s;
	transition: -webkit-transform .2s;
	transition: transform .2s;
	transition: transform .2s, -webkit-transform .2s;
	content: ""
}

.iconToggle--2_40O::after {
	-webkit-transition: -webkit-transform .2s;
	transition: -webkit-transform .2s;
	transition: transform .2s;
	transition: transform .2s, -webkit-transform .2s
}

.subtext--3uFzn {
	display: block;
	margin-top: 5px;
	font-size: 14px;
	line-height: 20px;
	color: #8c8c8c
}

.subtext--3uFzn a {
	position: relative;
	color: #4a65f6
}

.labelFile--30ntn {
	display: block;
	height: 54px;
	padding: 15px 0;
	-webkit-border-radius: -webkit-calc(54px * 0.15);
	border-radius: calc(54px * 0.15);
	border: solid 1px rgba(126, 150, 255, .15);
	background-color: #7e96ff;
	font-size: 15px;
	font-weight: 600;
	line-height: 22px;
	text-align: center;
	color: #fff;
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

.labelFile--30ntn:active {
	background-color: #6b7fd9
}
</style>
<style>
.section--15F24 {
	position: absolute;
	top: 54px;
	right: 0;
	z-index: 100;
	width: 340px;
	padding-top: 25px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 8px 0 rgba(126, 150, 255, .1);
	box-shadow: 0 8px 8px 0 rgba(126, 150, 255, .1);
	border: 1px solid rgba(111, 138, 255, .15);
	background-color: #fff
}

.searchHeader--TcHaI {
	padding: 0 20px
}

.searchHeader--TcHaI:after {
	content: "";
	display: block;
	clear: both
}

.searchHeader--TcHaI .title--1aa_v, .searchHeader--TcHaI .text--2xdtY {
	color: #8c8c8c
}

.searchHeader--TcHaI .title--1aa_v {
	font-size: 14px
}

.searchHeader--TcHaI .text--2xdtY {
	font-size: 12px;
	float: right;
	cursor: pointer
}

.searchList--1w1KH {
	margin-top: 8px
}

.searchList--1w1KH .item--2mRr0 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	width: 100%;
	line-height: 30px;
	padding: 7px 20px;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	font-size: 15px
}

.searchList--1w1KH .item--2mRr0:hover, .searchList--1w1KH .item--2mRr0:active
	{
	background-color: rgba(126, 150, 255, .1)
}

.searchList--1w1KH .text--2xdtY {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: block;
	-webkit-box-flex: 1;
	-webkit-flex: 1 1 auto;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto
}

.searchList--1w1KH .dateArea--2Ki77 {
	-webkit-box-flex: 0;
	-webkit-flex: none;
	-ms-flex: none;
	flex: none;
	margin-left: 4px;
	color: #8c8c8c
}

.searchList--1w1KH .deleteButton--3t0QN {
	position: relative;
	-webkit-box-flex: 0;
	-webkit-flex: none;
	-ms-flex: none;
	flex: none;
	z-index: 1;
	margin: 0 -5px 0 1px;
	padding: 5px;
	width: 28px;
	height: 28px;
	cursor: pointer
}

.searchList--1w1KH .deleteButton--3t0QN .deleteIcon--3NbuK {
	position: relative;
	display: inline-block;
	vertical-align: top;
	width: 18px;
	height: 18px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #d8dce7
}

.searchList--1w1KH .deleteButton--3t0QN .deleteIcon--3NbuK::before,
	.searchList--1w1KH .deleteButton--3t0QN .deleteIcon--3NbuK::after {
	position: absolute;
	top: 6px;
	left: 9px;
	width: 1px;
	height: 6px;
	background-color: #fff;
	content: ""
}

.searchList--1w1KH .deleteButton--3t0QN .deleteIcon--3NbuK::before {
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg)
}

.searchList--1w1KH .deleteButton--3t0QN .deleteIcon--3NbuK::after {
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg)
}

.iconSearch--3kSN6 {
	position: relative;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	display: inline-block;
	vertical-align: top;
	margin-right: 8px;
	width: 30px;
	height: 30px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #7e96ff
}

.iconSearch--3kSN6::before {
	position: absolute;
	top: 8px;
	left: 8px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	width: 13px;
	height: 13px;
	border: 1px solid #fff;
	content: ""
}

.iconSearch--3kSN6::after {
	position: absolute;
	top: 20px;
	left: 19px;
	width: 4px;
	height: 1px;
	background-color: #fff;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	content: ""
}

.searchToggleArea--23-0f {
	margin: 21px 20px 25px
}

.noData--QNG3P {
	line-height: 150px;
	text-align: center;
	color: #000
}
</style>
<style>
.searchSection--1lx_i {
	display: none;
	width: 340px;
	margin: 0 auto
}

.searchSection--1lx_i .input--23EGE {
	-webkit-box-flex: 1;
	-webkit-flex: 1 1 auto;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	display: block;
	width: 100%;
	height: 31px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	border: none;
	background-color: rgba(0, 0, 0, 0);
	caret-color: #50e3c2;
	line-height: 31px;
	font-size: 15px
}

.searchSection--1lx_i .input--23EGE::-webkit-input-placeholder {
	color: #6f8aff
}

.searchSection--1lx_i .input--23EGE:-ms-input-placeholder {
	color: #6f8aff
}

.searchSection--1lx_i .input--23EGE::placeholder {
	color: #6f8aff
}

.searchSection--1lx_i .inner--36xi8 {
	display: inline-block;
	position: relative;
	width: 100%;
	height: 48px;
	margin-top: 10px;
	padding: 7px 20px 10px 46px;
	-webkit-border-radius: -webkit-calc(48px * 0.5);
	border-radius: calc(48px * 0.5);
	border: 1px solid rgba(111, 138, 255, .15);
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-box-shadow: 0 8px 8px 0 rgba(126, 150, 255, .1);
	box-shadow: 0 8px 8px 0 rgba(126, 150, 255, .1);
	background-color: #fff
}

.searchSection--1lx_i .inner--36xi8:after {
	content: "";
	display: block;
	clear: both
}

.searchSection--1lx_i .inner--36xi8.themeTransparent--3_moO {
	background-color: rgba(255, 255, 255, .05);
	padding: 8px 20px 9px 46px;
	border: 0;
	-webkit-box-shadow: none;
	box-shadow: none
}

.searchSection--1lx_i .inner--36xi8.themeTransparent--3_moO .input--23EGE
	{
	background-color: rgba(0, 0, 0, 0);
	color: #fff
}

.searchSection--1lx_i .inner--36xi8.themeTransparent--3_moO .input--23EGE::-webkit-input-placeholder
	{
	color: #fff
}

.searchSection--1lx_i .inner--36xi8.themeTransparent--3_moO .input--23EGE:-ms-input-placeholder
	{
	color: #fff
}

.searchSection--1lx_i .inner--36xi8.themeTransparent--3_moO .input--23EGE::placeholder
	{
	color: #fff
}

.searchSection--1lx_i .inner--36xi8.themeTransparent--3_moO .iconSearch--2qnbk::before
	{
	background-color: #fff
}

.searchSection--1lx_i .inner--36xi8.themeTransparent--3_moO .iconSearch--2qnbk::after
	{
	border-color: #fff
}

.searchSection--1lx_i .text--2CL9y {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: block;
	color: #6f8aff;
	font-size: 15px;
	line-height: 31px
}

@media screen and (min-width: 1025px) {
	.searchSection--1lx_i {
		display: block
	}
}

.iconSearch--2qnbk {
	position: absolute;
	top: 14px;
	left: 20px;
	display: inline-block;
	width: 18px;
	height: 18px
}

.iconSearch--2qnbk::before {
	position: absolute;
	right: 3px;
	bottom: 1px;
	width: 1px;
	height: 6px;
	background-color: #6f8aff;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
	content: ""
}

.iconSearch--2qnbk::after {
	position: absolute;
	top: 0;
	left: 0;
	width: 13px;
	height: 13px;
	border: 1px solid #6f8aff;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	content: ""
}
</style>
<style>
.selectCustom--1wFlu {
	position: relative
}

.selectCustom--1wFlu .choose--1pLT4 {
	position: relative;
	width: 100%;
	padding: 13px 40px 13px 15px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid rgba(126, 150, 255, .3);
	background-color: #fff;
	font-size: 15px;
	line-height: 20px;
	text-align: left;
	color: #333
}

.selectCustom--1wFlu .choose--1pLT4:focus {
	border-color: rgba(126, 150, 255, .7);
	background-color: #fafbfe;
	color: #7e96ff
}

.selectCustom--1wFlu .choose--1pLT4[aria-expanded=true] {
	border-color: rgba(126, 150, 255, .7);
	background-color: #fafbfe;
	color: #7e96ff
}

.selectCustom--1wFlu .choose--1pLT4[aria-expanded=true] .iconArrow--2GNlA
	{
	-webkit-transform: rotate(180deg) translateY(50%);
	transform: rotate(180deg) translateY(50%)
}

.selectCustom--1wFlu .choose--1pLT4[aria-expanded=true] .iconArrow--2GNlA:before
	{
	border-color: #7e96ff
}

.selectCustom--1wFlu .choose--1pLT4[aria-expanded=true]+.selectList--4HL5N
	{
	display: block
}

.selectCustom--1wFlu .choose--1pLT4.isError--YQQMQ {
	border-color: #ff7070;
	background-color: rgba(255, 112, 112, .05);
	color: #ff7070
}

.selectCustom--1wFlu .choose--1pLT4:disabled {
	background-color: #fafbff;
	color: rgba(0, 0, 0, .3)
}

.selectCustom--1wFlu .choose--1pLT4:disabled .iconArrow--2GNlA:before {
	border-color: rgba(140, 140, 140, .5)
}

.selectCustom--1wFlu .choose--1pLT4.placeholder--J5cX0 {
	color: rgba(0, 0, 0, .3)
}

.selectCustom--1wFlu .iconArrow--2GNlA {
	display: inline-block;
	overflow: hidden;
	position: absolute;
	width: 16px;
	height: 8px;
	top: 50%;
	right: 17px;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	pointer-events: none
}

.selectCustom--1wFlu .iconArrow--2GNlA:before {
	position: absolute;
	top: 50%;
	left: 50%;
	content: ""
}

.selectCustom--1wFlu .iconArrow--2GNlA:before {
	width: 9px;
	height: 9px;
	-webkit-transform: translate(-50%, -50%) rotate(45deg);
	transform: translate(-50%, -50%) rotate(45deg);
	margin-top: -3px;
	border: 1px solid #4c4c4c;
	border-width: 0 1px 1px 0
}

.selectCustom--1wFlu .selectList--4HL5N {
	position: absolute;
	top: 54px;
	right: 0;
	left: 0;
	display: none;
	overflow-y: auto;
	z-index: 1;
	padding: 12px 0 11px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid rgba(126, 150, 255, .3);
	background-color: #fff;
	font-size: 15px;
	line-height: 20px;
	color: #333;
	-webkit-box-shadow: 0 3px 8px 0 rgba(126, 150, 255, .1);
	box-shadow: 0 3px 8px 0 rgba(126, 150, 255, .1)
}

.selectCustom--1wFlu .selectList--4HL5N .Checkbox_box--34YBS {
	padding: 7px 15px 8px
}

.selectCustom--1wFlu .option--zstH-:checked+.label--IX3mZ {
	position: relative;
	color: #7e96ff
}

.selectCustom--1wFlu .option--zstH-:checked+.label--IX3mZ:after {
	position: absolute;
	top: 50%;
	right: 20px;
	width: 5px;
	height: 10px;
	margin-top: -8px;
	border: 2px solid #7e96ff;
	border-width: 0 2px 2px 0;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	content: ""
}

.selectCustom--1wFlu .option--zstH-[disabled]+.label--IX3mZ {
	opacity: .5;
	pointer-events: none
}

.selectCustom--1wFlu .label--IX3mZ {
	display: block;
	padding: 7px 15px 8px
}

.selectCustom--1wFlu .label--IX3mZ:hover {
	background-color: #fafbfe;
	color: #7e96ff
}

.selectDefault--3F6Hf {
	position: relative;
	display: table-cell
}

.selectDefault--3F6Hf+.selectDefault--3F6Hf {
	padding-left: 5px
}

.selectDefault--3F6Hf .choose--1pLT4 {
	font-size: 13px;
	line-height: 24px;
	color: #4c4c4c;
	letter-spacing: -0.5px
}

.selectDefault--3F6Hf .choose--1pLT4 .iconArrow--2GNlA {
	display: inline-block;
	overflow: hidden;
	position: relative;
	width: 12px;
	height: 5px;
	margin: 8px 0 0 4px;
	vertical-align: top
}

.selectDefault--3F6Hf .choose--1pLT4 .iconArrow--2GNlA:before {
	position: absolute;
	top: 50%;
	left: 50%;
	content: ""
}

.selectDefault--3F6Hf .choose--1pLT4 .iconArrow--2GNlA:before {
	width: 6px;
	height: 6px;
	-webkit-transform: translate(-50%, -50%) scale(1, 0.8333333333)
		rotate(45deg);
	transform: translate(-50%, -50%) scale(1, 0.8333333333) rotate(45deg);
	margin-top: -2px;
	border: 1px solid #4c4c4c;
	border-width: 0 1px 1px 0
}

.selectDefault--3F6Hf .chooseText--evZVK {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: inline-block;
	vertical-align: top;
	max-width: 80px
}

.selectDefault--3F6Hf .selectList--4HL5N {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	opacity: .001
}
</style>
<style>
.tooltipBox--1UEZ6 {
	display: inline-block;
	position: relative;
	vertical-align: top
}

.tooltipBox--1UEZ6 .listArea--CUKpX {
	color: #4c4c4c
}

.tooltipBox--1UEZ6 .listArea--CUKpX li::before {
	top: 8px
}

.tooltipBox--1UEZ6 .listArea--CUKpX li+li {
	margin-top: 6px
}

.button--AgQ7W {
	display: inline-block;
	margin: -4px 0;
	padding: 6px 5px;
	line-height: 20px;
	vertical-align: top
}

.button--AgQ7W:hover+.tooltip--2r3wb, .button--AgQ7W:focus+.tooltip--2r3wb
	{
	display: block
}

.tooltipText--JZ__v ~.iconInfo--3ltfx {
	margin: 2px 0 0 4px
}

.tooltip--2r3wb {
	position: absolute;
	top: 23px;
	left: 0;
	display: block;
	z-index: 2;
	padding: 24px 20px;
	border: 1px solid rgba(0, 0, 0, .09);
	-webkit-border-radius: 10px;
	border-radius: 10px;
	background-color: #fff;
	font-size: 13px;
	line-height: 18px;
	-webkit-box-shadow: 0 2px 10px 0 rgba(157, 167, 195, .4);
	box-shadow: 0 2px 10px 0 rgba(157, 167, 195, .4);
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

.tooltip--2r3wb.alignRight--2eUJN {
	left: auto;
	right: 0
}

.tooltip--2r3wb:hover {
	display: block
}

.inner--2SYsg {
	margin-top: 15px
}

.inner--2SYsg:first-child {
	margin-top: 0
}

.mainTitle--3UgdA {
	display: block;
	font-size: 15px
}

.title--dVCZ1 {
	display: block;
	font-weight: 600;
	color: #333
}

.title--dVCZ1+.description--2fMwU {
	margin-top: 4px
}

.title--dVCZ1+.listArea--CUKpX {
	margin-top: 6px
}

.description--2fMwU {
	color: #4c4c4c
}

.buttonClose--1ZBhQ {
	position: absolute;
	top: 10px;
	right: 10px
}
</style>
<style>
.listDefault--3yD-H {
	display: block
}

.listDefault--3yD-H .item--jAymC.isTable--2G59o {
	padding-left: 0
}

.listDefault--3yD-H .item--jAymC.isTable--2G59o::before {
	display: none
}

.listDisc--IjJzz .item--jAymC {
	position: relative;
	padding-left: 8px
}

.listDisc--IjJzz .item--jAymC::before {
	position: absolute;
	top: 7px;
	left: 0;
	width: 2px;
	height: 2px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	background-color: #4c4c4c;
	content: ""
}

.listDonut--3WtJG .item--jAymC {
	position: relative;
	padding-left: 20px
}

.listDonut--3WtJG .item--jAymC::before {
	position: absolute;
	top: 6px;
	left: 0;
	width: 3px;
	height: 3px;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	border: 4px solid rgba(74, 101, 246, .5);
	content: ""
}
</style>
<style>
.titleSection--2IeYp .title--WCy7q {
	display: inline-block;
	vertical-align: top
}

.titleSection--2IeYp .title--WCy7q em {
	color: #4a65f6
}

.titleSection--2IeYp .headline1--3wgS8 {
	line-height: 1.2;
	letter-spacing: -1px;
	font-size: 60px;
	font-weight: 800
}

.titleSection--2IeYp .headline2--31N7V {
	line-height: 1.2;
	letter-spacing: -1px;
	font-size: 42px;
	font-weight: 700
}

.titleSection--2IeYp .headline3--VW-Ji {
	line-height: 1.2;
	letter-spacing: -1px;
	font-size: 36px;
	font-weight: 700
}

.titleSection--2IeYp .headline4--2M57t {
	line-height: 1.2;
	letter-spacing: -1px;
	font-size: 28px;
	font-weight: 700
}

.titleSection--2IeYp .headline5--2nAra {
	line-height: 1.5;
	letter-spacing: -1px;
	font-size: 24px;
	font-weight: 700
}

.titleSection--2IeYp .headline6--3VQbo {
	line-height: 1.5;
	letter-spacing: -1px;
	font-size: 22px;
	font-weight: 700
}

.titleSection--2IeYp .headline7--1R22e {
	line-height: 1.5;
	letter-spacing: -0.5px;
	font-size: 20px;
	font-weight: 700
}

.titleSection--2IeYp .headline8--292yD {
	line-height: 1.5;
	letter-spacing: -0.5px;
	font-size: 18px;
	font-weight: 700
}

.titleSection--2IeYp .headline9--26P26 {
	line-height: 1.5;
	letter-spacing: -0.5px;
	font-size: 16px;
	font-weight: 700
}

.titleSection--2IeYp .headline10--2eZwY {
	line-height: 1.5;
	letter-spacing: -0.5px;
	font-size: 15px;
	font-weight: 700
}

.titleSection--2IeYp .highlightDarkGray--3tAw0 {
	color: #333
}

.titleSection--2IeYp .highlightGray--1ZF4j {
	color: #4c4c4c
}

.titleSection--2IeYp .highlightLightGray--2OjC4 {
	color: #8c8c8c
}

.titleSection--2IeYp .highlightWhite--3pY3e {
	color: #fff
}
</style>
<style>
.subCategory--QyrFq+.list--3bBM7 {
	padding-top: 21px
}

.iconCategory--16q1m {
	display: inline-block;
	width: 36px;
	height: 36px;
	-webkit-background-size: cover;
	background-size: cover;
	vertical-align: top
}

.categoryMenu--1CwlR {
	position: relative;
	margin: 13px 0 40px
}

@media only screen and (min-width: 1025px) {
	.categoryMenu--1CwlR {
		margin-top: 30px
	}
}

.categoryMenu--1CwlR .list--3bBM7 {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 20px
}

@media only screen and (min-width: 768px) {
	.categoryMenu--1CwlR .list--3bBM7 {
		padding-left: 40px;
		padding-right: 40px
	}
}

.categoryMenu--1CwlR .list--3bBM7:after {
	content: "";
	display: block;
	clear: both
}

.categoryMenu--1CwlR .item--11-mn {
	position: relative;
	float: left;
	width: 25%;
	padding: 12px 2px 0;
	font-weight: 500;
	color: #4c4c4c;
	letter-spacing: -0.3px;
	text-align: center
}

.categoryMenu--1CwlR .item--11-mn[aria-pressed=true] {
	color: #4a65f6
}

.categoryMenu--1CwlR .item--11-mn .title--1_-Nd {
	position: relative;
	display: inline-block;
	vertical-align: top;
	margin-top: 7px;
	padding-bottom: 9px;
	line-height: 19px;
	font-size: 13px;
	font-weight: 500
}

.categoryMenu--1CwlR .item--11-mn[aria-expanded=true] .title--1_-Nd {
	color: #4a65f6;
	font-weight: bold
}

.categoryMenu--1CwlR .item--11-mn[aria-expanded=true] .title--1_-Nd::after
	{
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	height: 3px;
	background-color: #4a65f6;
	content: ""
}

.categoryMenu--1CwlR.isClass--2E8lE {
	-webkit-border-radius: 15px 15px 0 0;
	border-radius: 15px 15px 0 0;
	margin: -20px 0 30px;
	background-color: #fff
}

.categoryMenu--1CwlR.isClass--2E8lE .iconArea--2qRE6 {
	position: relative;
	display: inline-block;
	vertical-align: top;
	overflow: hidden;
	width: 60px;
	height: 60px;
	border: 1px solid rgba(74, 101, 246, .2);
	-webkit-border-radius: 50%;
	border-radius: 50%;
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

.categoryMenu--1CwlR.isClass--2E8lE .iconCategory--16q1m {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%)
}

.categoryMenu--1CwlR.isClass--2E8lE .list--3bBM7 {
	overflow-x: auto;
	white-space: nowrap;
	padding-bottom: 15px
}

.categoryMenu--1CwlR.isClass--2E8lE .itemWrap--1jX5j {
	display: -webkit-inline-box;
	display: -webkit-inline-flex;
	display: -ms-inline-flexbox;
	display: inline-flex;
	padding-right: 20px
}

@media only screen and (min-width: 768px) {
	.categoryMenu--1CwlR.isClass--2E8lE .itemWrap--1jX5j {
		padding-right: 40px
	}
}

.categoryMenu--1CwlR.isClass--2E8lE .item--11-mn {
	width: 80px;
	padding-top: 18px
}

.categoryMenu--1CwlR.isClass--2E8lE .item--11-mn[aria-expanded=true] .iconArea--2qRE6
	{
	border: 3px solid #7e96ff
}

.categoryMenu--1CwlR.isClass--2E8lE .item--11-mn[aria-expanded=true] .title--1_-Nd
	{
	color: #7e96ff;
	font-weight: 700
}

.categoryMenu--1CwlR.isClass--2E8lE .item--11-mn[aria-expanded=true] .title--1_-Nd::after
	{
	display: none
}

.categoryMenu--1CwlR.isClass--2E8lE .title--1_-Nd {
	font-size: 15px;
	margin-top: 5px;
	padding-bottom: 8px
}

@media only screen and (min-width: 1025px) {
	.categoryMenu--1CwlR.isClass--2E8lE .ListHomeSubCategory_subCategory--3_k4v
		{
		text-align: left
	}
}

.categoryMenu--1CwlR.isClass--2E8lE .ListHomeCategory_inner--3whG9 {
	padding-left: 16px;
	padding-right: 24px
}

@media only screen and (min-width: 768px) {
	.categoryMenu--1CwlR.isClass--2E8lE .ListHomeCategory_inner--3whG9 {
		padding-left: 40px;
		padding-right: 40px
	}
}

.categoryMenu--1CwlR.isServiceHomePC--1PQIE {
	margin-bottom: 60px
}

.categoryMenu--1CwlR.isServiceHomePC--1PQIE .itemWrap--1jX5j {
	text-align: center
}

.categoryMenu--1CwlR.isServiceHomePC--1PQIE .item--11-mn {
	float: none;
	display: inline-block;
	vertical-align: top;
	width: 7.692303769%
}

.categoryMenu--1CwlR.isServiceHomePC--1PQIE .item--11-mn .iconCategory--16q1m
	{
	width: 42px;
	height: 42px
}

.categoryMenu--1CwlR.isServiceHomePC--1PQIE .item--11-mn .title--1_-Nd {
	font-size: 14px;
	margin-top: 13px
}

.categoryMenu--1CwlR .LinkAll_listLink--2fcrV {
	font-size: 13px
}

.categoryLink--2Ids6 {
	position: absolute;
	top: -37px;
	right: 20px;
	height: 38px;
	padding: 0 17px 0 20px;
	-webkit-border-radius: 18px;
	border-radius: 18px;
	-webkit-box-shadow: 0 1px 4px 0 rgba(126, 150, 255, .3);
	box-shadow: 0 1px 4px 0 rgba(126, 150, 255, .3);
	background-color: rgba(255, 255, 255, .7);
	line-height: 38px;
	color: #4a65f6;
	font-size: 17px;
	font-weight: bold
}

.categoryLink--2Ids6 .arrow--Z3i2- {
	display: inline-block;
	overflow: hidden;
	position: relative;
	width: 6px;
	height: 12px;
	margin-left: 6px
}

.categoryLink--2Ids6 .arrow--Z3i2-:before {
	position: absolute;
	top: 50%;
	left: 50%;
	content: ""
}

.categoryLink--2Ids6 .arrow--Z3i2-:before {
	width: 6px;
	height: 6px;
	-webkit-transform: translate(-50%, -50%) scale(1, 1) rotate(45deg);
	transform: translate(-50%, -50%) scale(1, 1) rotate(45deg);
	margin-left: -2px;
	border: 1px solid #7e96ff;
	border-width: 1px 1px 0 0
}

.categoryLink--2Ids6 .iconNew--3pj-Y {
	position: absolute;
	top: -2px;
	right: 0
}

@media screen and (min-width: 768px) {
	.categoryLink--2Ids6 {
		right: 40px
	}
}

.categoryMore--kJFBE {
	margin-top: 10px;
	text-align: center
}

.categoryLayerWrap--2Oeah {
	position: absolute;
	top: 38px;
	right: 0;
	z-index: 1000;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 8px 0 rgba(126, 150, 255, .1);
	box-shadow: 0 8px 8px 0 rgba(126, 150, 255, .1);
	overflow: hidden
}

.categoryLayer--1AZBN {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	width: 360px;
	height: 645px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	background: #fff;
	border: 1px solid rgba(111, 138, 255, .15)
}

.categoryLayer--1AZBN .iconCategory--16q1m {
	width: 28px;
	height: 28px;
	margin-right: 10px
}

.categoryLayer--1AZBN .mainCategoryArea--3N5gE {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-box-flex: 0;
	-webkit-flex: 0 0 179px;
	-ms-flex: 0 0 179px;
	flex: 0 0 179px;
	padding: 10px 0;
	margin-left: -2px;
	background-color: rgba(126, 150, 255, .1);
	border-right: 1px solid rgba(126, 150, 255, .15);
	height: 100%
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT {
	position: relative;
	right: -1px
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT::before {
	position: absolute;
	top: 0;
	right: 20px;
	left: 20px;
	height: 1px;
	background-color: rgba(126, 150, 255, .15);
	z-index: 1;
	content: ""
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT[aria-pressed=true] .categoryButton--3VFP8
	{
	background-color: #fff
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT[aria-pressed=true] .categoryButton--3VFP8::before
	{
	position: absolute;
	top: 0;
	bottom: -1px;
	left: 0;
	width: 3px;
	background-color: #7e96ff;
	content: ""
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT[aria-pressed=true]::before,
	.categoryLayer--1AZBN .categoryButtonWrap--1aGsT[aria-pressed=true]+.categoryButtonWrap--1aGsT::before
	{
	left: 0;
	right: 0
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT:first-child::before {
	background-color: rgba(0, 0, 0, 0)
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT:first-child[aria-pressed=true]::before
	{
	background-color: rgba(126, 150, 255, .15)
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT:last-child {
	height: 50px
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT:last-child[aria-pressed=true] .categoryButton--3VFP8::before
	{
	bottom: 0
}

.categoryLayer--1AZBN .categoryButtonWrap--1aGsT:last-child[aria-pressed=true]::after
	{
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	height: 1px;
	background-color: rgba(126, 150, 255, .15);
	content: ""
}

.categoryLayer--1AZBN .categoryButton--3VFP8 {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 179px;
	height: 49px;
	padding: 0 20px;
	text-align: left;
	font-size: 15px;
	line-height: 28px;
	font-weight: bold;
	cursor: pointer
}

.categoryLayer--1AZBN .subCategoryArea--31Zk9 {
	-webkit-box-flex: 0;
	-webkit-flex: 0 0 180px;
	-ms-flex: 0 0 180px;
	flex: 0 0 180px;
	padding: 16px 0;
	overflow-x: hidden;
	overflow-y: auto
}
</style>
<style>
.footer--3zNrB {
	position: relative;
	padding: 1rem 0 5rem;
	z-index: 0;
	background-color: #eaebef
}

.footer--3zNrB .law--1BlkH {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 20px;
	font-size: 12px;
	color: #8c8c8c;
	line-height: 17px
}

@media only screen and (min-width: 768px) {
	.footer--3zNrB .law--1BlkH {
		padding-left: 40px;
		padding-right: 40px
	}
}

.footer--3zNrB .licensee--1ZKwx {
	margin-top: 20px
}

.footer--3zNrB .licensee--1ZKwx .linkButton--7tCnL {
	position: relative;
	display: block;
	padding: 10px 0 12px;
	color: #333;
	font-size: 13px;
	font-weight: 600;
	text-align: center
}

.footer--3zNrB .licensee--1ZKwx .linkButton--7tCnL .iconArrow--3kFI9 {
	position: absolute;
	top: 50%;
	display: inline-block;
	overflow: hidden;
	position: relative;
	width: 12px;
	height: 6px;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	margin-left: 6px
}

.footer--3zNrB .licensee--1ZKwx .linkButton--7tCnL .iconArrow--3kFI9:before
	{
	position: absolute;
	top: 50%;
	left: 50%;
	content: ""
}

.footer--3zNrB .licensee--1ZKwx .linkButton--7tCnL .iconArrow--3kFI9:before
	{
	width: 6px;
	height: 6px;
	-webkit-transform: translate(-50%, -50%) rotate(45deg);
	transform: translate(-50%, -50%) rotate(45deg);
	margin-top: -2px;
	border: 1px solid #979797;
	border-width: 0 1px 1px 0
}

.footer--3zNrB .licensee--1ZKwx .linkButton--7tCnL.isActive--1ZlxY .iconArrow--3kFI9
	{
	margin-top: -3px
}

.footer--3zNrB .licensee--1ZKwx .linkButton--7tCnL.isActive--1ZlxY .iconArrow--3kFI9:before
	{
	margin-top: 3px;
	border-top: 1px solid #979797;
	border-left: 1px solid #979797
}

.footer--3zNrB .licensee--1ZKwx .info--3Zhno {
	margin-bottom: 20px;
	background-color: rgba(0, 0, 0, .03);
	font-size: 12px;
	line-height: 18px
}

.footer--3zNrB .licensee--1ZKwx .info--3Zhno ul {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 1.2rem 20px
}

@media only screen and (min-width: 768px) {
	.footer--3zNrB .licensee--1ZKwx .info--3Zhno ul {
		padding-left: 40px;
		padding-right: 40px
	}
}

.footer--3zNrB .licensee--1ZKwx .info--3Zhno li {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	max-width: 100%
}

.footer--3zNrB .licensee--1ZKwx .info--3Zhno li+li {
	margin-top: .6rem
}

.footer--3zNrB .licensee--1ZKwx .info--3Zhno .title--Rq5lb {
	-webkit-box-flex: 0;
	-webkit-flex: none;
	-ms-flex: none;
	flex: none;
	width: 10.2rem;
	color: #8c8c8c
}

.footer--3zNrB .licensee--1ZKwx .info--3Zhno .text--3J8rM {
	-webkit-box-flex: 1;
	-webkit-flex: 1 1 auto;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding-left: 10px;
	color: #4c4c4c;
	letter-spacing: -0.2px
}

.footer--3zNrB .licensee--1ZKwx .info--3Zhno .text--3J8rM a {
	color: #4c4c4c
}

.footer--3zNrB .sideLink--1PaCk {
	margin-bottom: 10px;
	text-align: center
}

.footer--3zNrB .sideLink--1PaCk .sideMenu--AG2V- {
	display: inline-block;
	padding: 2rem 1rem;
	line-height: 16px;
	color: #333;
	font-size: 12px;
	font-weight: 600;
	vertical-align: top
}

.footer--3zNrB .sideLink--1PaCk .iconHome--21GR-, .footer--3zNrB .sideLink--1PaCk .iconTop--sUTQ3
	{
	margin-right: 4px
}

.footer--3zNrB .sideLink--1PaCk .text--3J8rM {
	display: inline-block;
	margin-top: 2px
}

.footer--3zNrB .footerSnb--2Mx58 {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 20px;
	text-align: center
}

@media only screen and (min-width: 768px) {
	.footer--3zNrB .footerSnb--2Mx58 {
		padding-left: 40px;
		padding-right: 40px
	}
}

.footer--3zNrB .footerSnb--2Mx58 .list--272kf {
	border: solid 1px rgba(0, 0, 0, .05);
	background-color: #fff;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex
}

.footer--3zNrB .footerSnb--2Mx58 .item--3YcCY {
	-webkit-box-flex: 1;
	-webkit-flex: 1 1 auto;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	position: relative;
	color: #4c4c4c;
	line-height: 42px;
	font-size: 13px
}

.footer--3zNrB .footerSnb--2Mx58 .item--3YcCY+.item--3YcCY::before {
	position: absolute;
	top: 50%;
	left: 0;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	width: 1px;
	height: 17px;
	background-color: #e5e5e5;
	content: ""
}

.footer--3zNrB .footerLnb--1FrcI {
	margin-top: 24px;
	text-align: center
}

.footer--3zNrB .footerLnb--1FrcI .item--3YcCY {
	display: inline-block;
	position: relative;
	margin-bottom: 5px;
	padding: 0 6px;
	color: #4c4c4c;
	font-size: 12px
}

.footer--3zNrB .footerLnb--1FrcI .item--3YcCY+.item--3YcCY::before {
	position: absolute;
	top: 50%;
	left: 0;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	width: 1px;
	height: 10px;
	background-color: rgba(0, 0, 0, .05);
	content: ""
}

.footer--3zNrB .footerLnb--1FrcI .emph--VpCIC {
	font-weight: 600
}

.footer--3zNrB .copyright--k8Uob {
	margin-top: 7px;
	text-align: center
}

.footer--3zNrB .copyright--k8Uob .text--3J8rM {
	margin-left: 10px;
	color: #8c8c8c;
	font-size: 12px
}

.openmainWrap--2GxDG {
	padding: 2rem 0 13px;
	text-align: center
}

.appShortcut--36Xeg {
	position: relative;
	margin: 0 20px 1rem;
	border: 1px solid #d3d5d9;
	background-color: #fcfcfc;
	text-align: left
}

.appShortcut--36Xeg .link--o0jV1 {
	display: block;
	padding: 1.6rem 1.5rem 1.3rem
}

.appShortcut--36Xeg .linkText--1GY16 {
	padding-left: 5rem;
	font-size: 14px
}

.appShortcut--36Xeg .linkText--1GY16 em {
	display: block;
	font-size: 11px;
	font-weight: 400;
	line-height: 12px;
	color: #8c8c8c
}

.appShortcut--36Xeg .linkText--1GY16 strong {
	color: #00c73c
}

.appShortcut--36Xeg .iconKin--38E_p {
	position: absolute;
	top: 50%;
	width: 40px;
	height: 40px;
	margin-top: -20px;
	background:
		url(https://ssl.pstatic.net/static/kin/section/expert/app/bridge/faviconKin-New_220x220.png)
		no-repeat center/cover
}

.appShortcut--36Xeg .iconPlus--16vO_ {
	position: absolute;
	top: 50%;
	right: 2rem;
	margin-top: -7px
}

.appShortcut--36Xeg .iconPlus--16vO_ path {
	fill: #8c8c8c
}

@media screen and (min-width: 768px) {
	.appShortcut--36Xeg {
		margin-left: 40px;
		margin-right: 40px
	}
}
</style>
<style>
.footer_wrap--A-_Sn {
	position: relative;
	width: 100%;
	border-top: 1px solid #ebebeb;
	background-color: #fff
}

.footer--hdLq2 {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 27px 20px;
	line-height: 20px;
	font-size: 12px;
	color: #4c4c4c;
	text-align: center
}

@media only screen and (min-width: 768px) {
	.footer--hdLq2 {
		padding-left: 40px;
		padding-right: 40px
	}
}

.footer--hdLq2 .footer_menu--3V11t {
	margin-bottom: 11px
}

.footer--hdLq2 .f_bar--KCrNa {
	display: inline-block;
	overflow: hidden;
	width: 1px;
	height: 11px;
	margin: -2px 8px 0;
	background-color: #d7d7d7;
	font-size: 0;
	vertical-align: middle
}

.footer--hdLq2 .copyright--1Ziy_ {
	font-family: Verdana, sans-serif;
	font-size: 10px
}

.areaDescription--GDsIH {
	margin: 18px 0
}

.description--1iCJ- {
	font-size: 12px;
	color: #8c8c8c;
	line-height: 18px
}

.information--IYpq6 {
	margin-top: 19px;
	font-size: 12px;
	line-height: 22px
}

.information--IYpq6 .text--ZaKgz {
	color: #8c8c8c
}

.information--IYpq6 .data--3c9wD {
	color: #4c4c4c
}

.footer_logo--PjSHM {
	background:
		url(https://ssl.pstatic.net/static/kin/section/sprite/sp_common_191113.svg)
		0 0/192px 155px;
	width: 54px;
	height: 11px;
	display: inline-block;
	margin: -2px 10px 0 0;
	font-size: 0;
	line-height: 0;
	color: rgba(0, 0, 0, 0);
	vertical-align: middle
}
</style>
<style>
.area--1J7Td {
	position: fixed;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 100
}

.toasts--39V9I {
	position: relative;
	margin: 0 20px 20px;
	max-width: 620px;
	padding: 15px 30px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-box-shadow: 0 2px 6px 0 rgba(255, 112, 112, .2);
	box-shadow: 0 2px 6px 0 rgba(255, 112, 112, .2);
	border: 1px solid rgba(255, 112, 112, .4);
	-webkit-border-radius: 36px;
	border-radius: 36px;
	background-color: #fff8f8;
	font-size: 15px;
	line-height: 21px;
	word-break: keep-all;
	text-align: center;
	color: #ff7070
}

.toasts--39V9I.typeDefault--1xAEO {
	padding-right: 52px
}

@media screen and (min-width: 660px) {
	.toasts--39V9I {
		margin-right: auto;
		margin-left: auto
	}
}

@media screen and (min-width: 1025px) {
	.toasts--39V9I:only-child {
		margin-bottom: 40px
	}
}

.buttonClose--1aFY_ {
	position: absolute;
	top: 50%;
	right: 19px;
	overflow: hidden;
	margin-top: -17px;
	padding: 5px
}

.iconClose--1q6av path {
	fill: #ff7070
}

.button--3QkpA {
	display: block;
	width: 100%;
	padding: 22px 20px;
	background-color: #4a65f6;
	font-size: 16px;
	font-weight: bold;
	line-height: 20px;
	color: #fff;
	cursor: pointer
}

.button--3QkpA:disabled {
	background-color: #d6d6d6;
	cursor: inherit
}

.iconCircleArrow--1u16D {
	margin-left: 9px;
	vertical-align: top
}
</style>
<style>
.title--3mvJt {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 20px
}

@media only screen and (min-width: 768px) {
	.title--3mvJt {
		padding-left: 40px;
		padding-right: 40px
	}
}

.section--fP821 .ListCarousel_defaultContainer--2aND6 .swiper-slide {
	width: 330px
}

@media screen and (min-width: 1025px) {
	.section--fP821 .ListCarousel_defaultContainer--2aND6 .swiper-slide {
		width: 33.3%
	}
}

.card--2H9Eo {
	display: block;
	overflow: hidden;
	-webkit-border-radius: 5px;
	border-radius: 5px
}

.thumbnail--jD34O {
	position: relative;
	padding-top: 46.875%;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	background: #eff1ee no-repeat center/cover
}

.thumbnail--jD34O:after {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border: 1px solid rgba(0, 0, 0, .05);
	-webkit-border-radius: 5px;
	border-radius: 5px;
	content: ""
}

.iconTimeDeal--2G8Qj {
	position: absolute;
	top: 10px;
	right: 10px
}
</style>
<style>/*
 * Swiper 2.7.6
 * Mobile touch slider and framework with hardware accelerated transitions
 *
 * http://www.idangero.us/sliders/swiper/
 *
 * Copyright 2010-2015, Vladimir Kharlampidi
 * The iDangero.us
 * http://www.idangero.us/
 *
 * Licensed under GPL & MIT
 *
 * Released on: February 11, 2015
*/
/* ===============================================================
Basic Swiper Styles 
================================================================*/
.swiper-container {
	margin: 0 auto;
	position: relative;
	overflow: hidden;
	direction: ltr;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
	/* Fix of Webkit flickering */
	z-index: 1;
}

.swiper-wrapper {
	position: relative;
	width: 100%;
	-webkit-transition-property: -webkit-transform, left, top;
	-webkit-transition-duration: 0s;
	-webkit-transform: translate3d(0px, 0, 0);
	-webkit-transition-timing-function: ease;
	-moz-transition-property: -moz-transform, left, top;
	-moz-transition-duration: 0s;
	-moz-transform: translate3d(0px, 0, 0);
	-moz-transition-timing-function: ease;
	-o-transition-property: -o-transform, left, top;
	-o-transition-duration: 0s;
	-o-transform: translate3d(0px, 0, 0);
	-o-transition-timing-function: ease;
	-o-transform: translate(0px, 0px);
	-ms-transition-property: -ms-transform, left, top;
	-ms-transition-duration: 0s;
	-ms-transform: translate3d(0px, 0, 0);
	-ms-transition-timing-function: ease;
	transition-property: transform, left, top;
	transition-duration: 0s;
	transform: translate3d(0px, 0, 0);
	transition-timing-function: ease;
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

.swiper-free-mode>.swiper-wrapper {
	-webkit-transition-timing-function: ease-out;
	-moz-transition-timing-function: ease-out;
	-ms-transition-timing-function: ease-out;
	-o-transition-timing-function: ease-out;
	transition-timing-function: ease-out;
	margin: 0 auto;
}

.swiper-slide {
	float: left;
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

/* IE10 Windows Phone 8 Fixes */
.swiper-wp8-horizontal {
	-ms-touch-action: pan-y;
}

.swiper-wp8-vertical {
	-ms-touch-action: pan-x;
}

/* ===============================================================
Your custom styles, here you need to specify container's and slide's
sizes, pagination, etc.
================================================================*/
.swiper-container {
	/* Specify Swiper's Size: */
	/*width:200px;
	height: 100px;*/
	
}

.swiper-slide {
	/* Specify Slides's Size: */
	/*width: 100%;
	height: 100%;*/
	
}

.swiper-slide-active {
	/* Specific active slide styling: */
	
}

.swiper-slide-visible {
	/* Specific visible slide styling: */
	
}
/* ===============================================================
Pagination Styles
================================================================*/
.swiper-pagination-switch {
	/* Stylize pagination button: */
	
}

.swiper-active-switch {
	/* Specific active button style: */
	
}

.swiper-visible-switch {
	/* Specific visible button style: */
	
}
</style>

<style>.area--1J7Td{position:fixed;right:0;bottom:0;left:0;z-index:100}.toasts--39V9I{position:relative;margin:0 20px 20px;max-width:620px;padding:15px 30px;-webkit-box-sizing:border-box;box-sizing:border-box;-webkit-box-shadow:0 2px 6px 0 rgba(255,112,112,.2);box-shadow:0 2px 6px 0 rgba(255,112,112,.2);border:1px solid rgba(255,112,112,.4);-webkit-border-radius:36px;border-radius:36px;background-color:#fff8f8;font-size:15px;line-height:21px;word-break:keep-all;text-align:center;color:#ff7070}.toasts--39V9I.typeDefault--1xAEO{padding-right:52px}@media screen and (min-width: 660px){.toasts--39V9I{margin-right:auto;margin-left:auto}}@media screen and (min-width: 1025px){.toasts--39V9I:only-child{margin-bottom:40px}}.buttonClose--1aFY_{position:absolute;top:50%;right:19px;overflow:hidden;margin-top:-17px;padding:5px}.iconClose--1q6av path{fill:#ff7070}.button--3QkpA{display:block;width:100%;padding:22px 20px;background-color:#4a65f6;font-size:16px;font-weight:bold;line-height:20px;color:#fff;cursor:pointer}.button--3QkpA:disabled{background-color:#d6d6d6;cursor:inherit}.iconCircleArrow--1u16D{margin-left:9px;vertical-align:top}</style>
<style>.title--3mvJt{-webkit-box-sizing:border-box;box-sizing:border-box;max-width:1280px;margin:0 auto;padding:0 20px}@media only screen and (min-width: 768px){.title--3mvJt{padding-left:40px;padding-right:40px}}.section--fP821 .ListCarousel_defaultContainer--2aND6 .swiper-slide{width:330px}@media screen and (min-width: 1025px){.section--fP821 .ListCarousel_defaultContainer--2aND6 .swiper-slide{width:33.3%}}.card--2H9Eo{display:block;overflow:hidden;-webkit-border-radius:5px;border-radius:5px}.thumbnail--jD34O{position:relative;padding-top:46.875%;-webkit-border-radius:5px;border-radius:5px;background:#eff1ee no-repeat center/cover}.thumbnail--jD34O:after{position:absolute;top:0;left:0;right:0;bottom:0;border:1px solid rgba(0,0,0,.05);-webkit-border-radius:5px;border-radius:5px;content:""}.iconTimeDeal--2G8Qj{position:absolute;top:10px;right:10px}</style>
<style>/*
 * Swiper 2.7.6
 * Mobile touch slider and framework with hardware accelerated transitions
 *
 * http://www.idangero.us/sliders/swiper/
 *
 * Copyright 2010-2015, Vladimir Kharlampidi
 * The iDangero.us
 * http://www.idangero.us/
 *
 * Licensed under GPL & MIT
 *
 * Released on: February 11, 2015
*/
/* ===============================================================
Basic Swiper Styles 
================================================================*/
.swiper-container {
	margin:0 auto;
	position:relative;
	overflow:hidden;
	direction:ltr;
	-webkit-backface-visibility:hidden;
	-moz-backface-visibility:hidden;
	-ms-backface-visibility:hidden;
	-o-backface-visibility:hidden;
	backface-visibility:hidden;
	/* Fix of Webkit flickering */
	z-index:1;
}
.swiper-wrapper {
	position:relative;
	width:100%;
	-webkit-transition-property:-webkit-transform, left, top;
	-webkit-transition-duration:0s;
	-webkit-transform:translate3d(0px,0,0);
	-webkit-transition-timing-function:ease;
	
	-moz-transition-property:-moz-transform, left, top;
	-moz-transition-duration:0s;
	-moz-transform:translate3d(0px,0,0);
	-moz-transition-timing-function:ease;
	
	-o-transition-property:-o-transform, left, top;
	-o-transition-duration:0s;
	-o-transform:translate3d(0px,0,0);
	-o-transition-timing-function:ease;
	-o-transform:translate(0px,0px);
	
	-ms-transition-property:-ms-transform, left, top;
	-ms-transition-duration:0s;
	-ms-transform:translate3d(0px,0,0);
	-ms-transition-timing-function:ease;
	
	transition-property:transform, left, top;
	transition-duration:0s;
	transform:translate3d(0px,0,0);
	transition-timing-function:ease;

	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}
.swiper-free-mode > .swiper-wrapper {
	-webkit-transition-timing-function: ease-out;
	-moz-transition-timing-function: ease-out;
	-ms-transition-timing-function: ease-out;
	-o-transition-timing-function: ease-out;
	transition-timing-function: ease-out;
	margin: 0 auto;
}
.swiper-slide {
	float: left;
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

/* IE10 Windows Phone 8 Fixes */
.swiper-wp8-horizontal {
	-ms-touch-action: pan-y;
}
.swiper-wp8-vertical {
	-ms-touch-action: pan-x;
}

/* ===============================================================
Your custom styles, here you need to specify container's and slide's
sizes, pagination, etc.
================================================================*/
.swiper-container {
	/* Specify Swiper's Size: */

	/*width:200px;
	height: 100px;*/
}
.swiper-slide {
	/* Specify Slides's Size: */
	
	/*width: 100%;
	height: 100%;*/
}
.swiper-slide-active {
	/* Specific active slide styling: */
	
}
.swiper-slide-visible {
	/* Specific visible slide styling: */	

}
/* ===============================================================
Pagination Styles
================================================================*/
.swiper-pagination-switch {
	/* Stylize pagination button: */	

}
.swiper-active-switch {
	/* Specific active button style: */	
	
}
.swiper-visible-switch {
	/* Specific visible button style: */	
	
}
</style>
<style>/*Pagination*/
.swiper-pagination {
    position: absolute;
    z-index: 20;
    bottom: 10px;
    width: 100%;
    text-align: center;
}

.swiper-pagination-switch {
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 8px;
    background: #1e1e1e;
    margin: 0 5px;
    opacity: 0.8;
    border: 1px solid #fff;
    cursor: pointer;
}

.swiper-active-switch {
    background: #3b99fc;
}

</style>
<style>.button--2tb79{position:absolute;width:48px;height:48px;-webkit-border-radius:50%;border-radius:50%;background-color:#fff;-webkit-box-shadow:0 5px 10px 0 rgba(126,150,255,.1);box-shadow:0 5px 10px 0 rgba(126,150,255,.1);border:1px solid rgba(111,138,255,.15);z-index:2}.button--2tb79[aria-disabled=true]{display:none}.button--2tb79::after{position:absolute;top:50%;left:50%;width:8px;height:8px;border:2px solid #222;-webkit-transform:rotate(45deg);transform:rotate(45deg);content:""}.typePrev--vNuTz::after{border-width:0 0 2px 2px;-webkit-transform:rotate(45deg);transform:rotate(45deg);margin:-5px 0 0 -3px}.typePrev--vNuTz.arrowWhite--3DQqE::after{border-color:#fff}.typeNext--3VGUN::after{border-width:2px 2px 0 0;margin:-5px 0 0 -6px}.typeNext--3VGUN.arrowWhite--3DQqE::after{border-color:#fff}.colorBlack--ulboX{background-color:#2d2d2d;-webkit-box-shadow:0 5px 10px 0 rgba(0,0,0,.3);box-shadow:0 5px 10px 0 rgba(0,0,0,.3);border:none}.colorWhiteTransparent--P0NUO{background-color:rgba(255,255,255,.1);border:none;-webkit-box-shadow:none;box-shadow:none}.colorBlackTransparent--2f2Wt{background-color:rgba(0,0,0,.1);border:none;-webkit-box-shadow:none;box-shadow:none}.colorNone--2PE0l{background-color:rgba(0,0,0,0);border:none;-webkit-box-shadow:none;box-shadow:none}</style>
<div class="subHeader--2JFq0">
	<div class="inner--2-cpy">
		<div class="titleSection--2IeYp SubTitleItem_titleSection--ai8xs">
			<p class="title--WCy7q SubTitleItem_title--m9p8G headline5--2nAra" style="font-size: 31px;">이벤트
				상세</p>
		</div>
		<security:authorize access="hasRole('ROLE_ADMIN')">
					<div class="titleSection--2IeYp SubTitleItem_titleSection--ai8xs">
										<a
								href="<%=request.getContextPath()%>/expert/event/update/${exevent.exeventId }"
								class="btn btn-block btn-light btn-md"> 이벤트수정 </a>
							<form id="delete_form"
								action="<%=request.getContextPath()%>/expert/event/delete/${exevent.exeventId }"
								method="post">
								<input type="hidden" name="_method" value="delete" /> <a
									onclick="if (confirm('정말로 삭제하시겠습니까?')) document.getElementById('delete_form').submit();"
									class="btn btn-danger">삭제</a>
							</form>
			</div>
		</security:authorize>	
          
		<div class="buttonSection--3nGYz"></div>
	</div>
</div>
<div>
	<div class="eventInfo--3Uj1c">
		<div class="inner--22EO_">
			<span class="eventPeriod--Fjuj5">${exevent.exeventStart } ~
				${exevent.exeventEnd }</span><span
				class="eventBadge--2e1qA badgeHighlight--16y0J">진행중</span>
		</div>
	</div>
	<div>
		<div class="eventThumbnail--2Xi17"
			style="background-image: url(&quot;<spring:url value='/image/expertFolder/${exevent.attatchList[0].attSavename }'/>&quot;); background-color: rgb(215, 233, 243); height: 112vw; max-height: 420px;"></div>
		<div class="eventBox--3-oBr">
			<div class="eventSummary--31Rx2"
				style="background-color: rgb(64, 89, 225);">
				<span class="blind">EVENT</span>
				<svg width="47" height="11" viewBox="0 0 47 11">
					<path fill="#FFF"
						d="M6.69 10.545V8.16H2.67V6.315h3.57V3.93H2.67V2.445h3.885v-2.4H0v10.5h6.69zm6.575.12L17.72.45V.045h-2.58l-2.4 5.94h-.075l-2.46-5.94h-2.58V.45l4.5 10.215h1.14zm12.575-.12V8.16h-4.02V6.315h3.57V3.93h-3.57V2.445h3.885v-2.4H19.15v10.5h6.69zm11.09.015V.045h-2.745V5.19L28.875 0H27.9v10.545h2.775v-5.16l5.295 5.175h.96zm6.62-.015v-8.1h2.565v-2.4h-7.8v2.4h2.58v8.1h2.655z"></path></svg>
				<p class="summaryText--3_x7Y">새롭게 엑스퍼트에 합류한 실력있는 전문가들이 당신을
					기다립니다!</p>
			</div>
					
		</div>
	</div>
	<div class="eventContent--17g10">
		<div class="eventArea--3hpam" id="comp0"
			style="background-color: rgb(255, 255, 255);">
			<div class="eventBox--3-oBr">
				
				${exevent.exeventContent }
			</div>
		</div>
	</div>
</div>
<div class="section--fP821 EventCarousel_section--17ygN">
			<div class="titleArea--s3-rN">
				<p class="title--1Yy8N" style="font-size: 37px; margin-bottom: 30px">진행 중인 이벤트</p>
			</div>

			<div class="optionArea--2CQRF">
				<a href="https://m.expert.naver.com/mobile/events"
					class="optionText--1NnLG primary--27Ntp"></a>
	</div>
	<div class="carouselSection--DEN01">
		<div class="carouselArea--2dIwk">
			<div class="swiper-container opened_event-swiper-container" style="">
				<div class="swiper-wrapper " style="width: 3290px;">
				<c:set var="exeventList" value="${pagingVO.dataList }"></c:set>
				<c:choose>
					<c:when test="${not empty exeventList }">
						<c:forEach items="${exeventList }" var="exevent">
					<div class="swiper-slide swiper-slide-visible swiper-slide-active"
						style="width: 329px;">
						<a href="${pageContext.request.contextPath}/expert/event/detail/${exevent.exeventId }"
							target="_self" class="card--2H9Eo"><div
								class="thumbnail--jD34O"
								style="background-image: url(&quot;<spring:url value='/image/expertFolder/${exevent.attatchList[0].attSavename }'/>&quot;);"></div></a>
					</div>
						</c:forEach>
					</c:when>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>




	<section class=" py-3 site-section mb-5">
		<div class="container" style="max-width: 60%;">
			<div class="row">
				<div class="col-md-4 text-center">
					<a
						href="${pageContext.request.contextPath}/expert/event/detail/${exevent.preExevent}"
						class="btn btn-md btn-outline-primary border-width-2 d-block"
						id="preBtn">&laquo; 이전</a>
				</div>
				<div class="col-md-4 text-center">
					<a href="${pageContext.request.contextPath}/expert/event"
						class="btn btn-md btn-primary border-width-2 d-block">전체</a>
				</div>
				<div class="col-md-4 text-center">
					<a
						href="${pageContext.request.contextPath}/expert/event/detail/${exevent.nextExevent}"
						class="btn btn-md btn-outline-primary border-width-2 d-block"
						id="nextBtn">다음 &raquo;</a>
				</div>
			</div>
		</div>
	</section>

</div>

<script type="text/javascript">
console.log(${exevent.attatchList});
	if (`${exevent.preExevent}` == "") {
		$("#preBtn").click(function() {
			return false;
		});
	};
	if (`${exevent.nextExevent}` == "") {
		$("#nextBtn").click(function() {
			return false;
		});
	};
</script>