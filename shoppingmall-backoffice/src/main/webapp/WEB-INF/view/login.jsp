<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
    <h1>로그인 페이지</h1>
    오류 : ${param.error}
    <form action="/login" method="post">
        <div>
            <label> ID : <input type="text" name="username"/></label>
        </div>
        <br/>
        <div>
            <label> Password : <input type="password" name="password"/></label>
        </div>
        <br>
        <div>
            <input type="submit" value="Sing In"/>
        </div>
    </form>
</body>
</html>