<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<style>
.ck-editor__editable_inline {
    min-height: 200px;
}
label {
	font-size: 25px;
	font-weight: bold;
}
</style>

<form:form modelAttribute="myintro" action="${pageContext.request.contextPath}/myintro" method="post" enctype="multipart/form-data">
	<div class="col-2" style="margin-top: 30px;">
		<button id="autoComp" type="button" class="btn btn-block btn-success btn-md" style=" border-radius: 0;">자동완성</button>
	</div>
	<div class="form-group" style="margin-top: 50px;">
		<label for="job-title">자기소개서 제목</label>
		<form:input path="myintroTitle" type="text" cssClass="form-control" />
		<form:errors path="myintroTitle" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">성장과정</label>
		<form:textarea path="myintroGrowth" cssClass="form-control textIncumContent" id="editor" placeholder="내가 어떻게 자라왔는지 적어주세요."></form:textarea>
		<form:errors path="myintroGrowth" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">성격 장단점</label>
		<form:textarea path="myintroPersonality" cssClass="form-control textIncumContent" id="editor2" placeholder="나의 성격 장단점을 적어주세요."></form:textarea>
		<form:errors path="myintroPersonality" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">학창시절</label>
		<form:textarea path="myintroSchoolday" cssClass="form-control textIncumContent" id="editor3" placeholder="학창시절의 경험을 적어주세요."></form:textarea>
		<form:errors path="myintroSchoolday" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">직무경험</label>
		<form:textarea path="myintroJob" cssClass="form-control textIncumContent" id="editor4" placeholder="직무를 맡아서 일했을 때의 경험을 적어주세요."></form:textarea>
		<form:errors path="myintroJob" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">지원동기</label>
		<form:textarea path="myintroMotive" cssClass="form-control textIncumContent" id="editor5" placeholder="왜 회사에 지원하려고 하는지 적어주세요."></form:textarea>
		<form:errors path="myintroMotive" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">입사 후 포부</label>
		<form:textarea path="myintroAspiration" cssClass="form-control textIncumContent" id="editor6" placeholder="입사 후의 의지를 적어주세요."></form:textarea>
		<form:errors path="myintroAspiration" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">가족소개</label>
		<form:textarea path="myintroFamily" cssClass="form-control textIncumContent" id="editor7" placeholder="나의 가족과의 일화를 적어주세요."></form:textarea>
		<form:errors path="myintroFamily" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">교외활동</label>
		<form:textarea path="myintroSubactivity" cssClass="form-control textIncumContent" id="editor8" placeholder="학교 밖에서 어떤 활동을 했는지 적어주세요."></form:textarea>
		<form:errors path="myintroSubactivity" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">전공선택</label>
		<form:textarea path="myintroMajor" cssClass="form-control textIncumContent" id="editor9" placeholder="왜 내 전공을 선택했는지 이유를 적어주세요."></form:textarea>
		<form:errors path="myintroMajor" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">생활진로</label>
		<form:textarea path="myintroCourse" cssClass="form-control textIncumContent" id="editor10" placeholder="앞으로의 계획, 진로에 대해서 적어주세요."></form:textarea>
		<form:errors path="myintroCourse" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">희망업무</label>
		<form:textarea path="myintroObjective" cssClass="form-control textIncumContent" id="editor11" placeholder="어떤 업무를 희망하는지 적어주세요."></form:textarea>
		<form:errors path="myintroObjective" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">동아리</label>
		<form:textarea path="myintroClub" cssClass="form-control textIncumContent" id="editor12" placeholder="동아리 활동한 것을 적어주세요."></form:textarea>
		<form:errors path="myintroClub" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">봉사활동</label>
		<form:textarea path="myintroVolunteer" cssClass="form-control textIncumContent" id="editor13" placeholder="어떤 봉사활동을 했는지 적어주세요."></form:textarea>
		<form:errors path="myintroVolunteer" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">추가항목1</label>
		<form:textarea path="myintroAdd1" cssClass="form-control textIncumContent" id="editor14" placeholder="추가로 말할 것이 있다면 적어주세요."></form:textarea>
		<form:errors path="myintroAdd1" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">추가항목2</label>
		<form:textarea path="myintroAdd2" cssClass="form-control textIncumContent" id="editor15" placeholder="추가로 말할 것이 있다면 적어주세요."></form:textarea>
		<form:errors path="myintroAdd2" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">추가항목3</label>
		<form:textarea path="myintroAdd3" cssClass="form-control textIncumContent" id="editor16" placeholder="추가로 말할 것이 있다면 적어주세요."></form:textarea>
		<form:errors path="myintroAdd3" element="span" cssClass="text-danger" />
	</div>
	<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-top: 1rem; padding-right: 0.5rem; padding-bottom: 0.5rem;">
		<button class="btn btn-primary" type="submit" style="width: 150px; height: 50px; border-radius: 0;">저장</button> 
		<button class="btn btn-danger" type="button" onclick='location.href="${pageContext.request.contextPath}/myintro"' style="width: 150px; height: 50px; border-radius: 0;">취소</button> 
	</div>
