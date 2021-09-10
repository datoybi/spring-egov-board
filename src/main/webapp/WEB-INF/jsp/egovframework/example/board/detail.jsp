<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	pageContext.setAttribute("replaceChar", "\n"); // br
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/board.css?ver=1'/>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/board.js'/>"></script>
<title>board detail</title>
<script type="text/javaScript" language="javascript" defer="defer">

	function updatePost() {
		location.href = "/board_test/write.do?idx=${result.idx}";
	}
	
	function deletePost() {
		location.href = "/board_test/write.do?idx=${result.idx}";
	}
	
	function deletePost() {
		let form = document.getElementById("form1");
		let delConfirm = confirm("정말로 삭제하시겠습니까?");
		if(delConfirm == true){
			form.action = "/board_test/write.do?idx=${result.idx}&mode=delete";
			form.submit();
		} 
	}
	
	function writeReply() {
		let form = document.getElementById("replyForm");
		
		if(form.replyWriter.value == '') {
			alert("작성자를 입력하세요");
			form.replyWriter.focus();
		} else if(form.reply.value == ''){
			alert("내용을 입력하세요");
			form.reply.focus();
		}
		form.action = "/board_test/reply.do?idx=${result.idx}&mode=write";
		form.submit();
	}
	
	function replyUpdate(id) {
	
		let fullid = "#ReplyContents" + id;
		$(fullid).hide();
	 
		var newForm = $('<form></form>'); //set attribute (form) 
		newForm.attr("name","newForm"); 
		newForm.attr("method","post"); 
		newForm.attr("action","/board_test/reply.do?idx=${result.idx}&mode=update&seq="+id); 
		newForm.append($('<textarea/>', {type: 'text', name: 'reply', value:'reply', style: 'width: 100%; height: 100px; margin-bottom: 10px;', text: $(fullid +"> p").text() })); 
		newForm.append($('<button/>', {class: 'btn btn-sm btn-outline-primary', text: '수정', value:'submit'})); 
		newForm.append($('<button/>', {class: 'btn btn-sm btn-outline-primary', style: 'margin-left: 10px', text: '취소' })); 	
		newForm.appendTo($('#cardBody'+id)); 
	}

	function replyDelete(id) {	
		
		let delConfirm = confirm("정말로 삭제하시겠습니까?");
		
		if(delConfirm == true){ // 삭제 클릭하면 form과 더불어 seq, idx 보내주기
			var newForm = $('<form></form>');
			newForm.attr("name","newForm"); 
			newForm.attr("method","post"); 
			newForm.attr("action","/board_test/reply.do?idx=${result.idx}&mode=delete&seq="+id); 
			$(document.body).append(newForm);
			newForm.submit();
		}	
	}
	
</script>
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
					<span>${sessionScope.userName} 님이 로그인하셨습니다.</span>
					<button type="button" class="btn btn-sm btn-outline-primary" onclick="logout()">로그아웃</button>
 				</div>	
			</c:if>
		</div>
		<form id="form1" name="form1" method="post" style="padding-bottom: 100px;">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">${result.title}</th>
	   		      <th scope="col">${result.writerName}</th>
	   		      <th scope="col">
	   		      	<fmt:parseDate value='${result.indate}' var='now' pattern="yyyy-MM-dd HH:mm:ss"/>
	   		      <fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></th>
			      <th scope="col">${result.count}</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			    	<td colspan="5" style="padding-bottom: 100px;">${fn:replace(result.contents, replaceChar, "<br/>")}</td>
			    </tr>
			  </tbody>
			</table>
			<c:if test="${result.writer == sessionScope.loginid}">
				<button type="button" class="btn btn-primary" onclick="updatePost()">수정</button>
				<button type="button" class="btn btn-danger" onclick="deletePost()">삭제</button>
			</c:if>
		</form>
		
		<!-- 댓글보기 -->
		<c:forEach var="replyList" items="${replyList}" varStatus="status">
			<div class="card">
			  <div class="card-body" id="cardBody${replyList.seq}">
			    <h5 class="card-title" style="font-weight: bold;">${replyList.writer}</h5>
			    <h6 class="card-subtitle mb-2 text-muted"><fmt:formatDate value="${replyList.indate}" pattern="yyyy년 MM월 dd일 hh시 mm분에 작성" /></h6>
			   <!--  <h6 class="card-subtitle mb-2 text-muted">${replyList.indate}</h6>--> 
			    <div id="ReplyContents${replyList.seq}">			    
				    <p class="card-text">${fn:replace(replyList.reply, replaceChar, "<br/>")} </p>
				    <button class="card-link" id="${replyList.seq}" onclick="replyUpdate(this.id)">수정</button>
	   			    <button class="card-link" id="${replyList.seq}" onclick="replyDelete(this.id)">삭제</button>    
			    </div>
			  </div>
			</div>
 		</c:forEach>
 		
		<!-- 댓글작성 -->
		<div class="jumbotron jumbo_custom">
		<h3>댓글 작성</h3><br>
			<form id="replyForm" name="replyForm" method="post">
				<div class="input-group mb-3">
		      		<div class="input-group-prepend">
		        		<span class="input-group-text">작성자</span>
		      		</div>
		      		<input id="replyWriter" type="text" class="form-control" name="replyWriter" placeholder="작성자를 입력하세요">
		      	</div>
		      	<div class="input-group mb-3">
		      		<div class="input-group-prepend">
		        		<span class="input-group-text">내용</span>
		      		</div>
				    <textarea rows="10" id="reply" name="reply" style="border: 1px solid #ced4da; width:94%"></textarea>
		      	</div>
		      	<button type="button" class="btn btn-info" onclick="writeReply()">댓글작성</button>
			</form>		
		</div>
		<button type="button" class="btn btn-primary" onclick="list()">목록</button>
		
	</div>
</body>
</html>