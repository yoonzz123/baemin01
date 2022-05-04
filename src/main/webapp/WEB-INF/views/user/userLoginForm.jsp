<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >로그인</div>
		<div class="header3" >&nbsp;</div>
	</div>
	<div class="loginFormWrap">
	<form id="loginForm" action="userLoginProcess"
		method="post">
		<div class="loginFormIn">
		<div class="loginFormIn1">
		<input id="user_id" class="id" placeholder="아이디 또는 이메일" name="user_id"  />
		<input type="password" id="user_pass" class="pass" placeholder="비밀번호" name="user_pass" />
		<input id="login" name="login" type="button" value="로그인">
		</div>
		</div>	
	</form>
	<div class="companyLogin">
	<a href="companyLoginForm">사장로그인</a> | 
	<a href="companyInsertForm">사장 회원가입</a>
	</div>
	<br><br><br>
	<a href="userFind?userCheck=true">아이디 찾기</a> | 
	<a href="userFind?userCheck=false">비밀번호 찾기</a>
	<br><br><br><br><br> 

	<div>혹시, 배달의민족이 처음이신가요? 
		<a href="userJoinForm">회원가입</a>
		<div class="gongback"> </div>
	</div>
	
	<a href="javascript:kakaoLogin();"><img src="./resources/img/1.jpg"></a>
	<div class="gongback"> </div>
	</div>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>  
        window.Kakao.init("fd399eb2f74f9d484b13aaf902799ffe");

        function kakaoLogin(){
            window.Kakao.Auth.login({
                scope:'profile_nickname, account_email, gender',
                success: function(authObj){
                    console.log(authObj);
                    window.Kakao.API.request({
                        url:"/v2/uesr/me",
                        success: res=>{
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                }
            });
        }
    </script>
</article>