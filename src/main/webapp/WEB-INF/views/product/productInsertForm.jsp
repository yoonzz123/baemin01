<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >상품 등록</div>
		<div class="header3" >&nbsp;</div>
	</div>
	
	<form action="productInsertProcess" method="post">
	<table class="storeTable">
		<tr>
			<td class="storeTd1">	상품명</td>
			<td><input type="text" name="productName"></td>
		</tr>
		<tr>
			<td class="storeTd1">	가격</td>
			<td><input type="text" name="productPrice"></td>
		</tr>
		<tr>
			<td class="storeTd1">	상세 설명</td>
			<td><input type="text" name="productContent"></td>
		</tr>
		<tr>
			<td class="storeTd1">	대표메뉴 설정</td>
			<td>
				<input type="radio" name="productIsPopular" value="1"> 대표 메뉴
				<input type="radio" name="productIsPopular" value="0" checked> 일반 메뉴
			</td>
		</tr>		
		<tr>
			<td class="storeTd1">	
				&nbsp;
			</td>
			<td>
				<button type="submit">상품 등록</button>
				<input type="hidden" name="storeNo" value="${storeNo}">
			</td>
		</tr>
	</table>
	</form>
	
</article>