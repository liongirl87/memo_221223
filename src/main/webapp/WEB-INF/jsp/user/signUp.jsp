<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="mb-4">회원가입</h1>
		<form id="signUpForm" method="post" action="/user/sign_up">
			<table class="sign-up-table table table-bordered">
				<tr>
					<th>* 아이디(4자 이상)<br></th>
					<td>
						<%-- 인풋박스 옆에 중복확인을 붙이기 위해 div를 하나 더 만들고 d-flex --%>
						<div class="d-flex">
							<input type="text" id="loginId" name="loginId" class="form-control col-9" placeholder="아이디를 입력하세요.">
							<button type="button" id="loginIdCheckBtn" class="btn btn-success">중복확인</button><br>
						</div>
						
						<%-- 아이디 체크 결과 --%>
						<%-- d-none 클래스: display none (보이지 않게) --%>
						<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
						<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
						<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
					</td>
				</tr>
				<tr>
					<th>* 비밀번호</th>
					<td><input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<th>* 비밀번호 확인</th>
					<td><input type="password" id="confirmPassword" class="form-control" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<th>* 이름</th>
					<td><input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요."></td>
				</tr>
				<tr>
					<th>* 이메일</th>
					<td><input type="text" id="email" name="email" class="form-control" placeholder="이메일 주소를 입력하세요."></td>
				</tr>
			</table>
			<br>
		
			<button type="submit" id="signUpBtn" class="btn btn-primary float-right">회원가입</button>
		</form>
	</div>
</div>

<script>
$(document).ready(function(){
	//중복확인 버튼 클릭
	$('#loginIdCheckBtn').on('click',function(){
		
		// 경고 문구 초기화
		$('#idCheckLength').addClass("d-none");
		$('#idCheckDuplicated').addClass("d-none");
		$('#idCheckOk').addClass("d-none");
		let loginId =$('#loginId').val().trim();
		
		// 4자 미만이면 경고 문구 노출
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none');
			return;
		}
		$.ajax({
			// request (get방식으로 보냄)
			url:"/user/is_duplicated_id"
			,data:{"loginId":loginId}
			
			// response
			,success:function(data) {	// call back 함수
				if (data.result) {
					// 중복
					$("#idCheckDuplicated").removeClass("d-none")
				} else {
					// 사용가능
					$("#idCheckOk").removeClass("d-none")
				}
			}
		});
		// 회원가입
		$('#signUpForm').on('submit', function(e){
			e.preventDefault(); // 서브밋 기능 중단
			// validation
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val();
			let confirmPassword = $('#confirmPassword').val();
			let name = $('#name').val().trim();
			let email = $('#email').val().trim();
			
			if (!loginId) {
				alert("아이디를 입력하세요");
				return false;
			}
			if (!password || !confirmPassword) {
				alert("비밀번호를 입력하세요");
			}
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.")
				return false;
			}
			if (!name) {
				alert("이름을 입력하세요.")
				return false;
			}
			if (!email) {
				alert("이메일을 입력하세요");
				return false;
			}
			
			// 아이디 중복확인 완료 됐는지 확인 -> idCheckOk d-none이 있으면 얼럿
			if ($('#idCheckOk').hasClass("d-none")) {
				alert("아이디 중복확인을 다시 해주세요");
				return false;
			}
			
			// 서버로 보내는 방법
			// 1) 서브밋
			/* $(this)[0].submit(); 일반 컨트롤러(화면 이동)*/
			
			// 2) AJAX
			let url = $(this).attr("action");
			console.log(url);
			let params = $(this).serialize(); // 폼태그에 있는 name 속성값들로 파라미터 구성
			
			$.post(url, params)	// request
			.done(function(data){
				//response
				if (data.code == 1) {	// 성공
					alert("가입을 환영합니다! 로그인을 해주세요.");
					location.href = "/user/sign_in_view";
				} else {	// 로직상 실패
					alert(data.errorMessage);
				}
				
			});
		});
	});
});

</script>


<!-- <div class="d-flex align-itmes-center justify-content-center">
	<form method="post" action="/user/sign_in_view">
		<table class="table border-1 mt-3">
			<tr>
				<div class="input-group">
					<th class="back-color"><label for="id">*아이디</label></th>
					<td>
					<input type="text" class="form-control" id="id" name="id">
					</td>
				</div>
			</tr>
			<tr>
				<div class="input-group">
					<th class="back-color"><label for="password">*비밀번호</label></th>
					<td>
					<input type="password" class="form-control" id="password" name="password">
					</td>
				</div>
			</tr>
			<tr>
				<div class="input-group">
					<th class="back-color"><label for="passwordCheck">*비밀번호 확인</label></th>
					<td>
					<input type="password" class="form-control" id="passwordCheck" name="passwordCheck">
					</td>
				</div>
			</tr>
			<tr>
				<div class="input-group">
					<th class="back-color"><label for="name">*이름</label></th>
					<td>
					<input type="password" class="form-control" id="name" name="name">
					</td>
				</div>
			</tr>
			<tr>
				<div class="input-group">
					<th class="back-color"><label for="email">*이메일</label></th>
					<td>
					<input type="password" class="form-control" id="email" name="email">
					</td>
				</div>
			</tr>
		</table>
	
	
	</form>


</div> -->