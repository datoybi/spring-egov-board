<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>write</title>
<script>
	function list() {
		location.href="<c:url value='/list.do'/>";
	}
</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>Egov 게시판 - 작성/수정</h2><br>
			<div class="loginForm">
				<span>뫄뫄님이 로그인하셨습니다.</span>
			<button type="button" class="btn btn-sm btn-outline-primary">로그아웃</button>
		  </div>
		</div>
		<form>
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">번호</span>
		    </div>
		    <input type="text" class="form-control" disabled>
		  </div>
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">제목</span>
		    </div>
		    <input type="text" class="form-control">
		  </div>
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">작성자</span>
		    </div>
		    <input type="text" class="form-control" disabled>
		  </div>
		  <div class="input-group mb-3" style="height:300px">
		    <div class="input-group-prepend">
		      <span class="input-group-text">내용</span>
		    </div> 
		    <textarea class="form-control" style="height:300px"></textarea>
		  </div>
		  	<button class="btn btn-primary" type="button" onclick="write()">작성</button>
	   		<button class="btn btn-danger" type="button" onclick="list()">취소</button>
		</form>
		
		
	</div></body>
</html>