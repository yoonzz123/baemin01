<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="resources/css/search.css" />
<link rel="stylesheet" type="text/css" href="resources/css/store.css" />
<link rel="stylesheet" type="text/css" href="resources/css/cart.css" />
<link rel="stylesheet" type="text/css" href="resources/css/order.css" />
<link rel="stylesheet" type="text/css" href="resources/css/mypage.css" />
<link rel="stylesheet" type="text/css" href="resources/css/login.css" />
<link rel="stylesheet" type="text/css" href="resources/css/companyUpdate.css" />
<link rel="stylesheet" type="text/css" href="resources/css/sotreInsert.css" />
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/commond.js"></script>
<script src="resources/js/cart.js"></script>
<script src="resources/js/user.js"></script>
<script src="resources/js/myPage.js"></script>
<script src="resources/js/delivery.js"></script>
<!-- 섹시한 스크립트 -->
<script src="resources/js/sexyboyScript.js"></script>

<!-- Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- Modal end -->

<!-- daum post API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- daum post API end -->

</head>
<body>
	<c:if test="${not sessionScope.isCompany }">
		<%@ include file="template/header.jsp"%>
	</c:if>
	<c:if test="${sessionScope.isCompany }">
		<%@ include file="template/cHeader.jsp"%>
	</c:if>
	<jsp:include page="${ param.body }" />
	
</body>
</html>