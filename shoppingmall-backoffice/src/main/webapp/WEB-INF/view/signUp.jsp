<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Spring Security Example</title>
</head>
<body>
	<h1>Spring Security SignUp page</h1>
	<hr>
	<form action="signUpAdd" method="post">
		<div>
			<input type="text" name="id" placeholder="아이디">
		</div>
		<div>
			<input type="password" name="password" placeholder="비밀번호">
		</div>
		<div>
			<input type="text" name="name" placeholder="이름">
		</div>
		<button type="submit">가입하기</button>
		<button type="button" onclick="location.href='/index';">취소</button>
	</form>
</body>
</html>