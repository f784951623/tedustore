<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的訂單 - 達內學子商城</title>
    <link href="../css/orders.css" rel="stylesheet"/>
    <link href="../css/header.css" rel="stylesheet"/>
    <link href="../css/footer.css" rel="stylesheet"/>
    <link href="../css/personage.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../css/icon/css/bootstrap.min.css">
	<link href="../css/icon/css/cropper.min.css" rel="stylesheet">
	<link href="../css/icon/css/sitelogo.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/icon/css/font-awesome.min.css">
</head>
<body>
<!-- 頁面頂部-->
<%@ include file="header.jsp"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav_order">
    <ul>
        <li><a href="">首頁<span>&gt;</span>個人中心</a></li>
    </ul>
</div>
<!--我的訂單內容區域 #container-->
<div id="container" class="clearfix">
    <!-- 左邊欄-->
   <%@ include file="left.jsp" %>
    <!-- 右邊欄-->
    <!--個人信息頭部-->
    <div class="rightsidebar_box rt">
        <div class="rs_header">
            <span class="rs_header_active"><a href="../user/showPersonPage.do">我的信息</a></span>
            <span><a href="../user/showPassword.do">安全管理</a></span>
        </div>

        <!--個人信息具體內容 -->
        <div class="rs_content">
            <!--頭像-->
            <div class="rs_content_headPortrait">
	                <span class="same">我的頭像：</span>
	                <img src="../images/personage/touxiang.png" alt="" id="icon" width="50px" height="50px"/>
	                <input type="hidden" name="iconPic" value="" id="iconPic">
	                <span class="change_headPortrait same_click" data-toggle="modal" data-target="#avatar-modal" >更改頭像</span>
	            </div>
				<form id="person-form" action="">
					<!--用戶名-->
					<div class="rs_content_username">
						<span class="same">用戶名：</span> <span class="same rs_username">${user.username}</span>
						<input class="ed_username" value="${user.username}" style="display: none;" name="username"id="username"/> <span
							class="change_username same_click">更改用戶名</span>
					</div>
					<!--性別-->
					<div class="rs_content_sex">
						<span class="same" >性別：</span> 
						<span class="man selected" style="display: none;"> <img
							src="../images/personage/select.png" alt="" />男
						</span> 
						<span class="women" style="display: none;"> <img
							src="../images/personage/un_select.png" alt="" />女
						</span>
						<input type="radio" name="gender" id="gender" value="0" checked="
						<c:if test="${user.gender==0}">
							checked
						</c:if>
						">男
						<input type="radio" name="gender" id="gender1" value="1" checked="
						<c:if test="${user.gender==1}">
							checked
						</c:if>
						">女
						
					</div>
					<!--綁定電話-->
					<div class="rs_content_tel">
						<span class="same">綁定電話：</span> 
						<input type="text" value="${user.phone}" name="phone" id="phone" >
					</div>
					<!--綁定郵箱-->
					<div class="rs_content_mail">
						<span class="same">綁定郵箱：</span> 
						<input class="ed_email" value="${user.email}" name="email" id="email"
							style="display: none;" /> <span class="rs_mail">${user.email}</span>
						<span class="same_click change_mail">更改郵箱</span>
					</div>
					<!--保存按鈕-->
					<div class="save" onclick="bt_update()">保存更改</div>
				</form>
			</div>
    </div>
