$(function(){

	//아이디 찾기
	$("#userFindId").on("click", function(){
		
		var user_email = $("#user_email").val();
		var user_name = $("#user_name").val();
		
		$.ajax({
			type : "post",
			url: "userFindProcess.ajax",
			data: "user_email=" + user_email + "&user_name=" + user_name,
			success : function(map, status, xhr){
			
			if(map.result == -1) {
				alert("아이디가 존재하지 않습니다.");
			}else if(map.result == 0) {
				alert("이름이 잘못 입력되었습니다.");
			}else {
				alert(map.user_id);
			}
			
			}, 
			error: function(xhr, status, error) {
			alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		})
	});
	
	//비밀번호 찾기
	$("#userFindPass").on("click", function(){
		var user_email = $("#user_email").val();
		var user_name = $("#user_name").val();
		var user_id = $("#user_id").val();
		
			$.ajax({
				type : "post",
				url : "userFind.ajax",
				data : "user_email=" + user_email + "&user_name=" + user_name
					+ "&user_id=" + user_id,
				success : function(map, status, xhr){
				
				if(map.result == 0) {
					alert("이름이 잘못 입력 되었습니다.");
				}else if(map.result == 1) {
					alert("아이디가 잘못 입력되었습니다.");
				}else {
					alert(map.user_pass);
				}
				
				},
				erorr: function(erorr, status, xhr){
				alert("ajax 실패 : " + status + " - " + xhr.status);
				}
			})
		});
		
	//아이디 비번 입력 없이 로그인버튼 눌렀을때
	$("#login").on("click",function(e){
		var user_id = $("#user_id").val();
		var user_pass = $("#user_pass").val();
		
		if(user_id.length <= 0) {
			alert("아이디가 입력되지 않았습니다.\n 아이디를 입력해 주세요.");
			$("#user_id").focus();
			return false;
		}
		if(user_pass <= 0) {
			alert("비밀번호가 입력되지 않았습니다. \n 비밀번호를 입력해 주세요.");
			$("#user_pass").focus();
			return false;
		}
		
		
		$.ajax({
			type : "post",
			url : "userLoginCheck",
			data : { user_id : user_id,
				user_pass : user_pass},
			success : function(map, status, xhr){		
					
					if(map.user_id != user_id) {
						alert("올바른 아이디가 아닙니다 \n 아이디를 확인해 주세여.");
						$("#user_id").focus();
						return false;
					} else
					 if(map.user_pass != user_pass) {
						 alert("비밀번호가 틀렸습니다 \n 비밀번호를 확인해 주세요.");
						 $("#user_pass").focus();
						 return false;
					 } else {
						 $("#loginForm").submit();
					 }
					 
		},
		error : function(error, status, xhr){
			alert("실패" + status + " - " + xhr.status);
			
		}
			
		});
		
		//e.preventDefault();
		 
		
	});
	
	//아이디 중복체크
		$("#userIdOverlap").on("click", function(){
			var user_id = $("#user_id").val();
			
			if(user_id.length <= 0) {
				alert("아이디가 입력되지 않았습니다.  \n 아이디를 입력해 주세요.");
				$("#user_id").focus();
				return false;
			}
			$.ajax({
				url : "idCheck.ajax",
				type : "post",
				data : {user_id : user_id},
				success : function(data){
					if(data == 1) {
						$("#user_id_ok").css("display", "none");
						$("#user_id_already").css("display", "block")
						.css("color","red");
						$("#user_id").attr("data-idCheck", "1");
					}else {
						$("#user_id_already").css("display", "none");
						$("#user_id_ok").css("display", "block")
						.css("color", "blue");
						$("#user_id").attr("data-idCheck", "2");
					}
					
					
				},
				error : function(){
					alert("실패");
				}
			});
			
		});
		
		//아이디 중복체크후 가입	
	$("#join").click(function(){
		var idCheck = $("#user_id").attr("data-idCheck");
		var user_pass = $("#user_pass").val();
		var user_name = $("#user_name").val();
		var user_email = $("#user_email").val();
		var user_phone = $("#user_phone").val();
		var user_isadult = $("#user_isadult").val();
		var user_isclause = $("#user_isclause").val();
		
		
		if(idCheck == 0) {
			alert("아이디 중복 검사를 해주세요.");
			return false;
		}else if(idCheck == 1) {
			alert("사용할 수 없는 아이디입니다.");
			return false;
		}
		if(user_pass.length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.\n 비밀번호를 입력해주세요");
			$("#user_pass").focus();
			return false;
		}
		if(user_name.length <= 0) {
			alert("이름이 입력되지 않았습니다 \n 이름을 입력해주세요");
			$("#user_name").focus();
			return false;
		}
		if(user_email <=0) {
			alert("이메일이 입력되지 않았습니다 \n 이메일을 입력해주세요");
			$("#user_email").focus();
			return false;
		}
		if(user_nick <= 0) {
			alert("닉네임이 입력되지 않았습니다. \n 닉네임을 입력해주세요");
			$("#user_nick").focus();
			return false;
		}
		
		if(user_isadult.length <= 0) {
			alert("나이 인증이 선택되지 않았습니다 \n 나이 인증을 선택해주세요.");
			$("#user_isadult").focus();
			return false;
		}
		if(user_isclause.length <= 0) {
			alert("약관을 선택 하지 않았습니다 \n 약관을 동의 해주세요.");
			$("#user_isclause").focus();
			return false;
		}
		
		if(user_phone.length <= 0) {
			alert("휴대폰번호가 입력되지 않았습니다 \n 휴대폰 번호를 입력해주세요.");
			$("#user_phone").focus();
			return false;
		}
		
		return false;
	})
	
	// update 비밀번호 체크
	$("#passCheckBtn").click(function(){
		var user_pass = $("#user_pass").val();
		var user_id = $("#user_id").val();
		
		$.ajax({
			type : "post",
			url : "userLoginCheck",
			data : { user_id : user_id,
				user_pass : user_pass},
			success : function(map, status, xhr){
				 if(map.user_pass != user_pass) {
					 alert("비밀번호가 틀렸습니다 \n 비밀번호를 확인해 주세요.");
					 $("#user_pass").focus();
					 return false;
				 } else {
					 $("#passCheckBtn")
					 	.css("color","RGB(90, 240, 90)");
					 $("#passCheckBtn").attr("data-passCheck", "1");
				 }
				 
			},
			error : function(error, status, xhr){
				alert("실패" + status + " - " + xhr.status);
			}
		});
		
	})
	
	// 비밀번호 확인
	$("#user_pass2").keyup(function(){
		var user_pass1 = $("#user_pass1").val();
		var user_pass2 = $("#user_pass2").val();
		var user_pass = $("#user_pass").val();
		
		if(user_pass == user_pass2) {
			$(".passCheck").remove();
			$("#user_pass2").after("<span class='passCheck'> 기존 비밀번호와 동일합니다. </span>");
			$(".passCheck").css("color", "RGB(216, 64, 42");
		} else if(user_pass1 != user_pass2) {
			$(".passCheck").remove();
			$("#user_pass2").after("<span class='passCheck'> 비밀번호가 일치하지 않습니다 </span>");
			$(".passCheck").css("color", "RGB(216, 64, 42");
		} else {
			$(".passCheck").remove();
			$("#user_pass2").after("<span class='passCheck'> 비밀번호 일치 </span>");
			$(".passCheck").css("color", "RGB(120, 240, 124)");
		}
		
	})
	
	
	
	//수정하기
	$("#update").click(function(){
		$("#user_pass").val($("#user_pass2").val());
		var passCheck = Number($("#passCheckBtn").attr("data-passCheck"));
		
		if(passCheck != 1) {
			alert("비밀번호 확인를 해주세요.");
		} else {
			$("#updateForm").submit();
		}
	})
	
	
	
});