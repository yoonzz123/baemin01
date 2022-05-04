<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="resources/css/join.css" />
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >회원가입</div>
		<div class="header3" >&nbsp;</div>
	</div>
	
	<h1 class="title">어서오세요<br>회원가입을 해주세요.</h1>
	
	<form class="joinForm" action="userJoinProcess" method="POST">
		<div class="id">아&nbsp;이&nbsp;디 : 
			<input type="text"id="user_id" name="user_id" 
				placeholder="아이디를 입력해주세요." data-idCheck="0">
			<input type="button" value="중복확인" id="userIdOverlap"/>
			<span id="user_id_ok">사용 가능한 아이디 입니다.</span>
			<span id="user_id_already">누군가 사용중인 아이디 입니다.</span>
		</div>
		<br/>
		<div>
		비밀번호 : <input type="text" id="user_pass" name="user_pass" 
			placeholder="비밀번호를 입력해주세요."></div><br/>
		<div>
		이&nbsp;&nbsp;름 : &nbsp;<input type="text" name="user_name">
		</div><br/>
		<div>
		이메일 : &nbsp;<input type="text" id="user_email" name="user_email">
		</div><br/>
		<div>
		닉네임 : &nbsp;<input type="text" name="user_nick">
		</div><br/>
		휴대전화 : <input type="text" name="user_phone"><br/><br/>
		성인확인 :
		<div>
		성인임<input type="radio" name="user_isadult" value="1">
		성인아님<input type="radio" name="user_isadult" value="2"><br/>&nbsp;
		</div>
		
		약관동의 :
		<div>
		약관동의<input type="radio" name="user_isclause" value="1">
		동의안함<input type="radio" name="user_isclause" value="2"><br/>&nbsp;
		</div>
		<input type="submit" id="join" name="join" value="가입하기">
	</form>
	
</article>