<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的訂單 - 達內學子商城</title>
    <link href="../css/orders.css" rel="Stylesheet"/>
    <link href="../css/header.css" rel="Stylesheet"/>
    <link href="../css/footer.css" rel="Stylesheet"/>
    <link href="../css/personage.css" rel="stylesheet" />
</head>
<body>
<!-- 頁面頂部-->
<%@ include file="header.jsp"%>
<!-- 我的訂單導航欄-->
<!--我的訂單內容區域 #container-->
<div id="container" class="clearfix">
    <!-- 左邊欄-->
	<%@ include file="left.jsp" %>
    <!-- 右邊欄-->
    <!--個人信息頭部-->
    <div class="rightsidebar_box rt">
        <div class="rs_header">
            <span >
            	<a href="../user/showPersonPage.do">我的信息</a>
            </span>
            <span class="rs_header_active">
          		<a href="../user/showPassword.do">安全管理</a>
            </span>
        </div>

        <!--安全管理 -->
        <div class="rs_content">
            <p class="change_password_title">更改密碼</p>
            <div class="new_password">
                <span class="word">輸入舊密碼：</span><input type="password" id="oldPwd"/><span class="change_hint" id="oldPwdSpan"></span>
            </div>
            <div class="new_password">
                <span class="word">輸入新密碼：</span><input type="password" id="newPwd"/><span class="change_hint" id="newPwdSpan"></span>
            </div>
            <div class="confirm_password">
                <span class="word">確認新密碼：</span><input type="password" id="confirmPwd"/><span class="confirm_hint" id="confirmPwdSpan"></span>
            </div>
            <div class="save_password" onclick="changePassword()">
                保存更改
            </div>
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
             <p class="footer2"><img src="../images/footer/footerFont.png" alt=""/></p>
        </div>
        <div class="foot_left lf">
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
</body>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/index.js"></script>
<script src="../js/jquery.page.js"></script>
<script type="text/javascript" src="../js/orders.js"></script>
<script type="text/javascript">
	//驗證密碼必須在6-8之間
	function checkPasswordLength(pwd){
		return pwd.length>=6&&pwd.length<=9;
	}
	//驗證密碼與新密碼相不相同
	function checkPasswordSame(){
		var newPwdValue = $("#newPwd").val();
		var confirmPwdValue = $("#confirmPwd").val();
		/*if(newPwdValue==confirmPwdValue){
			return trun;
		}else{
			return false;
		}*/
		return newPwdValue==confirmPwdValue;
	}
	$("#confirmPwd").blur(
			function(){
		if(checkPasswordSame()){
			$("#confirmPwdSpan").html("確認密碼與新密碼相同");
			$("#confirmPwdSpan").css("color","green");
		}else{
			$("#confirmPwdSpan").html("確認密碼與新密碼錯誤");
			$("#confirmPwdSpan").css("color","red");
		}
	});
	$("#oldPwd").blur(
		function(){
		var oldPwdValue= $("#oldPwd").val();
		if(checkPasswordLength(oldPwdValue)){
			$("#oldPwdSpan").html("密碼長度正確");
			$("#oldPwdSpan").css("color","green");
		}else{
			$("#oldPwdSpan").html("密碼長度應在6-9位之間");
			$("#oldPwdSpan").css("color","red");	
		}
	});
	
	$("#newPwd").blur(
			function(){
			var newPwdValue= $("#newPwd").val();
			if(checkPasswordLength(newPwdValue)){
				$("#newPwdSpan").html("密碼長度正確");
				$("#newPwdSpan").css("color","green");
			}else{
				$("#newPwdSpan").html("密碼長度應在6-9位之間");
				$("#newPwdSpan").css("color","red");	
			}
		});
	//密碼更改
	
	function changePassword(){
		var oldPwdVal=$("#oldPwd").val();
		var newPwdVal=$("#newPwd").val();
		//滿足js驗證成功
		if(checkPasswordLength(oldPwdVal)&&
				checkPasswordLength(newPwdVal)&&
				checkPasswordSame()){

			$.ajax({
				url:"../user/updatePassword.do",
				data:"oldPwd="+oldPwdVal+"&newPwd="+newPwdVal,
				type:"post",
				dateType:"json",
				success:function(obj){
					//如果有異常，顯示錯誤信息
					if(obj.state==0){
						$("#oldPwdSpan").html(obj.message);
						$("#oldPwdSpan").css("color","red");
					}else{
						//沒有錯誤，跳轉到login畫面
						location="../user/showLogin.do";
					}
				}
			});
			
		}else{
			alert("請填寫正確密碼");
		}
		
	}
</script>
<script type="text/javascript">
	//處理側邊攔
	$(function(){
		//表示4個標題的列表項全部隱藏
	    $("#leftsidebar_box dd").hide();
		//安全管理的列表項顯示
	    $("#leftsidebar_box .count_managment dd").show();
		//表示4個標題的圖片全部設置為myOrder2.png
	    $("#leftsidebar_box dt img").attr("src","../images/myOrder/myOrder2.png");
		//帳號管理的圖片設置為myOrder1.png
        $("#leftsidebar_box .count_managment dd").find('img').attr("src","../images/myOrder/myOrder1.png");
	})
</script>

</html>