</form:form>




<!-- SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace(document.querySelector('#editor'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor2'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor3'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor4'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor5'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor6'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor7'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor8'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor9'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor10'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor11'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor12'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor13'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor14'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor15'), {
		language : "ko"
	});
	CKEDITOR.replace(document.querySelector('#editor16'), {
		language : "ko"
	});
	
	let autoComp = document.querySelector("#autoComp");
	

	
	autoComp.addEventListener("click", function(event) {
		document.querySelector("[name=myintroTitle]").value = "시작부터 시작까지";
		CKEDITOR.instances.editor.setData('<p>어학연수 당시 A 도서관에서 토론 수업 멘토로서 봉사활동을 진행했습니다. 저를 중심으로 약 10명의 외국인과 일주일에 2회씩 자유 토론을 진행했습니다. 당시 여러 멘토들 중에서 한국인은 제가 유일했고, 1년 동안 매주 참가해서 문화 이해도를 높이려는 노력을 기울였고, 그 결과 다른 나라사람들과 원활한 의사소통을 할 수 있었습니다. 해외영업을 진행하며 다양성을 받아들이려는 마음가짐은 제일 중요하다고 생각합니다.</p>')
		CKEDITOR.instances.editor2.setData('<p>저는 학교 컴퓨터 실습 시간에 다양한 활용 능력을 배우고, 친구들과 경쟁적으로 실력을 쌓아 나가면서 자연스럽게 노는 것처럼 다양한 지식을 쌓아 나갔지만, 부모님은 여전히 정말 어쩔 수 없이 쓰셔야 하는 일이 아니라면, 거의 컴퓨터에 손대지 않으셨습니다. 자연히 두 분과의 격차가 벌어지면서, 친구들에 비하면 다분히 보통 실력에 불과했던 저는 부모님의 눈에 ‘컴퓨터 천재’로 보이는 수준까지 이르게 되었습니다. 인터넷으로 원하는 지식이나 화상 자료 등을 뚝딱 찾아내고, 멀리 있는 사람과도 의사소통하면서, 복잡한 사이트 가입 절차에도 간단히 응할 수 있는 제 능력이, 부모님에게는 ‘관련 진로에 내보내도 되지 않을까’ 선망을 품게 하는 원천이었던 것입니다. 저는 제 실력이 그리 뛰어나지 않다는 사실을 알고 있었으나, 부모님의 전폭적인 신뢰를 받는 기분이 무척 떨리고 설레, 차츰 그 기대에 맞춰 저를 변화시키기 위해 노력했습니다. 제가 대단한 실력자가 아니라는 사실을 밝히는 것보다, 부모님이 모르는 사이 저를 재빨리 성장시켜 그에 부응해 가는 편이 훨씬 좋다고 생각했기 때문입니다.</p>');
		CKEDITOR.instances.editor3.setData('<p>어린 시절 제가 부모님으로부터 가장 많이 들었던 말은 ‘너는 대체 어디서 왔니?’와 ‘어떻게 생각을 다 했니?’라는 것이었습니다. 1남 2녀 중 막내로 태어났는데, 아버지와 어머니 어느 한쪽도 닮지 않아서 부모님께서 당황한 적이 많았다고 하셨습니다. 아버지를 그대로 닮은 오빠와 엄마를 그대로 닮은 언니, 성격은 각각 반대로 닮아서 예측 가능한 행동을 했는데 저는 아주 달랐습니다. 엉뚱한 질문을 하여 부모님이 말문이 막히는 경우도 많으셨고, 재기발랄한 행동으로 가족들을 웃기기도 하였습니다. 그래서 부모님은 어린 시절의 저를 보고 ‘연예인이 되려나?’ 하셨답니다.</p>');
		CKEDITOR.instances.editor4.setData('<p>이야기를 잘 들어주는 것에서 그치지 않고, 친구들의 고민을 들으면, 그것이 제 일이라고 생각하면서 제 나름대로의 해결책을 생각해서 조언을 해주곤 했습니다. 친구에게 도움이 되기를 바라는 마음에서 그렇게 하다 보니, 친구들이 때로는 농담 삼아 언니라고 부를 때도 있습니다. 제가 조언해준 것들이 친구에게 실제로 도움이 된 경우도 있어서, 저는 친구들의 고민상담사가 되는 경우가 많습니다.</p>');
		CKEDITOR.instances.editor5.setData('<p>졸업을 앞두고 서울시 행정인턴을 지원하여 주민자치센터(동사무소)에서 1년 동안 사무보조로 근무하였습니다. 기초생활 수급자를 관리하는 일이 주된 업무였고, 주민센터를 찾는 민원인들을 응대하는 업무도 하였습니다. 수급자들의 재산 조사, 관련 서류의 보관 및 정리, 찾아가는 복지서비스 홍보 등 다양한 업무를 경험하면서 사회복지에 대한 관심을 갖게 되었습니다. 정작 고아원에서취약계층으로 자랐지만, 막연히 커서 사람들을 돕겠다는 생각만 있었을 뿐 복지 같은 구체적인 영역에 관심을 갖지 못했던 자신을 반성했습니다. 인턴생활을 하는 그 1년이라는 시간 동안 저는 사회복지사2급 자격증도 취득하였습니다</p>');
		CKEDITOR.instances.editor6.setData('<p>제가 귀사와 함께 일할 수 있다면, 귀사의 매력을 아직 소비자의 관점으로 파악하고 있는 측면이 대부분인 저의 시야를 전환시키고, 판매 촉진을 추구하는 실무자의 입장에서 저의 역량을 진화시켜 나가기 위한 노력에 매진하겠습니다. 그러면서도 제가 여동생과 함께 귀사의 매장을 방문해 더없는 매력을 느꼈던 제 스스로의 출발점을 잊지 않고, 판매자의 노하우와 소비자의 니즈를 더불어 의식하는 종합적인 측면에서 저의 마케팅 업무를 수행할 수 있도록 항상 경계를 게을리 하지 않고자 노력하겠습니다.</p>');
		CKEDITOR.instances.editor7.setData('<p>하지만 아버지는 신체 건강하고 아직 왕성하게 활동할 수 있는 나이에 쉬는 것이 바람직하지 않다고 생각하셨고 임금수준과는 관계없이 어떤 일이든 하고 싶어하셨습니다. 그리고 얼마 후 아버지께서는 구청에서 시간제로 근무하는 주차단속 일을 구하셨습니다. 추운 날씨에 밖에서 고생하시는 것이 염려되어 가족들이 말렸지만, 일을 하시는 아버지는 무척 행복하다고 하셨습니다.</p>');
		CKEDITOR.instances.editor8.setData('<p>처음에는 반 아이들끼리만 앞다투어 보면서 웃고 떠들었던 것이, 차차 다른 반 아이들이나 선생님들의 관심을 받으면서, 학교에는 2주마다 바뀌는 학급 신문을 만드는 붐이 소소하게 일기도 했습니다. 그러나 구관이 명관이라고, 저의 학교 안팎에 걸친 정보 수집 솜씨나, 입담 좋은 글재주를 따라갈 사람은 별로 없었습니다. 저는 단순히 환경 미화의 하나로 시작했던 제 작품이, 학교 조회 시간에 언급될 정도로 화제가 된다는 것이 그저 신이 나, 많은 아이가 재미있게 보고 즐길 만한 기사의 수집과 원고 작성에 노력했습니다. 자기들의 사소한 이야기나 행동, 소문이 근사한 기사로 작성되어 교실 뒤편에 걸리는 것을 재미있어한 아이들은, 저의 취재에도 적극적으로 응해주며 많은 이야깃거리를 제공하곤 했습니다. 단순한 놀이처럼 시작했던 신문이, 온 학교의 아이들을 독자층으로 사로잡는 산물로 거듭났던 것입니다.</p>');
		CKEDITOR.instances.editor9.setData('<p>중학생이 되면서 방황하며 PC방에서 살다시피 하고 있을 때, 바로 그 친척 형이 저를 지켜봐 주었습니다. 많은 말을 하는 성격은 아니었지만, PC방 대신에 형의 방에서 컴퓨터를 하게 해주었고, 형이 보던 대학생 프로그래밍 언어 책을 뒤적이면서 컴퓨터에 재미를 붙이게 되었습니다. 친척 형을 통해 정서적으로도 안정을 얻어 힘든 사춘기도 잘 보낼 수 있었고, 프로그래밍에 관심을 가지면서 장래희망이 뚜렷해졌습니다.</p>');
		CKEDITOR.instances.editor10.setData('<p>건강하고 맛있는 빵을 만들겠다는 허영인 회장님의 인터뷰 기사를 본 적이 있습니다. 가장 인상에 남은 것은 현장경영과 품질경영이었습니다. 이러한 경영철학이 있었기에 현재의 샤니가 있다는 생각을 하게 되었습니다. 최고경영자는 경영마인드만으로는 부족하다. 기술 마인드, 즉 엔지니어 감각이 있어야 한다는 허 회장님의 말씀처럼 저는 현장을 잘 이해하는 직원이 될 것입니다.</p>');
		CKEDITOR.instances.editor11.setData('<p>귀사는 Sales out-Sourcing 분야에서 식품의 주요상권 영업 업무를 대행하는 업체로서 큰 성과를 이루어냈습니다. 공격적인 마케팅과 영업 전략으로 기존의 영업 패턴을 뒤흔들어 빠르게 성장해가고 있는 귀사는 제가 몸담아 일을 배우고 성장하면서 회사가 이 분야에서 1위 기업으로 성장하는 과정을 함께 만들어나가고 싶은 기업입니다. 전공을 통해 배운 지식과 경험을 바탕으로, 제가 가진 책임감과 활달한 성격으로 만들어온 인간관계, 그리고 두려움 없는 도전정신으로 귀사가 업계의 핵심기업으로 성장하는 데 기여하고자 지원하게 되었습니다.</p>');
		CKEDITOR.instances.editor12.setData('<p>축제가 끝나고 47만3천 원이라는 거금이 모였고, 이 돈을 축구부 담당 체육 선생님을 통해 불우이웃돕기 성금으로 내달라고 전달해 드렸습니다. 연말에 학교이름으로 내는 불우이웃성금 모금에 보탤 거로 생각했는데, 체육 선생님께서 특별히 우리 학교 축구부 이름으로 기부해주셔서 축구부 전원이 다시 한 번 즐거운 추억을 되살릴 수 있었습니다.</p>');
		CKEDITOR.instances.editor13.setData('<p>가기 전에 한국을 알리기 위한 전통놀이와 의상 등을 준비해 가서 현지 주민들의 관심도 많이 이끌어낼 수 있었습니다. 한국을 잘 모르는 나라에 한국을 알리러 간 것이었기 때문에 저의 사소한 행동이 국가 전체의 이미지를 좌우할 수 있다는 생각으로 외국인들 앞에서는 항상 행동을 조심했습니다. 활동을 마치고 귀국할 때 현지 아이들이 직접 적어준 카드와 선물을 받아 들었을 때, 정말 좋은 일을 했구나, 하는 보람을 느낄 수 있었습니다.</p>');
		CKEDITOR.instances.editor14.setData('<p>인생관 신념 / 그러나 동생으로 인해 저 또한 귀사의 점포에 자주 방문하고, 함께 물건을 사서 돌아올 때면 여동생이 하루 종일 들떠서 저한테 늘어놓는 즐거운 수다를 들으며, ‘제가 관심 있지 않더라도 인기를 끄는 분야는 저마다 그만한 이유가 있다’는 사실을 알게 되었습니다. 그리고 제가 너무 본인의 흥미 본위에 따른 편협한 취향을 가지고 살아온 것이 아닌가 하는 반성으로, 여동생과 함께 정기적으로 방문하며 진지하게 살펴보기 시작한 귀사의 상품이나 마케팅 전략은, 제가 지금껏 관심 가지지 못했던 사실을 뉘우치게 할 정도로 충실하고 다방면에 걸친 열정이 대단하게 느껴질 정도로 대단한 저력을 가지고 있었습니다.</p>');
		CKEDITOR.instances.editor15.setData('<p>좌우명, 생활신조 / 그 인물 하나하나가 현실에 대처하는 데 큰 지혜를 줍니다. 많은 사람이 나쁜 인물로 평가하고 있지만, 저는 조조라는 인물에게 매력을 많이 느꼈습니다. 항상 큰 뜻을 가지고 공과 사를 철저히 구분하여 행동하는 것을 보면 현실에서도 보고 배울 점이 참 많은 인물이라고 생각합니다. 사람들은 존경하는 인물이나 생활신조를 이야기하곤 하는데, 저는 제 인생의 지침서로 주저 없이 삼국지를 꼽습니다.</p>');
		CKEDITOR.instances.editor16.setData('<p>특이사항 / 어린 시절, 제가 이해하기 힘들었던 누나의 취미는 좁은 방 안에 복닥복닥 붙여놓은 스티커나 메모지, 온갖 디자인의 팬시용품이었습니다. 다분히 실용적인 취향의 물건에만 투자했던 저와 다르게, 누나는 쥐꼬리만한 용돈을 아끼거나 알바를 하는 한이 있더라도 그렇게 아기자기한 물건을 사들이는데 열중하는 성격이었던 것입니다. 그와 같은 미적 센스를 이해하기 힘들었던 남동생인 저는, 다 거기서 거기인 것 같은 누나의 물건을 가지고 트집을 잡거나 놀리는 등의 유치한 장난을 하기도 했습니다. 덕분에 누나와 투닥거리기도 많이 했지만, 여전히 ‘여자들은 저런 것을 좋아하다니 이상해’ 같은 생각이 저의 머릿속을 지배하곤 했습니다.</p>');
	});	
</script>