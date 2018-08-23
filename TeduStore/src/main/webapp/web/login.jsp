<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>學子商城登陸頁面</title>
    <link href="../css/header.css" rel="stylesheet"/>
    <link href="../css/footer.css" rel="stylesheet"/>
    <link href="../css/animate.css" rel="stylesheet"/>
    <link href="../css/login.css" rel="stylesheet"/>
</head>
<body>
<!-- 頁面頂部-->
<header id="top">
    <div class="top">
        <img src="../images/header/logo.png" alt=""/>
        <span>歡迎登錄</span>
    </div>
</header>
<div id="container">
    <div id="cover" class="rt">
        <form id="login-form" method="post" name="form1">
            <div class="txt">
                <p>
					登錄學子商城<span><a href="../user/showRegister.do">新用戶註冊</a></span>
                </p>
                <div class="text">
                    <input type="text" placeholder="請輸入您的用戶名" name="lname" id="username" required>
                    <span><img src="../images/login/yhm.png"></span>
                </div>
                
                <div class="text">
                    <input type="password" id="password" placeholder="請輸入您的密碼" name="lwd" required minlength="6" maxlength="15">
                    <span><img src="../images/login/mm.png"></span>
                </div>
                <div class="chose">
                    <input type="checkbox" class="checkbox" id="ck_rmbUser">自動登錄
                    <span>忘記密碼？</span>
                </div>
                <input class="button_login" type="button" value="登錄" id="bt-login"/>
            </div>
        </form>
    </div>
</div>
<!--錯誤提示-->
<div id="showResult"></div>
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
                <li><a href="#">關於達內</a></li>
                <li><a href="#">聯系我們</a></li>
                <li>
                    <img src="../images/footer/wechat.png" alt=""/>
                    <img src="../images/footer/sinablog.png" alt=""/>
                </li>
            </ul>
        </div>
        <div class="service">
            <p>學子商城客戶端</p>
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
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../jquery/jquery.cookie.js"></script>
<script>
    $("#username").blur(function(){
        var data = $("#username").val();
        if (data == null || data == "") {
            $("#showResult").text("用戶名不能為空！");
            $("#showResult").css("color","red");
            return false;
        }
        
    });
</script>
<script>
    $('#bt-login').click(function(){
    	
        $.ajax({
        	url:"../user/login.do",
        	data:"username="+$("#username").val()+
        	      "&password="+$("#password").val(),
        	type:"post",
        	dataType:"json",
        	success:function(obj){
        		//顯示錯誤信息
        		if(obj.state==0){
        			//設置錯誤信息
        			$("#showResult").html(obj.message);
        			//給錯誤信息的 文本設置為red
        			$("#showResult").css("color","red");
        		}else{
        			//清空錯誤信息
        			$("#showResult").html("");
        			Save();
        			//顯示首頁
        			location.href='../main/showIndex.do';
        		}
        	}
        });
        
		
    });
</script>
<script type="text/javascript">

    $(document).ready(function () {
        if ($.cookie("rmbUser") == "true") {
            $("#ck_rmbUser").attr("checked", true);
            $("#username").val($.cookie("username"));
            $("#password").val($.cookie("password"));
        }
    });

    //記住用戶名密碼
    function Save() {
    	//prop()表示判斷覆選框是否被選中。值是 true和false
        if ($("#ck_rmbUser").prop("checked")) {
            var str_username = $("#username").val();
            console.log(str_username);
            var str_password = $("#password").val();
            $.cookie("rmbUser", "true", { expires: 7 }); //存儲一個帶7天期限的cookie
            $.cookie("username", str_username, { expires: 7 });
            $.cookie("password", str_password, { expires: 7 });
        }
        else {
            $.cookie("rmbUser", "false", { expire: -1 });
            $.cookie("username", "", { expires: -1 });
            $.cookie("password", "", { expires: -1 });
        }
    };
</script>
</body>
</html>