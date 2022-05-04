$(function(){
	$("#deliveryInsertProcess").on("submit",function(){
		let area = $("#deliArea").val();
		let price = $("#deliPrice").val();
		
		if(area.length == 0){
			alert("지역을 작성하셔야합니다.");
			return false;
		}
		if(price.length == 0){
			alert("가격을 작성하셔야합니다.");
			return false;
		}
		
	});
	$("#deliveryDelete").on("click", function(){
		$("#deliveryDeleteForm").attr("action", "deliveryDelete");
		$("#deliveryDeleteForm").submit();
	
	});
	
	$("#deliveryUpdateProcess").on("submit", function(e){
		
		let area = $("#deliArea").val();
		let price = $("#deliPrice").val();
		
		
		
		console.log(area,price);
		if(area.length == 0){
			alert("지역을 작성하셔야합니다.");
			return false;
		}
		if(price.length == 0){
			alert("가격을 작성하셔야합니다.");
			return false;
		}		
	});
	
});