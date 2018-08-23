<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>學子商城註冊頁面</title>
  <link href="../css/header.css" rel="stylesheet"/>
  <link href="../css/footer.css" rel="stylesheet"/>
  <link href="../css/animate.css" rel="stylesheet"/>
  <link href="../css/login.css" rel="stylesheet" />
</head>
<body>
<!-- 頁面頂部-->
<header id="top">
  <div class="top">
    <img src="../images/header/logo.png" alt=""/>
    <span>歡迎註冊</span>
  </div>
</header>
<div class="parent">
  <!--<video src="audio/snow.mp4" width="100%" autoplay loop muted></video>-->
  <div class="container">
    <div class="panel rt">
      <form id="form-register" method="post" action="/register.do">
        <div class="txt">
          <p>新用戶註冊
            <span>
              <a href="../user/showlogin.do">直接登錄</a>
            </span>
          </p>
        </div>
        <div class="form-group">
          <label for="uname">用戶名：</label>
          <input autocomplete required minlength="6" maxlength="9" type="text" placeholder="請輸入用戶名" autofocus name="uname" id="uname"/>
          <span class="msg-default" id="unamespan">用戶名長度在6到9位之間</span>
        </div>
        <div class="form-group">
          <label for="upwd">登錄密碼：</label>
          <input required type="password" minlength="6" maxlength="12" placeholder="請輸入密碼" name="upwd" autofocus id="upwd"/>
          <span class="msg-default hidden">密碼長度在6到12位之間</span>
        </div>
		 <div class="form-group">
          <label for="upwdconfirm">確認密碼：</label>
          <input required type="password" minlength="6" maxlength="12" placeholder="請確認密碼" name="upwdconfirm" autofocus id="upwdconfirm"/>
          <span class="msg-default hidden">密碼長度在6到12位之間</span>
        </div>
        <div class="form-group">
          <label for="email">郵箱：</label>
          <input autocomplete required type="email" placeholder="請輸入郵箱地址" name="email" id="email"/>
          <span class="msg-default hidden" id="emailspan">請輸入合法的郵箱地址</span>
        </div>
        <div class="form-group">
          <label for="phone">手機號：</label>
          <input placeholder="請輸入您的手機號" pattern="(09)+(\d{8})|(\d{10})" required type="text" id="phone" name="phone" />
          <span class="msg-default hidden" id="pgonespan">請輸入合法的手機號</span>
        </div>
        <div class="form-group">
          <label></label>
          <input type="button" value="提交註冊信息" id="bt-register"/>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- 品質保障，私人定制等-->
<div id="foot_box">
  <div class="icon1 lf">
    <img src="../images/footer/icon1.png" alt=""/>

    <h3>品質保障</h3>
  </div>
  <div class="icon2 lf">
    <img src="../images/footer/icon2.png" alt=""/>

    <h3>私人定制</h3>
  </div>
  <div class="icon3 lf">
    <img src="../images/footer/icon3.png" alt=""/>

    <h3>學員特供</h3>
  </div>
  <div class="icon4 lf">
    <img src="../images/footer/icon4.png" alt=""/>

    <h3>專屬特權</h3>
  </div>
</div>
<!-- 頁面底部-->
<div class="foot_bj">
  <div id="foot">
    <div class="lf">
      <p class="footer1"><img src="../images/footer/logo.png" alt="" class=" footLogo"/></p>
      <p class="footer2"><img src="../images/footer/footerFont.png"alt=""/></p>
      
    </div>
    <div class="foot_left lf" >
      <ul>
        <li><a href="#"><h3>買家幫助</h3></a></li>
        <li><a href="#">新手指南</a></li>
        <li><a href="#">服務保障</a></li>
        <li><a href="#">常見問題</a></li>
      </ul>
      <ul>
        <li><a href="#"><h3>商家幫助</h3></a></li>
        <li><a href="#">商家入駐</a></li>
        <li><a href="#">商家後台</a></li>
      </ul>
      <ul>
        <li><a href="#"><h3>關於我們</h3></a></li>
        <li><a href="#">關於達內</li>
        <li><a href="#">聯系我們</a></li>
        <li>
          <img src="../images/footer/wechat.png" alt=""/>
          <img src="../images/footer/sinablog.png" alt=""/>
        </li>
      </ul>
    </div>
    <div class="service">
      <p>商城客戶端</p>
      <img src="../images/footer/ios.png" class="lf">
      <img src="../images/footer/android.png" alt="" class="lf"/>
    </div>
    <div class="download">
      <img src="../images/footer/erweima.png">
    </div>
	<!-- 頁面底部-備案號 #footer -->
      <div class="record">
        &copy;2017 達內集團有限公司 版權所有 京ICP證xxxxxxxxxxx
      </div>
  </div>
