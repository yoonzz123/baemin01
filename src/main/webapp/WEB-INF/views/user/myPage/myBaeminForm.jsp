<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >My배민</div>
		<div class="header3" >&nbsp;</div>
	</div>
	
	<div class="space"></div>
	<c:if test="${not sessionScope.isLogin}">
	<div class="loginInfo flex1">
		<div class="storeImg flex">
			<img src="resources/img/icon/myPage/profile.png">
		</div>
		<a href="userLoginForm" class="loginText">로그인해주세요</a>
		<div>
			<img src="resources/img/icon/myPage/insert.png" class="insertImg">
		</div>
	</div>
	</c:if>
	
	<c:if test="${sessionScope.isLogin}">
	<div class="loginInfo flex1">
		<div class="storeImg flex">
			<img src="resources/img/icon/myPage/profile.png">
		</div>
		<a href="userUpdateForm?user_id=${ sessionScope.user_id }" class="loginText">고마운분, ${sessionScope.user_id }</a>
		<div>
			<img src="resources/img/icon/myPage/insert.png" class="insertImg">
		</div>
	</div>
	
	<div class="mypage-thank flex1">
		<img src="resources/img/icon/myPage/thank.png">
		<span>등급별 혜택</span>
	</div>
	</c:if>
	
	<br>
	<div class="myPage-category flex-wrap">
		<a href="userPointForm"><img src="resources/img/icon/myPage/point.png"><br>포인트</a>
		<a href="userCouponForm"><img src="resources/img/icon/myPage/coupon.png"><br>쿠폰함</a>
		<a href="#"><img src="resources/img/icon/myPage/gift.png"><br>선물함</a>
		<a href="userWishForm"><img src="resources/img/icon/myPage/wish.png"><br>찜</a>
		<a href="odrListForm"><img src="resources/img/icon/myPage/orderList.png"><br>주문내역</a>
		<a href="userReviewForm"><img src="resources/img/icon/myPage/review.png"><br>리뷰관리</a>
	</div>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
</article>
