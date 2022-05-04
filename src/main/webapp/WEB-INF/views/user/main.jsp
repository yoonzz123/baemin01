<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="header">
		<div class="header1">&nbsp;</div>
		<div class="main_address header2" >주소</div>
		<div class="header3" >&nbsp;</div>
	</div>
	<div class="banner">
		<img class="main_banner" src="resources/img/ss.png" />
	</div>
	<div class="recommended_menu">
		<span><img src="resources/img/first.png"></span>
		<span><img src="resources/img/fifth.png"></span>
		<span><img src="resources/img/fourth.png"></span>
	</div>
	<div class="flex-wrap main-category">
		<a href="storeListForm?mainCat=1"><img src="resources/img/icon/main/g.png"><br>돈까스·회·일식</a>
		<a href="storeListForm?mainCat=2"><img src="resources/img/icon/main/k.png"><br>중식</a>
		<a href="storeListForm?mainCat=3"><img src="resources/img/icon/main/h.png"><br>치킨</a>
		<a href="storeListForm?mainCat=4"><img src="resources/img/icon/main/d.png"><br>백반·죽·국수</a>
		<a href="storeListForm?mainCat=5"><img src="resources/img/icon/main/f.png"><br>카페·디저트</a>
		<a href="storeListForm?mainCat=6"><img src="resources/img/icon/main/e.png"><br>분식</a> 
		<a href="storeListForm?mainCat=7"><img src="resources/img/icon/main/n.png"><br>찜·탕·찌개 </a>
		<a href="storeListForm?mainCat=8"><img src="resources/img/icon/main/i.png"><br>피자</a> 
		<a href="storeListForm?mainCat=9"><img src="resources/img/icon/main/t.png"><br>양식 </a>
		<a href="storeListForm?mainCat=10"><img src="resources/img/icon/main/t.png"><br>고기·구이</a> 
		<a href="storeListForm?mainCat=11"><img src="resources/img/icon/main/l.png"><br>족발·보쌈</a> 
		<a href="storeListForm?mainCat=12"><img src="resources/img/icon/main/j.png"><br>아시안</a> 
		<a href="storeListForm?mainCat=13"><img src="resources/img/icon/main/p.png"><br>패스트푸드</a> 
		<a href="storeListForm?mainCat=14"><img src="resources/img/icon/main/m.png"><br>야식 </a>
		<a href="storeListForm?mainCat=15"><img src="resources/img/icon/main/o.png"><br>도시락 </a>
		<div class="ch"><a href="https://console.dialogflow.com/api-client/demo/embedded/8725f1d4-4c34-4c3d-ad0d-f766a73e7039"><img src="./resources/img/ch.png" width="10%" height="5%"></a></div>
		<br>	
	</div> 
	
	<div class="main_footer">
		<div class="main_nav"><a href="searchForm" ><img src="resources/img/icon/main/search.png"><br>검색</a></div>
		<div class="main_nav"><a href="userWishForm" ><img src="resources/img/icon/main/wishList.png"></a><br>찜</div>
		<div><a href="#" ><img src="resources/img/icon/b.png"></a></div>
		<div class="main_nav"><a href="odrListForm" ><img src="resources/img/icon/main/orderList.png"><br>주문내역</a></div>
		<div class="main_nav"><a href="myBaemin" ><img src="resources/img/icon/main/myBaemin.png"><br>My배민</a></div>
	</div>
	<c:if test="${sessionScope.cartCnt > 0}">
	<jsp:include page="../../template/cartBtnForm.jsp" />
	</c:if>
</article>
