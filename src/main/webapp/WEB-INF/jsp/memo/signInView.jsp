<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 

<link rel="stylesheet" href="/css/memo/memo.css" type="text/css">
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" id= "wrap">
		<header class="bg-light">
			<h1>메모게시판</h1>
		</header>
		<section>
			<div class="col-6">
				<table class="table text-center">
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>작성날짜</th>
							<th>수정날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memoList}" var="memo">
						<tr>
							<td>${memo.id}</td>
							<td>${memo.subject}</td>
							<td>${memo.createdAt}</td>
							<td>${memo.updatedAt}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<span><a href="#"><h3>이전</h3></a></span>
				<span><a href="#"><h3>다음</h3></a></span>
			</div>
			<div>
				<button type="button" class="btn btn-primary">글쓰기</button>
			</div>
		</section>
		<footer>
			<address class="bg-light">
				<h3>copyright marobiana</h3>
			</address>
		
		</footer>
	
	
	
	
	</div>
	
</body>
</html>