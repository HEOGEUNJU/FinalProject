<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>

<style>

.pf {
 	font-size: 24px; 
}

.radiuss{
	width: 100%;
	height: auto;
	border : 1px solid #eaedf4;
	border-radius: 12px;
	padding: 80px 99px 100px 99px;
	margin-top: 2%;
	margin-bottom: 2%;
}

.annoTable table {
  	width: 100%;
   	height: 500px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
  	margin: 0px;
}
.annoTable th{
	background: #f7f7f7;
	border-bottom: 1px solid #eaedf4;
  	padding: 10px;
  	width: 155px;
} 

.annoTable td {
  	border-bottom: 1px solid #eaedf4;
  	padding: 20px;
}

#checkDisp {
	width: 100%;
	height: 30vh;
	display: flex;
	justifiy-content: center;
}
.checkLabel {
	width: 13%;
	height: 20vh;
	margin: 0.5%;
	padding-top: 7%;
	font-size: 1.5em;
	font-weight: 800;
	line-height: 1;
	border-radius: 10px;
	background-color: #FAFBFF;
	box-shadow: 0 1.5em 2.5em -0.5em rgba(0, 0, 0, 0.1);
	transition: transform 0.45s ease, background 0.45s ease;
	text-align: center;
	word-break: keep-all;
}
.checkLabel:hover {
	background: #4B7BF5;
	transform: scale(1.04);
	text-decoration: none;
	color: white;
}
.hovered {
	background: #4B7BF5;
	transform: scale(1.04);
	text-decoration: none;
	color: white;
}
.ck-editor__editable_inline {
    min-height: 200px;
}
</style>
<c:set var="detail" value="${anno.detailList[0]}"/>
<c:forEach items="${detail.processList}" var="process">
	<span class="exist">${process.processCodeId}</span>
</c:forEach>
<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">세부공고</span>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<p class="pf" style="margin-bottom: 30px;">${anno.annoTitle}</p>
	<table class="annoTable" style="width: 100%;">
	  <tr>
	    <th scope="row">법인명</th>
	    <td>${anno.company.cmpName}</td>
	    <th scope="row">회사대표자</th>
	    <td>${anno.company.cmpRepName}</td>
	  </tr>
	  <tr>
	    <th scope="row">근무환경</th>
	    <td style="width:62%;">${anno.annoWorkenv}</td>
	    <th scope="row">수습기간</th>
	    <td>${anno.annoProbation}</td>
	  </tr>
	  <tr>
	    <th scope="row">공고 시작날짜</th>
	    <td>${anno.annoStartdate}</td>
	    <th scope="row">공고 종료날짜</th>
	    <td>${anno.annoEnddate}</td>
	  </tr>
	  <tr>
	    <th scope="row">공고 내용</th>
	    <td colspan="3">${anno.annoContent}</td>
	  </tr>
	  <tr>
	  	<th scope="row">담당업무</th>
	  	<td>${detail.daFd}</td>
	  	<th scope="row">근무부서</th>
	  	<td>${detail.daDepartment}</td>
	  </tr>
	  <tr>
	  	<th scope="row">상세업무</th>
	  	<td colspan="3">${detail.daTask}</td>
	</table>
</div>

