<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/company.js"></script>
<script src=
"https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<article>

<form action="comInsertProcess" id="companyInsertProcess" method="post">
	<div>
		아이디 : <input type="text" id ="comId"name="comId" placeholder="아이디를입력해주세요">
	</div>
	<div>
		비밀번호 : <input type="text" id="comPass" name="comPass" placeholder="비밀번호를입력해주세요">
	</div>
	<div>
		대표자명 : <input type="text" id="comName" name="comName" placeholder="대표자명을입력해주세요">
	</div>
	<div>
		회사명 : <input type="text" id="comCeoName" name="comCeoName" placeholder="회사명을입력해주세요">
	</div>
	<div>
		휴대폰 번호: <input type="text" id="comPhone1" name="comPhone1" size="4" maxlength="3">- <input type="text" id="comPhone2" name="comPhone2" size="4" maxlength="4">-<input type="text" id="comPhone3" name="comPhone3" size="4" maxlength="4">
	</div>
	<div>
		지번 : <input type="text" id="addr1"name="comAddr1">
	</div>
	<div>
		상세주소 : <input type="text" id="addr2" name="comAddr2">
	</div>
	<div>
		상세주소1: <input type="text" id="addr3" name="comAddr3">
	</div>
	<div>
		 <input type="button" id="storeAddrBtn" value="우편번호찾기"/>
	</div>
	<div>
		라이센스 : <input type="text" id="comLicense" name="comLicense" placeholder="사업자번호를입력해주세요">
	</div>
	<div>
		이메일 : <input type="text" id="comEmail" name="comEmail">@<input type="text" id="domain" name="domain">
		<select name="selectDomain" id="selectDomain">
					<option>직접입력</option>
					<option>네이버</option>
					<option>다음</option>
					<option>한메일</option>
					<option>구글</option>										
				</select>
				<input type="button" id="emailCheck" value="이메일확인">
	</div>
	<div>
		이메일 확인 : <input type="text" id="emailCheck2" placeholder="인증번호를입력해주세요">
		<input type="button" id="emailCheck3" value="이메일 인증확인">
	</div>
	<div>
			<input type="reset" value="다시쓰기"/>
			<input type="submit" value="가입하기" />
	</div>	
</form>

</article>