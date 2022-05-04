<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >
			<c:if test="${sList[0].mainCat eq 1}">돈까스·회·일식</c:if>
			<c:if test="${sList[0].mainCat eq 2}">중식</c:if>
			<c:if test="${sList[0].mainCat eq 3}">치킨</c:if>
			<c:if test="${sList[0].mainCat eq 4}">백반·죽·국수</c:if>
			<c:if test="${sList[0].mainCat eq 5}">카페·디저트</c:if>
			<c:if test="${sList[0].mainCat eq 6}">분식</c:if>
			<c:if test="${sList[0].mainCat eq 7}">찜·탕·찌개</c:if>
			<c:if test="${sList[0].mainCat eq 8}">피자</c:if>
			<c:if test="${sList[0].mainCat eq 9}">양식</c:if>
			<c:if test="${sList[0].mainCat eq 10}">고기·구이</c:if>
			<c:if test="${sList[0].mainCat eq 11}">족발·보쌈</c:if>
			<c:if test="${sList[0].mainCat eq 12}">아시안</c:if>
			<c:if test="${sList[0].mainCat eq 13}">패스트푸드</c:if>
			<c:if test="${sList[0].mainCat eq 14}">야식</c:if>
			<c:if test="${sList[0].mainCat eq 15}">도시락</c:if>
		</div>
		<div class="header3" >&nbsp;</div>
	</div>
	<div class="keywordList">
		<a href="#">배달 빠른 순</a> | 
		<a href="#">배달팁 낮은 순</a> | 
		<a href="#">기본순</a> | 
		<a href="#">주문 많은 순</a> | 
		<a href="#">별점 높은 순</a> | 
		<a href="#">가까운 순</a> | 
		<a href="#" id="getWishListBtn" data-cat="${ sList[0].mainCat }">찜 많은 순</a> | 
		<a href="#">최소주문금&nabla;</a> | 
		<a href="#">배달 빠른 순</a> | 
		<a href="#">배달 빠른 순</a> | 
		<a href="#">&nbsp; 기타</a>
	</div>
	<div>
		&nbsp;
	</div>
	
	<!-- storeList start -->
	<div class="storeListBox">
	<c:forEach var="s" items="${sList }">
	<a href="storeDetailForm?storeNo=${s.storeNo }">
	<div class="storeList">
		<c:if test="${not empty s.storeImg }">
		<div class="storeImg adios1"><img class="radios1" src="./resources/upload/${s.storeImg }"></div>
		</c:if>
		<div class="storeContent">
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
		</div>
	</div>
	</a>
	
	</c:forEach>
	</div>
	<!-- storeList end -->
	<c:if test="${sessionScope.cartCnt > 0}">
	<jsp:include page="../../template/cartBtnForm.jsp" />
	</c:if>
</article>