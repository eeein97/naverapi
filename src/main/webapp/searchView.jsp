<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>검색해보세요</h2>
	<div>
		<div>
			<form id="searchForm">
				한페이지에 10개씩 출력됨 
				<select id="startNum">
					<option value="1">1페이지</option>
					<option value="11">2페이지</option>
					<option value="21">3페이지</option>
					<option value="31">4페이지</option>
					<option value="41">5페이지</option>
				</select>
			</form>
			<input type="text" id="keyword" placeholder="검색어를 입력하세요.">
			<button type="button" id="searchBtn">검색요청</button>
		</div>
		<div class="row" id="searchResult">여기에 검색결과 출력</div>
	</div>
	<script>
		let btn = document.querySelector("#searchBtn");
		let keyword = document.querySelector("#keyword");
		let num = document.querySelector("#startNum");
		btn.addEventListener("click",async function(){
			let text;
			try {
				text = await getSearch();
				console.log(text);
				sunFuncJson(text.items);
			} catch (error) {
				console.log(error);
			}
		})
		function getSearch() {
			const response = fetch("./NaverSearchAPI.do?keyword="
					+keyword.value+"&startNum="+num.value);
			return response.then(res=>res.json());
		}
		//실제 화면에 나타낼 함수
		function sunFuncJson(data) {
			let str = "";
			data.forEach((item, index) => {
				str += "<ul>"
				str += "<li>"+(index+Number(num.value))+"</li>"				
				str += "<li>"+item.title+"</li>"				
				str += "<li>"+item.description+"</li>"				
				str += "<li>"+item.bloggername+"</li>"				
				str += "<li>"+item.bloggerlink+"</li>"				
				str += "<li>"+item.postdate+"</li>"				
				str += "<li><a href='"+item.link+"' target='_blank'>바로가기</a></li>"				
				str += "</ul>"
			})
			document.querySelector("#searchResult").innerHTML = str;
		}
	</script>
</body>
</html>