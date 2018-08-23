<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的訂單 - 達內學子商城</title>
    <link href="../css/orders.css" rel="stylesheet"/>
    <link href="../css/header.css" rel="stylesheet"/>
    <link href="../css/footer.css" rel="stylesheet"/>
    <link href="../css/personage.css" rel="stylesheet" />
</head>
<body>
<!-- 頁面頂部-->
<%@ include file="header.jsp"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<!--我的訂單內容區域 #container-->
<div id="container" class="clearfix">
    <!-- 左邊欄-->
     <%@ include file="left.jsp" %>
   <!-- 右邊欄-->
    <div class="rightsidebar_box rt">	
        <!--標題欄-->
        <div class="rs_header">
            <span class="address_title">收獲地址管理</span>
        </div>
        <!--收貨人信息填寫欄-->
        <div class="rs_content">
        	<form id="add_form" method="post" action="">
	            <!--收貨人姓名-->
	            <div class="recipients">
	                <span class="red">*</span><span class="kuan">收貨人：</span><input type="text" name="receiverName" id="receiverName"/>
	            </div>
	            <!--收貨人所在城市等信息-->
	            <div class="address_content">
					 <span class="red">*</span>
					 <span class="kuan">省&nbsp;&nbsp;份：</span>
					 <select data-province="---- 選擇省 ----" name="receiverState" id="receiverState" onchange="getCity(this.value,-1,-1)"></select>
					  城市：<select data-city="---- 選擇市 ----" name="receiverCity" id="receiverCity" onchange="getArea(this.value,-1)"></select>
					  區/縣：<select data-district="---- 選擇區 ----" name="receiverDistrict" id="receiverDistrict"></select>
				</div> 
	            
	            
	            <!--收貨人詳細地址-->
	            <div class="address_particular">
	                <span class="red">*</span><span class="kuan">詳細地址：</span><textarea name="receiverAddress" id="receiverAddress" cols="60" rows="3" placeholder="建議您如實填寫詳細收貨地址"></textarea>
	            </div>
	            <!--收貨人地址-->
	            <div class="address_tel">
	                <span class="red">*</span><span class="kuan">手機號碼：</span><input type="tel" id="receiverMobile" name="receiverMobile"/>固定電話：<input type="text" name="receiverPhone" id="receiverPhone"/>
	            </div>
	            <!--郵政編碼-->
	            <div class="address_postcode">
	                <span class="red">&nbsp;</span class="kuan"><span>郵政編碼：</span>&nbsp;<input type="text" name="receiverZip" id="receiverZip"/>
	            </div>
	            <!--地址名稱-->
	            <div class="address_name">
	                <span class="red">&nbsp;</span class="kuan"><span>地址名稱：</span>&nbsp;<input type="text" name="addressName" id="addressName"/>如：<span class="sp">家</span><span class="sp">公司</span><span class="sp">宿舍</span>
	            </div>
	            <!--保存收貨人信息-->
	            <div class="save_recipient">
	                保存收貨人信息
	            </div>
	
    		</form>
            <!--已有地址欄-->
            <div class="address_information_manage">
                
               
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
<script src="../js/jquery.page.js"></script>
<script type="text/javascript" src="../js/orders.js"></script>
<script type="text/javascript" src="../js/distpicker.data.js"></script>
<script type="text/javascript" src="../js/distpicker.js"></script>
<script type="text/javascript" src="../js/personal.js"></script>
<script type="text/javascript">
	$(".lxdh_normal").each(function(i,e) {
		var phone = $(e).html();
		$(e).html(changePhone(phone));
	});
