function add() {
	location.href = "/board_test/write.do";
}

function login() {
	let loginForm = document.getElementById("loginForm");
	
	if(loginForm.loginid.value == '') { 
		alert('아이디를 입력하세요');
		loginForm.loginid.focus();
		return false;
	} else if(loginForm.loginpwd.value == ''){
		alert('비밀번호를 입력하세요');
		loginForm.loginpwd.focus();
		return false;
	} else {
		loginForm.submit();
	}
	
}

function list() {
	location.href = "/board_test/list.do";
}

function logout() {
	let check = confirm("로그아웃 하시겠습니까?");
	if(check == true) {
		location.href="/board_test/logout.do";
	} 
}
