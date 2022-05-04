
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<article>
	<div class="header">
		<div class="back header1"><img src="resources/img/icon/back.png"></div>
		<div class="main_address header2" >양식</div>
		<div class="header3" >&nbsp;</div>
	</div>
	
	
	<form action="odrProcess" method="post" id="odrForm">
	
	
		<div class="odrbox">
			<h4 class="odrTh">배달정보</h4>
			<h3 class="odrTd" id="user_addr2">																																																																																																																																							</h3>
			<p class="odrTd">[도로명] 안양천로537가길 26</p>
			<input type="text" value="좌측 끝방" name="odrAddr3" class="odrInput" />
		</div>
		<div class="odrbox">
		<div class="flex1 ">
			<h3 class="odrTh margin0" id="orderUserPhone">${user.user_phone }</h3>
			<p class="odrTh">변경</p>
		</div>
		<p class="odrGuideText">내 주문횟수를 가게에 제공하지 않습니다. (최근 6개월)</p>
		</div>
		
		<div class="space">&nbsp;</div>
		
		<div class="odrbox">
			<h4 class="odrTh">요청사항</h4>
			<input type="checkbox" name="odrIsDis" checked="checked"> 일회용 수저, 포크 안 주셔도 돼요
		</div>
		<div class="odrbox">
			<p>가게 사장님께</p>
			<input type="text" class="odrInput" name="odrCeoMsg" placeholder="예) 견과류 빼주세요, 덜 맵게 해주세요" ><br>
		</div>
		<div class="odrbox">
			<p>라이더님께</p>
			<select id="riderSelectBox" class="odrSelectBox">
				<option>조심히 안전하게 와주세요 :)</option>
				<option>문 앞에 두고 벨 눌러주세요ㅕ.</option>
				<option>벨 누르지 말고 노크해주세요.</option>
				<option>도착하기 전에 전화해주세요.</option>
				<option>요청사항 없음</option>
				<option>직접 입력</option>
			</select>
		</div>
		
		<div class="space">&nbsp;</div>
		
		<div class="odrbox">
			<h4 class="odrTh" >결제수단</h4>
			<select id="paySelectBox" class="odrSelectBox" name="odrPay">
				<option value="0">신용/체크카드</option>
				<option value="1">휴대폰결제</option>
				<option value="2">네이버페이</option>
				<option value="3">카카오페이</option>
				<option value="4">토스</option>
				<option value="5">만나서 카드결제<br>
					<p class="odrGuideText">사회적 거리두기 강화를 위해, 만나서 결제 외 다른 결제수단을 선택해주세요.</p>
				</option value="6">
				<option><p>신용/체크카드</p><br>
					<p class="odrGuideText">사회적 거리두기 강화를 위해, 만나서 결제 외 다른 결제수단을 선택해주세요.</p></option>
			</select>
			<br>
			<ul>
				<li class="odrGuideText">배민현대카드는 최대 5.5% 배민포인트 적립</li>
				<li class="odrGuideText">배민페이(카드결제) - 배민페이에서 삼성카드로 결제한 적이 없다면? 아래의 할인<br>쿠폰을 눌러 쿠폰코드 '삼성카드첫결제'를 입력하면 3천원 즉시 할인!</li>
				<li class="odrGuideText">코로나19 예방을 위해 안전한 비대면 결제를 권장합니다.</li>
			</ul>
		</div>
		
		<div class="space">&nbsp;</div>
		
		
			<div class="flex1">
				<h4>선물함</h4>
				<span>0원  &gt;</span>
			</div>
		
			<div class="flex1">
				<h4>할인쿠폰</h4>
				<span>0원  &gt;</span>
			</div>
		
		
		<div class="space">&nbsp;</div>
		
		<div class="odrbox">
			<h4 class="odrTh">결제금액</h4>
			<div class="flex1 margin0">
				<p>주문금액</p>
				<p>${totalAmt }원</p>
			</div>
			<br><hr><br>
			<div class="flex1 margin0 ">
				<h4>총 금액</h4>
				<h3>${totalAmt }원</h3>
			</div>
		</div>
	
		<div class="detail-footer" id="odrInsert">
			<div class="odrGuideText"> 위 내용을 확인하였으며 결제에 동의합니다.</div>
			<div class="flex detail-footer-cartBtn">			
				<span>${totalAmt }원 결제</span>
			</div>
		</div>
		
		<!-- input hidden  -->
		<input type="hidden" id="odrPhone" name="odrPhone" value="${user.user_phone }"/>
		<input type="hidden" id="odrTotalAmt" name="odrTotalAmt" value="${totalAmt }"/>
		<input type="hidden" id="odrAddr1" name="odrAddr1" value="empty"/>
		<input type="hidden" id="odrAddr2" name="odrAddr2" value=""/>
	</form>
	
</article>
