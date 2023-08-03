$(document).ready(function() {
	$('#write').on('blur', function() {
		if($('#title').val()==='') {
			alert('제목은 필수입력입니다');
			return;
		}
		if($('#nickname').val()==='') {
			alert('글쓴이는 필수입력입니다');
			return;
		}
		if($('#password').val()==='') {
			alert('비밀번호는 필수입력입니다');
			return;
		}
		$('#write-form').submit();
	})
})