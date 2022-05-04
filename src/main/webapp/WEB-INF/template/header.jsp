<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<div id="header" class="header_info"></div>
	<div class="main-a flex1">
		<a href="home"><img class="wrap-logo" src="resources/img/baemin-logo.png"></a>
		<c:if test="${not sessionScope.isLogin }">
		<div>
			<a href="userJoinForm">회원가입</a>
			<a href="userLoginForm">로그인</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.isLogin }">
		<div>
			<span>안녕하세요!! ${sessionScope.user_id }님</span>
			<a href="userLogoutProcess">로그아웃</a>
			<a href="userUpdateForm?user_id=${ sessionScope.user_id }">정보수정</a>
		</div>
		</c:if>
	</div>
</header>