<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="cartForm">
<div id="cartBtnForm">
	&nbsp;<img id=cartImg src="resources/img/icon/cart.svg" />
	<c:if test="${sessionScope.cartCnt > 0}">
	<div id="cartNum">${sessionScope.cartCnt }</div>
	</c:if>
	<input type="hidden" value="${sessionScope.isLogin }" />
</div>
</a>