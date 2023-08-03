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
<script>
	$(document).ready(function() {
		const bno = '${board.bno}';
		$('#update').on('click', function() {
			const title = $('#title').val();
			const content = $('#content').val();
			const password = $('#password').val();
			const form = `
				<form action='/update' method='post'>
					<input type='hidden' name='title' value='\${title}'>
					<input type='hidden' name='content' value='\${content}'>
					<input type='hidden' name='password' value='\${password}'>
					<input type='hidden' name='bno' value='\${bno}'>
					<input type='hidden' name='_csrf' value='${_csrf.token}'>
				</form>
			`;
			$(form).appendTo($('body')).submit();
		});
		
		$('#delete').on('click', function() {
			const password = $('#password').val();
			const form = `
				<form action='/delete' method='post'>
					<input type='hidden' name='password' value='\${password}'>
					<input type='hidden' name='bno' value='\${bno}'>
					<input type='hidden' name='_csrf' value='${_csrf.token}'>
				</form>
			`;
			$(form).appendTo($('body')).submit();
		});
		
	})
</script>
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
				<div class="mb-3 mt-3">
				  <label for="title" class="form-label">할일:</label>
				  <input type="text" name="title" id="title" class="form-control" value="${board.title}">
				</div>
				<div class="mb-3 mt-3">
				  <textarea class="form-control" rows="5" id="content" name="content">${board.content}</textarea>
				</div>
				<div class="mb-3 mt-3">
				  <label for="nickname" class="form-label">글쓴이:</label>
				  <input type="text" name="nickname" id="nickname"  class="form-control" value="${board.nickname}" disabled>
				</div>
				<div class="mb-3 mt-3">
				  <label for="password" class="form-label">비밀번호:</label>
				  <input type="text" name="password" id="password" class="form-control" placeholder="비밀번호 입력">
				</div>
				<input type="hidden" name="_csrf" value="${_csrf.token}">
				<button id="update" class="btn btn-primary">변경</button>
				<button id="delete" class="btn btn-warning">삭제</button>
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