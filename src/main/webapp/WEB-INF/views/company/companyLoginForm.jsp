<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
	</div>
	<div class="companyLoginWrap">
	<h1>사장님 로그인</h1>
	<div class="dashed1"> </div>
	<div class="gongback"> </div>
	<form action="companyLoginProcess">
		<input type="text" id="comId" class="comId" placeholder="아이디" name="comId" />
		<input type="password" id="pass" class="pass" placeholder="비밀번호" name="comPass" />
		<input type="submit" value="로그인">	
	</form>
	<div class="gongback"> </div>
	<a href="userLoginForm">회원로그인</a>
	<div class="gongback"> </div>
	<div class="dashed2"> </div>
	</div>
	
	
</article>