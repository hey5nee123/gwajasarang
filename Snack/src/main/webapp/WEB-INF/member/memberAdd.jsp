<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.button_box{margin:0 auto !important; text-align:center;}
	em.warning{font-style:normal; margin-top:15px; color:red; font-size:14px;}
	div.row{justify-content:space-between; margin:0;}
	#id{flex:0 0 83%;}
	#id_check{flex:0 0 15%; padding:0 15px; font-size:14px; color:#fff; background:#6f6f6f; border:0;}
</style>

<section class="breadcrumb-section set-bg" data-setbg="bootstrap/img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>회원가입</h4>
            <form name="join" action="memberAdd.do">
            	<input type="hidden" name="checked_id" value="" />
	            <div class="checkout__input">
	                <p>아이디<span>*</span></p>
	                <div class="row">
	                	<input type="text" id="id" name="id" autofocus="autofocus">
	                	<button type="button" id="id_check">아이디 중복체크</button>
	                </div>
	                <em></em>
	                <i></i>
	            </div>
	            <div class="checkout__input">
	                <p>비밀번호<span>*</span></p>
	                <input type="password" id="pw" name="pw">
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>비밀번호 확인<span>*</span></p>
	                <input type="password" id="pwok" name="pwok">
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>이름<span>*</span></p>
	                <input type="text" id="name" name="name">
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>연락처<span>*</span></p>
	                <input type="text" id="phone" name="phone">
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>주소<span>*</span></p>
	                <input type="text" id="address" name="address">
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>이메일</p>
	                <input type="text" id="email" name="email">
	            </div>
	            <div  class="button_box">            
		            <button type="submit" id="addBtn" class="site-btn btn-lg">회원가입</button>
	            </div>
            </form>
        </div>
    </div>
</section>

<script>
$("input").on('blur', emptyCheck)

function emptyCheck(){
	if(event.target.id == "email"){
		return;
	}
	if(event.target.value == ''){
		$(this).parents('.checkout__input').find('em').html("필수입력값입니다.").addClass('warning');
		event.target.focus();
	} else{
		$(this).parents('.checkout__input').find('em').html("");
	}
}

$('#pwok').on('blur', function(){
	if($("#pw").val() != $("#pwok").val()){
		$(this).parents('.checkout__input').find('em').html("비밀번호가 맞지 않습니다").addClass('warning');
		$(this).val("");
		$(this).focus();
	}
})

$("#id_check").on('click', idCheck);
function idCheck(){
	const input = $('#id').val()
	console.log(input)
	// const id_ok = true;
	fetch('memberAddJson.do?id=' + input, { 
		method: 'get',
		headers: {'Content-Type': "application/json"},
	}) 
	.then(result => result.json())
    .then(result => {
		console.log(result);	    	
	 /*    $(result).each((idx, res) => {
	    	if($("#id").val() == res.id){
	    		id_ok = false;
	    	}
			console.log(res);
	    }) */
    	if(result == false){
	    	$("#id").parents('.checkout__input').find('em').html("사용가능한 아이디입니다.").addClass('warning');
	    	$("input[name='checked_id']").val('y');
	    } else {
	    	$("#id").parents('.checkout__input').find('em').html("아이디값 중복입니다.").addClass('warning');	
	    }
	   
    })
    .catch(err => console.log(err));
}

$("#addBtn").on('click', function() {
	if($("input[name='checked_id']").val() == ""){
		alert("아이디 중복체크를 해주세요.");
		$('#id').focus();
		return false;
    } 
})
</script>