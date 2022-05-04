<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >${store.storeName }</div>
		<c:if test="${isCompany }">
			<div class="header3" ><a href="#">수정</a></div>
		</c:if>
		<c:if test="${not isCompany }">
			<div class="header3" ><a href="#"><img class="searchImg" src="resources/img/icon/store/share.png"></a></div>
		</c:if>
	</div>
	
	<div>
		<div class="mainImg">
			<img src="#">
		</div>
		<div class="storeHeader">
			<div>
				<h3 class="storeName">${p.productName }</h3>
			</div>
			<div class="storeLink flex">
				<div>
					${p.productContent }
				</div>
			</div>
		</div>
		<!--  end Box -->
		
		<!-- p-detila start -->
		<div class="p-detail-box">
			<div class="p-detailTh">가격</div>	
			<div class="p-detailTd flex1">
				<p><input type="radio" name="mainOption" value="" checked>&ensp; ${p.productContent }</p>
				<span> ${p.productPrice } 원</span> 
			</div>
		</div>
		<!-- p-detila end -->
		
	
		<div class="flex1 p-detailTd">
			<span class="p-detailTh">수량</span>
			<p class="flex p-detail-amt" data-price="${p.productPrice }">
				<span class="cartCntMinus minus">-</span>
				<span id="cnt" data-num="1" > 1개</span>
				<span class="cartCntAdd add">+</span>
			</p>
		</div>
	</div>
	<div class="detail-footer">
		<div> 배달 최소주문금액 15000원</div>
		<div class="flex detail-footer-cartBtn"  id="cartBtn" >
			<span>&emsp;&emsp;&emsp;</span>
			<span class="cartCnt" data-totalCnt="1">1 개 담기</span>
			<span data-totalAmt=${ p.productPrice }>${p.productPrice } 원</span>
		</div>

	</div>
	<div id="cart-notice" class="cart-notice">
		<p>장바구니에 메뉴를 추가했습니다.</p>
	</div>
	<input type="hidden" id="pStoreNo" value="${storeNo }">
	<input type="hidden" id="cStoreNo" value="${sessionScope.storeNo }">
	<input type="hidden" id="isLogin" name="isLogin" value="${sessionScope.isLogin }">
	<input type="hidden" id="productNo" value="${productNo }">
	<input type="hidden" id="totalCnt" value="1">
	<input type="hidden" id="totalAmt" value="${ p.productPrice }">
	
</article>