</div>
<!-- 頭像插件 -->
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1"> 
    <div class="modal-dialog modal-lg"> 
        <div class="modal-content"> 
            <!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">--> 
            <form class="avatar-form"> 
                <div class="modal-header"> 
                    <button class="close" data-dismiss="modal" type="button">×</button> 
                    <h4 class="modal-title" id="avatar-modal-label">上傳圖片</h4> 
                </div> 
                <div class="modal-body"> 
                    <div class="avatar-body"> 
                        <div class="avatar-upload"> 
                            <input class="avatar-src" name="avatar_src" type="hidden"> 
                            <input class="avatar-data" name="avatar_data" type="hidden"> 
                            <label for="avatarInput" style="line-height: 35px;">圖片上傳</label> 
                            <button class="btn btn-info"  type="button" style="height: 35px;" onClick="$('input[id=avatarInput]').click();">請選擇圖片</button> 
                            <span id="avatar-name"></span> 
                            <input class="avatar-input hide" id="avatarInput" name="avatar_file" type="file"></div> 
                        <div class="row"> 
                            <div class="col-md-9"> 
                                <div class="avatar-wrapper"></div> 
                            </div> 
                            <div class="col-md-3"> 
                                <div class="avatar-preview preview-lg" id="imageHead"></div> 
                                <!--<div class="avatar-preview preview-md"></div> 
                        <div class="avatar-preview preview-sm"></div>--> 
                            </div> 
                        </div> 
                        <div class="row avatar-btns"> 
                            <div class="col-md-4"> 
                                <div class="btn-group"> 
                                    <button class="btn btn-info fa fa-undo" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"> 向左旋轉</button> 
                                </div> 
                                <div class="btn-group"> 
                                    <button class="btn  btn-info fa fa-repeat" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"> 向右旋轉</button> 
                                </div> 
                            </div> 
                            <div class="col-md-5" style="text-align: right;">                                 
                                <button class="btn btn-info fa fa-arrows" data-method="setDragMode" data-option="move" type="button" title="移動"> 
                                <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper("setDragMode", "move")"> 
                                </span> 
                              </button> 
                              <button type="button" class="btn btn-info fa fa-search-plus" data-method="zoom" data-option="0.1" title="放大圖片"> 
                                <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper("zoom", 0.1)"> 
                                  <!--<span class="fa fa-search-plus"></span>--> 
                                </span> 
                              </button> 
                              <button type="button" class="btn btn-info fa fa-search-minus" data-method="zoom" data-option="-0.1" title="縮小圖片"> 
                                <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper("zoom", -0.1)"> 
                                  <!--<span class="fa fa-search-minus"></span>--> 
                                </span> 
                              </button> 
                              <button type="button" class="btn btn-info fa fa-refresh" data-method="reset" title="重置圖片"> 
                                    <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper("reset")" aria-describedby="tooltip866214"> 
                               </button> 
                            </div> 
                            <div class="col-md-3"> 
                                <button id="button_save" class="btn btn-info btn-block avatar-save fa fa-save" type="button" data-dismiss="modal"> 保存修改</button> 
                            </div> 
                        </div> 
                    </div> 
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
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../js/index.js"></script>
<script src="../js/jquery.page.js"></script>
<script type="text/javascript" src="../js/orders.js"></script>
<script type="text/javascript" src="../js/personal.js"></script>
<script src="../js/icon/bootstrap.min.js"></script>
<script src="../js/icon/cropper.js"></script>
<script src="../js/icon/sitelogo.js"></script>
<script src="../js/icon/html2canvas.min.js" type="text/javascript" charset="utf-8"></script> 
<script type="text/javascript"> 
//做個下簡易的驗證  大小 格式  
    $('#avatarInput').on('change', function(e) {
        var filemaxsize = 1024 * 5;//5M 
        var target = $(e.target); 
        var Size = target[0].files[0].size / 1024; 
        if(Size > filemaxsize) { 
            alert('圖片過大，請重新選擇!'); 
            $(".avatar-wrapper").childre().remove; 
            return false; 
        } 
        if(!this.files[0].type.match(/image.*/)) { 
            alert('請選擇正確的圖片!') 
        } else { 
            var filename = document.querySelector("#avatar-name"); 
            var texts = document.querySelector("#avatarInput").value; 
            var teststr = texts; //你這裏的路徑寫錯了 
            testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的 
            filename.innerHTML = testend; 
        } 
     
    }); 
 
    $(".avatar-save").on("click", function() { 
        var img_lg = document.getElementById('imageHead'); 
        // 截圖小的顯示框內的內容 
        html2canvas(img_lg, { 
            allowTaint: true, 
            taintTest: false, 
            onrendered: function(canvas) { 
                canvas.id = "mycanvas"; 
                //生成base64圖片數據 
                var dataUrl = canvas.toDataURL("image/png"); 
                var newImg = document.createElement("img"); 
                newImg.src = dataUrl; 
                imagesAjax(dataUrl) 
            } 
        }); 
    }) 
    function imagesAjax(src) { 
        var data = {}; 
        data.img = src; 
        $.ajax({ 
            url: "", 
            data: data, 
            type: "POST", 
            dataType: 'json', 
            success: function(re) {
            	if (re) {
	                if(re.status == 200) {
	                    $('#icon').attr('src',re.data.url );
	                    $('#iconPic').val(re.data.url);
	                }else {
						alert("上傳失敗")
					} 
					
				}
            } 
        });
    } 
</script>
<script type="text/javascript">
$("#icon").click(function() {
	window.open($(this).attr("src"));
})
</script> 
<!--<script>
	$(".x").click(function(){
		$(".modal").hide();
	})
	$(".change_headPortrait").click(function(){
		$(".modal").show();
	})
</script>-->
<script type="text/javascript">
	function bt_update(){
	$.ajax({
		url:"../user/updateUser.do",
		data:$("#person-form").serialize(),
		type:"post",
		dataType:"json",
		success:function(obj){
			if(obj.state==0){
				alert(obj.message);
			}else{
				//alert(obj.message);
				//刷新頁面
				location="../user/showPersonPage.do";
			}
		}
	})	
		
	}
</script>
<script>
	$("#button_save").click(function(){
		var url = $("#imageHead img").attr("src");
		$('#icon').attr('src',url);
	})
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