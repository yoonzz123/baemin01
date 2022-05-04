<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<h1>사장님 메인화면</h1>
	
	<h3>내 가게</h3>
	<a href="companyUpdateForm">사장님 정보수정</a>
	<!-- storeList start -->
	<c:forEach var="s" items="${sList }">
	
	<div class="storeList">
		
		<div class="storeUpdate"><a href="storeUpdateForm?storeNo=${s.storeNo}">수정</a></div>
		
		<div class="storeImg ">
			<c:if test="${not empty s.storeImg }">
			<img class="radios1" src="./resources/upload/${s.storeImg}">
			</c:if>
			<c:if test="${empty s.storeImg }">
				<div class="storelogoMsg">이미지를<br> 등록해주세요</div>
			</c:if>
		</div>
		
		<div class="storeContent">
			<a href="storeDetailForm?storeNo=${s.storeNo}">
			<div class="storeName-min">${s.storeName }</div>
			<div class="storeScope">
				<span class="scopeSpan">${s.storeScope }</span>
			</div>
			<div class="deliveryDiv">
				<span class="deliverySpan">최소주문 6000원</span>
				배달팁 
				<span class="deliverySpan">0원 ~ 4000원</span>
			</div>
			<div class="deliveryTime">
				<img class="clockImg" src="./resources/img/icon/clock.png">
				<span> 35~40분 </span>
			</div>
			</a>
		</div>

	</div>

	
	</c:forEach>
</article>