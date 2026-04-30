<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 이 구문을 "스크립틀릿" 이라고 해서 html 태그 내에 자바 코드를 쓸 수 있는 영역
	
	// 4. 2 단계에서 request 의 attribute 영역에 담아놨던 응답값들을 뽑아내기
	// > request.getAttribute("키값") : Object (밸류값)
	//   (Object 타입에서 내가 받고자 하는 데이터의 원래 타입으로 강제형변환 해서 변수에 담기)
	String name = (String)request.getAttribute("name");
	int age = (int)request.getAttribute("age");
	String city = (String)request.getAttribute("city");
	double height = (double)request.getAttribute("height");
	String gender = (String)request.getAttribute("gender");
	String[] foods = (String[])request.getAttribute("foods");
	
	System.out.println("-----");
	System.out.println(name);
	System.out.println(age);
	System.out.println(city);
	System.out.println(height);
	System.out.println(gender);
	System.out.println((foods == null) ? "없음" : String.join(", ", foods));
	System.out.println("-----");
	
	// 5. 방금 뽑아낸 전달값들을 가지고 화면의 알맞은 자리에 출력
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 { color : red; }
	span {
		font-weight : bold;
		font-size : 17px;
	}
	#name { color : orange; }
	#age { color : yellow; }
	#city { color : green; }
	#height { color : blue; }
	#gender { color : navy; }
	li { color : purple; }
</style>
</head>
<body>

	<h2>개인정보 응답화면</h2>

	<span id="name"><%= name %></span> 님은
	<span id="age"><%= age %></span> 살이며,
	<span id="city"><%= city %></span> 에 사는,
	<span id="height"><%= height %></span> cm 이고,
	
	성별은
	
	<% if(gender == null) { %>
	
		<!-- case1 -->
		선택을 안했습니다. <br><br>
		
	<% } else { %>
	
		<% if(gender.equals("M")) { %>
		
			<!-- case2_1 -->
			<span id="gender">남자</span> 입니다. <br><br>
			
		<% } else { %>
		
			<!-- case2_2 -->
			<span id="gender">여자</span> 입니다. <br><br>
			
		<% } %>
		
	<% } %>
	
	좋아하는 음식은
	
	<% if(foods == null) { %>
	
		<!-- case1 -->
		없습니다.
		
	<% } else { %>
	
		<!-- case2 -->
		<ul>
			
			<% for(int i = 0; i < foods.length; i++) { %>
			
				<li><%= foods[i] %></li>
				
			<% } %>
			
		</ul>
		
	<% } %>
	
</body>
</html>