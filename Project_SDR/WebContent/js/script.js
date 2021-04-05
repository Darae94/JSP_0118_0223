// register - 회원가입 관련
var isIdChecked = false; // 중복체크 확인여부
var isIdChanged = true; // 아이디 변경여부
var isChanged = true;

function writeSave() {
	if(f.id.value == "") {
		alert("아이디를 입력하세요!");
		f.id.focus();
		return false;
	}

	var regex = /^[a-z0-9_]{3,12}$/; //영문소문자, 숫자, _ 포함하여 3~12자리 사용 가능
	
	if(f.id.value.search(regex) == -1) {
		alert('잘못된 형식입니다.');
		f.id.select();
		return false;
	}
	
	if(!isIdChecked) {
		alert("아이디 중복체크는 필수입니다.");
		return false;
	}
	
	if(!isIdChanged) {
		alert("사용 중인 아이디입니다.");
		f.id.select();
		return false;
	}
	
	if(f.pw.value == "") {
		alert("비밀번호를 입력하세요!");
		f.pw.focus();
		return false;
	}
	
	if(f.pw.value.search(regex) == -1) {
		alert('잘못된 형식입니다.');
		f.pw.select();
		return false;
	}
	
	if(f.repw.value == "") {
		alert("비밀 번호 확인을 입력하세요!");
		f.repw.focus();
		return false;
	}
	
	if(!isChanged) {
		alert("비밀번호 불일치입니다.");
		f.repw.select();
		return false;
	}
	
	regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	if(f.email.value.search(regex) == -1) {
		alert('잘못된 형식입니다.');
		f.email.select();
		return false;
	}
}

$(function() {
	//alert(1);
	$("input[name='id']").keydown(function() {
		$("#idmessage").html("");
		isIdChanged = true;
		isIdChecked = false;
	});
	
	$("#repw").keyup(function() {
		if($("input[name='pw']").val() == $(this).val()) {
			$("#pwmessage").html("<font color=gray>비밀번호 일치합니다.</font>");
			isChanged = true;
		} else {
			$("#pwmessage").html("<font color=red>비밀번호 불일치입니다.</font>");
			isChanged = false;
		}
	});
});


function duplicate() {
	isIdChecked = true;
	
	if($("input[name='id']").val() == "") {
		alert("아이디를 입력하세요!");
		$("input[name='id']").focus();
		return false;
	}
	
	$.ajax({
		url : 'id_check_proc.jsp',
		data : {input_id: $("input[name='id']").val()},
		success: function(data) {
			//alert(data);
			if($.trim(data) == "true") {
				$("#idmessage").html("<font color=gray>사용 가능한 아이디입니다.</font>");
			} else {
				$("#idmessage").html("<font color=red>사용 불가능한 아이디입니다.</font>");
				isIdChanged = false;
			}
		}
	})
}

function deleteCheck(no) {
	//alert(no);
	var flag = confirm(no+"번 회원을 삭제하시겠습니까?");
	if(flag) {
		location.href="../member/delete.jsp?no="+no;
	}
}

function deleteLecture(num) {
	//alert(no);
	var flag = confirm(num+"번 강의를 삭제하시겠습니까?");
	if(flag) {
		location.href="../lecture/delete.jsp?num="+num;
	}
}

function lecAddStu(num, name, teacher) {
	//alert(name+","+teacher);
	var flag = confirm(name+"("+teacher+") 강의를 수강하시겠습니까?");
	if(flag) {
		location.href="../lecture/addStu.jsp?num="+num;
	}
}

function writeSaveJquery() {
	if($("input[name='pw']").val() == "") {
		alert("비밀번호를 입력하세요!");
		$("input[name='pw']").focus();
		return false;
	}
	
	if($("input[name='name']").val() == "") {
		alert("강의명을 입력하세요!");
		$("input[name='name']").focus();
		return false;
	}
	
	if($("input[name='lec_date1']").val() == "") {
		alert("강의 시작 기간 입력하세요!");
		$("input[name='lec_date1']").focus();
		return false;
	}
	
	if($("input[name='lec_date2']").val() == "") {
		alert("강의 종료 기간 입력하세요!");
		$("input[name='lec_date2']").focus();
		return false;
	}
	
	if($("input[name='lec_date1']").val() > $("input[name='lec_date2']").val()) {
		alert("강의 시작 기간을 강의 종료 기간 전으로 입력하세요!");
		$("input[name='lec_date1']").focus();
		return false;
	}
	
	if($("select[name='time1']").val() > $("select[name='time2']").val()) {
		alert("강의 시작 시간을 강의 종료 시간 전으로 입력하세요!");
		$("select[name='time1']").focus();
		return false;
	}
	
	if($("textarea[name='context']").val() == "") {
		alert("강의 내용을 입력하세요!");
		$("input[name='context']").focus();
		return false;
	}
	
	if($("input[name='subject']").val() == "") {
		alert("제목을 입력하세요!");
		$("input[name='subject']").focus();
		return false;
	}
	
	if($("textarea[name='content']").val() == "") {
		alert("내용을 입력하세요!");
		$("input[name='content']").focus();
		return false;
	}
}

function deleteBoard(num, page) {
	//alert(no);
	var flag = confirm(num+"번 공지를 삭제하시겠습니까?");
	if(flag) {
		location.href="../board/delete.jsp?num="+num+"&pageNum="+page;
	}
}

function deleteMsg(num) {
	//alert(no);
	var flag = confirm(num+"번 메시지를 삭제하시겠습니까?");
	if(flag) {
		location.href="../messenger/delete.jsp?num="+num;
	}
}

function review() {
	//alert("댓글을 작성합니다.");
	$.ajax({
		url : 'addReview.jsp',
		data : ({
			num: $("input[name='num']").val(),
			re_writer: $("input[name='re_writer']").val(),
			re_content: $("input[name='re_content']").val()
		}),
		success : function(data) {
			//alert(data);
			$("#noreview").remove();
			if($.trim(data) != "no") {
				$("#tbl").append("<tr><td colspan=2 style='text-align:center'>"+data+"</td></tr>");
			}
		}
	})
}

