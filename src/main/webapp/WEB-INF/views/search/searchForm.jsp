<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >
			<div class="search">
			<form id="searchForm">
				<img class="searchImg" src="resources/img/icon/search2.png">
				<input name="searchKey" type="text" placeholder="검색어를 입력해주세요"></input>
			</form>
			 </div>
		</div>
	</div>
	
	<div class="recentSearches"></div>
	
	<div class="popularSearch"></div>
	
	<div class="searchList"></div>
	
</article>