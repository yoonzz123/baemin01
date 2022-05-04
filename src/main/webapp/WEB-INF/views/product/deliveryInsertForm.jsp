<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/delivery.js"></script>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >주문 지역 등록</div>
		<div class="header3" >&nbsp;</div>
	</div>
	
	<form action="deliveryInsertProcess" id="deliveryInsertProcess" method="post">
		지역 : <input type="text" id="deliArea" name="deliArea"><br>
		가격 : <input type="text" id="deliPrice" name="deliPrice"><br>
		<button type="submit">상품 등록</button>	
		<input type="hidden" name="storeNo" value="${storeNo}">
	</form>
	
</article>