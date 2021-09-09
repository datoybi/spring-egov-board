
function login() {
	let loginForm = document.getElementById("loginForm");
	
	if(loginForm.userId.value == '') { 
		alert('아이디를 입력하세요');
		loginForm.userId.focus();
		return false;
	} else if(loginForm.password.value == ''){
		alert('비밀번호를 입력하세요');
		loginForm.password.focus();
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
