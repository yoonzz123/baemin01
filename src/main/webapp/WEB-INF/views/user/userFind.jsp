<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<c:if test="${userCheck}">
		<div class="main_address header2" >아이디 찾기</div>
		</c:if>
		<c:if test="${not userCheck}">
		<div class="main_address header2" >비밀번호 찾기</div>
		</c:if>
		<div class="header3" >&nbsp;</div>
	</div>
	
	<form action="userCheckProcess">
	<div class="userCheckWrap">
		<c:if test="${userCheck}">
		<div class="gongback">
		이메일 : <input type=text id="user_email" name=user_email><br>
		</div>
		이름 : <input type=text id="user_name" name=user_name><br>
		</c:if>
	</div>
		<c:if test="${not userCheck}">
		<div class="userCheckWrap">
		이메일 : <input type=text id="user_email" name=user_email><br>
		이름: <input type="text" id="user_name" name=user_name><br/>
		아이디 : <input type=text id="user_id" name=user_id><br>
		</div>
		</c:if>
		
	</form>
	<c:if test="${userCheck}">
	<div class="userCheckWrap">
	<div class="userCheckButton">
	<input type="button" id="userFindId" value="아이디 찾기"/>
	</div>
	<div class="gongback"> </div>
	<div class="dashed3"> </div>
	</div>
	</c:if>
	<c:if test="${not userCheck}">
	<div class="userCheckWrap">
	<div class="userCheckButton">
	<input type="button" id="userFindPass" value="비밀빈호 찾기"/>
	</div>
	</div>
	<div class="gongback"> </div>
	<div class="dashed3"> </div>
	</c:if>
</article>