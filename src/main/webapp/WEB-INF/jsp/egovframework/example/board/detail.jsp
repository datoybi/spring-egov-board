<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/board.css'/>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/board.js'/>"></script>
<title>board detail</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>Egov 게시판 - 상세화면</h2><br>
			 <c:if test ="${empty loginid && empty userName}">
			 	<div class="loginForm">
					<p>로그인</p>
					<form class="form-inline searchForm" id="loginForm" action="<c:url value='/login.do'/>" method="post" onsubmit="login(); return false;">
					    <input type="text" class="form-control" id="loginid" placeholder="아이디를 입력하세요" name="loginid">
					    <input type="password" class="form-control" id="loginpwd" placeholder="비밀번호를 입력하세요" name="loginpwd">
						<button type="submit" class="btn btn-outline-primary">로그인</button>
					</form>
			  	</div>
			</c:if>
			<c:if test ="${not empty loginid && not empty userName}">
				<div class="loginForm">
					<span>${userName} 님이 로그인하셨습니다.</span>
					<button type="button" class="btn btn-sm btn-outline-primary" onclick="logout()">로그아웃</button>
 				</div>	
			</c:if>
		</div>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">1</th>
		      <th scope="col">test1</th>
   		      <th scope="col">관리자</th>
   		      <th scope="col">2021.09.01</th>
   		      <th scope="col">0</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		    	<td colspan="5" style="padding-bottom: 100px;">내용입니다라라라라랄랄내용입니다라라라라랄랄내용입니다라라라라랄랄내용입니다라라라라랄랄내용입니다라라라라랄랄내용입니다라라라라랄랄내용입니다라라라라랄랄내용입니다라라라라랄랄내용입니다라라라라랄랄내용입니다라라라라랄랄</td>
		    </tr>
		  </tbody>
		</table>
		<button type="button" class="btn btn-primary" onclick="list()">목록</button>
		<button type="button" class="btn btn-primary" onclick="add()">수정</button>
		<button type="button" class="btn btn-danger" onclick="">삭제</button>
		
	</div>
</body>
</html>