<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">세부공고 채용과정 수정</span>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<h1 style="margin-bottom: 30px; font-size: 1.5rem;">수정할 채용과정을 선택하세요</h1>
	
	<div id="checkDisp">
	
		<input type="checkbox" class="btn-check" name="process" value="PRC001" id="check1" checked disabled>
		<label class="checkLabel hovered" for="check1" id="label1">입사지원서</label>
		
		<input type="checkbox" class="btn-check" name="process" value="PRC002" id="check2">
		<label class="checkLabel" for="check2" id="label2">자기소개서</label>
		
		<input type="checkbox" class="btn-check" name="process" value="PRC003" id="check3">
		<label class="checkLabel" for="check3" id="label3">필기시험</label>
		
		<input type="checkbox" class="btn-check" name="process" value="PRC004" id="check4">
		<label class="checkLabel" for="check4" id="label4">역량평가</label>
		
		<input type="checkbox" class="btn-check" name="process" value="PRC005" id="check5">
		<label class="checkLabel" for="check5" id="label5">토론면접</label>
		
		<input type="checkbox" class="btn-check" name="process" value="PRC006" id="check6">
		<label class="checkLabel" for="check6" id="label6">실무면접</label>
		
		<input type="checkbox" class="btn-check" name="process" value="PRC007" id="check7">
		<label class="checkLabel" for="check7" id="label7">인턴십</label>
		
		<input type="checkbox" class="btn-check" name="process" value="PRC008" id="check8" checked disabled>
		<label class="checkLabel hovered" for="check8" id="label8">임원면접</label>
			
	</div>

	<h1 style="margin-bottom: 30px; font-size: 1.5rem;">채용과정</h1>
	<div id="radioDisp">
		<input type="radio" class="btn-check" name="options" value="PRC001" id="option1" autocomplete="off" checked>
		<label class="btn btn-primary" for="option1" data-color="btn-primary">입사지원서</label>
		
		<input type="radio" class="btn-check" name="options" value="PRC002" id="option2" autocomplete="off" style="display: none;">
		<label class="btn " for="option2" style="display: none;">자기소개서</label>
		
		<input type="radio" class="btn-check" name="options" value="PRC003" id="option3" autocomplete="off" style="display: none;">
		<label class="btn " for="option3" style="display: none;">필기시험</label>
		
		<input type="radio" class="btn-check" name="options" value="PRC004" id="option4" autocomplete="off" style="display: none;">
		<label class="btn " for="option4" style="display: none;">역량평가</label>
		
		<input type="radio" class="btn-check" name="options" value="PRC005" id="option5" autocomplete="off" style="display: none;">
		<label class="btn " for="option5" style="display: none;">토론면접</label>
		
		<input type="radio" class="btn-check" name="options" value="PRC006" id="option6" autocomplete="off" style="display: none;">
		<label class="btn " for="option6" style="display: none;">실무면접</label>
		
		<input type="radio" class="btn-check" name="options" value="PRC007" id="option7" autocomplete="off" style="display: none;">
		<label class="btn " for="option7" style="display: none;">인턴십</label>
		
		<input type="radio" class="btn-check" name="options" value="PRC008" id="option8" autocomplete="off">
		<label class="btn " for="option8" >임원면접</label>
	</div>
	<form:form modelAttribute="process" action="${pageContext.request.contextPath}/process/edit?annoNo=${anno.annoNo}&daNo=${daNo}" method="post" enctype="multipart/form-data">
	<form:hidden path="processList[0].daNo" cssClass="form-control" value="${daNo}"/>
	<form:hidden path="processList[1].daNo" cssClass="form-control" value="${daNo}"/>
	<form:hidden path="processList[2].daNo" cssClass="form-control" value="${daNo}"/>
	<form:hidden path="processList[3].daNo" cssClass="form-control" value="${daNo}"/>
	<form:hidden path="processList[4].daNo" cssClass="form-control" value="${daNo}"/>
	<form:hidden path="processList[5].daNo" cssClass="form-control" value="${daNo}"/>
	<form:hidden path="processList[6].daNo" cssClass="form-control" value="${daNo}"/>
	<form:hidden path="processList[7].daNo" cssClass="form-control" value="${daNo}"/>
	<div id="disp">
		<div id="disp1">
			<div class="form-group">
				<form:hidden path="processList[0].processCodeId" cssClass="form-control" value="PRC01" readonly="true"/>
				<form:errors path="processList[0].processCodeId" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">시작 - 종료 날짜</label>
				<input type="text" name="datetimes" id="dt0" class="box box_input form-control" style="width: 300px;">
				<form:hidden path="processList[0].processStartDate" id="sd0"/>
				<form:hidden path="processList[0].processEndDate" id="ed0"/>
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">방식</label>
				<form:select path="processList[0].processWay" cssClass="form-control">
					<form:option value="온라인">온라인</form:option>
					<form:option value="대면">대면</form:option>
					<form:option value="화상">화상</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="processList[0].processWay" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 600px; margin-right: 1%;">
				<label for="job-title">첨부파일</label>
				<input type="file" name="processList[0].attachFiles" class="form-control" multiple>
				<form:errors path="processList[0].attachFiles" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
				<label for="job-title">상세설명 </label>
				<form:textarea path="processList[0].processLimit" cssClass="form-control textIncumContent" id="editor0" placeholder="예) 추후 시간이 달라질 수 있음."></form:textarea>
				<form:errors path="processList[0].processLimit" element="span" cssClass="text-danger" />
			</div>
		</div>
		<div id="disp2" style="display: none;">
			<div class="form-group">
				<form:hidden path="processList[1].processCodeId" cssClass="form-control" value="PRC02" readonly="true"/>
				<form:errors path="processList[1].processCodeId" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">시작 - 종료 날짜</label>
				<input type="text" name="datetimes" id="dt1" class="box box_input form-control" style="width: 300px;">
				<form:hidden path="processList[1].processStartDate" id="sd1"/>
				<form:hidden path="processList[1].processEndDate" id="ed1"/>
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">방식</label>
				<form:select path="processList[1].processWay" cssClass="form-control">
					<form:option value="온라인">온라인</form:option>
					<form:option value="대면">대면</form:option>
					<form:option value="화상">화상</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="processList[1].processWay" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 600px; margin-right: 1%;">
				<label for="job-title">첨부파일</label>
				<input type="file" name="processList[1].attachFiles" class="form-control" multiple>
				<form:errors path="processList[1].attachFiles" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
				<label for="job-title">상세설명 </label>
				<form:textarea path="processList[1].processLimit" cssClass="form-control textIncumContent" id="editor1" placeholder="예) 추후 시간이 달라질 수 있음."></form:textarea>
				<form:errors path="processList[1].processLimit" element="span" cssClass="text-danger" />
			</div>
		</div>
		<div id="disp3" style="display: none;">
			<div class="form-group">
				<form:hidden path="processList[2].processCodeId" cssClass="form-control" value="PRC03" readonly="true"/>
				<form:errors path="processList[2].processCodeId" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">시작 - 종료 날짜</label>
				<input type="text" name="datetimes" id="dt2" class="box box_input form-control" style="width: 300px;">
				<form:hidden path="processList[2].processStartDate" id="sd2"/>
				<form:hidden path="processList[2].processEndDate" id="ed2"/>
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">방식</label>
				<form:select path="processList[2].processWay" cssClass="form-control">
					<form:option value="온라인">온라인</form:option>
					<form:option value="대면">대면</form:option>
					<form:option value="화상">화상</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="processList[2].processWay" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 600px; margin-right: 1%;">
				<label for="job-title">첨부파일</label>
				<input type="file" name="processList[2].attachFiles" class="form-control" multiple>
				<form:errors path="processList[2].attachFiles" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
				<label for="job-title">상세설명 </label>
				<form:textarea path="processList[2].processLimit" cssClass="form-control textIncumContent" id="editor2" placeholder="예) 추후 시간이 달라질 수 있음."></form:textarea>
				<form:errors path="processList[2].processLimit" element="span" cssClass="text-danger" />
			</div>
		</div>
		<div id="disp4" style="display: none;">
			<div class="form-group">
				<form:hidden path="processList[3].processCodeId" cssClass="form-control" value="PRC04" readonly="true"/>
				<form:errors path="processList[3].processCodeId" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">시작 - 종료 날짜</label>
				<input type="text" name="datetimes" id="dt3" class="box box_input form-control" style="width: 300px;">
				<form:hidden path="processList[3].processStartDate" id="sd3"/>
				<form:hidden path="processList[3].processEndDate" id="ed3"/>
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">방식</label>
				<form:select path="processList[3].processWay" cssClass="form-control">
					<form:option value="온라인">온라인</form:option>
					<form:option value="대면">대면</form:option>
					<form:option value="화상">화상</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="processList[3].processWay" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 600px; margin-right: 1%;">
				<label for="job-title">첨부파일</label>
				<input type="file" name="processList[3].attachFiles" class="form-control" multiple>
				<form:errors path="processList[3].attachFiles" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
				<label for="job-title">상세설명 </label>
				<form:textarea path="processList[3].processLimit" cssClass="form-control textIncumContent" id="editor3" placeholder="예) 추후 시간이 달라질 수 있음."></form:textarea>
				<form:errors path="processList[3].processLimit" element="span" cssClass="text-danger" />
			</div>
		</div>
		<div id="disp5" style="display: none;">
			<div class="form-group">
				<form:hidden path="processList[4].processCodeId" cssClass="form-control" value="PRC05" readonly="true"/>
				<form:errors path="processList[4].processCodeId" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">시작 - 종료 날짜</label>
				<input type="text" name="datetimes" id="dt4" class="box box_input form-control" style="width: 300px;">
				<form:hidden path="processList[4].processStartDate" id="sd4"/>
				<form:hidden path="processList[4].processEndDate" id="ed4"/>
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">방식</label>
				<form:select path="processList[4].processWay" cssClass="form-control">
					<form:option value="온라인">온라인</form:option>
					<form:option value="대면">대면</form:option>
					<form:option value="화상">화상</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="processList[4].processWay" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 600px; margin-right: 1%;">
				<label for="job-title">첨부파일</label>
				<input type="file" name="processList[4].attachFiles" class="form-control" multiple>
				<form:errors path="processList[4].attachFiles" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
				<label for="job-title">상세설명 </label>
				<form:textarea path="processList[4].processLimit" cssClass="form-control textIncumContent" id="editor4" placeholder="예) 추후 시간이 달라질 수 있음."></form:textarea>
				<form:errors path="processList[4].processLimit" element="span" cssClass="text-danger" />
			</div>
		</div>
		<div id="disp6" style="display: none;">
			<div class="form-group">
				<form:hidden path="processList[5].processCodeId" cssClass="form-control" value="PRC06" readonly="true"/>
				<form:errors path="processList[5].processCodeId" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">시작 - 종료 날짜</label>
				<input type="text" name="datetimes" id="dt5" class="box box_input form-control" style="width: 300px;">
				<form:hidden path="processList[5].processStartDate" id="sd5"/>
				<form:hidden path="processList[5].processEndDate" id="ed5"/>
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">방식</label>
				<form:select path="processList[5].processWay" cssClass="form-control">
					<form:option value="온라인">온라인</form:option>
					<form:option value="대면">대면</form:option>
					<form:option value="화상">화상</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="processList[5].processWay" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 600px; margin-right: 1%;">
				<label for="job-title">첨부파일</label>
				<input type="file" name="processList[5].attachFiles" class="form-control" multiple>
				<form:errors path="processList[5].attachFiles" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
				<label for="job-title">상세설명 </label>
				<form:textarea path="processList[5].processLimit" cssClass="form-control textIncumContent" id="editor5" placeholder="예) 추후 시간이 달라질 수 있음."></form:textarea>
				<form:errors path="processList[5].processLimit" element="span" cssClass="text-danger" />
			</div>
		</div>
		<div id="disp7" style="display: none;">
			<div class="form-group">
				<form:hidden path="processList[6].processCodeId" cssClass="form-control" value="PRC07" readonly="true"/>
				<form:errors path="processList[6].processCodeId" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">시작 - 종료 날짜</label>
				<input type="text" name="datetimes" id="dt6" class="box box_input form-control" style="width: 300px;">
				<form:hidden path="processList[6].processStartDate" id="sd6"/>
				<form:hidden path="processList[6].processEndDate" id="ed6"/>
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">방식</label>
				<form:select path="processList[6].processWay" cssClass="form-control">
					<form:option value="온라인">온라인</form:option>
					<form:option value="대면">대면</form:option>
					<form:option value="화상">화상</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="processList[6].processWay" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 600px; margin-right: 1%;">
				<label for="job-title">첨부파일</label>
				<input type="file" name="processList[6].attachFiles" class="form-control" multiple>
				<form:errors path="processList[6].attachFiles" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
				<label for="job-title">상세설명 </label>
				<form:textarea path="processList[6].processLimit" cssClass="form-control textIncumContent" id="editor6" placeholder="예) 추후 시간이 달라질 수 있음."></form:textarea>
				<form:errors path="processList[6].processLimit" element="span" cssClass="text-danger" />
			</div>
		</div>
		<div id="disp8" style="display: none;">
			<div class="form-group">
				<form:hidden path="processList[7].processCodeId" cssClass="form-control" value="PRC08" readonly="true"/>
				<form:errors path="processList[7].processCodeId" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">시작 - 종료 날짜</label>
				<input type="text" name="datetimes" id="dt7" class="box box_input form-control" style="width: 300px;">
				<form:hidden path="processList[7].processStartDate" id="sd7"/>
				<form:hidden path="processList[7].processEndDate" id="ed7"/>
			</div>
			<div class="form-group" style="width: 300px; margin-right: 1%; display: inline-block;">
				<label for="job-title">방식</label>
				<form:select path="processList[7].processWay" cssClass="form-control">
					<form:option value="온라인">온라인</form:option>
					<form:option value="대면">대면</form:option>
					<form:option value="화상">화상</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="processList[7].processWay" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group" style="width: 600px; margin-right: 1%;">
				<label for="job-title">첨부파일</label>
				<input type="file" name="processList[7].attachFiles" class="form-control" multiple>
				<form:errors path="processList[7].attachFiles" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
				<label for="job-title">상세설명 </label>
				<form:textarea path="processList[7].processLimit" cssClass="form-control textIncumContent" id="editor7" placeholder="예) 추후 시간이 달라질 수 있음."></form:textarea>
				<form:errors path="processList[7].processLimit" element="span" cssClass="text-danger" />
			</div>
		</div>
	</div>
	<div class="form-group" style="display: flex; justify-content: end;">
		<input type="submit" class="btn btn-primary" value="저장 후 세부 항목 등록" style="margin-right: 20px; width: 200px; border-radius: 0;"/> 
		<input type="button" class="btn btn-danger" value="취소" onclick='location.href="${pageContext.request.contextPath}/process/${anno.annoNo}/${daNo}"' style="width: 200px; border-radius: 0;"/>		
	</div>
	</form:form>
