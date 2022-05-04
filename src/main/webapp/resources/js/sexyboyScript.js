$(() => {

	//wish
	let wishCount;

	$("#wishBtn").click(e => {
		let store_no = e.target.dataset.storeno

		$.post({
			url: "wishClick",
			data: { store_no }
		}).done(res => {
			if (res == -1)
				alert("비회원 찜은 어렵다.")
			if (res == 1) {
				$("#wishCount").html("").html(++wishCount)
				alert("찜등록")
			}
			if (res == 0) {
				$("#wishCount").html("").html(--wishCount)
				alert("찜 삭제 ~~~~~~~~~~~~~")
			}
		})
	})

	let getWishListBtn = $("#getWishListBtn")
	getWishListBtn.click(e => {
		let catNo = e.target.dataset.cat
		$.post({
			url: "wishList",
			data: { catNo }
		}).done(res => {
			let storeListBox = $(".storeListBox")
			storeListBox.html(null)
			for (var i in res) {
				storeListBox.append(

					`<a href="storeDetailForm?storeNo=` + res[i].store_no + `">
				<div class="storeList">
					<div class="storeImg">
					<img src="` + res[i].store_img + `">
					</div>
					<div class="storeContent">
					<div class="storeName-min">${res[i].store_name} 찜(${res[i].wish_count})</div>
					<div class="storeScope">
					<span class="scopeSpan">0.0</span>
					</div>
					<div class="deliveryDiv">
					<span class="deliverySpan">최소주문 6000원</span>
					배달팁 
					<span class="deliverySpan">0원 ~ 4000원</span>
					</div>
					<div class="deliveryTime">
					<img src="#">
					<span> 35~40분 </span>
					</div>
					</div>
					</div>
					</a>`
				)
			}
		})


	})

	//search 
	let searchForm = $("#searchForm")

	searchForm.submit(e => {
		e.preventDefault();
		let searchKey = e.target.searchKey.value
		let recentSearches = $(".recentSearches")
		let popularSearch = $(".popularSearch")

		$.post({
			url: "storeSearch",
			data: { searchKey }
		}).done(res => {
			$(".searchList").html("")

			for (var i in res) {
				$(".searchList").append(
					`<a href="storeDetailForm?storeNo=` + res[i].storeNo + `">
				<div class="storeList">
					<div class="storeImg">
						<img src="` + res[i].storeImg + `">
					</div>
					<div class="storeContent">
						<div class="storeName-min">` + res[i].storeName + `</div>
						<div class="storeScope">
							<span class="scopeSpan">` + res[i].storeScope + `</span>
						</div>
						<div class="deliveryDiv">
							<span class="deliverySpan">최소주문 6000원</span>
							배달팁 
							<span class="deliverySpan">0원 ~ 4000원</span>
						</div>
						<div class="deliveryTime">
							<img src="#">
							<span> 35~40분 </span>
						</div>
					</div>
				</div>
				</a>`
				)
			}
			e.target.searchKey.value = ""

		}).done(() => {
			searchOption(recentSearches, popularSearch)
		})

	})

	function searchOption(recentSearches, popularSearch) {
		$.post({
			url: "recentSearches"
		}).done(res => {
			if (res) {
				recentSearches.html("최근 검색어 : ")
				for (var i in res) {
					recentSearches.append(res[i] + " ")
				}
			}
		})

		$.post({
			url: "popularSearch"
		}).done(res => {
			if (res) {
				popularSearch.html("인기검색어 : ")
				for (var i in res) {
					popularSearch.append("<br/>" + res[i].search_keyword + "(" + res[i].count + ")")
				}
			}
		})
	}

	//review
	let reviewForm = $(".reviewForm")

	reviewForm.submit(e => {
		e.preventDefault()
		$.post({
			url: "review/insert",
			data: {
				"product_no": e.target.product_no.value,
				"r_scope": e.target.r_scope.value,
				"r_content": e.target.r_content.value
			}
		}).done(res => {
			let reviewList = $(".reviewList")
			reviewList.html("")
			let 합 = 0;
			for(let i in res) {
				reviewList.append(`
					<div>
						<p>작성자 : ${res[i].user_id}</p>
						<p>별점 : ${res[i].r_scope}개</p>
						<p>${res[i].r_content}</p>
					</div>
				`)
				합 += res[i].r_scope
				$(".평균별점").html(`평균별점 : ${합 / res.length}`)
			}
		})
	})

	//
	$(() => {

		//wish Count		
		let store_no = $("#wishBtn").data("storeno")

		if (store_no) {
			$.post({
				url: "wishCount",
				data: { store_no }
			}).done(res => {
				wishCount = res
				$("#wishBtn").append("<span id='wishCount'>" + res + "</span>")
			})
		}

		//recentSearches
		let recentSearches = $(".recentSearches")
		let popularSearch = $(".popularSearch")

		if (recentSearches) {
			searchOption(recentSearches, popularSearch)
		}

		//Review
		let reviewList = $(".reviewList")
		
		if(reviewList) {
			$.post({
				url: "review/reviewList",
				data: { store_no }
			}).done(res => {
				let 합 = 0;
				for(let i in res) {
					reviewList.append(`
						<div>
							<p>작성자 : ${res[i].user_id}</p>
							<p>별점 : ${res[i].r_scope}개</p>
							<p>${res[i].r_content}</p>
						</div>
					`)
					합 += res[i].r_scope
				}
				$(".평균별점").html(`평균별점 : ${합 / res.length}`)
			})
		}

	})
})