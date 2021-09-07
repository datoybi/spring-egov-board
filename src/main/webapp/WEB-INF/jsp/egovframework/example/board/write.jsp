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
<script language="javascript" defer="defer" src="<c:url value='/js/board.js'/>"></script>
<title>write</title>
<script type="text/javaScript" language="javascript" defer="defer">

function newPost() {
	let form = document.getElementById("writeForm");
	if(form.title.value == '') { 
		alert('제목을 입력하세요');
		form.title.focus();
		return false;
	} else if(form.contents.value == ''){
		alert('내용을 입력하세요');
		form.contents.focus();
		return false;
	} else {
		form.action = "<c:url value='/write.do'/>?mode=write";
		form.submit();
	}
}

function updatePost() {
	let form = document.getElementById("writeForm");
	if(form.title.value == '') { 
		alert('제목을 입력하세요');
		form.title.focus();
		return false;
	} else if(form.contents.value == ''){
		alert('내용을 입력하세요');
		form.contents.focus();
		return false;
	} else {
		form.action = "<c:url value='/write.do'/>?mode=update";
		form.submit();
	}
}


</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>Egov 게시판 - 작성/수정</h2><br>
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
		<form id="writeForm" method="post">
		<input type="hidden" id="idx" value="${result.idx}" name="idx"/>
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">제목</span>
		    </div>
		    <input type="text" class="form-control" id="title" name="title" value="${result.title}"> 
		  </div>
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">작성자</span>
		    </div>
		    <input type="text" class="form-control" value="${sessionScope.userName}" disabled>
		    <input type="hidden" value="${sessionScope.loginid}" id="writer" name="writer">
		  </div>
		  <div class="input-group mb-3" style="height:300px">
		    <div class="input-group-prepend">
		      <span class="input-group-text">내용</span>
		    </div> 
		    <textarea class="form-control" style="height:300px" id="contents" name="contents">${result.contents}</textarea>
		  </div>
		  <c:if test="${not empty result.idx}">
		  	<button class="btn btn-primary" type="button" onclick="updatePost()">수정</button>
		  </c:if>
		  <c:if test="${empty result.idx}">
  		  	<button class="btn btn-primary" type="button" onclick="newPost()">작성</button>
		  </c:if>
	  		<button class="btn btn-danger" type="button" onclick="list()">취소</button>
		</form>
		
	</div>
	</body>
</html>