</div>

<script>
for (let i = 2; i < 8; i++){
	$("#check"+i).on("click", function(){
		if (!$(this).prop("checked")){
			$("#option"+i).hide();
			$("[for=option"+i+"]").hide();
		} else {
			$("#option"+i).show();
			$("[for=option"+i+"]").show();
		}
	});
}

let $btnColor = $("label[for=option1]").data("color");

$("input[type=radio]").on("click", function() {
	let parent = $(this).parent();
	let id = parent.find(":checked").attr("id");
	$("label[for="+id+"]").addClass($btnColor);
	
	let uid = parent.children("input").not(":checked");
	for (let i = 0; i < uid.length; i++) {
		$("label[for="+uid[i].id+"]").removeClass($btnColor);
	}
	
	let index = id.substring(6);
	$("#disp"+index).show();
	
	let udisp = $("#disp").children().not("#disp"+index);
	for (let i = 0; i < udisp.length; i++) {
		udisp[i].style.display = "none";
	}
});

$("[type=checkBox]").on("click", function() {
	let id = $(this).attr("id");
	let thisId = $("[for=" + id + "]");
	if (thisId.hasClass("hovered")) {
		thisId.removeClass("hovered");
		$("#sd" + (Number(id.substring(5)) + 1)).val("");		
	} else {
		thisId.addClass("hovered");
	}
});

