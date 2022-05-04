\<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?
		ncpClientId=27hxsduogs&submodules=geocoder"></script>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >${store.storeName }</div>
		<c:if test="${not isCompany }">
			<div class="header3" ><a href="#"><img class="searchImg" src="resources/img/icon/search2.png"></a></div>
		</c:if>
	</div>
	
	<div>
		<div class="mainImg">
			<img src="./resources/upload/${store.storeImg}">
		</div>
		<div class="storeHeader">
			<div>
				<h1 class="storeName">${store.storeName }</h1>
				<div class="storeScope">${store.storeScope }</div>
				<div class="storeReview">
					<span class="userReview">최근리뷰 0</span> | 
					<span class="comReview">&nbsp;최근사장님댓글 0</span>
				</div>
			</div>
			<div class="storeLink flex">
				<div><img src="resources/img/icon/store/phone.png"> 전화</div>|
				<div id="wishBtn" data-storeno="${store.storeNo}"> <img src="resources/img/icon/store/heart.png"> 찜</div>|
				<div> <img src="resources/img/icon/store/share.png"> 공유</div>
			</div>
		</div>
		<div class="deliSelect flex">
			<div class="deliSelect1">배달주문</div>
			<div class="deliSelect2">포장/방문주문</div>
		</div>
		<table class="storeTable">
			<tr>
				<td class="storeTd1">최소주문금액</td>
				<td>8000원</td>
			</tr>
			<tr>
				<td class="storeTd1">결제 방법</td>
				<td>바로결제</td>
			</tr>
			<tr>
				<td class="storeTd1">배달시간</td>
				<td>47분 ~ 60분 소요 예상</td>
			</tr>
			<tr>
				<td class="storeTd1">배달팁</td>
				<td>1,500원 ~ 2,000원</td>
			</tr>
		</table>
	</div>
	
	<div class="space">&nbsp;</div>
	<div class="sotreContent flex">
		<div>메뉴</div>
		<div><a href="storeDetailInfo?storeNo=${storeNo }">정보</a></div>
		<div><a href="#">리뷰</a></div>
	</div>
	
	<div>
		<p class="평균별점"></p>
		<form class="reviewForm">
			<input type="hidden" name="product_no" value="${store.storeNo}">
		    <fieldset>
		        <label for="rate1">⭐1</label><input type="radio" name="r_scope" value="1" id="rate1">
		        <label for="rate2">⭐2</label><input type="radio" name="r_scope" value="2" id="rate2">
		        <label for="rate3">⭐3</label><input type="radio" name="r_scope" value="3" id="rate3">
		        <label for="rate4">⭐4</label><input type="radio" name="r_scope" value="4" id="rate4">
		        <label for="rate5">⭐5</label><input type="radio" name="r_scope" value="5" id="rate5">
		    </fieldset>
		    <textarea rows="5" cols="50" name="r_content"></textarea>
			<input type="submit" value="리뷰쓰기">
		</form>
	</div>	

	<div class="reviewList">
		
	</div>
	
	<jsp:include page="../../template/cartBtnForm.jsp" />
		
</article>