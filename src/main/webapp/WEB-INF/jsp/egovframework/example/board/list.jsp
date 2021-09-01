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
<title>board list</title>
<script>
	function add() {
		location.href = "<c:url value='/write.do'/>";
	}
	
	function login() {
		alert("ok");
	// action="<c:url value='/login().do'/>"
	
	}

</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>Egov 게시판 - 목록</h2><br>
			<div class="loginForm">
				<p>로그인</p>
				<form class="form-inline searchForm" id="loginForm" method="post" onsubmit="login()">
				    <input type="text" class="form-control" id="email" placeholder="아이디를 입력하세요" name="id">
				    <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="password">
					<button type="submit" class="btn btn-outline-primary">로그인</button>
				</form>
		  </div>
		</div>
		<form class="form-inline" class="searchForm" action="">
		    <input type="text" class="form-control" id="search" width="33%" placeholder="검색어를 입력하세요" name="search">
			<button type="button" class="btn btn-outline-primary">검색</button>
		</form>
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th style="width:30%" scope="col">제목</th>
   		      <th scope="col">작성자</th>
   		      <th scope="col">작성일</th>
   		      <th scope="col">조회수</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td><a href="<c:url value='/detail.do'/>">test1</a></td>
		      <td>관리자</td>
   		      <td>2021.09.01</td>	      
		      <td>0</td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>test2</td>
		      <td>윤다솜</td>
   		      <td>2021.09.01</td>	      
		      <td>0</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		       <td>test3</td>
		      <td>사용자</td>
   		      <td>2021.09.01</td>	      
		      <td>0</td>
		    </tr>
		  </tbody>
		</table>
		<button type="button" class="btn btn-primary" onclick="add()">글 작성</button>
	</div>
</body>
</html>