//daterangepicker
$(function() {
	for (let i = 0; i < 8; i++) {
		$('#dt' + i).daterangepicker({
			opens: 'left',
			timePicker: true,
			startDate: moment().startOf('hour'),
			endDate: moment().startOf('hour').add(32, 'hour'),
			locale: {
				format: 'M/DD hh:mm A'
			}
		}, function(start, end, label) {
			let processStartDate = document.querySelector("#sd" + i);
			let processEndDate = document.querySelector("#ed" + i);
			processStartDate.value=start.format('YYYY-MM-DD HH:mm:ss');
			processEndDate.value=end.format('YYYY-MM-DD HH:mm:ss');
			console.log('시작날짜',processStartDate.value);
			console.log('종료날짜',processEndDate.value);
		});
	}
});
let today = new Date();

ClassicEditor.create(document.querySelector('#editor0'), {
	language : "ko"
});
ClassicEditor.create(document.querySelector('#editor1'), {
	language : "ko"
});
ClassicEditor.create(document.querySelector('#editor2'), {
	language : "ko"
});
ClassicEditor.create(document.querySelector('#editor3'), {
	language : "ko"
});
ClassicEditor.create(document.querySelector('#editor4'), {
	language : "ko"
});
ClassicEditor.create(document.querySelector('#editor5'), {
	language : "ko"
});
ClassicEditor.create(document.querySelector('#editor6'), {
	language : "ko"
});
ClassicEditor.create(document.querySelector('#editor7'), {
	language : "ko"
});

window.addEventListener('DOMContentLoaded', function() {
	let exist = $(".exist");
	for (let i = 0; i < exist.length; i++) {
		let id = exist[i].innerHTML.substring(4);
		if (!$("#check" + id).is(":checked")) {
			$("#check" + id).trigger("click");
		}
	}
	
});
</script>
