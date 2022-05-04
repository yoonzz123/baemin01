<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >정보수정</div>
		<div class="header3" >&nbsp;</div>
	</div>
	<form id="updateForm" action="updateProcess" method="post">
		<table class="storeTable">
			<tr>
				<td class="storeTd1">아이디</td>
				<td><input type="text" id="user_id" name="user_id" value="${user.user_id }" readonly/></td>
			</tr>
			<tr>
				<td class="storeTd1">이메일</td>
				<td><input type="text" id="user_email" name="user_email" value="${user.user_email }" readonly/></td>
			</tr>
			<tr>
				<td class="storeTd1">현제 비밀번호</td>
				<td>
					<input type="password" id="user_pass" name="user_pass" />
					<button type="button" id="passCheckBtn" data-passCheck="0">비밀번호 체크</button>
				</td>
			</tr>
			<tr>
				<td class="storeTd1">신규 비밀번호</td>
				<td>
					<input type="password" id="user_pass1" name="user_pass1" />&emsp;
				</td>
			</tr>
			<tr>
				<td class="storeTd1">비밀번호 확인</td>
				<td>
					<input type="password" id="user_pass2" name="user_pass2" />&emsp;
			
				</td>
			</tr>
			<tr>
				<td class="storeTd1">우편번호</td>
				<td>
					<input type="text" id="addr1" name="addr1" readonly />
					<button type="button" id="userAddrBtn">주소 찾기</button>
				</td>
			</tr>
			<tr>
				<td class="storeTd1">주소</td>
				<td>
					<input type="text" id="addr2" name="addr2" size="40" readonly/><br>
					<input type="text" id="addr3" name="addr3" size="40" />
				</td>
			</tr>
			<tr>
				<td colspan="2" class="storeTd1">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="button" id="update" name="update" value="수정하기" />&nbsp;
					<input type="button" id="delete" name="delete" value="삭제하기" />
				</td>
			</tr>
		</table>
	</form>
</article>