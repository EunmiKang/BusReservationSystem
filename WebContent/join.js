/**
 * 
 */
function check() {
	if(joinForm.ID.value == "") {
		alert("아이디를 입력해 주세요.");
		joinForm.ID.focus();
	    return false;
	}
	else if(joinForm.ID.value.length() >= 6) {
		var inputID = joinForm.ID.value;
		if(inputID.substring(0,5) == "ADMIN_") {
			alert("아이디는 'ADMIN_'으로 시작할 수 없습니다.");
			joinForm.ID.focus();
			return false;
		}
	}
	else if(joinForm.PW.value == "") {
		alert("비밀번호를 입력해 주세요.");
		joinForm.PW.focus();
		return false;
	}
	else if(joinForm.nameInput.value == "") {
		alert("이름을 입력해 주세요.");
		joinForm.nameInput.focus();
		return false;
	}
	else if(joinForm.phoneNum.value == "") {
		alert("전화번호를 입력해 주세요.");
		joinForm.phoneNum.focus();
		return false;
	}
	else return true;
}