</script>
<script type="text/javascript">
	$(function(){
		getProvinceFun(-1,-1,-1);
		getAllAddress();
	});
	//顯示登錄用戶的收貨地址
	function getAllAddress(){
		$.ajax({
			url : "../address/getByUid.do",
			data : "",
			type : "get",
			dateType : "json",
			success : function(obj) {
				var header=
				'<div class="aim_title">'+
                '<span class="dzmc dzmc_title">地址名稱</span><span class="dzxm dzxm_title">姓名</span><span class="dzxq dzxq_title">地址詳情</span><span class="lxdh lxdh_title">聯系電話</span><span class="operation operation_title">操作</span>'+
           		'</div>';
           		$(".address_information_manage").html(header);
				for(i=0;i<obj.data.length;i++){
					if(obj.data[i].isDefault==1){
						//表示默認地址
						var str1=
						 '<div class="aim_content_one aim_active">'+
		                 '<span class="dzmc dzmc_active">'+obj.data[i].recvTag+'</span>'+
		                 '<span class="dzxm dzxm_normal">'+obj.data[i].recvName+'</span>'+
		                 '<span class="dzxq dzxq_normal">'+obj.data[i].recvDistrict+obj.data[i].recvAddress+'</span>'+
		                 '<span class="lxdh lxdh_normal">'+obj.data[i].recvPhone+'</span>'+
		                 '<span class="operation operation_normal">'+
		                 '<span class="aco_change">修改</span>|<span class="aco_delete">刪除</span></span>'+
		                 '<span class="swmr swmr_normal" id="'+obj.data[i].id+'"></span>'+
		            	 '</div>';	
		            	 $(".address_information_manage").append(str1);
					}else{
						//非默認地址
						  var str2 =
			             '<div class="aim_content_two">'+
			             '<span class="dzmc dzmc_active">'+obj.data[i].recvTag+'</span>'+
		                 '<span class="dzxm dzxm_normal">'+obj.data[i].recvName+'</span>'+
		                 '<span class="dzxq dzxq_normal">'+obj.data[i].recvDistrict+obj.data[i].recvAddress+'</span>'+
		                 '<span class="lxdh lxdh_normal">'+obj.data[i].recvPhone+'</span>'+
		                 '<span class="operation operation_normal">'+
		                 '<span class="aco_change">修改</span>|<span class="aco_delete">刪除</span></span>'+
		                 '<span class="swmr swmr_normal" id="'+obj.data[i].id+'">設為默認</span>'+
		            	 '</div>';
						  $(".address_information_manage").append(str2);
					}
				}
				//設為默認 的點擊事件
				$(".swmr_normal").click(function(){
					$.ajax({
						url : "../address/setDefault.do",
						//獲取id屬性值
						data : "id="+$(this).attr("id"),
						type : "get",
						dateType : "json",
						success : function(obj) {
							alert(obj.message);
						}
					});
					setDefault(this);
				})
			}
		});
	}
	//異步請求 獲取區/縣信息
	function getArea(cityCode,areaCode){
		$.ajax({
			url : "../dict/getArea.do",
			data : "cityCode="+cityCode,
			type : "get",
			dateType : "json",
			success : function(obj) {
				$("#receiverDistrict").html(
						"<option>...請選擇...</option>");
				for(i=0;i<obj.data.length;i++){
					$("#receiverDistrict").append(
							new Option(obj.data[i].areaName,
									   obj.data[i].areaCode));
				}
				if(areaCode!=-1){
					$("#receiverDistrict").val(areaCode);
				}
			}
		});
	}
	//異步請求，獲取城市信息
	function getCity(provinceCode,cityCode,areaCode){
		$.ajax({
			url : "../dict/getCity.do",
			data : "provinceCode="+provinceCode,
			type : "get",
			dateType : "json",
			success : function(obj) {
				$("#receiverCity").html("<option>...請選擇...</option>");
				for(i=0;i<obj.data.length;i++){
					$("#receiverCity").append(
							new Option(obj.data[i].cityName,
									   obj.data[i].cityCode));
				}
				if(cityCode!=-1){
					$("#receiverCity").val(cityCode);
				}
				getArea(cityCode,areaCode);
			}
		});
	}
	
	//異步請求，獲取省份信息
	function getProvinceFun(provinceCode,cityCode,areaCode){
		$.ajax({
			url : "../dict/getProvince.do",
			data : "",
			type : "get",
			dateType : "json",
			success : function(obj) {
				$("#receiverState").html("<option>...請選擇...</option>");
				for(i=0;i<obj.data.length;i++){
					$("#receiverState").append(
							new Option(obj.data[i].provinceName,
									   obj.data[i].provinceCode));
				}
				if(provinceCode!=-1){
					$("#receiverState").val(provinceCode);
				}
				getCity(provinceCode,cityCode,areaCode);
			}
			
		});
	}
</script>
<script type="text/javascript">
	//處理側邊攔
	$(function(){
		//表示4個標題的列表項全部隱藏
	    $("#leftsidebar_box dd").hide();
		//地址管理的列表項顯示
	    $("#leftsidebar_box .address dd").show();
		//表示4個標題的圖片全部設置為myOrder2.png
	    $("#leftsidebar_box dt img").attr("src","../images/myOrder/myOrder2.png");
		//地址管理的圖片設置為myOrder1.png
        $("#leftsidebar_box .address dd").find('img').attr("src","../images/myOrder/myOrder1.png");
	})
</script>
</html>