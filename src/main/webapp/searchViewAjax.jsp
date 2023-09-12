<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	 <script>
	 	//html문서의 로딩이 완료되면 코드가 실행되도록함
	 	$(function(){
	 		//버튼을 클릭하면 api요청
			$("#searchBtn").click(function() {
				console.log("aaaaaaaa");
				$.ajax({
					url: "./NaverSearchAPI.do",
					type: "get",
					data: {
						keyword: $("#keyword").val(),
						startNum: $("#startNum option:selected").val()
					},
					dataType: "json",
					success: sucFuncJson,
					error: errFunc
				})
			})	 		
	 	})
	 	//검색 성공시 결과를 화면에 출력
	 	function sucFuncJson(d) {
	 		let str = "";
			$.each(d.items, function(index, item){
				str += "<ul>"
				str += "<li>"+(index+1)+"</li>"				
				str += "<li>"+item.title+"</li>"				
				str += "<li>"+item.description+"</li>"				
				str += "<li>"+item.bloggername+"</li>"				
				str += "<li>"+item.bloggerlink+"</li>"				
				str += "<li>"+item.postdate+"</li>"				
				str += "<li><a href='"+item.link+"' target='_blank'>바로가기</a></li>"				
				str += "</ul>"
			})
			$("#searchResult").html(str);
	 	}
	 	//실패시 경고창을 띄움
	 	function errFunc(e) {
	 		alert("실패 : "+e.status);
	 	}
	 </script>
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
</body>
</html>