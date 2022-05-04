<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="resources/js/company.js"></script>
<article>
	<form id="companydeleteProcess">
		<input type="hidden" name="comId" value="${sessionScope.comId}">
		
		<input type="submit" value="삭제하기" />
		<a href="userLoginForm">로그인화면</a>
	</form>
</article>