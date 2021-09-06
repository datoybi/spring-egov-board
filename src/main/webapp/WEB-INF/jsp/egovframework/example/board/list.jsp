<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/board.css'/>"/>
<script language="javascript" defer="defer" src="<c:url value='/js/board.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>board list</title>
<script type="text/javaScript" language="javascript" defer="defer">

	$(document).ready(function() {
		<c:if test="${loginMsg == false}">
			alert("아이디, 비밀번호가 유효하지 않습니다.");
		</c:if>
	})
	
</script>
</head>
<body>
<h1>${loginid} ${userName}</h1>
<h2>${loginMsg}</h2>
	<div class="container">
		<div class="jumbotron">
			<h2>Egov 게시판 - 목록</h2><br>
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
		<form class="form-inline" id="searchForm" method="post" action="<c:url value='/list.do'/>">
		    <input type="text" class="form-control" id="searchKeyword" width="33%" placeholder="검색어를 입력하세요" name="searchKeyword">
			<button type="submit" class="btn btn-outline-primary">검색</button>
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
			<c:forEach var="result" items="${resultList}" varStatus="status">
		  		<tr>
			      <th scope="row">${status.count}</th>
			      <td><a href="<c:url value='/detail.do?idx=${result.idx}'/>">${result.title}</a></td>
			      <td>${result.writer}</td>
	   		      <td><fmt:formatDate value="${result.indate}" pattern="yyyy.MM.dd" /></td>	      
			      <td>${result.count}</td>
		    	</tr>
		  	</c:forEach>
		  </tbody>
		</table>
		<c:if test ="${not empty loginid && not empty userName}">
			<button type="button" class="btn btn-primary" onclick="add()">글 작성</button>
		</c:if>
	</div>
</body>
</html>