</div>
<!--彈出的小廣告-->
<script src="../js/jquery-3.1.1.min.js"></script>
<script>
  $('#bt-register').click(function(){
    var lengths=0;
    $('.form-group').each(function(){
      if($(this).find('span').hasClass('msg-success')){
        lengths++;
      }
    });
    if(lengths==5){
    	$.ajax({
    		url:"../user/register.do",
    		//serialize()表示form表單中的所有組件
    		data:$('#form-register').serialize(),
    		type:"post",
    		dataType:"json",
    		success:function(obj){
    			if(obj.state==0){
    				$('#unamespan').html(obj.message);
    				$('#unamespan').attr('class','msg-error');
    			}else{
    				location="../user/showLogin.do";
    				跳轉至login頁面
    			}
    		}
    	});
    }
    
  })
</script>
<script>
  /*1.對用戶名進行驗證*/
  uname.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '用戶名不能為空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('用戶名不能為空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '用戶名不能少於6位';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('用戶名不能少於6位');
    }else {
      this.nextElementSibling.innerHTML = '用戶名格式正確';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
      var data =document.getElementById("uname").value;
      if(!data){   //用戶沒有輸入任何內容
        return;
      }
      /**發起異步GET請求，詢問服務器用戶名是否已經存在**/
    	$.ajax({
    		url:"../user/checkUsername.do",
    		data:"username="+$("#uname").val(),
    		type:"get",
    		dataType:"json",
    		success:function(obj){
  			  //在span節點中設置顯示訊息
  			  $("#unamespan").html(obj.message);
  			  //如果state為0，設置樣式為msg-error
  			  if(obj.state==0){
  				  $("#unamespan").attr("class","msg-error");
  			  }else{
  				  //如果state為1，設置樣式為msg-success
  				  $("#unamespan").attr("class","msg-success");
  			  }
  		  }
    	});

    }
  }

  uname.onfocus = function(){
    this.nextElementSibling.innerHTML = '用戶名長度在6到9位之間';
    this.nextElementSibling.className = 'msg-default';
  }
  upwd.onfocus = function(){
    this.nextElementSibling.innerHTML = '密碼長度在6到12位之間';
    this.nextElementSibling.className = 'msg-default';
  }
  upwd.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '密碼不能為空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密碼不能為空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '密碼長度在盡量別少於6位';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密碼長度在盡量別少於6位');
    }else {
      this.nextElementSibling.innerHTML = '密碼格式正確';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
    }
  }
  

  upwdconfirm.onfocus = function(){
    this.nextElementSibling.innerHTML = '密碼長度在6到12位之間';
    this.nextElementSibling.className = 'msg-default';
  }
  upwdconfirm.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '密碼不能為空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密碼不能為空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '密碼長度在盡量別少於6位';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密碼長度在盡量別少於6位');
    }else {
      this.nextElementSibling.innerHTML = '密碼格式正確';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
    }
  }
  
  /*3.對郵箱地址進行驗證*/
  email.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '郵箱不能為空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('郵箱不能為空');
    }else if(this.validity.typeMismatch){
      this.nextElementSibling.innerHTML = '郵箱格式不正確';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('郵箱格式不正確');
    }else {
      this.nextElementSibling.innerHTML = '郵箱格式正確';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');

      var data =document.getElementById("email").value;
      if(!data){   //用戶沒有輸入任何內容
        return;
      }
      /**發起異步GET請求，詢問服務器用戶名是否已經存在**/
     
      $.ajax({
  		url:"../user/checkEmail.do",
  		data:"email="+$("#email").val(),
  		type:"get",
  		dataType:"json",
  		success:function(obj){
  			 //在span節點中設置顯示訊息
			  $("#emailspan").html(obj.message);
			  //如果state為0，設置樣式為msg-error
			  if(obj.state==0){
				  $("#emailspan").attr("class","msg-error");
			  }else{
				  //如果state為1，設置樣式為msg-success
				  $("#emailspan").attr("class","msg-success");
			  }
  		}
  	});

    }
  }
  email.onfocus = function(){
    this.nextElementSibling.innerHTML = '請輸入合法的郵箱地址';
    this.nextElementSibling.className = 'msg-default';
  }
  /*3.對手機號進行驗證*/
  phone.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '手機號不能為空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('手機號不能為空');
    }else if(this.validity.patternMismatch){
      this.nextElementSibling.innerHTML = '手機號格式不正確';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('手機號格式不正確');
    }else {
      this.nextElementSibling.innerHTML = '手機號格式正確';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');

      var data =document.getElementById("phone").value;
      if(!data){   //用戶沒有輸入任何內容
        return;
      }
      /**發起異步GET請求，詢問服務器用戶名是否已經存在**/
      $.ajax({
    		url:"../user/checkPhone.do",
    		data:"phone="+$("#phone").val(),
    		type:"get",
    		dataType:"json",
    		success:function(obj){
    			 //在span節點中設置顯示訊息
    			  $("#phonespan").html(obj.message);
    			  //如果state為0，設置樣式為msg-error
    			  if(obj.state==0){
    				  $("#phonespan").attr("class","msg-error");
    			  }else{
    				  //如果state為1，設置樣式為msg-success
    				  $("#phonespan").attr("class","msg-success");
    			  }
    		}
    	});
    }
  }
  phone.onfocus = function(){
    this.nextElementSibling.innerHTML = '請輸入合法的手機號';
    this.nextElementSibling.className = 'msg-default';
  }
</script>
</body>
</html>