$(function(){
	
	// cartBtn, orderBtn click시 css
	$("#cartBtn, #orderBtn").click(function(){
		$(this).css("background-color", "RGB(101, 166, 170)");
		setTimeout(function(){
			$(this).css("background-color", "RGB(121, 186, 190)");
		}, 7);
	});
	
	// + 버튼 클릭시 
	$(".cartCntAdd").click(function(){
		var price = $(this).parent().attr("data-price");
		var num = Number($(this).prev().attr("data-num"));
		var num = num + 1;
		
		$(this).prev().text(num + "개");
		$(".cartCnt").text(num + " 개 담기").attr("data-totalCnt", num);
		$(".detail-footer-cartBtn>span:last-child").text(price * num + "원").attr("data-totalAmt", price * num);
		$("#cnt").attr("data-num", num);
	})
	
	// - 버튼 클릭시
	$(".cartCntMinus").click(function(){
		var price = $(this).parent().attr("data-price");
		var num = Number($(this).next().attr("data-num"));
		
		// num이 1 이하일 경우 실행 취소
		if(num == 1) {return false;	}
		
		var num = num - 1;
		
		$(this).next().text(num + "개");
		$(".cartCnt").text(num + " 개 담기").attr("data-totalCnt", num);
		$(".detail-footer-cartBtn>span:last-child").text(price * num + "원").attr("data-totalAmt", price * num);
		$("#cnt").attr("data-num", num);
	});
	
	// cartBtn 버튼 클릭시 폼 서브밋
	$("#cartBtn").click(function(){		
		if($("#isLogin").val() != "true") {
			if (!confirm("로그인후 이용 가능합니다. \n로그인 창으로 이동하시겠습니까?")) {
				return false;
			} else {
				window.location.href="userLoginForm";
				console.log("asdfjlk");
				$("#cartAhref").attr("href", "userLoginForm");
				
				return false;
			}
		}
		
		var pStoreNo = Number($("#pStoreNo").val());
		var cStoreNo = Number($("#cStoreNo").val());
		var totalCnt = Number($(".cartCnt").attr("data-totalCnt"));
		var totalAmt = Number($(".detail-footer-cartBtn>span:last-child").attr("data-totalAmt"));
		var productNo = $("#productNo").val();
		
		if(cStoreNo != pStoreNo && cStoreNo != 0) {
			if (!confirm(" 장바구니에는 같은 가게의 메뉴만 담을 수 있습니다. \n 선택하신 메뉴를 장바구니에 담을 경우 이전에 담은 메뉴가 삭제됩니다.")) {
				return false;
		    } else {
		    	$.ajax({
		    		type: "POST",
		    		url: "cartUpdate.ajax?cartCnt=" + totalCnt,
		    		success: function(){
		    			$("#cStoreNo").val(pStoreNo);
		    		},
		    		error: function(){
		    		}
		    	});
		    }
		}	
		
		$("#totalCnt").attr("value", totalCnt);
		$("#totalAmt").attr("value", totalAmt);
		$.ajax({
			type: "POST",
			url: "cartInsert?productNo=" + productNo,
			data: "cartCnt=" + totalCnt + "&cartAmt=" + totalAmt,
			success:function(){
				$("#cart-notice").fadeIn(800);
				$('#cart-notice').delay(1000).fadeOut(800);
			}
		});
	});
	
	
	// ############### order JavaScript ############
	
	// + 버튼 클릭시 
	var totalCnt = Number($("#totalCnt").val());
	var totalAmt = Number($("#totalAmt").val());			
		
	$(".orderAdd").click(function(){
		
		var price = Number($(this).parent().attr("data-price"));
		var num = Number($(this).prev().attr("data-num"));
		var num = num + 1;
		totalCnt = totalCnt + 1;
		totalAmt = totalAmt + price;
		
		
		$(this).prev().text(num + "개");
		$(this).prev().attr("data-num", num);			
		$(this).parent().attr("data-amt", num * price);
		$(this).parent().prev().find('span.amt').text("총 : " + num * price + " 원");
		
		$(".cartCnt").text(totalCnt + " 개 담기").attr("data-totalCnt", totalCnt);
		$(".detail-footer-cartBtn>span:last-child").text(totalAmt + "원").attr("data-totalAmt", totalAmt);
		
	})
	
	// - 버튼 클릭시
	$(".orderMinus").click(function(){
		var price = $(this).parent().attr("data-price");
		var num = Number($(this).next().attr("data-num"));
		
		// num이 1 이하일 경우 실행 취소
		if(num == 1) {return false;	}
		
		num = num - 1;
		totalCnt = totalCnt - 1;
		totalAmt = totalAmt - price;
		
		$(this).next().text(num + "개");
		$(this).next().attr("data-num", num);			
		$(this).parent().attr("data-amt", num * price);
		$(this).parent().prev().find('span.amt').text("총 : " + num * price + " 원");
		
		$(".cartCnt").text(totalCnt + " 개 담기").attr("data-totalCnt", totalCnt);
		$(".detail-footer-cartBtn>span:last-child").text(totalAmt + "원").attr("data-totalAmt", totalAmt);
		

	});

	// orderBtn 버튼 클릭시 폼 서브밋
	$("#orderBtn").click(function(){
		$("#cartForm").submit();
		
	})
		
	// Order Form 전송
	$(".detail-footer-cartBtn").click(function(){
		// 핸드폰 번호 세팅
		var odrPhone = $("#orderUserPhone").text();
		$("#odrPhone").val(odrPhone);
		
		// 사장님 메시지 유효성 검사
		var odrCeoMsg = $("input[name=odrCeoMsg]").val();
		if(odrCeoMsg.length == 0) {
			$("input[name=odrCeoMsg]").val("메세지 없음");
		}
		var odrCeoMsg = $("input[name=odrCeoMsg]").val();
		
		// 일회용품 사용여부 체크
		var odrIsDis = $("input[name=odrIsDis]").is(':checked');
		if(odrIsDis == true) {
			$("input[name=odrIsDis]").attr("value", 1);
		} else {
			$("input[name=odrIsDis]").attr("value", 0);
		}
		
		console.log("asdjflksajldk");
		// 추후 addr 테이블 생성 후 보안 예정
		$("#odrAddr2").val($("#user_addr2").text());
		
		// 폼 전송
		$("#odrForm").submit();
		
	});
		
	$("#cartBtnForm").click(function(){
		var isLigin = $(this).find("input").val();
		
		if(isLigin != 'true') {
			if (!confirm("로그인후 이용 가능합니다. \n로그인 창으로 이동하시겠습니까?")) {
				return false;
			} else {
				window.location.href="userLoginForm";
				return false;
			}
		}
	})
	
	//################### store update && Delete###################
	$("#storeUpdateBtn").click(function(){
		$("#storeForm").attr("action", "storeUpdate");
		$("#storeForm").submit();
		
	})
	$("#storeDeleteBtn").click(function(){
		if (!confirm("정말로 상점을 폐업하시겠습니까? \n(기존에 등록된 모든 내용은 삭제됩니다.)")) {
			return false;
		} else {
			$("#storeForm").attr("action", "storeDelete");
			$("#storeForm").submit();
		}
	
	})
})
