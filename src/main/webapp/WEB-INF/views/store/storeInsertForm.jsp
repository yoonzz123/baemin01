<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
<div class="storeFormInsertWrap">
	<form id="storeForm" action="storeInsert" enctype="multipart/form-data" method="post">
		<input type="hidden" name="comId" value="${sessionScope.comId}" />		
		<div class="companyComId">
		회사명 : ${sessionScope.comId }<br>
		</div>
		<div class="storegongback"></div>
		가게이름 : <input type="text" name="storeName" value="${store.storeName }"><br/>
		<div class="storegongback"></div>
		카테고리 : 
		<select name="mainCat">
			<option value="1">돈까스,회,일식</option>
			<option value="2">중식</option>
			<option value="3">치킨</option>
			<option value="4">백반,죽,국수</option>
			<option value="5">카페,디저트</option>
			<option value="6">분식</option>
			<option value="7">찜,탕,찌개</option>
			<option value="8">피자</option>
			<option value="9">양식</option>
			<option value="10">고기,구이</option>
			<option value="11">족발,보쌈</option>
			<option value="12">아시안</option>
			<option value="13">패스트푸드</option>
			<option value="14">야식</option>
			<option value="15">도시락</option>
		</select><br/>
		<div class="storegongback"></div>
		우편번호 : 
		<input type="text" id="addr1" name="storeAddr1" value="${store.storeAddr1 }">
		<button id="storeAddrBtn" type="button">우편번호 찾기</button>
		<div class="storegongback"></div>
		<br/>
		주소 : 
		<input type="text" id="addr2" name="storeAddr2" value="${store.storeAddr2 }"><br/>
		<div class="storegongback"></div>
		상세주소 : 
		<input type="text" id="addr3" name="storeAddr3" value="${store.storeAddr3 }"><br/>
		<div class="storegongback"></div>
		전화번호 : 
		<input type="text" name="phone1" size="4"maxlength="4" value=${phone1 }> - 
		<input type="text" name="phone2" size="4" maxlength="4" value=${phone2 }> - 
		<input type="text" name="phone3" size="4" maxlength="4" value=${phone3 }><br/>
		<div class="storegongback"></div>
		파일<input type="file" id="file1"name="storeImage" size="70" maxlength="50" multiple>
		<div class="drop-zone">
			파일을 드래그해주세요.
		</div>
		<div class="storegongback"></div>
		<!-- 입점 신청 버튼 -->
		
		<c:if test="${empty store }">
		<div class="storeSumbit">
		<button type="submit">입점 신청</button>
		</div>
		</c:if>
		<!-- 상점 수정 버튼 -->
		<c:if test="${not empty store  }">
			<button id="storeUpdateBtn" type="button">상점 정보 수정</button>
			<input type="hidden" name="storeNo" value="${store.storeNo }"	>
			<button id="storeDeleteBtn" type="button">폐업 신고</button>
		</c:if>
		
	</form>
</div>

 <script>
      
        (function() {
            
            let file = document.getElementById("file1")
            let dropZone = document.querySelector(".drop-zone")

            let toggleClass = function(className) {
                
              

                let list = ["dragenter", "dragleave", "dragover", "drop"]

                for (let i = 0; i < list.length; i++) {
                    if (className === list[i]) {
                        dropZone.classList.add("drop-zone-" + list[i])
                    } else {
                        dropZone.classList.remove("drop-zone-" + list[i])
                    }
                }
            }
            
            let showFiles = function(files) {
                dropZone.innerHTML = ""
                for(let i = 0, len = files.length; i < len; i++) {
                    dropZone.innerHTML += "<p>" + files[i].name + "</p>"
                }
            }

            let selectFile = function(files) {
                // input file 영역에 드랍된 파일들로 대체
                file.files = files
                showFiles(file.files)
                
            }
            
            file.addEventListener("change", function(e) {
                showFiles(e.target.files)
            })

            // 드래그한 파일이 최초로 진입했을 때
            dropZone.addEventListener("dragenter", function(e) {
                e.stopPropagation()
                e.preventDefault()

                toggleClass("dragenter")

            })

            // 드래그한 파일이 dropZone 영역을 벗어났을 때
            dropZone.addEventListener("dragleave", function(e) {
                e.stopPropagation()
                e.preventDefault()

                toggleClass("dragleave")

            })

            // 드래그한 파일이 dropZone 영역에 머물러 있을 때
            dropZone.addEventListener("dragover", function(e) {
                e.stopPropagation()
                e.preventDefault()

                toggleClass("dragover")

            })

            // 드래그한 파일이 드랍되었을 때
            dropZone.addEventListener("drop", function(e) {
                e.preventDefault()

                toggleClass("drop")

                let files = e.dataTransfer && e.dataTransfer.files
                console.log(files)

                if (files != null) {
                    if (files.length < 1) {
                        alert("폴더 업로드 불가")
                        return
                    }
                    selectFile(files)
                } else {
                    alert("ERROR")
                }

            })

        })();
    </script>
    
</article>


