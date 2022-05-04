<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src=
"https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/company.js"></script>
<article>
<div class="companyUpdateForm">
	<form action="companyUpdateProcess" id="companyUpdateForm">
	
	<h1>사장님 정보수정</h1>
	<div class="companygongback"> </div>
	<div class="solid"></div>
	<div class="companygongback"> </div>
	<div class="companygongback">
		아이디 : <input type="text" name="comId" id="comId" value="${sessionScope.comId}" readonly />
	</div>
	<div class="companygongback">
		비밀번호 : <input type="text" name="comPass" id="comPass">
	</div>
	<div class="companygongback" >
		비밀번호 확인:<input type="text" name="compass1" id="comPass1">
	</div>
	<div class="companygongback">
		대표자명 : <input type="text" name="comCeoName" id="comCeoName">
	</div>
	<div class="companygongback">
		회사명 : <input type="text" name="comName" id="comName">
	</div>
	<div class="companygongback">
		휴대폰 번호: <input type="text" name="comPhone1" size="4" maxlength="3">- <input type="text" name="comPhone2" id="comPhone2" size="4" maxlength="4">-<input type="text" name="comPhone3" id="comPhone3" size="4" maxlength="4">
	</div>
	<div class="companygongback">
		지번 : <input type="text" id="addr1"name="comAddr1" id="comAddr1">
	</div>
	<div class="companygongback">
		상세주소 : <input type="text" id="addr2" name="comAddr2" id="comAddr2">
	</div>
	<div class="companygongback">
		상세주소1: <input type="text" id="addr3" name="comAddr3">
	</div>
	<div class="companygongback">
		 <input type="button" id="storeAddrBtn" value="우편번호찾기"/>
	</div>
	<div class="companygongback">
		라이센스 : <input type="text" name="comLicense"  id="comLicense" placeholder="사업자번호를입력해주세요">
	</div>
	<div>
		이메일 : <input type="text" name="comEmail" id="comEmail">@<input type="text" id="domain" name="domain" id="domain">
		<select name="selectDomain" id="selectDomain">
					<option>직접입력</option>
					<option>네이버</option>
					<option>다음</option>
					<option>한메일</option>
					<option>구글</option>										
				</select>
	</div>
	<div>
	<div class="companygongback"> </div>
			<input type="reset" value="다시쓰기"/>
			<input type="submit" value="수정하기" />
	</div>	
	<div class="companygongback"> </div>
	<a href="companyDeleteForm">사장님아이디삭제</a>
	<div class="companygongback"> </div>
	<div class="solid"></div>
	</form>
	</div>
</article>