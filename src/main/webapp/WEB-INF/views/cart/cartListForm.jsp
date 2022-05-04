<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >장바구니</div>
		<div class="header3" >&nbsp;</div>
	</div>
	
	<!-- cartList -->
	<c:forEach var="c" items="${cList}" varStatus="status">
	<div class="bold flex1">
		<div>${ pList[status.index].productName}</div>
		<a href="cartDelete?cartNo=${c.cartNo }">X</a>
	</div>
	<div class="storeList">
		<div class="storeImg smallIng">
			
		</div>
		<div class="storeContent cartContent">
			<span class="p-detail-price">가격 : ${ pList[status.index].productPrice}</span><br>
			<span class="amt">총 : ${c.cartAmt } 원</span>
		</div>
		<p class="cart-amt flex" data-price="${ pList[status.index].productPrice}" data-amt="${c.cartAmt }">
			<span class="minus orderMinus">-</span>
			<span id="cnt" data-num="${c.cartCnt }"> ${c.cartCnt }개</span>
			<span class="add orderAdd">+</span>
		</p>
	</div>
	
	</c:forEach>
	
		<div class="p-detailTd flex1">
			<span class="p-detailTh">결제 예정금액</span>
			<span class="p-detailTh">	${totalAmt } 원	</span>
		</div>
	<div class="detail-footer">
		<div class="detail-footer-cartBtn" id="orderBtn">
			<span>&emsp;&emsp;&emsp;</span>
			<span class="cartCnt" data-totalCnt="${totalCnt }">${totalCnt } 개 담기</span>
			<span data-totalAmt=${ totalAmt }>${totalAmt } 원</span>
		</div>
	</div>
	<form action="odrForm" id="cartForm">
		<input type="hidden" id="cListCnt" value="${cListCnt }"/>
		<input type="hidden" id="totalCnt" value="${totalCnt }">
		<input type="hidden" id="totalAmt" name="totalAmt" value="${ totalAmt }">
	</form>
</article>
