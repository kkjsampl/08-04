<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/script/write.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="page">
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</header>
		<nav>
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</nav>
		<main>
			<aside>
				<jsp:include page="/WEB-INF/views/include/aside.jsp" />
			</aside>
			<section>
				<form action="/write" method="post" id="write-form">
				  <div class="mb-3 mt-3">
				    <label for="title" class="form-label">할일:</label>
				    <input type="text" name="title" id="title" class="form-control" placeholder="할일 입력">
				  </div>
				  <div class="mb-3 mt-3">
            <label for="content">글 작성:</label>
						<textarea class="form-control" rows="5" id="content" name="content"></textarea>
				  </div>
				  <div class="mb-3 mt-3">
				    <label for="nickname" class="form-label">글쓴이:</label>
				    <input type="text" name="nickname" id="nickname" class="form-control" placeholder="글쓴이 입력">
				  </div>
				  <div class="mb-3 mt-3">
				    <label for="password" class="form-label">비밀번호:</label>
				    <input type="text" name="password" id="password" class="form-control" placeholder="비밀번호 입력">
				  </div>
				  <input type="hidden" name="_csrf" value="${_csrf.token}">
				  <button id="add" class="btn btn-primary">추가</button>
				</form>
			</section>
			<aside>
				<jsp:include page="/WEB-INF/views/include/aside.jsp" />
			</aside>
		</main>
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>